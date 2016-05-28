//
//  FriendCircleCell.h
//  WDAutoLayout
//
//  Created by 王迪 on 16/4/5.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDTimeLineCellModel;
@interface FriendCircleCell : UITableViewCell

@property (nonatomic, strong) SDTimeLineCellModel *model;
@property (nonatomic, copy) void (^moreBtnClickBlock)(NSIndexPath *indexPath);

@end
