//
//  WLNMineCommunityCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineCommunityCtr.h"

@interface WLNMineCommunityCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@property (nonatomic, strong) WLNMineCommunityHeadView*headView;

@end

@implementation WLNMineCommunityCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的社区".Intl;
    self.tab.dataSource = self;
    self.tab.delegate = self;
    [self tabType:1];
    
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tab registerClass:WLNMineCommunityCell.class forCellReuseIdentifier:@"WLNMineCommunityCell"];
    
    self.headView  = [[WLNMineCommunityHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 250)];
    self.tab.tableHeaderView = self.headView;

    weakSelf(self);  
    [self.headView setDidIntegralBLock:^{
    
        [weakself.navigationController pushViewController:@"WLNMineIntegralCtr".instance animated:YES];
        
    }];
    
    
    [self routeTargetName:Handle actionName:@"shequHome:"];
    
  
}

- (void)result:(id)data sel:(NSString *)sel{
    
    self.headView.dic = data;
    
    
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineCommunityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineCommunityCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.titleLab.text = @[@"GHB社群",@"新闻媒体"][indexPath.row];
    cell.img.image = [UIImage imageNamed:@[@"group",@"multimedia"][indexPath.row]];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *arr = @[@"WLNMineGroupCtr".instance,@"WLNMineNewsCtr".instance];
    
    [self.navigationController pushViewController:arr[indexPath.row] animated:YES];
    
    
}

@end
