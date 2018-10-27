//
//  WLNTradeAgreementCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreementCtr.h"

@interface WLNTradeAgreementCtr ()<UITableViewDelegate,UITableViewDataSource,WLNSimpleHeadViewDelegate>
{
    NSInteger _currentType;
}
@end

@implementation WLNTradeAgreementCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"合约";
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeHoldCell.class forCellReuseIdentifier:@"WLNTradeHoldCell"];
    [self.tab registerClass:WLNTradeTradeCell.class forCellReuseIdentifier:@"WLNTradeTradeCell"];
    [self.tab registerClass:WLNTradeHangCell.class forCellReuseIdentifier:@"WLNTradeHangCell"];

    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"交易",@"挂单",@"持仓"]];
    self.tab.tableHeaderView = view;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNTradeTradeHeadView *view = [[WLNTradeTradeHeadView alloc]init];
    
    return view;
    
}
- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    _currentType = tag;
    [self.tab reloadData];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_currentType == 0) {
        
        return [self trade_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }else if (_currentType == 1){
        
        return [self hang_bleView:tableView cellForRowAtIndexPath:indexPath];
        
    }else{
        return [self hold_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)trade_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeCell"];
    
    return cell;
    
    
}
- (UITableViewCell *)hang_bleView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeHangCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeHangCell"];
    
    return cell;
    
}
- (UITableViewCell *)hold_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeHoldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeHoldCell"];
    
    return cell;
    
}

@end
