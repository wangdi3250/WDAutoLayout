//
//  WDDemoVC3Cell.h
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/28.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDDemoVC3Cell : UITableViewCell

@property (nonatomic, copy) NSString *text;
@property (nonatomic, weak) UIView *bgView;
@property (nonatomic, weak) UILabel *label;

@end
