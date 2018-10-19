//
//  UITableView+hook.m
//  KangYangChain
//
//  Created by edz on 2018/10/19.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UITableView+hook.h"
#import <objc/runtime.h>

@implementation UITableView (hook)
+ (void)load{
    
    
    Method AMethod = class_getInstanceMethod([self class], @selector(tableView:didSelectRowAtIndexPath:));
    
    Method BMethod = class_getInstanceMethod([self class], @selector(fr_tableView:didSelectRowAtIndexPath:));
    
    method_exchangeImplementations(AMethod, BMethod);
    
    
    
}
- (void)fr_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"fdsfdasfdkalfhasdjf");
    
    
    
}
@end
