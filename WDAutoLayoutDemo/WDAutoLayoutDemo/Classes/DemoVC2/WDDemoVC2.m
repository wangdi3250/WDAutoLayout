//
//  WDDemoVC2.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/28.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC2.h"
#import "WDAutoLayout.h"

@interface WDDemoVC2 ()

@end

@implementation WDDemoVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.wd_widthEqualSubviews = @[self.view0, self.view1, self.view2];
    self.view0.wd_layout
    .leftSpaceToView(self.view, 0)      // 左边距父view为0
    .topSpaceToView(self.view, 100)     // 上边距离父view为100
    .heightEqualWidth();              // 高度等于自身宽度
    
    self.view1.wd_layout
    .leftSpaceToView(self.view0, 0)     // 左边距离view0为0
    .topEqualToView(self.view0)         // top和view0相同
    .heightEqualWidth();              // 高度等于自身宽度
    
    self.view2.wd_layout
    .leftSpaceToView(self.view1, 0)     // 左边距离view1为0
    .topEqualToView(self.view1)         // top和view1相同
    .rightSpaceToView(self.view, 0)     // 右边距离父view为0
    .heightEqualWidth();              // 高度等于自身宽度
    
    self.view3.wd_layout
    .width(50)
    .heightEqualWidth()
    .centerYEqualToView(self.view)
    .centerXEqualToView(self.view);
}
@end
