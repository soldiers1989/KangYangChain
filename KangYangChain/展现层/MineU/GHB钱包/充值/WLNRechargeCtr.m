//
//  WLNRechargeCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/18.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNRechargeCtr.h"

@interface WLNRechargeCtr ()<WLNReqstProtocol>

@property (nonatomic, strong) UITextField *numTxt;


@end

@implementation WLNRechargeCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值".Intl;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"充值记录" style:UIBarButtonItemStyleDone target:self action:@selector(rechargeHis)];
    
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
}

- (void)sureAction{
    
    if (self.numTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入金额"];
        return;
    }
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"amount"] = self.numTxt.text;
    [self routeTargetName:Handle actionName:@"GHBRecharge:" param:dic];
    
    
}
- (void)rechargeHis{
 
    [self.navigationController pushViewController:@"WLNRechargeListCtr".instance animated:YES];
    
}

@end
