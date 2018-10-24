//
//  WLNMineAgreeWalletCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineAgreeWalletCtr.h"

@interface WLNMineAgreeWalletCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNMineAgreeWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"合约账户".Intl;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    
    
    [self.tab registerClass:WLNWalletBodyCell.class forCellReuseIdentifier:@"WLNWalletBodyCell"];
    
    [self.tab registerClass:WLNWalletHeadCell.class forCellReuseIdentifier:@"WLNWalletHeadCell"];
    
    
    
    WLNMineAgreeWalletHeadView *view = [[WLNMineAgreeWalletHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 250)];
    view.forwarder = self;
    self.tab.tableHeaderView = view;
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 40 : 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNMineSmallView *view = [[WLNMineSmallView alloc]init];
    return section == 0 ? view : nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNWalletHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletHeadCell"];
    
    cell.forwarder = self;
    
    
    return cell;
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNWalletBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletBodyCell"];
    
    
    return cell;
    
}
- (void)changeBiAction{
    NSLog(@"1");
    
}
- (void)clickAction:(UITapGestureRecognizer *)tap{

    UIViewController *vc = @[[WLNChangeCtr new],[WLNOrderCtr new]][tap.view.tag];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


@end
