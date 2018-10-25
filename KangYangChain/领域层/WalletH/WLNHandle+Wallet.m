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
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    [[WLNDataNet new]getWithUrl:UpdateTicker resultBlock:^(id result) {
        
        
        NSNumber *last = result[@"1"][@"last"];
        
        NSNumber *USD = result[@"currencies_rate"][@"USD"];
        
        double rmb = last.doubleValue / USD.doubleValue / 100;
        
        if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
            
            [delegate result:@(rmb) sel:NSStringFromSelector(_cmd)];
            
        }
        
        
        
    }];
    
    
}

@end
