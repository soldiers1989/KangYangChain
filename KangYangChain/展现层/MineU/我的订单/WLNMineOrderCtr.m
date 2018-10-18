//
//  WLNMineOrderCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/3.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineOrderCtr.h"

@interface WLNMineOrderCtr ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tab;
@end

@implementation WLNMineOrderCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单".Intl;
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    WLNMineOrderHeadView*view = [[WLNMineOrderHeadView alloc]initWithFrame:CGRectMake(00, 0, DEVICEWidth, 50)];
    self.tab.tableHeaderView = view;
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    static NSString *identifier = @"WLNMineOrderCell";
    WLNMineOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WLNMineOrderCell alloc] initWithFlex:nil reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


@end
