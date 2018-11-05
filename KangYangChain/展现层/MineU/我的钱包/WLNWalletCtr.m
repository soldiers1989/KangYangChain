//
//  WLNWalletCtr.m
//  WLNWallet
//
//  Created by furao on 2018/9/29.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNWalletCtr.h"

#import "WLNKeyChain.h"

@interface WLNWalletCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol,WLNFloatViewDelegate>

@property (nonatomic, strong) WLNWalletHeadView *headView;

@end

@implementation WLNWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"币币账户".Intl;
        
    [self tabType:2];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self.tab registerClass:WLNWalletBodyCell.class forCellReuseIdentifier:@"WLNWalletBodyCell"];

    [self.tab registerClass:WLNWalletHeadCell.class forCellReuseIdentifier:@"WLNWalletHeadCell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"clear" style:UIBarButtonItemStylePlain target:self action:@selector(clearAction)];
    

    self.headView.model = [WLNSingle shared].current_model;
    
    self.tab.tableHeaderView = self.headView;
    
    
    
    NSString *action = BANLANCE_ACTION([WLNSingle shared].currentType);
    
    [self routeTargetName:Handle actionName:action];

    
}

- (void)clearAction{
    
    [WLNKeyChain deleteKeychainValue:@"BTC"];
    [WLNKeyChain deleteKeychainValue:@"USDT"];

    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    [SVProgressHUD dismiss];
    
    
    Money *model = [WLNSingle shared].current_model;
    
    if ([sel isEqualToString:@"rmbPrice:"]){
        
        
        
        model.rmb = data;
        
        [self.tab reloadData];
        
        [self.headView reloadData];
        
        
    }else{
        
        
        model.balance = data;
        
        [self.tab reloadData];
        
        [self.headView reloadData];
        
        
        [self routeTargetName:Handle actionName:@"rmbPrice:"];
        
        
    }
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 40 : 0.1;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNMineSmallView *view = [[WLNMineSmallView alloc]init];
    return section == 0 ? view : 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section == 0 ? 1: BI_TITLE_ARR.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
    
    return cell;
    
    
}
- (void)changeBiAction:(UITapGestureRecognizer *)tap{
    
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:BI_TITLE_ARR, nil];
    
    
    [view show];
  
}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    
    [WLNSingle shared].currentType = BI_TITLE_ARR[tag];
    
    NSString *action = BANLANCE_ACTION([WLNSingle shared].currentType);
    
    [self routeTargetName:Handle actionName:action];
    
    [SVProgressHUD show];
    
    
}

- (void)clickAction:(UITapGestureRecognizer *)tap{

  
    NSArray *arr = @[[WLNChangeCtr new],[WLNOrderCtr new]];
    UIViewController *vc = arr[tap.view.tag];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNWalletBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletBodyCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.bizhongLab.text = BI_TITLE_ARR[indexPath.row];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 1){
        
        [self.navigationController pushViewController:[WLNWalletDetailCtr new] animated:YES];

    }
    
}
- (WLNWalletHeadView *)headView{
    if (_headView == nil) {
        _headView = [[WLNWalletHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 250)];
        _headView.forwarder = self;
    }
    return _headView;
}
@end
