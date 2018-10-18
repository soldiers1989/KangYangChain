//
//  WLNHandle+Log.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Log.h"


@implementation WLNHandle (Log)

- (void)requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel{
    
    
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    [[WLNDataNet new]postWithUrl:url params:dic resultBlock:^(id result) {
        
        if ([result[@"code"] integerValue] == 200) {
            
            if (delegate && [delegate respondsToSelector:@selector(result:sel:)]) {
                
                [delegate result:result[@"data"] sel:NSStringFromSelector(sel)];
                
            }
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:result[@"message"]];
            
            if (delegate && [delegate respondsToSelector:@selector(faild:sel:)]) {
                
                [delegate faild:result[@"message"] sel:NSStringFromSelector(sel)];
                
            }
            
            
        }
        
        
    }];
 
}

- (void)log:(NSMutableDictionary *)dic{
    
    [self requestWith:Logurl dic:dic sel:@selector(log:)];
    
}
- (void)registers:(NSMutableDictionary *)dic{
    
    [self requestWith:Register dic:dic sel:@selector(registers:)];
    
}
- (void)getCode:(NSMutableDictionary *)dic{
    
    [self requestWith:Getcode dic:dic sel:@selector(getCode:)];
    
}
- (void)fafdasfdasfds:(NSMutableDictionary *)dic{
    
    
    [self requestWith:fdsfdsf dic:dic sel:@selector(fafdasfdasfds:)];
    
}
- (void)forGet:(NSMutableDictionary *)dic{
    
    [self requestWith:ForGet dic:dic sel:@selector(forGet:)];
    
}
@end
