//
//  WDViewLayout.h
//  WDAutoLayout
//
//  Created by 王迪 on 16/3/19.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UITableView+WDAutoLayout.h"

@class WDViewLayout,WDLayoutConstraint;
/**
 *  内部使用的Block
 */
typedef WDViewLayout *(^WDMarginToView)(UIView *toView,CGFloat value);
typedef WDViewLayout *(^WDMarginToSuperView)(CGFloat value);
typedef WDViewLayout *(^WDMarginEqualToView)(UIView *toView);
typedef WDViewLayout *(^WDMarginEqualToSuperView)();
typedef WDViewLayout *(^WDMarginEqualToViewAndExtrasMargin)(UIView *toView,CGFloat value);
typedef WDViewLayout *(^WDMarginEqualToSuperViewAndExtrasMargin)(CGFloat value);
typedef WDViewLayout *(^WDWidthHeight)(CGFloat value);
typedef WDViewLayout *(^WDSameWidthHeight)(void);
typedef WDViewLayout *(^WDWidthHeightRatioToView)(UIView *toView,CGFloat value);
typedef WDViewLayout *(^WDSpaceToSuperView)(UIEdgeInsets edgeInsets);
typedef WDViewLayout *(^WDAutoHeightRatio)(CGFloat value);
typedef WDViewLayout *(^WDWidthHeightEqualToView)(UIView *toView);
typedef WDViewLayout *(^WDExtrasWidthHeight)(CGFloat value);

@interface WDViewLayout : NSObject<UIGestureRecognizerDelegate>
/**
 *  左边的距离，参数 toView: 参考的view value: 距离
 */
@property (nonatomic, copy, readonly) WDMarginToView leftSpaceToView;
/**
 *  顶部的距离，参数 toView: 参考的view value: 距离
 */
@property (nonatomic, copy, readonly) WDMarginToView topSpaceToView;
/**
 *  右边的距离，参数 toView: 参考的view value: 距离
 */
@property (nonatomic, copy, readonly) WDMarginToView rightSpaceToView;
/**
 *  底部的距离，参数 toView: 参考的view value: 距离
 */
@property (nonatomic, copy, readonly) WDMarginToView bottomSpaceToView;
/**
 *  左边距离父控件的距离
 */
@property (nonatomic, copy, readonly) WDMarginToSuperView leftSpaceToSuperView;
/**
 *  顶部距离父控件的距离
 */
@property (nonatomic, copy, readonly) WDMarginToSuperView topSpaceToSuperView;
/**
 *  右边距离父控件的距离
 */
@property (nonatomic, copy, readonly) WDMarginToSuperView rightSpaceToSuperView;
/**
 *  底部距离父控件的距离
 */
@property (nonatomic, copy, readonly) WDMarginToSuperView bottomSpaceToSuperView;
/**
 *  左边对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView leftEqualToView;
/**
 *  顶部对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView topEqualToView;
/**
 *  右边对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView rightEqualToView;
/**
 *  底部对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView bottomEqualToView;
/**
 *  左边在对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin leftEqualToViewAndExtrasMargin;
/**
 *  顶部在对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin topEqualToViewAndExtrasMargin;
/**
 *  右边在对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin rightEqualToViewAndExtrasMargin;
/**
 *  底部在对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin bottomEqualToViewAndExtrasMargin;
/**
 *  左边和superView对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView leftEqualToSuperView;
/**
 *  顶部和superView对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView topEqualToSuperView;
/**
 *  右边和superView对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView rightEqualToSuperView;
/**
 *  底部和superView对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView bottomEqualToSuperView;
/**
 *  左边在和superView对齐的基础上加上一个间距 参数:value 间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin leftEqualToSuperViewAndExtrasMargin;
/**
 *  顶部在和superView对齐的基础上加上一个间距 参数:value 间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin topEqualToSuperViewAndExtrasMargin;
/**
 *  右边在和superView对齐的基础上加上一个间距 参数:value 间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin rightEqualToSuperViewAndExtrasMargin;
/**
 *  底部在和superView对齐的基础上加上一个间距 参数:value 间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin bottomEqualToSuperViewAndExtrasMargin;
/**
 *  中心点x对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView centerXEqualToView;
/**
 *  中心点x对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin centerXEqualToViewAndExtrasMargin;
/**
 *  中心点y对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView centerYEqualToView;
/**
 *  中心点y对齐的基础上加上一个间距 参数 toView: 参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin centerYEqualToViewAndExtrasMargin;
/**
 *  中心点x和superView中心点x对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView centerXEqualToSuperView;
/**
 *  中心点y和superView中心点y对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView centerYEqualToSuperView;
/**
 *  中心点x在和superView的中心点x对齐的基础上加上一段间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin
centerXEqualToSuperViewAndExtrasMargin;
/**
 *  中心点y在和superView中心点对齐的基础上加上一段间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin centerYEqualToSuperViewAndExtrasMargin;
/**
 *  宽度相等 参数 toView: 参考的view
 */
@property (nonatomic, copy, readonly) WDWidthHeightEqualToView widthEqualToView;
/**
 *  高度相等 参数 toView: 参考的view
 */
@property (nonatomic, copy, readonly) WDWidthHeightEqualToView heightEqualToView;
/**
 *  相对于父控件的上下左右的距离
 */
@property (nonatomic, copy, readonly) WDSpaceToSuperView spaceToSuperView;
/**
 *  宽度 参数 value: 宽度
 */
@property (nonatomic, copy, readonly) WDWidthHeight width;
/**
 *  额外的宽度，设置设个，会在当前宽度的基础上再加上一个宽度 参数 value:额外的宽度
 */
@property (nonatomic, copy, readonly) WDExtrasWidthHeight extrasWidth;
/**
 *  额外的高度，设置这个，会在当前的高度的基础上再加上一个高度 参数 value:额外的高度
 */
@property (nonatomic, copy, readonly) WDExtrasWidthHeight extrasHeight;
/**
 *  高度 参数 value: 高度
 */
@property (nonatomic, copy, readonly) WDWidthHeight height;
/**
 *  最大宽度 参数 value: 最大宽度
 */
@property (nonatomic, copy, readonly) WDWidthHeight maxWidth;
/**
 *  最大高度 参数 value: 最大高度
 */
@property (nonatomic, copy, readonly) WDWidthHeight maxHeight;
/**
 *  最小宽度 参数 value: 最小宽度
 */
@property (nonatomic, copy, readonly) WDWidthHeight minWidth;
/**
 *  最小宽度 参数 value: 最小宽度
 */
@property (nonatomic, copy, readonly) WDWidthHeight minHeight;
/**
 *  自动适应宽度 参数 value:自适应的最大宽度，传入0会按照maxFloat来计算，传入>0的数，会按照这个数来计算
 */
@property (nonatomic, copy, readonly) WDWidthHeight autoresizingMaxWidth;
/**
 *  宽度跟高度相等
 */
@property (nonatomic, copy, readonly) WDSameWidthHeight widthEqualHeight;
/**
 *  高度跟宽度相等
 */
@property (nonatomic, copy, readonly) WDSameWidthHeight heightEqualWidth;
/**
 *  宽度是参照view宽度的多少倍 参数 toView: 参照的view value: 倍数
 */
@property (nonatomic, copy, readonly) WDWidthHeightRatioToView widthRatioToView;
/**
 *  高度是参照view高度的多少倍 参数 toView: 参照的view value: 倍数
 */
@property (nonatomic, copy, readonly) WDWidthHeightRatioToView heightRatioToView;
/**
 *  高度自适应，如果是UILabel，传入0即可实现自适应高度 参数 value: 高度和宽度的比值
 */
@property (nonatomic, copy, readonly) WDAutoHeightRatio autoHeightRatio;
/**
 *  需要自动布局的view
 */
@property (nonatomic, weak) UIView *needAutoLayoutView;
/**
 *  宽度是否固定
 */
@property (nonatomic, assign, getter=isWidthFix) BOOL widthFix;
/**
 *  高度是否固定
 */
@property (nonatomic, assign, getter=isHeightFix) BOOL heightFix;
/**
 *  宽度等于高度的约束，内部使用，外部无需关心
 */
@property (nonatomic, strong, readonly)  WDLayoutConstraint *widthEqualHeightConstraint;
/**
 *  高度等于宽度约束，内部使用，外部无需关心
 */
@property (nonatomic, strong, readonly) WDLayoutConstraint * heightEqualWidthConstraint;
/**
 *  内部的缓存model，用来做缓存，内部使用，外部无需关心
 */
@property (nonatomic, strong) WDCellSubviewFrame *cellSubviewFrame;
@property (nonatomic, assign, getter=isDidFinishedCache) BOOL didFinishedCache;
@property (nonatomic, assign,getter=isCellSubview) BOOL cellSubview;
/**
 *  初始化方法
 *
 *  @param view 需要自动布局的view
 *
 *  @return 对象
 */
+ (instancetype)layoutWithNeedAutoLayoutView:(UIView *)view;
/**
 *  开始布局
 */
- (void)startLayout;
/**
 *  调整水平方向布局
 */
- (void)adjustHorizontalConstraint;
/**
 *  调整竖直方向布局
 */
- (void)adjustVerticalConstraint;
/**
 *  设置等宽的子view
 *
 *  @param subviewsArray 等宽的子view数组
 */
+ (void)setupWidthEqualSubViewsWithSubviewsArray:(NSArray *)subviewsArray;
/**
 *  设置等高的子view
 *
 *  @param subviewsArray 等高的子view数组
 */
+ (void)setupHeightEqualSubViewsWithSubviewsArray:(NSArray *)subviewsArray;

@end
