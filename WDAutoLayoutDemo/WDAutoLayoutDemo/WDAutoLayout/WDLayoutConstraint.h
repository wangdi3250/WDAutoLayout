//
//  WDLayoutConstraint.h
//  WDAutoLayout
//
//  Created by 王迪 on 16/3/19.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WDLayoutConstraint : NSObject
/**
 *  第一个view，一般为要添加布局的view
 */
@property (nonatomic, weak) UIView *firstView;
/**
 *  第二个view，一般为参照的view
 */
@property (nonatomic, weak) UIView *secondView;
/**
 *  两个view之间的距离值
 */
@property (nonatomic, assign) CGFloat constant;
/**
 *  两个view之间相差的倍数
 */
@property (nonatomic, assign) CGFloat multiplier;
/**
 *  初始化方法
 *
 *  @param firstView  第一个view
 *  @param secondView 第二个view
 *
 *  @return 对象
 */
+ (instancetype)constraintWithFirstView:(UIView *)firstView secondView:(UIView *)secondView;
/**
 *  初始化方法
 *
 *  @param firstView  第一个view
 *  @param secondView 第二个view
 *  @param constant   两个view之间的间距
 *
 *  @return 对象
 */
+ (instancetype)constraintWithFirstView:(UIView *)firstView secondView:(UIView *)secondView constant:(CGFloat)constant;
/**
 *  初始化方法
 *
 *  @param firstView  第一个view
 *  @param secondView 第二个view
 *  @param constant   两个view之间的间距
 *  @param multiplier 两个view之间相差的倍数
 *
 *  @return 对象
 */
+ (instancetype)constraintWithFirstView:(UIView *)firstView secondView:(UIView *)secondView constant:(CGFloat)constant multiplier:(CGFloat)multiplier;

@end
