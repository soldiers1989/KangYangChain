//
//  WLNHandle+Wallet.h
//  KangYangChain
//
//  Created by furao on 2018/10/19.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle (Wallet)

- (void)getKeys:(NSMutableDictionary *)dic;

- (void)balanceInquiry:(NSMutableDictionary *)dic;

- (void)send:(NSMutableDictionary *)dic;

- (void)orderSearch:(NSMutableDictionary *)dic;

- (void)rmbPrice:(NSMutableDictionary *)dic;


@end
