//
//  WLNTradeLawPayCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawPayCtr.h"

@interface WLNTradeLawPayCtr ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation WLNTradeLawPayCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"支付";
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeLawPayCell.class forCellReuseIdentifier:@"WLNTradeLawPayCell"];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeLawPayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawPayCell"];
    cell.forwarder = self;
    return cell;
    
}

@end
