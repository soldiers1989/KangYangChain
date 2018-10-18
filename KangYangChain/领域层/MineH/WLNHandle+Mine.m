//
//  WLNHandle+Mine.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Mine.h"

@implementation WLNHandle (Mine)

- (void)__showError:(id)result{
    
    [SVProgressHUD showErrorWithStatus:@"内部错误"];
    NSError *error = (NSError *)result;
    NSLog(@"报错code =  %ld",error.code);
    
}
- (void)__requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel isPost:(BOOL)isPost{
    
    
    id <WLNReqstProtocol> delegate = dic[DELEGATES];
    
    [dic removeObjectForKey:DELEGATES];
    
    
    if (isPost) { //post请求
    
        [[WLNDataNet new]postWithUrl:url params:dic resultBlock:^(id result) {
            
            
            [SVProgressHUD dismiss];
            
            if ([result isKindOfClass:[NSError class]]) {
                
                [self __showError:result];
                return;
                
            }
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
        
        
    }else{ //get请求
        
        
        /**
         将dic变成字符串
         */
        
        for (int i = 0; i < dic.allKeys.count; i++) {
            
            if (i == 0) {
            
                url = [NSString stringWithFormat:@"%@?%@=%@",url,dic.allKeys[0],dic[dic.allKeys[0]]];
                
            }else{
                
                url = [NSString stringWithFormat:@"%@&%@=%@",url,dic.allKeys[i],dic[dic.allKeys[i]]];

                
            }
        }
        
        
        [[WLNDataNet new] getWithUrl:url resultBlock:^(id result) {
            
            [SVProgressHUD dismiss];
            
            if ([result isKindOfClass:[NSError class]]) {
                
                [self __showError:result];
                return;
                
                
            }
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

  

    
}

- (void)resetName:(NSMutableDictionary *)dic{
    
    NSLog(@"1");
    
    
}
- (void)buyGHB:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:BuyGHB dic:dic sel:@selector(buyGHB:) isPost:YES];
    
    
}
- (void)buyInfo:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:BuyInfo dic:dic sel:@selector(buyInfo:) isPost:NO];

    
}
- (void)matchList:(NSMutableDictionary *)dic{
    
    [self __requestWith:MatchList dic:dic sel:@selector(matchList:) isPost:NO];

}
- (void)matchInfo:(NSMutableDictionary *)dic{
    
    [self __requestWith:MatchInfo dic:dic sel:@selector(matchInfo:) isPost:NO];
    
}
- (void)payGHB:(NSMutableDictionary *)dic{
    
    [self __requestWith:PayGHB dic:dic sel:@selector(payGHB:) isPost:YES];
    
    
}
- (void)lockAction:(NSMutableDictionary *)dic{
    
    [self __requestWith:LockAction dic:dic sel:@selector(lockAction:) isPost:YES];
    
}
- (void)lockConfig:(NSMutableDictionary *)dic{
    
    [self __requestWith:LockcConfig dic:dic sel:@selector(lockConfig:) isPost:YES];
    
    
}
- (void)yaoqingList:(NSMutableDictionary *)dic{
    
    [self __requestWith:YaoqingList dic:dic sel:@selector(yaoqingList:) isPost:NO];
    
    
}
@end
