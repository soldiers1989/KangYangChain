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

@property (nonatomic, strong) UITableView *tab;


@end

@implementation WLNMineGHBWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lockConfigDic = [NSMutableDictionary dictionary];
    
    [self.view addSubview:self.tab];
    
    [self.tab registerClass:WLNMineGHBHeadCell.class forCellReuseIdentifier:@"WLNMineGHBHeadCell"];
    [self.tab registerClass:WLNMineGHBBodyCell.class forCellReuseIdentifier:@"WLNMineGHBBodyCell"];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 1 : 5;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
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
        
    
        [weakself.navigationController pushViewController:@"WLNLockCtr".instance animated:YES];
        
    }];
    
    
    return cell;
    
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNMineGHBBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGHBBodyCell"];
    
    return cell;
    
    
}




- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tab.delegate = self;
        _tab.dataSource = self;
    }
    return _tab;
}


@end
