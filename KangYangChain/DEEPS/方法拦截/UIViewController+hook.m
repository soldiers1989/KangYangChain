//
//  UIViewController+hook.m
//  KangYangChain
//
//  Created by edz on 2018/10/19.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIViewController+hook.h"
#import <objc/runtime.h>
#import "NSObject+Swizzle.h"
@implementation UIViewController (hook)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
  
        [self swizzleMethod:@selector(viewDidLoad) swizzledSelector:@selector(__viewDidLoad)];
        
        [self swizzleMethod:@selector(viewWillAppear:) swizzledSelector:@selector(fr_viewWillAppear:)];

    });
                  
    
   

    
}

- (void)fr_viewWillAppear:(BOOL)animated{
    
    NSLog(@"🍓🍓🍓 当前控制器 : %@",NSStringFromClass([self class]));
    
    [self fr_viewWillAppear:animated];

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
