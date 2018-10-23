//
//  WLNWalletCtr.m
//  WLNWallet
//
//  Created by furao on 2018/9/29.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNWalletCtr.h"

#import "WLNKeyChain.h"

@interface WLNWalletCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol,WMYActionSheetDelegate>


@end

@implementation WLNWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"币币账户".Intl;
    
    [WLNWalletSingle shared].currentType = @"BTC";
    
    [self tabType:2];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self.tab registerClass:WLNWalletBodyCell.class forCellReuseIdentifier:@"WLNWalletBodyCell"];

    [self.tab registerClass:WLNWalletHeadCell.class forCellReuseIdentifier:@"WLNWalletHeadCell"];

    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[DELEGATES] = self;
    dic[@"type"] = @(0);
    
    [self routeTargetName:@"WLNHandle" actionName:@"getKeys:" param:dic];
    
    [self routeTargetName:@"WLNHandle" actionName:@"rmbPrice:" param:@{DELEGATES:self}.mutableCopy];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"clear" style:UIBarButtonItemStylePlain target:self action:@selector(clearAction)];
    
    
}
- (void)clearAction{
    
    [WLNKeyChain deleteKeychainValue:@"BTC"];
    [WLNKeyChain deleteKeychainValue:@"USDT"];

    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    
    
    if ([sel isEqualToString:@"getKeys:"]) {
        
        
        [WLNWalletSingle shared].address = data[@"address"];
        [WLNWalletSingle shared].words   = data[@"words"];
        [WLNWalletSingle shared].privatekey = data[@"private"];
        
        NSMutableDictionary *dic = @{}.mutableCopy;
        dic[DELEGATES] = self;
        dic[@"address"] = data[@"address"];
        
        [self routeTargetName:@"WLNHandle" actionName:@"getBalance:" param:dic];
        
        
    }else if ([sel isEqualToString:@"getBalance:"]){
        
        NSMutableDictionary *dic = data[[WLNWalletSingle shared].address];
        
        [WLNWalletSingle shared].balance = dic[@"final_balance"];
        
        [self.tab reloadData];
        
    }else if ([sel isEqualToString:@"rmbPrice:"]){
        
        
        
        [WLNWalletSingle shared].rmb = data;
        
        [self.tab reloadData];

        
    }
    
    
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    
}
- (void)fist:(id)data sel:(NSString *)sel{
    
    
    NSString *str = data[@"address"];
    
    NSString *type = data[@"type"];
    
    HYAlertView *alert = [[HYAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"为您生成 %@ 地址:%@",type,str] buttonTitles:@"确定", nil];
    
    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
    
        
        
        
    }];
    
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNWalletHeadView *view = [[WLNWalletHeadView alloc]init];
    
    return section == 1 ? view : nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return section == 1 ?  80 : 0.1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section == 0 ? 1 : 2;
    
    
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

    WLNWalletHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletHeadCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.balanceLab.text = [NSString stringWithFormat:@"%.5f",[WLNWalletSingle shared].changeBalance];
    
    cell.currentType = [WLNWalletSingle shared].currentType;
    
    cell.rmbLab.text = [NSString stringWithFormat:@"≈ %.2f RMB",[WLNWalletSingle shared].rmb.doubleValue * [WLNWalletSingle shared].changeBalance];

    weakSelf(self);
    
    [cell setDidClickBlock:^(NSInteger tag) {
       
        [weakself gotoNextWith:tag];
        
    }];
    
    
    
    [cell setDidChangeBiBlock:^{
        
        [weakself showSheet];
        
    }];
    
    
    return cell;
    
}
- (void)showSheet{
    
    
    WMYActionSheet *sheet = [[WMYActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"BTC",@"USDT",nil];
    
    [sheet show];
    
    
}
- (void)actionSheet:(WMYActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        return;
        
    }else{
        
        [WLNWalletSingle shared].currentType = @[@"BTC",@"USDT"][buttonIndex - 1];
        
        NSMutableDictionary *dic = @{}.mutableCopy;
        
        dic[DELEGATES] = self;
        
        dic[@"type"] = @(buttonIndex - 1);
        
        [self routeTargetName:@"WLNHandle" actionName:@"getKeys:" param:dic];

    }
    
    
}

- (void)gotoNextWith:(NSInteger)tag{

  
    NSArray *arr = @[[WLNChangeCtr new],[WLNOrderCtr new]];
    UIViewController *vc = arr[tag];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNWalletBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletBodyCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.bizhongLab.text = @[@"BTC",@"USDT"][indexPath.row];
    
    
    
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 1){
        
        [self.navigationController pushViewController:[WLNWalletDetailCtr new] animated:YES];

    }
    
    
}

@end
