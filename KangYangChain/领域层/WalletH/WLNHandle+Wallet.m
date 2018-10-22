//
//  WLNHandle+Wallet.m
//  KangYangChain
//
//  Created by furao on 2018/10/19.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Wallet.h"

#define BTCKEY @"BTC"
#define USDTKEY @"USDT"
#define ETHTKEY @"ETH"

#define TYPE_ARR @[BTCKEY,USDTKEY,ETHTKEY]

@implementation WLNHandle (Wallet)
/**
 获取私钥公钥地址
 */

- (void)getKeys:(NSMutableDictionary *)dic{
    
    NSInteger type = [dic[@"type"] integerValue];
    
    [self getKeys:TYPE_ARR[type] dic:dic sel:_cmd];
    
}


- (void)getKeys:(NSString *)key dic:(NSMutableDictionary*)dic sel:(SEL)sel{
    
    
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    
    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:key].mutableCopy;
//    chainDic[@"address"] = @"1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY";
    if (chainDic) {
        
        if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
            
            [delegate result:chainDic sel:NSStringFromSelector(sel)];
        }
        
    }else{
        
        [BTCWrapper createAccountWithBlock:^(NSString *private, NSString *address, NSString *words) {
            
            NSMutableDictionary *dic =@{}.mutableCopy;
            dic[@"private"] = private;
            dic[@"address"] = address;
            dic[@"words"] = words;
            dic[@"type"] = key;
            
            [WLNKeyChain saveKeychainValue:dic key:key];

            
            if (delegate && [delegate respondsToSelector:@selector(fist:sel:)]) {
                
                [delegate fist:dic sel:NSStringFromSelector(sel)];
                
            }
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:dic sel:NSStringFromSelector(sel)];
                
            }
            
            
        }];
        
        
    }
    
    
    
}



/**
 2.查询余额,并显示,约等于人民币金额
 */

- (void)getBalance:(NSMutableDictionary *)dic{
    
    
    NSInteger type = [dic[@"type"] integerValue];

    [self getBalance:TYPE_ARR[type] dic:dic sel:_cmd];
    
}

- (void)getBalance:(NSString *)key dic:(NSMutableDictionary *)dic sel:(SEL)sel{
    
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    NSString *address = dic[@"address"];
    
    [BTCWrapper getBalanceWithAddress:address block:^(NSDictionary *dict, BOOL suc) {
        
        
        if (suc) {
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:dict sel:NSStringFromSelector(sel)];
                
            }
        }else{
            
            if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
                
                [delegate faild:dict sel:NSStringFromSelector(sel)];
                
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
    
    
    NSString *sendAddress = dic[@"sendAddress"];
    
    NSString *sendNum = dic[@"sendNum"];
    
    NSInteger type = [dic[@"type"] integerValue];

    NSMutableDictionary *chainDic = [WLNKeyChain readKeychainValue:TYPE_ARR[type]].mutableCopy;
    
    [BTCWrapper sendToAddress:sendAddress  money:sendNum fromAddress:chainDic[@"address"] privateKey:chainDic[@"private"] fee:1 block:^(NSString *hashStr, BOOL suc) {
        
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

- (void)getOrder:(NSMutableDictionary *)dic{
    
    NSInteger type = [dic[@"type"] integerValue];

    [self getOrder:TYPE_ARR[type] dic:dic sel:_cmd];
    
}

/**
 3.查询交易记录
 */
- (void)getOrder:(NSString *)key dic:(NSMutableDictionary *)dic sel:(SEL)sel{
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    
    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:key].mutableCopy;
    
    
    [BTCWrapper getTxlistWithAddress:@"1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY" withPage:1 block:^(NSArray *array, BOOL suc) {
        
        
        if (suc) {
            
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:array.mutableCopy sel:NSStringFromSelector(sel)];
                
            }
            
            
        }else{
            
            if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
                
                [delegate faild:array sel:NSStringFromSelector(sel)];
                
            }
        }

        
    }];
    
}
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
