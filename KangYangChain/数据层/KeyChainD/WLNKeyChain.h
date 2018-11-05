//
//  WLNKeyChain.h
//  KangYangChain
//
//  Created by edz on 2018/10/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNKeyChain : NSObject
/**
 *  储存字符串到🔑钥匙串
 *
 *  @param sValue 对应的Value
 *  @param sKey   对应的Key
 */
+ (void)saveKeychainValue:(NSDictionary *)sValue key:(NSString *)sKey;


/**
 *  从🔑钥匙串获取字符串
 *
 *  @param sKey 对应的Key
 *
 *  @return 返回储存的Value
 */
+ (NSDictionary *)readKeychainValue:(NSString *)sKey;


/**
 *  从🔑钥匙串删除字符串
 *
 *  @param sKey 对应的Key
 */
+ (void)deleteKeychainValue:(NSString *)sKey;

@end

NS_ASSUME_NONNULL_END
