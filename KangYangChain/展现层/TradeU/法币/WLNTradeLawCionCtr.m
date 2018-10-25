//
//  WLNTradeLawCionCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawCionCtr.h"

@interface WLNTradeLawCionCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNTradeLawCionCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"法币(USDT)".Intl;
    
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self tabType:1];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:WLNTradeLawCionCell.class forCellReuseIdentifier:@"WLNTradeLawCionCell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(addAction)];
    
}
- (void)addAction{
    
    [self push:@"WLNTradeLawBuyCtr".instance];
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeLawCionCell *cell =[tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawCionCell"];
    
    
    return cell;
    
    
}


@end
