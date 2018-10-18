//
//  UIControl+furaohook.m
//  bither-ios
//
//  Created by furao on 2018/9/30.
//  Copyright © 2018年 Bither. All rights reserved.
//

#import "UIControl+furaohook.h"
#import <objc/runtime.h>

@implementation UIControl (furaohook)

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
