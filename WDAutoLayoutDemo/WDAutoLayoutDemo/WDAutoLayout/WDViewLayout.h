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
typedef WDViewLayout *(^WDMarginToViewKeepWidthHeight)(UIView *toView,CGFloat value,BOOL keep);
typedef WDViewLayout *(^WDMarginToSuperView)(CGFloat value);
typedef WDViewLayout *(^WDMarginToSuperViewKeepWidthHeight)(CGFloat value,BOOL keep);
typedef WDViewLayout *(^WDMarginEqualToView)(UIView *toView);
typedef WDViewLayout *(^WDMarginEqualToViewKeepWidthHeight)(UIView *toView,BOOL keep);
typedef WDViewLayout *(^WDMarginEqualToSuperView)();
typedef WDViewLayout *(^WDMarginEqualToSuperViewKeepWidthHeight)(BOOL keep);
typedef WDViewLayout *(^WDMarginEqualToViewAndExtrasMargin)(UIView *toView,CGFloat value);
typedef WDViewLayout *(^WDMarginEqualToViewAndExtrasMarginKeepWidthHeight)(UIView *toView,CGFloat value,BOOL keep);
typedef WDViewLayout *(^WDMarginEqualToSuperViewAndExtrasMargin)(CGFloat value);
typedef WDViewLayout *(^WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight)(CGFloat value,BOOL keep);
typedef WDViewLayout *(^WDWidthHeight)(CGFloat value);
typedef WDViewLayout *(^WDWidthHeightKeepLeftTop)(CGFloat value,BOOL keep);
typedef WDViewLayout *(^WDSameWidthHeight)(void);
typedef WDViewLayout *(^WDSameWidthHeightKeepLeftTop)(BOOL keep);
typedef WDViewLayout *(^WDWidthHeightRatioToView)(UIView *toView,CGFloat value);
typedef WDViewLayout *(^WDWidthHeightRatioToViewKeepLeftTop)(UIView *toView,CGFloat value,BOOL keep);
typedef WDViewLayout *(^WDSpaceToSuperView)(UIEdgeInsets edgeInsets);
typedef WDViewLayout *(^WDWidthHeightEqualToView)(UIView *toView);
typedef WDViewLayout *(^WDWidthHeightEqualToViewKeepLeftTop)(UIView *toView,BOOL keep);
typedef WDViewLayout *(^WDExtrasWidthHeight)(CGFloat value);
typedef WDViewLayout *(^WDFixedWidthHeight)();
typedef WDViewLayout *(^WDAutoWidthHeight)(NSArray<UIView *> *views,CGFloat margin);

@interface WDViewLayout : NSObject
/**
 *  左边的距离，参数 toView: 参考的view value: 距离
 */
@property (nonatomic, copy, readonly) WDMarginToView leftSpaceToView;
@property (nonatomic, copy, readonly) WDMarginToViewKeepWidthHeight leftSpaceToViewKeepWidth;
/**
 *  顶部的距离，参数 toView: 参考的view value: 距离
 */
@property (nonatomic, copy, readonly) WDMarginToView topSpaceToView;
@property (nonatomic, copy, readonly) WDMarginToViewKeepWidthHeight topSpaceToViewKeepHeight;
/**
 *  右边的距离，参数 toView: 参考的view value: 距离
 */
@property (nonatomic, copy, readonly) WDMarginToView rightSpaceToView;
/**
 * 右边的距离，参数 toView: 参考的view value: 距离 keep: 是否保持宽度，这种情况是既存在left相关的约束又存在width相关的约束，是否保留宽度约束,使用具体看demo
 */
@property (nonatomic, copy, readonly) WDMarginToViewKeepWidthHeight rightSpaceToViewKeepWidth;
/**
 *  底部的距离，参数 toView: 参考的view value: 距离
 */
@property (nonatomic, copy, readonly) WDMarginToView bottomSpaceToView;
/**
 * 右边的距离，参数 toView: 参考的view value: 距离 keep: 是否保持高度，这种情况是既存在top相关的约束又存在height相关的约束，是否保留高度约束,使用具体看demo
 */
@property (nonatomic, copy, readonly) WDMarginToViewKeepWidthHeight bottomSpaceToViewKeepHeight;
/**
 *  左边距离父控件的距离
 */
@property (nonatomic, copy, readonly) WDMarginToSuperView leftSpaceToSuperView;
@property (nonatomic, copy, readonly) WDMarginToSuperViewKeepWidthHeight leftSpaceToSuperViewKeepWidth;
/**
 *  顶部距离父控件的距离
 */
@property (nonatomic, copy, readonly) WDMarginToSuperView topSpaceToSuperView;
@property (nonatomic, copy, readonly) WDMarginToSuperViewKeepWidthHeight topSpaceToSuperViewKeepHeight;
/**
 *  右边距离父控件的距离
 */
@property (nonatomic, copy, readonly) WDMarginToSuperView rightSpaceToSuperView;
/**
 *  右边距离父控件的距离,是否保留宽度
 */
@property (nonatomic, copy, readonly) WDMarginToSuperViewKeepWidthHeight rightSpaceToSuperViewKeepWidth;
/**
 *  底部距离父控件的距离
 */
@property (nonatomic, copy, readonly) WDMarginToSuperView bottomSpaceToSuperView;
/**
 *  底部距离父控件的距离,是否保留高度
 */
@property (nonatomic, copy, readonly) WDMarginToSuperViewKeepWidthHeight bottomSpaceToSuperViewKeepHeight;
/**
 *  左边对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView leftEqualToView;
@property (nonatomic, copy, readonly) WDMarginEqualToViewKeepWidthHeight leftEqualToViewKeepWidth;
/**
 *  顶部对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView topEqualToView;
@property (nonatomic, copy, readonly) WDMarginEqualToViewKeepWidthHeight topEqualToViewKeepHeight;

/**
 *  右边对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView rightEqualToView;
/**
 *  右边对齐 参数 toView:参考的view keep: 是否保留高度约束
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewKeepWidthHeight rightEqualToViewKeepWidth;
/**
 *  底部对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView bottomEqualToView;
/**
 *  右边对齐 参数 toView:参考的view keep: 是否保留高度约束
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewKeepWidthHeight bottomEqualToViewKeepHeight;
/**
 *  左边在对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin leftEqualToViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMarginKeepWidthHeight leftEqualToViewAndExtrasMarginKeepWidth;
/**
 *  顶部在对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin topEqualToViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMarginKeepWidthHeight topEqualToViewAndExtrasMarginKeepHeight;
/**
 *  右边在对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin rightEqualToViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMarginKeepWidthHeight rightEqualToViewAndExtrasMarginKeepWidth;
/**
 *  底部在对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin bottomEqualToViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMarginKeepWidthHeight bottomEqualToViewAndExtrasMarginKeepHeight;
/**
 *  左边和superView对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView leftEqualToSuperView;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewKeepWidthHeight leftEqualToSuperViewKeepWidth;
/**
 *  顶部和superView对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView topEqualToSuperView;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewKeepWidthHeight topEqualToSuperViewKeepHeight;
/**
 *  右边和superView对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView rightEqualToSuperView;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewKeepWidthHeight rightEqualToSuperViewKeepWidth;
/**
 *  底部和superView对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView bottomEqualToSuperView;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewKeepWidthHeight bottomEqualToSuperViewKeepHeight;

/**
 *  左边在和superView对齐的基础上加上一个间距 参数:value 间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin leftEqualToSuperViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight leftEqualToSuperViewAndExtrasMarginKeepWidth;
/**
 *  顶部在和superView对齐的基础上加上一个间距 参数:value 间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin topEqualToSuperViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight topEqualToSuperViewAndExtrasMarginKeepHeight;
/**
 *  右边在和superView对齐的基础上加上一个间距 参数:value 间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin rightEqualToSuperViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight rightEqualToSuperViewAndExtrasMarginKeepWidth;
/**
 *  底部在和superView对齐的基础上加上一个间距 参数:value 间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin bottomEqualToSuperViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight bottomEqualToSuperViewAndExtrasMarginKeepHeight;
/**
 *  中心点x对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView centerXEqualToView;
@property (nonatomic, copy, readonly) WDMarginEqualToViewKeepWidthHeight centerXEqualToViewKeepWidth;
/**
 *  中心点x对齐的基础上加上一个间距 参数 toView:参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin centerXEqualToViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMarginKeepWidthHeight centerXEqualToViewAndExtrasMarginKeepWidth;
/**
 *  中心点y对齐 参数 toView:参考的view
 */
@property (nonatomic, copy, readonly) WDMarginEqualToView centerYEqualToView;
@property (nonatomic, copy, readonly) WDMarginEqualToViewKeepWidthHeight centerYEqualToViewKeepHeight;
/**
 *  中心点y对齐的基础上加上一个间距 参数 toView: 参考的view value:间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMargin centerYEqualToViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToViewAndExtrasMarginKeepWidthHeight centerYEqualToViewAndExtrasMarginKeepHeight;
/**
 *  中心点x和superView中心点x对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView centerXEqualToSuperView;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewKeepWidthHeight centerXEqualToSuperViewKeepWidth;
/**
 *  中心点y和superView中心点y对齐
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperView centerYEqualToSuperView;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewKeepWidthHeight centerYEqualToSuperViewKeepHeight;
/**
 *  中心点x在和superView的中心点x对齐的基础上加上一段间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin centerXEqualToSuperViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight centerXEqualToSuperViewAndExtrasMarginKeepWidth;
/**
 *  中心点y在和superView中心点对齐的基础上加上一段间距
 */
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMargin centerYEqualToSuperViewAndExtrasMargin;
@property (nonatomic, copy, readonly) WDMarginEqualToSuperViewAndExtrasMarginKeepWidthHeight centerYEqualToSuperViewAndExtrasMarginKeepHeight;
/**
 *  宽度相等 参数 toView: 参考的view
 */
@property (nonatomic, copy, readonly) WDWidthHeightEqualToView widthEqualToView;
@property (nonatomic, copy, readonly) WDWidthHeightEqualToViewKeepLeftTop widthEqualToViewKeepLeft;
/**
 *  高度相等 参数 toView: 参考的view
 */
@property (nonatomic, copy, readonly) WDWidthHeightEqualToView heightEqualToView;
@property (nonatomic, copy, readonly) WDWidthHeightEqualToViewKeepLeftTop heightEqualToViewKeepTop;
/**
 *  相对于父控件的上下左右的距离
 */
@property (nonatomic, copy, readonly) WDSpaceToSuperView spaceToSuperView;
/**
 *  宽度 参数 value: 宽度
 */
@property (nonatomic, copy, readonly) WDWidthHeight width;
@property (nonatomic, copy, readonly) WDWidthHeightKeepLeftTop widthKeepLeft;
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
@property (nonatomic, copy, readonly) WDWidthHeightKeepLeftTop heightKeepTop;
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
@property (nonatomic, copy, readonly) WDWidthHeightKeepLeftTop autoresizingMaxWidthKeepLeft;
/**
 *  宽度跟高度相等
 */
@property (nonatomic, copy, readonly) WDSameWidthHeight widthEqualHeight;
@property (nonatomic, copy, readonly) WDSameWidthHeightKeepLeftTop widthEqualHeightKeepLeft;
/**
 *  高度跟宽度相等
 */
@property (nonatomic, copy, readonly) WDSameWidthHeight heightEqualWidth;
@property (nonatomic, copy, readonly) WDSameWidthHeightKeepLeftTop heightEqualWidthKeepTop;
/**
 *  宽度是参照view宽度的多少倍 参数 toView: 参照的view value: 倍数
 */
@property (nonatomic, copy, readonly) WDWidthHeightRatioToView widthRatioToView;
@property (nonatomic, copy, readonly) WDWidthHeightRatioToViewKeepLeftTop widthRatioToViewKeepLeft;
/**
 *  高度是参照view高度的多少倍 参数 toView: 参照的view value: 倍数
 */
@property (nonatomic, copy, readonly) WDWidthHeightRatioToView heightRatioToView;
@property (nonatomic, copy, readonly) WDWidthHeightRatioToViewKeepLeftTop heightRatioToViewKeepTop;
/**
 *  高度自适应，如果是UILabel，传入0即可实现自适应高度 参数 value: 高度和宽度的比值
 */
@property (nonatomic, copy, readonly) WDWidthHeight autoHeightRatio;
@property (nonatomic, copy, readonly) WDWidthHeightKeepLeftTop autoHeightRatioKeepTop;
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
@property (nonatomic, assign) BOOL hasCalculateWidth;
@property (nonatomic, assign) BOOL hasCalculateHeight;
/**
 *  宽度等于高度的约束，内部使用，外部无需关心
 */
@property (nonatomic, strong, readonly)  WDLayoutConstraint *widthEqualHeightConstraint;
/**
 *  高度等于宽度约束，内部使用，外部无需关心
 */
@property (nonatomic, strong, readonly) WDLayoutConstraint * heightEqualWidthConstraint;
/**
 *  宽度固定约束， 设置了这个，就不会帮你自动计算宽度
 */
@property (nonatomic, copy, readonly) WDFixedWidthHeight fixedWidth;
/** 
 *  高度固定约束，设置了这个，就不会帮你自动计算高度
 */
@property (nonatomic, copy, readonly) WDFixedWidthHeight fixedHeight;
@property (nonatomic, copy, readonly) WDAutoWidthHeight heightSpaceToBottom;
@property (nonatomic, copy, readonly) WDAutoWidthHeight widthSpaceToRight;


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
