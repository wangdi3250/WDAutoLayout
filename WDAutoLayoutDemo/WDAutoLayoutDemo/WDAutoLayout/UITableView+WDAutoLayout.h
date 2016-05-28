//
//  UITableView+WDAutoLayout.h
//  WDAutoLayout
//
//  Created by 王迪 on 16/3/22.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WDIndexPathCache;

@protocol WDTableViewRefreshDataDelegate <NSObject>

- (void)tableViewReloadData:(UITableView *)tableView indexPathCache:(WDIndexPathCache *)indexPathCachche;

@end

@interface WDIndexPathCache : NSObject
/**
 *  初始化方法
 *
 *  @param tableView tableView
 *
 *  @return 对象
 */
- (instancetype)initWithTableView:(UITableView *)tableView;
/**
 *  从缓存中读取高度
 *
 *  @param indexPath cell对应的一行
 *
 *  @return 高度，如果不存在，返回nil
 */
- (NSNumber *)heightWithIndexPath:(NSIndexPath *)indexPath;
/**
 *  缓存高度
 *
 *  @param indexPath cell对应的一行
 *  @param height    要缓存的高度
 */
- (void)cacheHeightWithIndexPath:(NSIndexPath *)indexPath height:(NSNumber *)height;
/**
 *  从缓存中读取cell
 *
 *  @param cellClass cell的类型
 *
 *  @return cell
 */
- (UITableViewCell *)cellWithCellClass:(Class)cellClass;
/**
 *  缓存cell
 *
 *  @param cellClass cell的类型
 *  @param cell      要缓存的cell
 */
- (void)cacheCellWithCellClass:(Class)cellClass cell:(UITableViewCell *)cell;
/**
 *  读取cell上的view的WDCellsubviewFrame模型
 *
 *  @param indexPath cell 对应的一行
 *
 *  @return 这个cell中的的所有子控件的WDCellsubviewFrame模型，一个view对应一个WDCellsubviewFrame模型
 */
- (NSArray *)subviewFramesWithIndexPath:(NSIndexPath *)indexPath;
/**
 *  缓存cell上的view的WDCellsubviewFrame模型
 *
 *  @param indexPath cell 对应的一行
 *  @param frame     cell上的view的WDCellsubviewFrame模型
 */
- (void)cacheSubviewFramesWithIndexPath:(NSIndexPath *)indexPath frames:(NSArray *)frame;
/**
 *  清楚所有缓存
 */
- (void)clearAllCache;
/**
 *  清楚指定行的缓存
 *
 *  @param indexPaths 指定的行
 */
- (void)clearCacheWithIndexPath:(NSArray *)indexPaths;
/**
 *  获取缓存的数量
 *
 *  @return 缓存的数量
 */
- (NSInteger)cacheCount;

@end

@interface UITableView (WDAutoLayout)
/**
 *  缓存类，tableView 通过控制缓存对象来控制缓存
 */
@property (nonatomic, strong) WDIndexPathCache *indexPathCache;
/**
 *  返回cell某一行的高度，内部自动计算，并且有缓存
 *
 *  @param cellClass     cell的类型
 *  @param indexPath     cell 的一行
 *  @param configuration 回调的block，用来给外部配置数据
 *
 *  @return 返回高度
 */
- (NSNumber *)wd_heightWithCellClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath configuration:(void (^)(UITableViewCell *cell))configuration;
/**
 *  读取cell上的view的WDCellSubviewFrame模型
 *
 *  @param indexPath cell 的一行
 *
 *  @return WDCellSubviewFrame 模型的数组
 */
- (NSArray *)wd_subviewFramesWithIndexPath:(NSIndexPath *)indexPath;
@end

@interface UITableViewCell (WDAutoLayout)

/**
 *  自动计算高度
 *
 *  @param tableView     tableView
 *  @param indexPath     cell的一行
 *  @param configuration 回调的block，用来给外部配置数据
 *
 *  @return 高度
 */
+ (CGFloat)wd_heightForRowWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath configuration:(void (^)(UITableViewCell *cell))configuration;
/**
 *  设置tableView 和indexPath，用来实现内部的view的frame的缓存机制
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 */
- (void)wd_setupTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end

@interface WDCellSubviewFrame  : NSObject
/**
 *  view自身的frame
 */
@property (nonatomic, assign) CGRect selfFrame;
/**
 *  子控件的WDCellSubviewFrame 模型数组，用来建立一棵树，建立子节点跟父节点之间的关系，内部使用
 */
@property (nonatomic, strong) NSArray *subviewFrames;

@end
