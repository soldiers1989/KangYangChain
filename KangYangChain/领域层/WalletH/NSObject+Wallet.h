//
//  NSObject+Wallet.h
//  KangYangChain
//
//  Created by edz on 2018/10/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Wallet)

- (void)getKeys:(NSMutableDictionary *)dic;

- (void)balanceInquiry:(NSMutableDictionary *)dic;

- (void)send:(NSMutableDictionary *)dic;

- (void)orderSearch:(NSMutableDictionary *)dic;


@end

NS_ASSUME_NONNULL_END
