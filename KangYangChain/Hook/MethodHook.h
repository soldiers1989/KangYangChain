//
//  MethodHook.h
//  KangYangChain
//
//  Created by furao on 2018/10/20.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MethodHook : NSObject

+(void)swizzingForClass:(Class)cls originalSel:(SEL)originalSelector swizzingSel:(SEL)swizzingSelector;

@end
