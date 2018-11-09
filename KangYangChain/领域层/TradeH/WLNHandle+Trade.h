//
//  WLNHandle+Trade.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNHandle (Trade)

- (void)agreeOrder:(NSMutableDictionary *)dic;

- (void)createAgree:(NSMutableDictionary *)dic;

- (void)closeAgreeLog:(NSMutableDictionary *)dic;

- (void)holdAgreeLog:(NSMutableDictionary *)dic;

- (void)agreeTradeList:(NSMutableDictionary *)dic;

- (void)cionChooseList:(NSMutableDictionary *)dic;

- (void)agreeAccount:(NSMutableDictionary *)dic;

- (void)closeAgree:(NSMutableDictionary *)dic;

- (void)yingSunSet:(NSMutableDictionary*)dic;

- (void)weituoAllHisList:(NSMutableDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
