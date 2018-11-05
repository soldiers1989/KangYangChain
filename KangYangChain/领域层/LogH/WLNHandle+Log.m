//
//  WLNHandle+Log.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Log.h"


@implementation WLNHandle (Log)

- (void)__requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel{
    
    
    self.sel = sel;
    
    
    NSMutableDictionary *dicp = @{}.mutableCopy;
    
    if (url) {
        dicp[URLS] = url;
        
    }
    if (dic) {
        dicp[PRAMAS] = dic;
        
    }
    [self routeTargetName:@"WLNData" actionName:@"postWithDic:" param:dicp];

 
}

- (void)log:(NSMutableDictionary *)dic{
    
    [self __requestWith:Logurl dic:dic sel:_cmd];
    
}
- (void)registers:(NSMutableDictionary *)dic{
    
    [self __requestWith:Register dic:dic sel:_cmd];
    
}
- (void)getCode:(NSMutableDictionary *)dic{
    
    [self __requestWith:Getcode dic:dic sel:_cmd];
    
}
- (void)fafdasfdasfds:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:fdsfdsf dic:dic sel:_cmd];
    
}
- (void)forGet:(NSMutableDictionary *)dic{
    
    [self __requestWith:ForGet dic:dic sel:_cmd];
    
}

- (void)logout:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:OutLog dic:dic sel:_cmd];
    
}
- (void)judgeNet{
    
    [self __requestWith:@"http://www.baidu.com" dic:nil sel:_cmd];
    
}
- (NSDictionary *)readUserDic{
    
    NSUserDefaults *de =[NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [de objectForKey:@"log"];
    
    return dic;
    
}
- (void)saveUserDic:(NSMutableDictionary *)dic{
    
    NSUserDefaults *de =[NSUserDefaults standardUserDefaults];
    [de setValue:dic forKey:@"log"];
    
}
- (void)deleteUserDic{
    
    NSUserDefaults *de = [NSUserDefaults standardUserDefaults];
    
    [de removeObjectForKey:@"log"];
    
}
@end
