//
//  WLNTradeLawBPublishCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBPublishCtr.h"

@interface WLNTradeLawBPublishCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNTradeLawBPublishCtr

- (CGRect)resetTabFrame{
    
    return CGRectMake(0, 45, DEVICEWidth, DEVICEHEIGHT - 64 - 45);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布委托单".Intl;
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    
    [self.tab registerClass:WLNTradeLawBPublishCell.class forCellReuseIdentifier:@"WLNTradeLawBPublishCell"];
    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"购买",@"出售"]];
    
    [self.view addSubview:view];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBPublishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBPublishCell"];
    
    return cell;
    
}


@end
