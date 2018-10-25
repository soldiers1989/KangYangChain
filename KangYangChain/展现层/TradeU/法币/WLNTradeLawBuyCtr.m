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
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self tabType:1];
    
    
    [self.tab registerClass:WLNTradeLawBuyCell.class forCellReuseIdentifier:@"WLNTradeLawBuyCell"];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBuyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBuyCell"];
    cell.forwarder = self;
    
    
    return cell;
    
}
- (void)gotoPay{
    
    [self push:@"WLNTradeLawPayCtr".instance];
    
    
}

@end
