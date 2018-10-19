//
//  UIControl+hook.m
//  KangYangChain
//
//  Created by edz on 2018/10/19.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIControl+hook.h"
#import <objc/runtime.h>

@implementation UIControl (hook)

+(void)load{
    
    Method AMethod = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    
    
    Method BMethod = class_getInstanceMethod([self class], @selector(fr_sendAction:to:forEvent:));
    
    method_exchangeImplementations(AMethod, BMethod);
    
    
    
    
    
}
- (void)fr_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    
    NSLog(@"🍌🍌🍌当前点击方法 : %@-%@",self,NSStringFromSelector(action));
    
    [self fr_sendAction:action to:target forEvent:event];
    
    
    
}
@end
