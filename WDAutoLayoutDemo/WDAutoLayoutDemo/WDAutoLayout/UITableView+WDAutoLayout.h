//
//  UITableView+WDAutoLayout.h
//  WDAutoLayout
//
//  Created by 王迪 on 16/3/22.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WDTableViewExtensionProtocol <NSObject>

- (id<NSCopying>)tableView:(UITableView *)tableView identifierForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WDAutoLayoutCache : NSObject
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
 *  @param key 缓存的一行的标识
 *
 *  @return 高度
 */
- (NSNumber *)heightWithKey:(id<NSCopying>)key;
/**
 *  缓存高度
 *
 *  @param key    缓存的一行的标识
 *  @param height 高度
 */
- (void)cacheHeightWithKey:(id<NSCopying>)key height:(NSNumber *)height;
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
 *  缓存cell上的所有子控件的位置
 *
 *  @param key   一行的标识
 *  @param frame cell上所有子控件的信息
 */
- (void)cacheSubviewFramesWithKey:(id <NSCopying>)key frames:(NSArray *)frame;
/**
 *  从缓存中读取cell的子控件的缓存数据
 *
 *  @param cacheKey 一行的标识
 *
 *  @return cell的子控件的缓存数据
 */
- (NSArray *)subviewFrameWithCacheKey:(id<NSCopying>)cacheKey;
/**
 *  清除所有缓存
 */
- (void)clearAllCache;
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
@property (nonatomic, strong, readonly) WDAutoLayoutCache *wd_cache;
/**
 *  返回cell某一行的高度，内部自动计算，并且有缓存
 *
 *  @param cellClass     cell的类型
 *  @param cacheKey      缓存的一行的标识
 *  @param configuration 回调的block，用来给外部配置数据
 *
 *  @return 返回高度
 */
- (NSNumber *)wd_heightWithCellClass:(Class)cellClass indexPath:(NSIndexPath *)indexPath cacheKey:(id <NSCopying>)cacheKey configuration:(void (^)(UITableViewCell *cell))configuration;
- (NSArray *)wd_subviewFramwWithCacheKey:(id<NSCopying>)cacheKey;

@end

@interface UITableViewCell (WDAutoLayout)

/**
 *  自动计算高度
 *  @param tableView     tableView
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
