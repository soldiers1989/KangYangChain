//
//  WLNHandle+Wallet.m
//  KangYangChain
//
//  Created by furao on 2018/10/19.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Wallet.h"


#define TYPE_ARR @[BTCKEY,USDTKEY,ETHTKEY]

@implementation WLNHandle (Wallet)




- (void)rmbPrice:(NSMutableDictionary *)dic{
    
    self.delegate = dic[DELEGATES];
    self.sel = @selector(rmbPrice:);
    
    [dic removeObjectForKey:DELEGATES];
    
    
    NSMutableDictionary *dicp = @{}.mutableCopy;
    
    dicp[DELEGATES] = self;
    
    dicp[URLS] = UpdateTicker;

    
    [self routeTargetName:@"WLNData" actionName:@"getWithDic:" param:dicp];
  
    
}

@end
