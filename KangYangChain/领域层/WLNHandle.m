//
//  WLNHandle.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle() 

@property (nonatomic, assign ) BOOL isImpMented;
@property (nonatomic, strong ) id <Interface> impl;
@property (nonatomic, assign ) Class cls;

@end
@implementation WLNHandle

- (void)rmbBackWith:(id)data{
    
    
    NSNumber *last = data[@"1"][@"last"];
    
    NSNumber *USD = data[@"currencies_rate"][@"USD"];
    
    double rmb = last.doubleValue / USD.doubleValue / 100;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(result:sel:)]) {
        
        [self.delegate result:@(rmb) sel:NSStringFromSelector(self.sel)];
        
    }

    
}
/**
 所有请求全部经过这里
 
 */
- (void)result:(id)data sel:(NSString *)sel{
    
    
    if ([NSStringFromSelector(self.sel) isEqualToString:@"rmbPrice:"]) {
    
        [self rmbBackWith:data];
        return;
        
    }
    
    if ([data[@"code"] integerValue] == 200) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(result:sel:)]) {
            
            [self.delegate result:data[@"data"] sel:NSStringFromSelector(self.sel)];
            
        }
        
    }else{
        
        [SVProgressHUD showErrorWithStatus:data[@"message"]];
        
        if (self.delegate  && [self.delegate respondsToSelector:@selector(faild:sel:)]) {
            
            [self.delegate faild:data[@"message"] sel:NSStringFromSelector(self.sel)];
            
        }
        
    }
    
    
}

- (void)faild:(id)data sel:(NSString *)sel{
    
    
    if ([data isKindOfClass:[NSError class]]) {
        
        NSError *error = (NSError *)data;
        NSLog(@"-----------------------------------%ld",error.code);
        
        
    }
    
}
//- (void)implementWith:(id<Interface>)impl{
//    
//    self.impl = impl;
//    self.cls = [impl class];
//    
//    
//    
//}
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    
//    if (self.impl && [self.impl respondsToSelector:aSelector]) {
//        
//        return self.impl;
//        
//    }else if (self.cls && [self.cls respondsToSelector:aSelector]){
//        
//        return self.cls;
//        
//    }else{
//        
//        return nil;
//    }
//  
//}

@end
