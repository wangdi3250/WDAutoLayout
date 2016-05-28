//
//  FriendCiclePhotoView.m
//  WDAutoLayout
//
//  Created by 王迪 on 16/4/5.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "FriendCiclePhotoView.h"
#import "WDAutoLayout.h"

#define kMargin 5
#define kPhotoImageViewW 100
#define kPhotoImageViewH 100

@implementation FriendCiclePhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        for(int i = 0;i < 9;i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [self addSubview:imageView];
        }
    }
    return self;
}

- (void)setPhotoURLArray:(NSArray *)photoURLArray
{
    _photoURLArray = photoURLArray;
//    if(photoURLArray.count == 0) {
//        self.wd_height = 0;
//        self.wd_layout.heightFix = YES;
//    }
    for(int i = 0;i < self.subviews.count;i++) {
        UIImageView *imageView = self.subviews[i];
        if(i >= photoURLArray.count) {
            imageView.hidden = YES;
        } else {
            imageView.hidden = NO;
            imageView.image = [UIImage imageNamed:photoURLArray[i]];
            int maxColumns = photoURLArray.count == 4 ? 2: 3;
            CGFloat col = i % maxColumns;
            CGFloat row = i / maxColumns;
            CGFloat x = (kPhotoImageViewW + kMargin) * col;
            CGFloat y = (kPhotoImageViewH + kMargin) * row;
            imageView.frame = CGRectMake(x, y, kPhotoImageViewW, kPhotoImageViewH);
        }
    }
    
    CGSize size = [self photoViewSizeWithCount:photoURLArray.count];
    self.wd_width = size.width;
    self.wd_height = size.height;
    self.wd_layout.widthFix = YES;
    self.wd_layout.heightFix = YES;
    
}

- (CGSize)photoViewSizeWithCount:(NSInteger)count
{
    NSInteger maxColumns = count == 4 ? 2 : 3;
    NSInteger totalRows = (count + maxColumns - 1) / maxColumns;
    CGFloat totalHeight = kPhotoImageViewH * totalRows + (totalRows - 1) * kMargin;
    CGFloat totalCols = count > maxColumns ? maxColumns : count;
    CGFloat totalWidth = kPhotoImageViewW * totalCols + (totalCols - 1) * kMargin;
    return CGSizeMake(totalWidth, totalHeight);
}

@end
