//
//  WLNHandle+Wallet.h
//  KangYangChain
//
//  Created by furao on 2018/10/19.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle (Wallet) <WLNReqstProtocol>

/**
 人民币数值
 */
- (void)rmbPrice:(NSMutableDictionary *)dic;


@end
