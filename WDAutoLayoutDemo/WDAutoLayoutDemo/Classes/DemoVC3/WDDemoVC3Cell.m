//
//  WDDemoVC3Cell.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/28.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC3Cell.h"
#import "WDAutoLayout.h"

@implementation WDDemoVC3Cell
{
    UIView *_view0;
    UIView *_view1;
    UILabel *_view2;
    UIView *_view3;
    UIView *_view4;
    UIView *_view5;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *view0 = [[UIImageView alloc] init];
        view0.image = [UIImage imageNamed:@"iii"];
        view0.backgroundColor = [UIColor redColor];
        _view0 = view0;
        
        UIView *view1 = [UIView new];
        view1.backgroundColor = [UIColor grayColor];
        _view1 = view1;
        
        UILabel *view2 = [UILabel new];
        view2.backgroundColor = [UIColor brownColor];
        _view2 = view2;
        
        UILabel *view3 = [UILabel new];
        view3.backgroundColor = [UIColor orangeColor];
        _view3 = view3;
        
        UIView *view4 = [UIView new];
        view4.backgroundColor = [UIColor purpleColor];
        _view4 = view4;
        
        UIView *view5 = [UIView new];
        view5.backgroundColor = [UIColor yellowColor];
        _view5 = view5;
        [self.contentView wd_addSubviews:@[view0, view1, view2, view3, view4, view5]];
        
        _view0.wd_layout
        .width(50)
        .height(50)
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 10);
        
        _view1.wd_layout
        .topEqualToView(_view0)
        .leftSpaceToView(_view0, 10)
        .rightSpaceToView(self.contentView, 10)
        .heightRatioToView(_view0, 0.4);
        
        _view2.wd_layout
        .topSpaceToView(_view1, 10)
        .rightSpaceToView(self.contentView, 60)
        .leftEqualToView(_view1)
        .autoHeightRatio(0);
        
        _view3.wd_layout
        .topEqualToView(_view2)
        .leftSpaceToView(_view2, 10)
        .heightRatioToView(_view2, 1)
        .rightEqualToView(_view1);
        
        _view4.wd_layout
        .leftEqualToView(_view2)
        .topSpaceToView(_view2, 10)
        .height(30)
        .widthRatioToView(_view1, 0.7);
        
        _view5.wd_layout
        .leftSpaceToView(_view4, 10)
        .rightSpaceToView(self.contentView, 10)
        .bottomSpaceToView(self.contentView, 10)
        .heightRatioToView(_view4, 1);
        
        //***********************高度自适应cell设置步骤************************
        [self wd_setupBottomViewWithBottomView:_view4 marginToBottom:10];
    }
    return self;
}

- (void)setText:(NSString *)text
{
    _text = text;
    _view2.text = text;
}

@end
