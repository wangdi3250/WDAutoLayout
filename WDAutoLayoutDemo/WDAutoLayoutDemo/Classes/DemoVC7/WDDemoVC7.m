//
//  WDDemoVC7.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/28.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC7.h"
#import "WDAutoLayout.h"

@interface WDDemoVC7 ()

@end

@implementation WDDemoVC7
{
    UIScrollView *_scrollView;
    
    UIView *_subview1;
    UILabel *_subview1_label;
    
    UILabel *_subview2;
    
    UIView *_redView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupScrollView];

}

// 添加scrollview
- (void)setupScrollView
{
    UIScrollView *scroll = [UIScrollView new];
    [self.view addSubview:scroll];
    _scrollView = scroll;
    
    // 设置scrollview与父view的边距
    scroll.wd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    [self setupScrollViewSubView1];
    [self setupScrollViewSubView2];
    [self setupScrollViewSubView3];
    
    // 设置scrollview的contentsize自适应
    [scroll wd_setupBottomViewWithBottomView:_redView marginToBottom:10];
}

// 设置scrollview的第一个子深粉色view（包含左边一个label、右边一个button的深粉色view，这个view根据label文字高度自适应）
- (void)setupScrollViewSubView1
{
    // 深粉色view
    UIView *container = [UIView new];
    container.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    [_scrollView addSubview:container];
    _subview1 = container;
    
    
    // 深粉色view第一个子view：左边的lable
    UILabel *leftLabel = [UILabel new];
    leftLabel.text = @"我是wdAutoLayout，你是谁？么么哒！";
    _subview1_label = leftLabel;
    
    // 深粉色view第二个子view：白色文字button
    UIButton *rightButton = [UIButton new];
    [rightButton setTitle:@"添加文字" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(subView1ButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    [container wd_addSubviews:@[leftLabel, rightButton]];
    
    leftLabel.wd_layout
    .leftSpaceToView(container, 10)
    .rightSpaceToView(container, 100)
    .topSpaceToView(container, 10)
    .autoHeightRatio(0); // 此行设置label文字自适应
    
    rightButton.wd_layout
    .bottomEqualToView(container)
    .rightSpaceToView(container, 10)
    .width(80)
    .height(20);
    
    
    container.wd_layout
    .leftSpaceToView(_scrollView, 10)
    .rightSpaceToView(_scrollView, 10)
    .topSpaceToView(_scrollView, 10);
    [container wd_setupBottomViewWithBottomView:leftLabel marginToBottom:10];
}


- (void)setupScrollViewSubView2
{
    UILabel *label = [UILabel new];
    label.text = [NSString stringWithFormat:@" 共有%zd个字符 ", [_subview1_label.text length]];
    label.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    _subview2 = label;
    label.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:label];
    
    label.wd_layout
    .topSpaceToView(_subview1, 10)
    .centerXEqualToView(_subview1)
    .height(30).width(300);
    //    [label setSingleLineAutoResizeWithMaxWidth:400];
}

- (void)setupScrollViewSubView3
{
    UIView *red = [UIView new];
    red.backgroundColor = [UIColor redColor];
    _redView = red;
    
    UIView *green = [UIView new];
    green.backgroundColor = [UIColor greenColor];
    
    UIView *blue = [UIView new];
    blue.backgroundColor = [UIColor blueColor];
    
    [_scrollView wd_addSubviews:@[red, green, blue]];
    
    // 设置scrollview底部三个等宽子view（红绿蓝三个view）
    _scrollView.wd_widthEqualSubviews = @[red, green, blue];
    
    red.wd_layout
    .leftSpaceToView(_scrollView, 20) // 设置redview的左边距
    .topSpaceToView(_subview2, 20)
    .heightEqualWidth();
    
    green.wd_layout
    .leftSpaceToView(red, 20) // 设置greenview的左边距
    .topEqualToView(red)
    .heightEqualWidth();
    
    blue.wd_layout
    .leftSpaceToView(green, 20) // 设置blueview的左边距
    .topEqualToView(red)
    .rightSpaceToView(_scrollView, 20) // 设置blueview的右边距
    .heightEqualWidth();
}


- (void)subView1ButtonClicked
{
    NSString *addStr = [NSString stringWithFormat:@"新增文字，发生时间：%@", [[NSDate date] descriptionWithLocale:nil]];
    _subview1_label.text = [NSString stringWithFormat:@"%@     ---> %@", _subview1_label.text, addStr];
    [_subview1_label wd_updateLayout];
    
    _subview2.text = [NSString stringWithFormat:@" 共有%zd个字符 ", [_subview1_label.text length]];
    
    if (_scrollView.contentSize.height > _scrollView.wd_height) {
        CGPoint point = _scrollView.contentOffset;
        point.y = _scrollView.contentSize.height - _scrollView.wd_height;
        [UIView animateWithDuration:0.2 animations:^{
            _scrollView.contentOffset = point;
        }];
    }
}


@end
