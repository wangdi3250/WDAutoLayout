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

@interface WDAutoLayoutCache()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *cellCache;
@property (nonatomic, strong) NSMutableDictionary *heightCache;
@property (nonatomic, strong) NSMutableDictionary *subViewFramesCache;

@end

@implementation WDAutoLayoutCache

- (instancetype)initWithTableView:(UITableView *)tableView
{
    if(self = [super init]) {
        _tableView = tableView;
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

- (NSNumber *)heightWithKey:(id<NSCopying>)key
{
    if(!key) return nil;
    return self.heightCache[key];
}

- (void)cacheHeightWithKey:(id<NSCopying>)key height:(NSNumber *)height
{
    if(!key) return;
    self.heightCache[key] = height;
}

- (UITableViewCell *)cellWithCellClass:(Class)cellClass
{
    if(!cellClass) return nil;
    return self.cellCache[NSStringFromClass(cellClass)];
}

- (void)cacheCellWithCellClass:(Class)cellClass cell:(UITableViewCell *)cell
{
    if(!cellClass || !cell) return;
    self.cellCache[NSStringFromClass(cellClass)] = cell;
}

- (NSArray *)subviewFrameWithCacheKey:(id<NSCopying>)cacheKey
{
    if(!cacheKey) return nil;
    return self.subViewFramesCache[cacheKey];
}

- (void)cacheSubviewFramesWithKey:(id <NSCopying>)key frames:(NSArray *)frame
{
    if(!key || !frame.count) return;
    self.subViewFramesCache[key] = frame;
}

- (NSInteger)cacheCount
{
    return self.heightCache.count;
}

@end

@implementation UITableView (WDAutoLayout)

- (WDAutoLayoutCache *)wd_cache
{
    WDAutoLayoutCache *cache = objc_getAssociatedObject(self, _cmd);
    if(!cache) {
        cache = [[WDAutoLayoutCache alloc] initWithTableView:self];
        objc_setAssociatedObject(self, _cmd, cache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return cache;
}

- (NSNumber *)wd_heightWithCellClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath cacheKey:(id<NSCopying>)cacheKey configuration:(void (^)(UITableViewCell *cell))configuration
{
    if(!cellClass) return nil;
    UITableViewCell *cell = [self.wd_cache cellWithCellClass:cellClass];
    if(!cell) {
        NSString *identifier = [NSString stringWithFormat:@"wd_%@",NSStringFromClass(cellClass)];
        [self registerClass:cellClass forCellReuseIdentifier:identifier];
        cell = [self dequeueReusableCellWithIdentifier:identifier];
        [self.wd_cache cacheCellWithCellClass:cellClass cell:cell];
    }
    if(configuration) {
        configuration(cell);
    }
    CGFloat cellW = self.wd_width;
    if(cell.contentView.wd_width != cellW) {
        cell.contentView.wd_width = cellW;
    }
    [self wd_resetLayoutDidFinished:cell.contentView.wd_layoutArray];
    [cell.contentView layoutSubviews];
    CGFloat height = 0;
    if(cell.wd_bottomViewArray.count) {
        for(UIView *view in cell.wd_bottomViewArray) {
            height = MAX(height, view.wd_bottom);
        }
        height += cell.wd_marginToBottom;
    } else {
        for(UIView *view in cell.contentView.subviews) {
            height = MAX(height, view.wd_bottom);
        }
        height += cell.wd_marginToBottom;
    }
    [self.wd_cache cacheHeightWithKey:cacheKey height:@(height)];
    NSArray *subviewFrames = [self wd_subviewFramesWithLayoutArray:cell.contentView.wd_layoutArray];
    [self.wd_cache cacheSubviewFramesWithKey:cacheKey frames:subviewFrames];
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

- (NSArray *)wd_subviewFramwWithCacheKey:(id<NSCopying>)cacheKey
{
    return [self.wd_cache subviewFrameWithCacheKey:cacheKey];
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

@end

@implementation UITableViewCell (WDAutoLayout)

+ (CGFloat)wd_heightForRowWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath configuration:(void (^)(UITableViewCell *))configuration
{
    WDAutoLayoutCache *cache = tableView.wd_cache;
    id<NSCopying> key = nil;
    id dataSource = tableView.dataSource;
    if(dataSource && [dataSource respondsToSelector:@selector(tableView:identifierForRowAtIndexPath:)]) {
        key = [dataSource tableView:tableView identifierForRowAtIndexPath:indexPath];
    }
    if(!key) {
        key = [NSString stringWithFormat:@"%zd%zd",indexPath.section,indexPath.row];
    }
    NSNumber *height = [cache heightWithKey:key];
    if(height) {
        return [height floatValue];
    } else {
        height = [tableView wd_heightWithCellClass:self indexPath:indexPath cacheKey:key configuration:configuration];
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
