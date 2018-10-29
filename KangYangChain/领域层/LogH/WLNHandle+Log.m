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
    
    
    
    self.delegate = dic[DELEGATES];
    self.sel = sel;
    
    [dic removeObjectForKey:DELEGATES];
    
    NSMutableDictionary *dicp = @{}.mutableCopy;
    
    dicp[DELEGATES] = self;
    
    if (url) {
        dicp[URLS] = url;
        
    }
    if (dic) {
        dicp[PRAMAS] = dic;
        
    }
    [self routeTargetName:@"WLNData" actionName:@"postWithDic:" param:dicp];

    
    
    
    
    
 
}

- (void)log:(NSMutableDictionary *)dic{
    
    [self requestWith:Logurl dic:dic sel:_cmd];
    
}
- (void)registers:(NSMutableDictionary *)dic{
    
    [self requestWith:Register dic:dic sel:_cmd];
    
}
- (void)getCode:(NSMutableDictionary *)dic{
    
    [self requestWith:Getcode dic:dic sel:_cmd];
    
}
- (void)fafdasfdasfds:(NSMutableDictionary *)dic{
    
    
    [self requestWith:fdsfdsf dic:dic sel:_cmd];
    
}
- (void)forGet:(NSMutableDictionary *)dic{
    
    [self requestWith:ForGet dic:dic sel:_cmd];
    
}

- (void)logout:(NSMutableDictionary *)dic{
    
    
    [self requestWith:OutLog dic:dic sel:_cmd];
    
}
@end
