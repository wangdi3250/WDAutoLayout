//
//  WDDemoVC8Cell.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/6/7.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC8Cell.h"
#import "WDAutoLayout.h"

@interface WDDemoVC8Cell()

@property (nonatomic, weak) UILabel *topLabel;
@property (nonatomic, weak) UILabel *bottomLabel;

@end

@implementation WDDemoVC8Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview
{
    
    UIView *topView = [[UIView alloc] init];
//    topView.clipsToBounds = YES;
//    topView.tag = 100;
    topView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:topView];
    
    UILabel *topLabel = [[UILabel alloc] init];
//    topLabel.backgroundColor = [UIColor purpleColor];
    topLabel.tag = 100;
    topLabel.numberOfLines = 0;
    topLabel.textColor = [UIColor greenColor];
    topLabel.font = [UIFont systemFontOfSize:16];
    [topView addSubview:topLabel];
    self.topLabel = topLabel;
    
    UIView *bottomView = [[UIView alloc] init];
//    bottomView.clipsToBounds = YES;
//    bottomView.tag = 200;
    bottomView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:bottomView];
    
    
    UILabel *bottomLabel = [[UILabel alloc] init];
    bottomLabel.numberOfLines = 0;
    bottomLabel.tag = 200;
    bottomLabel.textColor = [UIColor blackColor];
    bottomLabel.font = [UIFont systemFontOfSize:16];
    [bottomView addSubview:bottomLabel];
    self.bottomLabel = bottomLabel;
    
    //添加约束
    topView.wd_layout.leftSpaceToSuperView(0).rightSpaceToSuperView(0).topSpaceToSuperView(0);
    [topView wd_setupBottomViewWithBottomView:topLabel marginToBottom:0];
    bottomView.wd_layout.leftSpaceToSuperView(0).rightSpaceToSuperView(0).topSpaceToView(topView,0);
    [bottomView wd_setupBottomViewWithBottomView:bottomLabel marginToBottom:0];
    
    topLabel.wd_layout.leftSpaceToSuperView(0).rightSpaceToSuperView(0).autoHeightRatio(0).topSpaceToSuperView(0);
    bottomLabel.wd_layout.leftSpaceToSuperView(0).rightSpaceToSuperView(0).autoHeightRatio(0).topSpaceToSuperView(0);
    [self wd_setupBottomViewWithBottomView:bottomView marginToBottom:10];
}

- (void)setModel:(WDDemoVC8Model *)model
{
    _model = model;
    self.topLabel.text = model.topTitle;
    self.bottomLabel.text = model.bottomTitle;
    
}

@end
