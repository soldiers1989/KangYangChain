//
//  WLNHandle+Mine.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNHandle (Mine)

- (void)resetName:(NSMutableDictionary *)dic;

- (void)buyGHB:(NSMutableDictionary *)dic;

- (void)buyInfo:(NSMutableDictionary *)dic;

- (void)sellGHB:(NSMutableDictionary *)dic;

- (void)matchList:(NSMutableDictionary *)dic;

- (void)matchInfo:(NSMutableDictionary *)dic;

- (void)payGHB:(NSMutableDictionary *)dic;

/**
 锁仓
 */
- (void)lockAction:(NSMutableDictionary *)dic;

- (void)lockConfig:(NSMutableDictionary *)dic;

- (void)lockList:(NSMutableDictionary *)dic;

/*
 邀请列表
 */
- (void)yaoqingList:(NSMutableDictionary *)dic;


@end

NS_ASSUME_NONNULL_END
