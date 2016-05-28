//
//  FriendCircleHeaderView.m
//  WDAutoLayout
//
//  Created by 王迪 on 16/4/5.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "FriendCircleHeaderView.h"
#import "WDAutoLayout.h"

@interface FriendCircleHeaderView()

@property (nonatomic, weak) UIImageView *bgImageView;
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;

@end

@implementation FriendCircleHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.image = [UIImage imageNamed:@"pbg.jpg"];
    [self addSubview:bgImageView];
    self.bgImageView = bgImageView;
    
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"picon.jpg"];
    [self addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:15];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.text = @"W了个D";
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    bgImageView.wd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    iconView.wd_layout.width(70).heightEqualWidth().rightSpaceToSuperView(15).bottomSpaceToSuperView(20);
    
    nameLabel.wd_layout.rightSpaceToView(iconView,20).bottomSpaceToView(iconView,-35).autoresizingMaxWidth(200).height(20);
    
    
}

@end
