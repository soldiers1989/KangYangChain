//
//  WLNMineGHBWalletCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineGHBWalletCtr.h"

@interface WLNMineGHBWalletCtr ()<WLNReqstProtocol,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *lockConfigDic;

@end

@implementation WLNMineGHBWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的GHB钱包".Intl;
    
    self.lockConfigDic = [NSMutableDictionary dictionary];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self tabType:1];
    
    [self.tab registerClass:WLNWalletHeadCell.class forCellReuseIdentifier:@"WLNWalletHeadCell"];
    [self.tab registerClass:WLNMineGHBBodyCell.class forCellReuseIdentifier:@"WLNMineGHBBodyCell"];
    
    
    WLNMineGHBHeadView *view = [[WLNMineGHBHeadView alloc]initWithFrame:CGRectMake(0 , 0, DEVICEWidth, 250)];
    view.forwarder = self;
    

    self.tab.tableHeaderView = view;
 
    
}

- (void)clickAction:(UITapGestureRecognizer *)tap{
    
    
    [self.navigationController pushViewController:tap.view.tag == 0 ? @"WLNRechargeCtr".instance: @"WLNLockCtr".instance animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 1 : 5;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 40: 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNMineSmallView *view = [[WLNMineSmallView alloc]init];
    view.titleLab.text = @"账单明细";
    
    return section == 0 ? view : nil;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNWalletHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletHeadCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.bottomView.hidden = YES;
    cell.bottom2View.hidden = NO;

    return cell;
    
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNMineGHBBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGHBBodyCell"];
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

@end
