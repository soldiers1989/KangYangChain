//
//  WLNHandle+Trade.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Trade.h"

@implementation WLNHandle (Trade)



- (void)agreeOrder:(NSMutableDictionary *)dic{
    
    [self __requestWith:AgreeOrder dic:dic sel:_cmd isPost:NO];
  
}
- (void)createAgree:(NSMutableDictionary *)dic{
    
    [self __requestWith:CreateAgree dic:dic sel:_cmd isPost:YES];
    
   
}
- (void)closeAgreeLog:(NSMutableDictionary *)dic{
    
    [self __requestWith:CloseAgreeLog dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)holdAgreeLog:(NSMutableDictionary *)dic{
    
    [self __requestWith:HoldAgreeLog dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)agreeTradeList:(NSMutableDictionary *)dic{
    
    [self __requestWith:AgreeTradeList dic:dic sel:_cmd isPost:YES];
    
}
- (void)cionChooseList:(NSMutableDictionary *)dic{
    
    [self __requestWith:CionChooseList dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)agreeAccount:(NSMutableDictionary *)dic{
    
    [self __requestWith:AgreeAccount dic:dic sel:_cmd isPost:YES];
}

- (void)closeAgree:(NSMutableDictionary *)dic{
    
    [self __requestWith:CloseAgree dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)yingSunSet:(NSMutableDictionary*)dic{
    
    [self __requestWith:YingSunSet dic:dic sel:_cmd isPost:YES];
    
}
- (void)weituoAllHisList:(NSMutableDictionary *)dic{
    
    [self __requestWith:WeituoAllHisList dic:dic sel:_cmd isPost:NO];
    
}
@end
