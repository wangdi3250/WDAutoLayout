//
//  WDDemoVC0.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/28.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC0.h"
#import "WDAutoLayout.h"

#define kTimeInterval 0.8

@interface WDDemoVC0 ()

@end

@implementation WDDemoVC0
{
    NSTimer *_timer;
    CGFloat _widthRatio;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _timer = [NSTimer scheduledTimerWithTimeInterval:kTimeInterval target:self selector:@selector(animation) userInfo:nil repeats:YES];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view0.wd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(self.view,80)
    .height(130)
    .widthRatioToView(self.view, _widthRatio);
    
    self.view1.wd_layout
    .leftSpaceToView(self.view0, 10)
    .topEqualToView(self.view0)
    .height(60)
    .widthRatioToView(self.view0, 0.5);
    
    self.view2.wd_layout
    .leftSpaceToView(self.view1, 10)
    .topEqualToView(self.view1)
    .heightRatioToView(self.view1, 1)
    .width(50);
    
    self.view3.wd_layout
    .leftEqualToView(self.view1)
    .topSpaceToView(self.view1, 10)
    .heightRatioToView(self.view1, 1)
    .widthRatioToView(self.view1, 1);
    
    self.view4.wd_layout
    .leftEqualToView(self.view2)
    .topEqualToView(self.view3)
    .heightRatioToView(self.view3, 1)
    .widthRatioToView(self.view2, 1);
    
    
    [self.view0 addSubview:self.view5];
    self.view5.wd_layout
    .centerYEqualToView(self.view0)
    .rightSpaceToView(self.view0, 10)
    .widthRatioToView(self.view0, 0.5)
    .height(20);
}
- (void)animation
{
    if (_widthRatio == 0.4) {
        _widthRatio = 0.1;
    } else {
        _widthRatio = 0.4;
    }
    
    // 开启动画
    [UIView animateWithDuration:0.8 animations:^{
        self.view0.wd_layout
        .widthRatioToView(self.view, _widthRatio);
        [self.view0 wd_updateLayout]; // 调用此方法开启view0动画效果
        [self.view5 wd_updateLayout]; // 调用此方法开启view5动画效果
        /*
         调用[self.view0 updateLayout]就可以实现view0和其它兄弟view一起动画，view0和view5是父子关系，如果view0需要动画要再主动调用一次[self.view5 updateLayout]
         */
    }];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [_timer invalidate];
    _timer = nil;
}
@end
