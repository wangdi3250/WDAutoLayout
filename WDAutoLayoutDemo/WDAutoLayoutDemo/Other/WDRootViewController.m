//
//  WDRootViewController.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/28.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDRootViewController.h"
#import "WDAutoLayout.h"
#import "WDRootCell.h"

NSString * const demo0Description = @"自动布局动画，修改一个view的布局约束，其他view也会自动重新排布";
NSString * const demo1Description = @"设置view1高度根据子view而自适应(在view1中加入两个子view(testLabel和testView)，然后设置view1高度根据子view内容自适应)";
NSString * const demo2Description = @"1.设置水平方向的3个等宽子view\n2.设置一个宽高都为50的位于父view中间的view";
NSString * const demo3Description = @"简单tableview展示";
NSString * const demo4Description = @"1.设置间距固定自动调整宽度的一组子view\n2.设置宽度固定自动调整间距的一组子view";
NSString * const demo5Description = @"1.利用普通view的内容自适应功能添加tableheaderview\n2.利用自动布局功能实现cell内部图文排布，图片可根据原始尺寸按比例缩放后展示\n3.利用“普通版tableview的cell高度自适应”完成tableview的排布";
NSString * const demo6Description = @"利用SDAutoLayout仿制微信朋友圈。";
NSString * const demo7Description = @"scroll任意布局内容自适应自动布局";
NSString * const demo8Description = @"cell的多级缓存";

@interface WDRootViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation WDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray *)dataArray
{
    if(!_dataArray) {
            _dataArray = @[demo0Description, demo1Description, demo2Description, demo3Description, demo4Description, demo5Description,demo6Description,demo7Description,demo8Description];
    }
    return _dataArray;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"test";
    WDRootCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WDRootCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.titleLabel.text = [NSString stringWithFormat:@"Demo -- %ld", indexPath.row];
    cell.contentLabel.text = self.dataArray[indexPath.row];
    [cell wd_setupTableView:tableView indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *demoClassString = [NSString stringWithFormat:@"WDDemoVC%ld", indexPath.row];
    UIViewController *vc = [NSClassFromString(demoClassString) new];
    vc.title = demoClassString;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [WDRootCell wd_heightForRowWithTableView:tableView atIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        WDRootCell *demoCell = (WDRootCell *)cell;
        demoCell.contentLabel.text = self.dataArray[indexPath.row];
    }];
}
@end
