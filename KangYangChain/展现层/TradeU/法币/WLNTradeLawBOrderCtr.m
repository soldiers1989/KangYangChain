//
//  WLNTradeLawBOrderCtr.m
//  KangYangChain
//
//  Created by furao on 2018/11/4.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeLawBOrderCtr.h"

@interface WLNTradeLawBOrderCtr ()<WLNSimpleHeadViewDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNTradeLawBOrderCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"法币订单".Intl;
    
    self.tab.dataSource = self;
    self.tab.delegate = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeLawBOrderCell.class forCellReuseIdentifier:@"WLNTradeLawBOrderCell"];
    
    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"未完成",@"已完成",@"已取消"]];
    self.tab.tableHeaderView = view;
}
- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBOrderCell"];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self push:@"WLNTradeLawBOrderDetailCtr".instance];
    
}


@end
