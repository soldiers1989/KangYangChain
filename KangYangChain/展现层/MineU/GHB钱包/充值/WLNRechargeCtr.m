//
//  WLNRechargeCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/18.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNRechargeCtr.h"

@interface WLNRechargeCtr ()

@end

@implementation WLNRechargeCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值".Intl;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"充值记录" style:UIBarButtonItemStyleDone target:self action:@selector(rechargeHis)];
    
    
}
- (void)rechargeHis{
 
    [self.navigationController pushViewController:@"WLNRechargeListCtr".instance animated:YES];
    
}

@end
