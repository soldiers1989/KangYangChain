//
//  UIViewController+hook.m
//  KangYangChain
//
//  Created by edz on 2018/10/19.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIViewController+hook.h"
#import <objc/runtime.h>

@implementation UIViewController (hook)

+(void)load{
    
    Method o = class_getInstanceMethod(self, @selector(viewDidLoad));
    
    Method t = class_getInstanceMethod(self, @selector(__viewDidLoad));
    
    method_exchangeImplementations(o, t);
    
    
    Method AMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    
    
    Method BMethod = class_getInstanceMethod([self class], @selector(fr_viewWillAppear:));
    
    method_exchangeImplementations(AMethod, BMethod);
    
    
    
    Method select = class_getInstanceMethod([self class], @selector(tableView:didSelectRowAtIndexPath:));
    
    Method selectc = class_getInstanceMethod([self class], @selector(fr_tableView:didSelectRowAtIndexPath:));
    
    method_exchangeImplementations(select, selectc);

    
    
}
- (void)fr_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"fdsfasfsa");
    
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


//-(void)setTab:(UITableView *)tab{
//    
//    objc_setAssociatedObject(self, @selector(<#selector#>), box, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//
//    
//}
//- (UITableView *)tab{
//    
//    
//}



@end
