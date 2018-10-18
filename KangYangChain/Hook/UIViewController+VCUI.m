//
//  UIViewController+VCUI.m
//  KangYangChain
//
//  Created by furao on 2018/10/3.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "UIViewController+VCUI.h"
#import <objc/runtime.h>
@implementation UIViewController (VCUI)
+(void)load{
    
    Method o = class_getInstanceMethod(self, @selector(viewDidLoad));
    
    Method t = class_getInstanceMethod(self, @selector(__viewDidLoad));
    
    method_exchangeImplementations(o, t);
    

    
}
- (void)__resetNav{
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent; //设置电池栏位白色效果
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.barTintColor = rgba(29, 36, 61, 1);
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];

}
- (void)__viewDidLoad{
    
  
    [self __resetNav];
    
    [self __viewDidLoad];
    

}
@end
