//
//  WLNDataNet.h
//  KangYangChain
//
//  Created by furao on 2018/10/13.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLNDataNet : NSObject
- (void)getWithUrl:(NSString *)url resultBlock:(void(^)(id result))block;

- (void)postWithUrl:(NSString *)url params:(NSDictionary *)params  resultBlock:(void(^)(id result))block;

@end
