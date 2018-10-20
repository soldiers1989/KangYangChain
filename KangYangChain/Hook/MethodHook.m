//
//  MethodHook.m
//  KangYangChain
//
//  Created by furao on 2018/10/20.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "MethodHook.h"
#import <objc/runtime.h>
@implementation MethodHook
+(void)swizzingForClass:(Class)cls originalSel:(SEL)originalSelector swizzingSel:(SEL)swizzingSelector
{
    Class class = cls;
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method  swizzingMethod = class_getInstanceMethod(class, swizzingSelector);
    
    BOOL addMethod = class_addMethod(class,
                                     originalSelector,
                                     method_getImplementation(swizzingMethod),
                                     method_getTypeEncoding(swizzingMethod));
    
    if (addMethod) {
        class_replaceMethod(class,
                            swizzingSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }else{
        
        method_exchangeImplementations(originalMethod, swizzingMethod);
    }
}
@end
