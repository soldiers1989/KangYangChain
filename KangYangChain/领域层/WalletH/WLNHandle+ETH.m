//
//  WLNHandle+ETH.m
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+ETH.h"

#define ETHTKEY @"ETH"

#define ETHINFO @"http://api.ethplorer.io/"

@implementation WLNHandle (ETH)


- (void)getETHKeys:(NSMutableDictionary *)dic{
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:ETHTKEY].mutableCopy;

    chainDic[@"address"] = @"0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0";

        if (chainDic) {
            
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:chainDic sel:NSStringFromSelector(_cmd)];
            }
            
        }else{
            
            
            [HSEther hs_createWithPwd:nil block:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey) {
                
                NSMutableDictionary *dic =@{}.mutableCopy;
                dic[@"address"] = address;
                dic[@"private"] = privateKey;
                dic[@"words"] = mnemonicPhrase;
                dic[@"keyStore"] = keyStore;
                [WLNKeyChain saveKeychainValue:dic key:ETHTKEY];
                
                if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                    
                    [delegate result:dic sel:NSStringFromSelector(_cmd)];
                    
                }
                
                
            }];
        }
 
}
- (void)getETHBalance:(NSMutableDictionary *)dic{
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    
    [HSEther hs_getBalanceWithTokens:@[] withAddress:@"0xe83aec696478bba2404eaa0eb9b1f2d58269d637" block:^(NSArray *arrayBanlance, BOOL suc) {
        
        if (suc) {
            
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:arrayBanlance.firstObject sel:NSStringFromSelector(_cmd)];
                
            }
        }else{
            
            if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
                
                [delegate faild:arrayBanlance sel:NSStringFromSelector(_cmd)];
                
            }
        }
        
        
    }];
    
    
}

- (void)getETHOrder:(NSMutableDictionary *)dic{
    
    NSString *str = [NSString stringWithFormat:@"%@/getTxInfo/0x6aa670c983425eba23314459c48ae89b3b8d0e1089397c56400ce2da5ece9d26?apiKey=freekey",ETHINFO];
    
   
    
    
}
- (void)sendETH:(NSMutableDictionary *)dic{
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    NSString *sendAddress = dic[@"sendAddress"];
    
    NSString *sendNum = dic[@"sendNum"];
    
    NSMutableDictionary *chainDic = [WLNKeyChain readKeychainValue:ETHTKEY].mutableCopy;

    
    [HSEther hs_sendToAssress:sendAddress money:sendNum tokenETH:nil decimal:nil currentKeyStore:chainDic[@"keyStore"] pwd:nil gasPrice:nil gasLimit:nil block:^(NSString *hashStr, BOOL suc, HSWalletError error) {
        
        
        if (suc) {
            
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:hashStr sel:NSStringFromSelector(_cmd)];
                
            }
            
            
        }else{
            
            if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
                
                [delegate faild:hashStr sel:NSStringFromSelector(_cmd)];
                
            }
            
        }
        
    }];
        
 
    
}











@end
