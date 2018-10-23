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
    
    [self.tab registerClass:WLNMineGHBHeadCell.class forCellReuseIdentifier:@"WLNMineGHBHeadCell"];
    [self.tab registerClass:WLNMineGHBBodyCell.class forCellReuseIdentifier:@"WLNMineGHBBodyCell"];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 1 : 5;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 1 ?80: 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNWalletHeadView *view = [[WLNWalletHeadView alloc]init];
    view.bottomView.hidden = YES;
    view.titleLab.text = @"账单l记录";
    view.bottom2View.hidden = NO;
    
    return section == 1 ? view : nil;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNMineGHBHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGHBHeadCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    weakSelf(self);
    [cell setDidClickBlock:^(NSInteger tag) {
        
        [weakself.navigationController pushViewController:tag == 0 ?
        @"WLNRechargeCtr".instance: @"WLNLockCtr".instance animated:YES];
        
    }];
    
    
    return cell;
    
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNMineGHBBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGHBBodyCell"];
    
    return cell;
    
    
}


@end
