//
//  WDDemoVC4.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/29.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC4.h"
#import "WDAutoLayout.h"

@interface WDDemoVC4 ()

@end

@implementation WDDemoVC4
{
    UIView *_autoWidthViewsContainer;
    UIView *_autoMarginViewsContainer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupAutoWidthViewsWithCount:4 margin:10];
    [self setupAutoMarginViewsWithCount:4 itemWidth:60];
}

// 设置一排固定间距自动宽度子view
- (void)setupAutoWidthViewsWithCount:(NSInteger)count margin:(CGFloat)margin
{
    _autoWidthViewsContainer = [[UIView alloc] init];
    _autoWidthViewsContainer.clipsToBounds = YES;
    _autoWidthViewsContainer.backgroundColor = [UIColor redColor];
    [self.view addSubview:_autoWidthViewsContainer];
    
    
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < count; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor orangeColor];
        [_autoWidthViewsContainer addSubview:view];
        view.wd_layout.height(50);
        [temp addObject:view];
    }
    
    _autoWidthViewsContainer.wd_layout
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(self.view,100);
    
    // 此步设置之后_autoWidthViewsContainer的高度可以根据子view自适应
    [_autoWidthViewsContainer wd_setupAutoWidthFixMarginLayoutWithItemArray:[temp copy] horizontalMargin:margin verticalMargin:margin rowCount:4];
    
}

// 设置一排固定宽度自动间距子view
- (void)setupAutoMarginViewsWithCount:(NSInteger)count itemWidth:(CGFloat)itemWidth
{
    _autoMarginViewsContainer = [UIView new];
    _autoMarginViewsContainer.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_autoMarginViewsContainer];
    
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < count; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor orangeColor];
        [_autoMarginViewsContainer addSubview:view];
        view.wd_layout.height(50);
        [temp addObject:view];
    }
    
    // 此步设置之后_autoMarginViewsContainer的高度可以根据子view自适应
//    [_autoMarginViewsContainer setupAutoMarginFlowItems:[temp copy] withPerRowItemsCount:3 itemWidth:itemWidth verticalMargin:10];
    [_autoMarginViewsContainer wd_setupAutoMarginFixWidthLayoutWithItemArray:[temp copy] verticalMargin:10 itemWidth:itemWidth rowCount:4];
    
    _autoMarginViewsContainer.wd_layout
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(_autoWidthViewsContainer, 50);
}

@end
