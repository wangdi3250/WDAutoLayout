//
//  WDDemoVC3.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/28.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC3.h"
#import "WDAutoLayout.h"
#import "WDDemoVC3Cell.h"

@interface WDDemoVC3 ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation WDDemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSArray *)dataArray
{
    if(!_dataArray) {
        _dataArray =  @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                        @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                        @"当你的 app 没有提供 3x 的 LaunchImage 时",
                        @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                        @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下，"
                        ];
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int index = indexPath.row % 5;
    static NSString *ID = @"test";
    WDDemoVC3Cell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WDDemoVC3Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
       cell.text = self.dataArray[index];
    [cell wd_setupTableView:tableView indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int index = indexPath.row % 5;
    NSString *str = self.dataArray[index];
    return [WDDemoVC3Cell wd_heightForRowWithTableView:tableView atIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        WDDemoVC3Cell *testCell = (WDDemoVC3Cell *)cell;
        testCell.text = str;
    }];
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    WDDemoVC3Cell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    [cell test];
//}
@end
