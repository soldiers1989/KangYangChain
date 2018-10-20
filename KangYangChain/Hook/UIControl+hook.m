//
//  UIControl+hook.m
//  KangYangChain
//
//  Created by edz on 2018/10/19.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIControl+hook.h"
#import <objc/runtime.h>
#import "MethodHook.h"
@implementation UIControl (hook)

+(void)load{
   
    
    
    SEL originalSelector = @selector(sendAction:to:forEvent:);
    SEL swizzingSelector = @selector(fr_sendAction:to:forEvent:);
    
    [MethodHook swizzingForClass:self originalSel:originalSelector swizzingSel:swizzingSelector];

 
}
- (void)fr_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    
    NSLog(@"🍌🍌🍌当前点击方法 : %@ - %@",target,NSStringFromSelector(action));
    
    [self fr_sendAction:action to:target forEvent:event];
    
    
    
}
@end
