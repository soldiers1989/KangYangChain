//
//  WLNTradeLawBuyCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBuyCtr.h"

@interface WLNTradeLawBuyCtr ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation WLNTradeLawBuyCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购买".Intl;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    
    [self.tab registerClass:WLNTradeLawBuyCell.class forCellReuseIdentifier:@"WLNTradeLawBuyCell"];
    
    [self.tab registerClass:WLNTradeLawCionCell.class forCellReuseIdentifier:@"WLNTradeLawCionCell"];
    
    
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
    
    WLNTradeLawCionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawCionCell"];
    return cell;
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBuyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBuyCell"];
    cell.forwarder = self;
    
    
    return cell;
    
}
- (void)gotoPay{
    
    [self push:@"WLNTradeLawPayCtr".instance];
    
    
}

@end
