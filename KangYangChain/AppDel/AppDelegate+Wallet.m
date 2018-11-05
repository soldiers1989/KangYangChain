//
//  AppDelegate+Wallet.m
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "AppDelegate+Wallet.h"

@implementation AppDelegate (Wallet)

- (void)walletSetup{
    
 
    /**
     生成比特币地址
     */
    [self routeTargetName:Handle actionName:@"getBTCKeys:"];
    
    /**
     生成usdt地址
     */
    [self routeTargetName:Handle actionName:@"getUSDTKeys:"];

    /**
     生成ETH地址
     */
    
    [self routeTargetName:Handle actionName:@"getETHKeys:"];

    /**
     生成ETC地址
     */
    
    
    /**
     生成EOS地址
     */
    [self routeTargetName:Handle actionName:@"getEOSKeys:"];
    
    
    /**
     生成RTC地址
     */
    
    
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    
    if ([sel isEqualToString:@"getBTCKeys:"]) {
        
        
        [WLNSingle shared].btc_model = [[Money alloc]initWithDictionary:data];
        
        
    }else if ([sel isEqualToString:@"getUSDTKeys:"]){
        
        [WLNSingle shared].usdt_model = [[Money alloc]initWithDictionary:data];

    }else if ([sel isEqualToString:@"getETHKeys:"]){
        
        [WLNSingle shared].eth_model = [[Money alloc]initWithDictionary:data];

    }
    
    [WLNSingle shared].currentType = @"BTC";

    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
}



@end
