//
//  WDDemoVC5.m
//  WDAutoLayoutDemo
//
//  Created by 王迪 on 16/5/28.
//  Copyright © 2016年 wangdi. All rights reserved.
//

#import "WDDemoVC5.h"
#import "WDDemoVC5Model.h"
#import "WDDemoVC5Cell.h"
#import "WDAutoLayout.h"

@interface WDDemoVC5 ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation WDDemoVC5

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeaderView];
    [self creatModelsWithCount:20];
}

- (void)setupHeaderView
{
    UIView *header = [UIView new];
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"pic1.jpg"];
    [header addSubview:imageView];
    
    UILabel *tagLabel = [UILabel new];
    tagLabel.font = [UIFont systemFontOfSize:13];
    tagLabel.textColor = [UIColor lightGrayColor];
    tagLabel.text = @"更新时间：2016.01.08";
    [header addSubview:tagLabel];
    
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [header addSubview:bottomLine];
    
    imageView.wd_layout
    .leftSpaceToView(header, 0)
    .topSpaceToView(header, 0)
    .rightSpaceToView(header, 0)
    .height(150);
    
    tagLabel.wd_layout
    .leftSpaceToView(header, 10)
    .topSpaceToView(imageView, 0)
    .height(25)
    .rightSpaceToView(header, 0);
    
    bottomLine.wd_layout
    .topSpaceToView(tagLabel, 0)
    .leftSpaceToView(header, 0)
    .rightSpaceToView(header, 0)
    .height(1);
    
    [header wd_setupBottomViewWithBottomView:bottomLine marginToBottom:0];
    [header layoutSubviews];
    self.tableView.tableHeaderView = header;
    
}

- (void)creatModelsWithCount:(NSInteger)count
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    
    NSArray *namesArray = @[@"GSD_iOS",
                            @"风口上的猪",
                            @"当今世界网名都不好起了",
                            @"我叫郭德纲",
                            @"Hello Kitty"];
    
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。"
                           ];
    
    NSArray *picImageNamesArray = @[ @"pic0.jpg",
                                     @"pic1.jpg",
                                     @"pic2.jpg",
                                     @"pic3.jpg",
                                     @"pic4.jpg",
                                     ];
    
    for (int i = 0; i < count; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        int picRandomIndex = arc4random_uniform(5);
        
        WDDemoVC5Model *model = [[WDDemoVC5Model alloc] init];
        model.iconName = iconImageNamesArray[iconRandomIndex];
        model.name = namesArray[nameRandomIndex];
        model.content = textArray[contentRandomIndex];
        
        
        // 模拟“有或者无图片”
        int random = arc4random_uniform(100);
        if (random <= 80) {
            model.picName = picImageNamesArray[picRandomIndex];
        }
        
        [self.dataArray addObject:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"test";
    WDDemoVC5Cell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WDDemoVC5Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = self.dataArray[indexPath.row];
    [cell wd_setupTableView:tableView indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [WDDemoVC5Cell wd_heightForRowWithTableView:tableView atIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        WDDemoVC5Cell *demoCell = (WDDemoVC5Cell *)cell;
        demoCell.model = self.dataArray[indexPath.row];
    }];
}
@end
