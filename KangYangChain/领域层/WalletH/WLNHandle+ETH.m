//
//  WLNHandle+ETH.m
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+ETH.h"

#define ETHTKEY @"ETH"

@implementation WLNHandle (ETH)


- (void)getETHKeys:(NSMutableDictionary *)dic{
    
    [HSEther hs_createWithPwd:nil block:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey) {
       
        
        
        
        
        
        
        
    }];
    
    
    
}
- (void)getETHBalance:(NSMutableDictionary *)dic{
    
    
    [HSEther hs_getBalanceWithTokens:@[] withAddress:nil block:^(NSArray *arrayBanlance, BOOL suc) {
        
        
    }];
    
    
}

- (void)getETHOrder:(NSMutableDictionary *)dic{
    
    
}
- (void)sendETH:(NSMutableDictionary *)dic{
    
    [HSEther hs_sendToAssress:nil money:nil tokenETH:nil decimal:nil currentKeyStore:nil pwd:nil gasPrice:nil gasLimit:nil block:^(NSString *hashStr, BOOL suc, HSWalletError error) {
        
        
    }];
    
    
    
    
}











@end
