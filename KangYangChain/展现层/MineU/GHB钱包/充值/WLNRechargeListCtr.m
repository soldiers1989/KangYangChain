//
//  WLNRechargeListCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNRechargeListCtr.h"

@interface WLNRechargeListCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNRechargeListCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值记录".Intl;
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNRechargeListCell.class forCellReuseIdentifier:@"WLNRechargeListCell"];
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNRechargeListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNRechargeListCell"];
    
    return cell;
    
    
}




@end
