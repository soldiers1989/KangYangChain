//
//  WLNTradeAgreementLeftCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreementLeftCtr.h"

@interface WLNTradeAgreementLeftCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNTradeAgreementLeftCtr

- (CGRect)resetTabFrame{
    return CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 84 - 64);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeTradeCell.class forCellReuseIdentifier:@"WLNTradeTradeCell"];
    [self.tab  registerClass:WLNTradeTradeBodyCell.class forCellReuseIdentifier:@"WLNTradeTradeBodyCell"];
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WLNTradeAgreementLeftHeadView *view = [[WLNTradeAgreementLeftHeadView alloc]init];
    view.layer.masksToBounds = YES;
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0.1 :  80;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ?  1 : 5;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
       return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeBodyCell"];
    
    return cell;
    
}
@end
