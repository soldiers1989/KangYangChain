//
//  WLNHandle+Wallet.h
//  KangYangChain
//
//  Created by furao on 2018/10/19.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle (Wallet)
/**
 生成秘钥
 */
- (void)getKeys:(NSMutableDictionary *)dic;

/**
 查询余额
 */
- (void)getBalance:(NSMutableDictionary *)dic;

/**
 订单查询
 */

- (void)getOrder:(NSMutableDictionary *)dic;

/**
 转账
 */
- (void)send:(NSMutableDictionary *)dic;

/**
 人民币数值
 */
- (void)rmbPrice:(NSMutableDictionary *)dic;


@end
