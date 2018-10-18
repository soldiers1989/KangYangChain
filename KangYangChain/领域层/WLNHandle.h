//
//  WLNHandle.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WLNDataNet.h"
#import "WLNKeyChain.h"

@protocol Interface<NSObject>

@end

@interface WLNHandle : NSObject<Interface>


- (void)implementWith:(id <Interface>)impl;


@end
