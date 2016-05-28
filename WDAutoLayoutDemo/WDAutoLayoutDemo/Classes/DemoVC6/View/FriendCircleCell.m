//
//  FriendCircleCell.m
//  WDAutoLayout
//
//  Created by 王迪 on 16/4/5.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "FriendCircleCell.h"
#import "WDAutoLayout.h"
#import "FriendCiclePhotoView.h"
#import "SDTimeLineCellModel.h"

const CGFloat contentLabelFontSize = 15;
CGFloat maxContentLabelHeight = 0; 

@interface FriendCircleCell()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *contentLabel;
@property (nonatomic, weak) UIButton *moreBtn;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) FriendCiclePhotoView *photoView;
@property (nonatomic, weak) UIButton *operationBtn;

@end

@implementation FriendCircleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    UIView *backgroundView = [[UIView alloc] init];
    [self.contentView addSubview:backgroundView];
    backgroundView.wd_layout.leftSpaceToSuperView(0).rightSpaceToSuperView(0).topSpaceToSuperView(0).height(60);
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.numberOfLines = 0;
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.font = [UIFont systemFontOfSize:contentLabelFontSize];
    if(maxContentLabelHeight == 0) {
        maxContentLabelHeight = contentLabel.font.lineHeight * 3;
    }
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreBtn setTitleColor:[UIColor colorWithRed:92/255.0 green:140/255.0 blue:193/255.0 alpha:1.0] forState:UIControlStateNormal];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:moreBtn];
    self.moreBtn = moreBtn;
    FriendCiclePhotoView *photoView = [[FriendCiclePhotoView alloc] init];
    [self.contentView addSubview:photoView];
    self.photoView = photoView;
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.backgroundColor = [UIColor clearColor];
    timeLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    UIButton *operationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [operationBtn setImage:[UIImage imageNamed:@"AlbumOperateMore"] forState:UIControlStateNormal];
    [operationBtn addTarget:self action:@selector(oprationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:operationBtn];
    self.operationBtn = operationBtn;
    
    CGFloat margin = 10;
    iconView.wd_layout.leftSpaceToSuperView(margin).topSpaceToSuperView(margin + 5).width(40).height(40);
    nameLabel.wd_layout.leftSpaceToView(iconView,margin).topEqualToView(iconView).autoresizingMaxWidth(200).height(18);
    contentLabel.wd_layout.leftEqualToView(nameLabel).topSpaceToView(nameLabel,margin).rightSpaceToSuperView(margin).autoHeightRatio(0);
    moreBtn.wd_layout.leftEqualToView(contentLabel).topSpaceToView(contentLabel,margin).width(30);
    
    photoView.wd_layout.leftEqualToView(contentLabel);
    
    timeLabel.wd_layout.leftEqualToView(contentLabel).topSpaceToView(photoView,margin).autoresizingMaxWidth(100).autoHeightRatio(0);
    
    operationBtn.wd_layout.rightSpaceToSuperView(margin).topEqualToView(timeLabel).width(25).height(25);
}

- (void)setModel:(SDTimeLineCellModel *)model
{
    _model = model;
    self.iconView.image = [UIImage imageNamed:model.iconName];
    self.nameLabel.text = model.name;
    self.contentLabel.text = model.msgContent;
    self.timeLabel.text = @"一分钟前";
    if(model.shouldShowMoreButton) {
        self.moreBtn.wd_layout.height(20);
        self.moreBtn.hidden = NO;
        if(model.isOpening) {
            [self.moreBtn setTitle:@"收起" forState:UIControlStateNormal];
            self.contentLabel.wd_layout.maxHeight(MAXFLOAT);
        } else {
            [self.moreBtn setTitle:@"全文" forState:UIControlStateNormal];
            self.contentLabel.wd_layout.maxHeight(maxContentLabelHeight);
        }
    } else {
        self.moreBtn.wd_layout.height(0);
        self.moreBtn.hidden = YES;
    }
    
    self.photoView.photoURLArray = model.picNamesArray;
    
    CGFloat photoTopMargin = 0;
    if(model.picNamesArray.count) {
        photoTopMargin = 10;
        self.timeLabel.wd_layout.topSpaceToView(self.photoView,10);
    } else {
        self.timeLabel.wd_layout.topSpaceToView(self.photoView,0);
    }
    self.photoView.wd_layout.topSpaceToView(self.moreBtn,photoTopMargin);
    [self wd_setupBottomViewWithBottomView:self.timeLabel marginToBottom:10];
    
}

- (void)moreBtnClick:(UIButton *)btn
{
    if(self.moreBtnClickBlock) {
        self.moreBtnClickBlock(self.contentView.wd_indexPath);
    }
}

- (void)oprationBtnClick
{
    
}

@end
