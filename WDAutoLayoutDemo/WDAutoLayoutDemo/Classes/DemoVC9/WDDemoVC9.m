//
//  WDDemoVC9.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/10/18.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC9.h"
#import "WDAutoLayout.h"

@interface WDDemoVC9 ()

@property (nonatomic, weak) UIView *view1;
@property (nonatomic, weak) UIView *view2;
@property (nonatomic, weak) UIView *view3;
@property (nonatomic, weak) UIView *view4;

@end

@implementation WDDemoVC9

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    self.view1 = view1;
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view2];
    self.view2 = view2;
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view3];
    self.view3 = view3;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor blueColor].CGColor;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.wd_layout.width(100).height(50).rightSpaceToSuperView(0).bottomSpaceToSuperView(0);
    
    
    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view4];
    self.view4 = view4;
    
    
    view1.wd_layout.leftSpaceToSuperView(0).topSpaceToSuperView(100).width(100).height(100);
    view2.wd_layout.leftSpaceToView(view1,10).topEqualToView(view1).width(100).height(100);
    view3.wd_layout.leftSpaceToView(view2,10).topEqualToView(view2).width(100).height(100);
    
    view4.wd_layout.leftSpaceToSuperView(10).rightSpaceToSuperView(10).topSpaceToView(self.view1,50).height(50);
    
}

- (void)btnClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if(btn.selected) {
        self.view2.wd_layout.leftEqualToSuperView();
        self.view4.wd_layout.widthKeepLeft(50,YES).bottomSpaceToSuperViewKeepHeight(100,YES);
    } else {
        self.view2.wd_layout.leftSpaceToView(self.view1,10);
        self.view4.wd_layout.rightSpaceToSuperViewKeepWidth(10,NO).topSpaceToViewKeepHeight(self.view1,50,YES);
    }
    [self.view2 wd_updateLayout];
}

@end
