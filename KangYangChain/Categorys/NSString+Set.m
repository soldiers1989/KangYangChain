//
//  NSString+Set.m
//  KangYangChain
//
//  Created by edz on 2018/11/2.
//  Copyright © 2018 furao. All rights reserved.
//

#import "NSString+Set.h"

@implementation NSString (Set)
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
