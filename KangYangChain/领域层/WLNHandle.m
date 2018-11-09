//
//  WLNHandle.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle() 

@end

@implementation WLNHandle

/**
 所有请求返回结果全部经过这里
 
 */
- (void)result:(id)data sel:(NSString *)sel{
    
   
    
    if ([data[@"code"] integerValue] == 200) {
        
        [self emptyDataHandleWith:data];
        
        if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
            
            [self.reqDelegate result:data[@"data"] sel:NSStringFromSelector(self.sel)];
            
        }
        
    }else{
        
        if (self.reqDelegate  && [self.reqDelegate respondsToSelector:@selector(faild:sel:)]) {
            
            [self.reqDelegate faild:data[@"message"] sel:NSStringFromSelector(self.sel)];
            
        }
        [SVProgressHUD showErrorWithStatus:data[@"message"]];

        
    }
    
    
}
/**
 空数据处理
 */
- (void)emptyDataHandleWith:(id)data{
    
    if ([data[@"data"] isKindOfClass:[NSArray class]]) {
        
        if ([data[@"data"]count] == 0) {
            
            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(emptyShow)]) {
                [self.reqDelegate emptyShow];
                
            }
        }else{
            
            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(removeEmptyShow)]) {
                [self.reqDelegate removeEmptyShow];
                
            }
        }
        
        
    }
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    if ([data isKindOfClass:[NSError class]]) {
        
        NSError *error = (NSError *)data;
        NSLog(@"-----------------------------------%@",error.userInfo);
        
        
    }
    
}

- (void)__requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel isPost:(BOOL)isPost{
    
    
    self.sel = sel;
    
    NSMutableDictionary *dicp = @{}.mutableCopy;
    
    if (url) {
        dicp[URLS] = url;
    }
    dicp[PRAMAS] = dic == nil ? @{}.mutableCopy:dic;
    
    [self routeTargetName:@"WLNData" actionName:isPost ? @"postWithDic:":@"getWithDic:" param:dicp];
    
    
}

@end
