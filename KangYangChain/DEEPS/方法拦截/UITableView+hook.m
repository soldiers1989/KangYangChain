//
//  UITableView+hook.m
//  KangYangChain
//
//  Created by furao on 2018/10/20.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "UITableView+hook.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>
@implementation UITableView (hook)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(setDelegate:);
        SEL swizzingSelector = @selector(newSetDelegate:);
        
        [self swizzleMethod:originalSelector swizzledSelector:swizzingSelector];

    });
}

-(void)newSetDelegate:(id<UITableViewDelegate>)delegate
{
    [self newSetDelegate:delegate];
    
    SEL sel = @selector(tableView:didSelectRowAtIndexPath:);
    
    //这里要与底下保持一致,最好能唯一
    SEL newSel =  @selector(newTableView:didSelectRowAtIndexPath:);
    
    class_addMethod([delegate class],
                    newSel,
                    method_getImplementation(class_getInstanceMethod([self class], @selector(newTableView:didSelectRowAtIndexPath:))),
                    nil);

    [[delegate class] swizzleMethod:sel swizzledSelector:newSel];


}

-(void)newTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"我被抓住了");
    
    if ([NSStringFromClass([self class]) isEqualToString:@"WLNMineCtr"] && indexPath.section == 2) {
        
        [self newTableView:tableView didSelectRowAtIndexPath:indexPath];

    }else{
        
        [SVProgressHUD showErrorWithStatus:@"功能开发中"];
    }
  

    
}
@end
