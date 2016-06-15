//
//  UITableView+WDAutoLayout.m
//  WDAutoLayout
//
//  Created by 王迪 on 16/3/22.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "UITableView+WDAutoLayout.h"
#import "UIView+WDAutoLayout.h"
#import "WDViewLayout.h"
#import <objc/runtime.h>

@interface WDIndexPathCache()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *cellCache;
@property (nonatomic, strong) NSMutableDictionary *heightCache;
@property (nonatomic, strong) NSMutableDictionary *subViewFramesCache;

@end

@implementation WDIndexPathCache

- (instancetype)initWithTableView:(UITableView *)tableView
{
    if(self = [super init]) {
        self.tableView = tableView;
    }
    return self;
}

- (NSMutableDictionary *)cellCache
{
    if(!_cellCache) {
        _cellCache = [NSMutableDictionary dictionary];
    }
    return _cellCache;
}

- (NSMutableDictionary *)heightCache
{
    if(!_heightCache) {
        _heightCache = [NSMutableDictionary dictionary];
    }
    return _heightCache;
}

- (NSMutableDictionary *)subViewFramesCache
{
    if(!_subViewFramesCache) {
        _subViewFramesCache = [NSMutableDictionary dictionary];
    }
    return _subViewFramesCache;
}

- (void)clearAllCache
{
    [self.heightCache removeAllObjects];
    [self.subViewFramesCache removeAllObjects];
}

- (void)clearCacheWithIndexPath:(NSArray *)indexPaths
{
    for(NSIndexPath *indexPath in indexPaths) {
        NSString *cacheKey = [NSString stringWithFormat:@"%zd%zd",indexPath.section,indexPath.row];
        [self.heightCache removeObjectForKey:cacheKey];
        [self.subViewFramesCache removeObjectForKey:cacheKey];
    }
}

- (NSNumber *)heightWithIndexPath:(NSIndexPath *)indexPath
{
    if(!indexPath) return nil;
    NSString *cacheKey = [NSString stringWithFormat:@"%zd%zd",indexPath.section,indexPath.row];
    return self.heightCache[cacheKey];
}

- (void)cacheHeightWithIndexPath:(NSIndexPath *)indexPath height:(NSNumber *)height
{
    if(!indexPath || !height) return;
    NSString *cacheKey = [NSString stringWithFormat:@"%zd%zd",indexPath.section,indexPath.row];
    self.heightCache[cacheKey] = height;
}

- (UITableViewCell *)cellWithCellClass:(Class)cellClass
{
    if(!cellClass) return nil;
    return self.cellCache[NSStringFromClass(cellClass)];
}

- (void)cacheCellWithCellClass:(Class)cellClass cell:(UITableViewCell *)cell
{
    if(!cellClass || !cellClass) return;
    self.cellCache[NSStringFromClass(cellClass)] = cell;
}

- (NSArray *)subviewFramesWithIndexPath:(NSIndexPath *)indexPath
{
    if(!indexPath) return nil;
    NSString *cacheKey = [NSString stringWithFormat:@"%zd%zd",indexPath.section,indexPath.row];

    return self.subViewFramesCache[cacheKey];
}

- (void)cacheSubviewFramesWithIndexPath:(NSIndexPath *)indexPath frames:(NSArray *)frame
{
    if(!indexPath || !frame.count) return;
    NSString *cacheKey = [NSString stringWithFormat:@"%zd%zd",indexPath.section,indexPath.row];
    self.subViewFramesCache[cacheKey] = frame;
}

- (NSInteger)cacheCount
{
    return self.heightCache.count;
}

@end

@implementation UITableView (WDAutoLayout)
- (WDIndexPathCache *)indexPathCache
{
    return objc_getAssociatedObject(self, _cmd);

}

- (void)setIndexPathCache:(WDIndexPathCache *)indexPathCache
{
    objc_setAssociatedObject(self, @selector(indexPathCache), indexPathCache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (NSNumber *)wd_heightWithCellClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath configuration:(void (^)(UITableViewCell *cell))configuration
{
    if(!cellClass || !indexPath) return nil;
    UITableViewCell *cell = [self.indexPathCache cellWithCellClass:cellClass];
    if(!cell) {
        NSString *identifier = NSStringFromClass(cellClass);
        [self registerClass:cellClass forCellReuseIdentifier:identifier];
        cell = [self dequeueReusableCellWithIdentifier:identifier];
        [self.indexPathCache cacheCellWithCellClass:cellClass cell:cell];
    }
    [cell wd_setupTableView:self indexPath:indexPath];
    if(configuration) {
        configuration(cell);
    }
    CGFloat cellW = self.wd_width;
    if(cell.contentView.wd_width != cellW) {
        cell.contentView.wd_width = cellW;
    }
    [self wd_resetLayoutDidFinished:cell.contentView.wd_layoutArray];
    [cell.contentView layoutSubviews];
    [cell wd_setupTableView:nil indexPath:nil];
    CGFloat height = 0;
    if(cell.wd_bottomViewArray.count) {
        for(UIView *view in cell.wd_bottomViewArray) {
            height = MAX(height, view.wd_bottom);
        }
        height += cell.wd_marginToBottom;
    }
    [self.indexPathCache cacheHeightWithIndexPath:indexPath height:@(height)];
    NSArray *subviewFrames = [self wd_subviewFramesWithLayoutArray:cell.contentView.wd_layoutArray];
    [self.indexPathCache cacheSubviewFramesWithIndexPath:indexPath frames:subviewFrames];
    return @(height);
}

- (NSArray *)wd_subviewFramesWithLayoutArray:(NSArray *)layoutArray
{
    if(!layoutArray.count) return nil;
    NSMutableArray *subviewFrames = [NSMutableArray array];
    for(int i = 0;i < layoutArray.count;i++) {
        WDViewLayout *layout = layoutArray[i];
        UIView *view = layout.needAutoLayoutView;
        if(!view) continue;
        WDCellSubviewFrame *subviewFrame = [[WDCellSubviewFrame alloc] init];
        subviewFrame.subviewFrames = [self wd_subviewFramesWithLayoutArray:view.wd_layoutArray];
        subviewFrame.selfFrame = view.frame;
        [subviewFrames addObject:subviewFrame];
    }
    return subviewFrames;
}

- (NSArray *)wd_subviewFramesWithIndexPath:(NSIndexPath *)indexPath
{
    return [self.indexPathCache subviewFramesWithIndexPath:indexPath];
}

- (void)wd_resetLayoutDidFinished:(NSArray *)layoutArray
{
    if(!layoutArray.count) return;
    for(int i = 0;i < layoutArray.count;i++) {
        WDViewLayout *layout = layoutArray[i];
        UIView *view = layout.needAutoLayoutView;
        if(!view) continue;
        layout.didFinishedCache = NO;
        layout.cellSubview = NO;
        [self wd_resetLayoutDidFinished:view.wd_layoutArray];
    }
}

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSEL[] = {@selector(reloadData),@selector(reloadRowsAtIndexPaths:withRowAnimation:)};
        SEL customerSEL[] = {@selector(wd_reloadData),@selector(wd_reloadRowsAtIndexPaths:withRowAnimation:)};
        for(int i = 0;i < sizeof(systemSEL) / sizeof(SEL);i++) {
           Method systemMethod = class_getInstanceMethod([UITableView class],systemSEL[i]);
            Method custmerMethod = class_getInstanceMethod([UITableView class],customerSEL[i]);
            method_exchangeImplementations(systemMethod, custmerMethod);
        }
    });
}

- (void)wd_reloadData
{
    id <WDTableViewRefreshDataDelegate> dataSource = (id <WDTableViewRefreshDataDelegate>)self.dataSource;
    if([dataSource respondsToSelector:@selector(tableViewReloadData:indexPathCache:)]) {
        [dataSource tableViewReloadData:self indexPathCache:self.indexPathCache];
    } else {
        [self.indexPathCache clearAllCache];
    }
    [self wd_reloadData];
}

- (void)wd_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    if(!indexPaths.count) return;
    [self.indexPathCache clearCacheWithIndexPath:indexPaths];
    [self wd_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

@end

@implementation UITableViewCell (WDAutoLayout)

+ (CGFloat)wd_heightForRowWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath configuration:(void (^)(UITableViewCell *))configuration
{
    WDIndexPathCache *indexPathCache = tableView.indexPathCache;
    if(!indexPathCache) {
        indexPathCache = [[WDIndexPathCache alloc] initWithTableView:tableView];
        tableView.indexPathCache = indexPathCache;
    }
    NSNumber *height = [indexPathCache heightWithIndexPath:indexPath];
    if(height) {
        return [height floatValue];
    } else {
        height = [tableView wd_heightWithCellClass:self indexPath:indexPath configuration:configuration];
        return [height floatValue];
    }
    
}

- (void)wd_setupTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    self.contentView.wd_tableView = tableView;
    self.contentView.wd_indexPath = indexPath;
}

@end

@implementation WDCellSubviewFrame

@end
