//
//  UIView+WDAutoLayout.h
//  WDAutoLayout
//
//  Created by 王迪 on 16/3/19.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WDViewLayout;

@interface UIView (WDAutoLayout)
/**
 *  view内部的布局对象
 */
@property (nonatomic, strong, readonly) WDViewLayout *wd_layout;
/**
 *  从新产生一个view内部的布局对象
 */
@property (nonatomic, strong, readonly) WDViewLayout *wd_resetLayout;
/**
 * view的子控件的布局对象数组
 */
@property (nonatomic, strong, readonly) NSMutableArray *wd_layoutArray;
/**
 *  宽度相等的子view
 */
@property (nonatomic, strong) NSArray *wd_widthEqualSubviews;
/**
 *  高度相等的子view
 */
@property (nonatomic, strong) NSArray *wd_heightEqualSubviews;
/**
 *  如果是tableView，cell所在的tableView
 */
@property (nonatomic, strong) UITableView *wd_tableView;
/**
 *  如果是tableView，cell所在的行
 */
@property (nonatomic, strong) NSIndexPath *wd_indexPath;
/**
 *  最底部的子控件
 */
@property (nonatomic, strong) UIView *wd_bottomView;
/**
 *  最底部的子控件距离最底部的距离
 */
@property (nonatomic, assign) CGFloat wd_marginToBottom;
/**
 *  最底部的子控件的数组，如果你不是知道那个控件在最底部，可以传递一个数组可能出现在最底部的数组
 */
@property (nonatomic, strong) NSArray *wd_bottomViewArray;
/**
 *  最右边的子控件
 */
@property (nonatomic, strong) UIView *wd_rightView;
/**
 *  最右边的子控件距离最底部的距离
 */
@property (nonatomic, assign) CGFloat wd_marginToRight;
/**
 *  最底部的子控件的数组，如果你不是知道那个控件在最右边，可以传递一个数组可能出现在最右边的数组
 */
@property (nonatomic, strong) NSArray *wd_rightViewArray;
/**
 *  布局完成的回调block
 */
@property (nonatomic, copy) void (^wd_didFinishedAutoLayout)(CGRect frame);
/**
 *  以下属性内部使用
 */
@property (nonatomic, strong) NSArray *wd_autoLayoutArray;
@property (nonatomic, assign) CGFloat wd_autoLayoutFixWidth;
@property (nonatomic, assign) CGFloat wd_autoLayoutHormargin;
@property (nonatomic, assign) CGFloat wd_autoLayoutVerMargin;
@property (nonatomic, assign) NSInteger wd_rowCount;
@property (nonatomic, assign, getter=isWd_FixWidthLayout) BOOL wd_fixWidthLayout;
/**
 *  更新布局
 */
- (void)wd_updateLayout;
/**
 *  设置最底部的子控件，当父控件的高度需要根据子控件来决定时候，需要调用这个方法
 *
 *  @param bottomView     最底部的view
 *  @param marginToBottom 最底部的view距离最底部的间距
 */
- (void)wd_setupBottomViewWithBottomView:(UIView *)bottomView marginToBottom:(CGFloat)marginToBottom;
/**
 *  设置最底部的子控件，当父控件的高度需要根据子控件来决定时候，需要调用这个方法
 *
 *  @param bottomViewArray 最底部的view的数组，如果你不是知道那个控件在最底部，可以传递一个数组可能出现在最底部的数组
 *  @param marginToBottom 最底部的view距离最底部的间距
 */
- (void)wd_setupBottomViewWithBottomViewArray:(NSArray *)bottomViewArray marginToBottom:(CGFloat)marginToBottom;
/**
 *  设置最右边的子控件，当父控件的宽度需要根据子控件来决定时候，需要调用这个方法
 *
 *  @param rightView     最右边的view
 *  @param marginToRight 最右边的view距离最右边的间距
 */
- (void)wd_setupRightViewWithRightView:(UIView *)rightView marginToRight:(CGFloat)marginToRight;
/**
 *  设置最右边的子控件，当父控件的宽度需要根据子控件来决定时候，需要调用这个方法
 *
 *  @param rightViewArray 最右边的view的数组，如果你不是知道那个控件在最右边，可以传递一个数组可能出现在最右边的数组
 *  @param marginToRight  最右边的view距离最右边的间距
 */
- (void)wd_setupRightViewWithRightViewArray:(NSArray *)rightViewArray marginToRight:(CGFloat)marginToRight;
/**
 *  固定宽度间距不定的布局
 *
 *  @param itemArray        容器内的子控件
 *  @param verticalMargin   竖直方向的间距
 *  @param itemWidth        容器内每一个子控件的宽度
 *  @param rowCount         容器中每一行的个数
 */
- (void)wd_setupAutoMarginFixWidthLayoutWithItemArray:(NSArray *)itemArray verticalMargin:(CGFloat)verticalMargin itemWidth:(CGFloat)itemWidth rowCount:(NSInteger)rowCount;
/**
 *  间距固定宽度不定的布局
 *
 *  @param itemArray        容器内的子控件
 *  @param horizontalMargin 水平方向的间距
 *  @param verticalMargin   竖直方向的间距
 *  @param rowCount         容器中每一行的个数
 */
- (void)wd_setupAutoWidthFixMarginLayoutWithItemArray:(NSArray *)itemArray horizontalMargin:(CGFloat)horizontalMargin verticalMargin:(CGFloat)verticalMargin rowCount:(NSInteger)rowCount;
/**
 *  添加所有的子控件方法
 *
 *  @param subViews 所有的子控件
 */
- (void)wd_addSubviews:(NSArray *)subViews;

@end

@interface UIView (WDAutoLayoutFrame)
/**
 *  左上角的x坐标
 */
@property (nonatomic, assign) CGFloat wd_left;
/**
 *  左上角的y坐标
 */
@property (nonatomic, assign) CGFloat wd_top;
/**
 *  右上角的x坐标
 */
@property (nonatomic, assign) CGFloat wd_right;
/**
 *  左下角的y坐标
 */
@property (nonatomic, assign) CGFloat wd_bottom;
/**
 *  中点的x坐标
 */
@property (nonatomic, assign) CGFloat wd_centerX;
/**
 *  中点的y坐标
 */
@property (nonatomic, assign) CGFloat wd_centerY;
/**
 *  宽度
 */
@property (nonatomic, assign) CGFloat wd_width;
/**
 *  高度
 */
@property (nonatomic, assign) CGFloat wd_height;
/**
 *  大小
 */
@property (nonatomic, assign) CGSize wd_size;
/**
 *  原点
 */
@property (nonatomic, assign) CGPoint wd_origin;

@end

@interface UILabel (WDAutoLayout)
/**
 *  label是否使用attributedString属性
 */
@property (nonatomic, assign, getter=isAttributedContent) BOOL attributedContent;

@end
