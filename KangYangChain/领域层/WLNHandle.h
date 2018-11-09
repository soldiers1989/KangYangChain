//
//  WLNHandle.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WLNKeyChain.h"

@interface WLNHandle : NSObject<WLNReqstProtocol>

@property (nonatomic, assign) SEL sel;

- (void)__requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel isPost:(BOOL)isPost;

@end
