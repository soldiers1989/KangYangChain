//
//  UIViewController+furaohook.m
//  bither-ios
//
//  Created by furao on 2018/9/30.
//  Copyright © 2018年 Bither. All rights reserved.
//

#import "UIViewController+furaohook.h"
#import <objc/runtime.h>
@implementation UIViewController (furaohook)
+(void)load{
    
    
    Method AMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));

    
    Method BMethod = class_getInstanceMethod([self class], @selector(fr_viewWillAppear:));

    method_exchangeImplementations(AMethod, BMethod);

}

- (void)fr_viewWillAppear:(BOOL)animated{

    NSLog(@"🍓🍓🍓 当前控制器 : %@",NSStringFromClass([self class]));
    
    [self fr_viewWillAppear:animated];
    
    
    
}
@end
