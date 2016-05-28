//
//  WDDemoVC5Cell.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/28.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC5Cell.h"
#import "WDAutoLayout.h"

@implementation WDDemoVC5Cell
{
    UIImageView *_view0;
    UILabel *_view1;
    UILabel *_view2;
    UIImageView *_view3;
    UILabel *_view4;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    UIImageView *view0 = [[UIImageView alloc] init];
    view0.backgroundColor = [UIColor redColor];
    _view0 = view0;
    
    UILabel *view1 = [[UILabel alloc] init];
    view1.textColor = [UIColor lightGrayColor];
    view1.font = [UIFont systemFontOfSize:16];
    _view1 = view1;
    
    UILabel *view2 = [[UILabel alloc] init];
    view2.textColor = [UIColor grayColor];
    view2.font = [UIFont systemFontOfSize:16];
    view2.numberOfLines = 0;
    _view2 = view2;
    
    UIImageView *view3 = [[UIImageView alloc] init];
    view3.backgroundColor = [UIColor orangeColor];
    _view3 = view3;
    
    UILabel *view4 = [[UILabel alloc] init];
    view4.textColor = [UIColor whiteColor];
    view4.backgroundColor = [UIColor lightGrayColor];
    view4.text = @"纯文本";
    view4.font = [UIFont systemFontOfSize:13];
    _view4 = view4;
    
    [self.contentView wd_addSubviews:@[view0, view1, view2, view3, view4]];
    
    _view0.wd_layout
    .width(40)
    .height(40)
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10);
    
    _view1.wd_layout
    .topEqualToView(_view0)
    .leftSpaceToView(_view0, 10)
    .heightRatioToView(_view0, 0.4).autoresizingMaxWidth(200);
    
    _view2.wd_layout
    .topSpaceToView(_view1, 10)
    .rightSpaceToView(self.contentView, 10)
    .leftEqualToView(_view1)
    .autoHeightRatio(0);
    
    _view3.wd_layout
    .topSpaceToView(_view2, 10)
    .leftEqualToView(_view2)
    .widthRatioToView(_view2, 0.7);
    
    _view4.wd_layout
    .leftSpaceToView(_view1, 5)
    .centerYEqualToView(_view1)
    .height(14).autoresizingMaxWidth(0);
}

- (void)setModel:(WDDemoVC5Model *)model
{
    _model = model;
    
    _view0.image = [UIImage imageNamed:model.iconName];
    
    _view1.text = model.name;
    _view2.text = model.content;
    
    CGFloat bottomMargin = 0;
    
    // 在实际的开发中，网络图片的宽高应由图片服务器返回然后计算宽高比。
    
    UIImage *pic = [UIImage imageNamed:model.picName];
    if (pic.size.width > 0) {
        CGFloat scale = pic.size.height / pic.size.width;
        _view3.wd_layout.autoHeightRatio(scale);
        _view3.image = pic;
        bottomMargin = 10;
        _view4.hidden = YES;
    } else {
        _view3.wd_layout.autoHeightRatio(0);
        _view4.hidden = NO;
    }
    //高度自适应
    [self wd_setupBottomViewWithBottomView:_view3 marginToBottom:bottomMargin];

}

@end
