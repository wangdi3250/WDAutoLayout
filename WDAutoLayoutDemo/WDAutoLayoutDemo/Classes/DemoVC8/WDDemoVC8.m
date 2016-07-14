//
//  WDDemoVC8.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/6/7.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC8.h"
#import "WDAutoLayout.h"
#import "WDDemoVC8Cell.h"
#import "WDAutoLayout.h"

@interface WDDemoVC8 ()<WDTableViewExtensionProtocol>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation WDDemoVC8

- (void)viewDidLoad {
    [super viewDidLoad];
   self.titleArray =  @[@"fdsjkfdskfhdks1111hjgjkgk1111111111111111111111111111111111111111111111111",@"fhdskfkqqqfjksdfhkdsfhksqkqqwedjk2222",@"fsdjkfhdskfhdkjsfhdskfhdktttttsfhdsfhdsfsdhq3333333333333333333333333333333333333333333333333333",@"jdsfhdsjkfhsdkfhsdkfjfd4444", @"jdsfhdsjkfhsdkfhsdkfjfds5555",@"jdsfhdsjkfhsdkfhsdkfjfd666",@"jdsfhdsjkfhsdkfhsdkfjfds777",@"jdsfhdsjkfhsdkfhsdkfjfds888",@"jdsfhdsjkfhsdkfhsdkfjfds9999999999999999999999999999999999999999999",@"jdsfhdsjkfhsdkfhsdkfjfds1010101",@"qwewoeuwoeuwoqeowqeuowuqo11111",@"我是王迪完大数据库哈斯卡后是开放和电视剧开发华东数控见发货单上可减肥独守空房的首付款",@"fnsdjfhdsjkfhdsjk发货速度快发货单上扣积分换第三空间佛挡杀佛接口的数据库",@"fjdksfjdslfdkslfdfhkdsjhf dsfhkdsjfdsfhdskf",@"fdsjkfhdksfhdsjkfhdksfhjdksfhkdsfh",@"fjdksfjdsklfjdslfdksfdksfhkdsfjdskfhkds",@"fjksdfhdskjfhdskfhdksfhksdfksdfhqqq",@"fndsjfhdskjfhsdfhkggjghbbkjfgkjdshewfekf",@"qwiueyewituewoiojfksfafhfjkfhfdf",@"fjksdfhsdjkfhjdksfddddfdsssssssssssssssssssssssssssssdjsfkdshfkjdsfhksdfhjsfdskfhdskfdskjfdskfhdskfhdskjfhdskfhdksfhdskfhdkshfdkshfskdfhksdfh",@"qqiruieryiuewhiufdjkhhdhsfjksdfhjksdfhdskfhkasdfhjkdsfhsdkjfshdfjhksdfbdnvxbvnxcvbhvbdvbdksjvbdkxvbk"];
//    self.titleArray = @[@"fjdsfjdskfhsdkff"];
    
}

- (NSMutableArray *)dataArray
{
    if(!_dataArray) {
        _dataArray = [NSMutableArray array];
        for(int i = 0;i < self.titleArray.count;i++) {
            NSString *title = self.titleArray[i];
            WDDemoVC8Model *model = [[WDDemoVC8Model alloc] init];
            model.topTitle = [NSString stringWithFormat:@"%zd_top_%@",i + 1,title];
            model.bottomTitle = [NSString stringWithFormat:@"%zd_bottom_%@",i + 1,title];
            model.identify = [NSString stringWithFormat:@"%zd",i];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    WDDemoVC8Cell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell) {

        cell = [[WDDemoVC8Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = self.dataArray[indexPath.row];
    [cell wd_setupTableView:tableView indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [WDDemoVC8Cell wd_heightForRowWithTableView:tableView atIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        WDDemoVC8Cell *demoCell = (WDDemoVC8Cell *)cell;
        demoCell.model = self.dataArray[indexPath.row];
    }];
}

- (id<NSCopying>)tableView:(UITableView *)tableView identifierForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDDemoVC8Model *model = self.dataArray[indexPath.row];
    return model.identify;
    
}

@end
