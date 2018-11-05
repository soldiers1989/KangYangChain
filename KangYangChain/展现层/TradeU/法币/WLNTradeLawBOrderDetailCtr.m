//
//  WLNTradeLawBOrderDetailCtr.m
//  KangYangChain
//
//  Created by furao on 2018/11/4.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeLawBOrderDetailCtr.h"

@interface WLNTradeLawBOrderDetailCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNTradeLawBOrderDetailCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情".Intl;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    
    [self.tab registerClass:WLNTradeLawBOrderDetailTopCell.class forCellReuseIdentifier:@"WLNTradeLawBOrderDetailTopCell"];
    [self.tab registerClass:WLNTradeLawBOrderDetailBottomCell.class forCellReuseIdentifier:@"WLNTradeLawBOrderDetailBottomCell"];
    
    
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
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    WLNTradeLawBOrderDetailFootView *view = [[WLNTradeLawBOrderDetailFootView alloc]init];
    return section == 0 ? nil : view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 0 ? 0.1 : 120;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"请支付";
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self top_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self bottom_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
}
- (UITableViewCell *)top_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBOrderDetailTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBOrderDetailTopCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
- (UITableViewCell *)bottom_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBOrderDetailBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBOrderDetailBottomCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
    
}
@end
