//
//  WLNWalletCtr.m
//  WLNWallet
//
//  Created by furao on 2018/9/29.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNWalletCtr.h"


@interface WLNWalletCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@property (strong, nonatomic) UITableView *tab;



@end

@implementation WLNWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的钱包".Intl;
    
    
    
    [self.view addSubview:self.tab];
    
    [self.tab registerClass:WLNWalletBodyCell.class forCellReuseIdentifier:@"WLNWalletBodyCell"];

    [self.tab registerClass:WLNWalletHeadCell.class forCellReuseIdentifier:@"WLNWalletHeadCell"];

    
    
    [self routeTargetName:@"WLNHandle" actionName:@"getKeys:" param:@{DELEGATES:self}.mutableCopy];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"getKeys:"]) {
        
        
        [WLNWalletSingle shared].address = data[@"address"];
        [WLNWalletSingle shared].words   = data[@"words"];
        [WLNWalletSingle shared].privatekey = data[@"private"];
        
        
        
        NSMutableDictionary *dic = @{}.mutableCopy;
        dic[DELEGATES] = self;
        dic[@"address"] = data[@"address"];
        
        [self routeTargetName:@"WLNHandle" actionName:@"balanceInquiry:" param:dic];
        
        
    }else if ([sel isEqualToString:@"balanceInquiry:"]){
        
        NSMutableDictionary *dic = data[[WLNWalletSingle shared].address];
        
        [WLNWalletSingle shared].balance = dic[@"final_balance"];
        

        [self.tab reloadData];
        
        
    }
    
    
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    
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
    cell.img.image = [UIImage imageNamed:@"123"];

    cell.balanceLab.text = [NSString stringWithFormat:@"%.5f BTC",[WLNWalletSingle shared].changeBalance];
    

    weakSelf(self);
    
    [cell setDidClickBlock:^(NSInteger tag) {
       
        [weakself gotoNextWith:tag];
        
    }];
    
    return cell;
    
}
- (void)gotoNextWith:(NSInteger)tag{

  
    NSArray *arr = @[[WLNReceiveMoneyCtr new],[WLNRSendMoneyCtr new],[WLNChangeCtr new],[WLNOrderCtr new]];
    
    [self.navigationController pushViewController:arr[tag] animated:YES];
    
    
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
- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
        _tab.dataSource = self;
        _tab.delegate = self;
        
    }
    return _tab;
}
@end
