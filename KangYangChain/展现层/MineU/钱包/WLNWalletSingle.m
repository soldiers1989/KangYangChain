//
//  WLNWalletSingle.m
//  KangYangChain
//
//  Created by edz on 2018/10/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNWalletSingle.h"

@implementation WLNWalletSingle

+ (WLNWalletSingle *)shared{
    
    static WLNWalletSingle* instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WLNWalletSingle alloc]init];
    });
    
    return instance;
    
}
- (void)setBalance:(NSNumber *)balance{
    
    
    _balance = balance;
 
    
    double numd = [balance doubleValue];
    
    
    
    numd = numd / pow(10,8);
    
    
    self.changeBalance = numd;
    
    
}
@end
