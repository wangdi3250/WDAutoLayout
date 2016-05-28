//
//  WDLayoutConstraint.m
//  WDAutoLayout
//
//  Created by 王迪 on 16/3/19.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDLayoutConstraint.h"

@implementation WDLayoutConstraint

+ (instancetype)constraintWithFirstView:(UIView *)firstView secondView:(UIView *)secondView
{
    return [self constraintWithFirstView:firstView secondView:secondView constant:0];
}

+ (instancetype)constraintWithFirstView:(UIView *)firstView secondView:(UIView *)secondView constant:(CGFloat)constant
{
    return [self constraintWithFirstView:firstView secondView:secondView constant:constant multiplier:1];
}

+ (instancetype)constraintWithFirstView:(UIView *)firstView secondView:(UIView *)secondView constant:(CGFloat)constant multiplier:(CGFloat)multiplier
{
    WDLayoutConstraint *constraint = [[self alloc] init];
    constraint.firstView = firstView;
    constraint.secondView = secondView;
    constraint.constant = constant;
    constraint.multiplier = multiplier;
    return constraint;
}

@end
