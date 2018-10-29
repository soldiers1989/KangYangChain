//
//  WLNHandle.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WLNKeyChain.h"

@protocol Interface <NSObject,WLNReqstProtocol>

@end

@interface WLNHandle : NSObject<Interface>

@property (nonatomic, weak) id <WLNReqstProtocol>delegate;

@property (nonatomic, assign) SEL sel;



- (void)implementWith:(id <Interface>)impl;


@end
