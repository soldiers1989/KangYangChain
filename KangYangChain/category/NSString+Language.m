//
//  NSString+Language.m
//  KangYangChain
//
//  Created by furao on 2018/10/2.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "NSString+Language.h"

@implementation NSString (Language)
+ (void)initialize{
    
}
- (NSString *)Intl{
    
    return NSLocalizedString(self, nil);
    
}
- (UIColor *)color{
    
   return [UIColor performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@Color",self])];
    
}
- (UIViewController *)instance{
    
    UIViewController *vc = [NSClassFromString(self) new];
    if (vc == nil) {
        vc = [UIViewController new];
    }
    vc.hidesBottomBarWhenPushed = YES;

    return vc;
    
}
- (UIImage *)image{
    
    return [UIImage imageNamed:self];
    
}
@end
