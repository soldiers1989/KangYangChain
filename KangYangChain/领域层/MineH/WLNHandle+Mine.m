//
//  WLNHandle+Mine.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Mine.h"

@implementation WLNHandle (Mine)


- (void)__requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel isPost:(BOOL)isPost{
    
    
    self.sel = sel;
    
    NSMutableDictionary *dicp = @{}.mutableCopy;
        
    if (url) {
        dicp[URLS] = url;
        
    }
    if (dic) {
        dicp[PRAMAS] = dic;
        
    }
    [self routeTargetName:@"WLNData" actionName:isPost ? @"postWithDic:":@"getWithDic:" param:dicp];

    
}
- (void)sellGHB:(NSMutableDictionary *)dic{
    
}
- (void)resetName:(NSMutableDictionary *)dic{
    
    NSLog(@"1");
    
    
}
- (void)buyGHB:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:BuyGHB dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)buyInfo:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:BuyInfo dic:dic sel:_cmd isPost:NO];

    
}
- (void)matchList:(NSMutableDictionary *)dic{
    
    [self __requestWith:MatchList dic:dic sel:_cmd isPost:NO];

}
- (void)matchInfo:(NSMutableDictionary *)dic{
    
    [self __requestWith:MatchInfo dic:dic sel:_cmd isPost:NO];
    
}
- (void)payGHB:(NSMutableDictionary *)dic{
    
    [self __requestWith:PayGHB dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)lockAction:(NSMutableDictionary *)dic{
    
    [self __requestWith:LockAction dic:dic sel:_cmd isPost:YES];
    
}
- (void)lockConfig:(NSMutableDictionary *)dic{
    
    [self __requestWith:LockcConfig dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)lockList:(NSMutableDictionary *)dic{
    
    
    
}
- (void)yaoqingList:(NSMutableDictionary *)dic{
    
    [self __requestWith:YaoqingList dic:dic sel:_cmd isPost:NO];
    
    
}
@end
