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
    
    self.sel = @selector(rmbPrice:);
    
    
    NSMutableDictionary *dicp = @{}.mutableCopy;
        
    dicp[URLS] = UpdateTicker;

    
    [self routeTargetName:@"WLNData" actionName:@"getWithDic:" param:dicp];
  
    
}

@end
