//
//  NSObject+Wallet.m
//  KangYangChain
//
//  Created by edz on 2018/10/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import "NSObject+Wallet.h"

#define WALLETKEY @"walletKKKKKKKKKKKKKKK"

@implementation NSObject (Wallet)
/**
 获取私钥公钥地址
 */
- (void)getKeys:(NSMutableDictionary *)dic{
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    
    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:WALLETKEY].mutableCopy;
    
    chainDic[@"address"] = @"1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY";
    if (chainDic) {
        
        if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
            
            [delegate result:chainDic sel:NSStringFromSelector(@selector(getKeys:))];
        }
        
    }else{
        
        [BTCWrapper createAccountWithBlock:^(NSString *private, NSString *address, NSString *words) {
            
            NSMutableDictionary *dic =@{}.mutableCopy;
            dic[@"private"] = private;
            dic[@"address"] = @"1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY";
            dic[@"words"] = words;
            
            [WLNKeyChain saveKeychainValue:dic key:WALLETKEY];
            
            
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:dic sel:NSStringFromSelector(@selector(getKeys:))];
                
            }
            
            
        }];
  
        
    }
    
}


/**
 2.查询余额,并显示,约等于人民币金额
 */

- (void)balanceInquiry:(NSMutableDictionary *)dic{
    
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    NSString *address = dic[@"address"];
    
    [BTCWrapper getBalanceWithAddress:address block:^(NSDictionary *dict, BOOL suc) {
        
        
        
        
        if (suc) {
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:dict sel:NSStringFromSelector(@selector(balanceInquiry:))];
                
            }
        }else{
            
            if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
                
                [delegate faild:dict sel:NSStringFromSelector(@selector(balanceInquiry:))];
                
            }
        }
      
        
        
    }];
}


/**
 转账
 */
- (void)send:(NSMutableDictionary *)dic{
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    
    
    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:WALLETKEY].mutableCopy;

    
    
    [BTCWrapper sendToAddress:dic[@"sendAddress"]  money:dic[@"sendNum"] fromAddress:chainDic[@"address"] privateKey:chainDic[@"private"] fee:1 block:^(NSString *hashStr, BOOL suc) {
        
        if (suc) {
            
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:hashStr sel:NSStringFromSelector(@selector(send:))];
                
            }
            
            
        }else{
            
            if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
                
                [delegate faild:hashStr sel:NSStringFromSelector(@selector(send:))];
                
            }
            
        }
        
        
        
        
        
    }];
    
    
    
}
/**
 3.查询交易记录
 */
- (void)orderSearch:(NSMutableDictionary *)dic{
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];[dic removeObjectForKey:DELEGATES];
    
    
    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:WALLETKEY].mutableCopy;

    
    [BTCWrapper getTxlistWithAddress:@"1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY" withPage:1 block:^(NSArray *array, BOOL suc) {
        
        
        if (suc) {
            
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:array.mutableCopy sel:NSStringFromSelector(@selector(orderSearch:))];
                
            }
            
            
        }else{
            
            if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
                
                [delegate faild:array sel:NSStringFromSelector(@selector(orderSearch:))];
                
            }
        }
        
        
        
        
        
    }];
    
    
    
    
}

@end
