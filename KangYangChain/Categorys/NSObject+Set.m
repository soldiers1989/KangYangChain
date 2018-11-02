//
//  NSObject+Set.m
//  KangYangChain
//
//  Created by edz on 2018/11/2.
//  Copyright © 2018 furao. All rights reserved.
//

#import "NSObject+Set.h"

@implementation NSObject (Set)

- (User *)userModel{
    
    NSUserDefaults *de =[NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dic = [de objectForKey:@"log"];
    User *model = [[User alloc]initWithDictionary:dic];
    return model;
    
}
- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName{
    
    return [self routeTargetName:targetName actionName:actionName param:nil];
    
}

- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName blockParam:(void(^)(NSDictionary*))completion{
    
    return [self routeTargetName:targetName actionName:actionName param:completion];
    
}

- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName param:(id)param{
    
    Class targetClass = NSClassFromString(targetName);
    SEL actionSel = NSSelectorFromString(actionName);
    
    NSObject *targetObj = [targetClass new];
    if ([targetObj respondsToSelector:actionSel]) {
        
        NSMethodSignature *signture = [targetObj methodSignatureForSelector:actionSel];
        NSString *returnType = [NSString stringWithUTF8String:signture.methodReturnType];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        if([returnType isEqualToString:@"@"]){
            return [targetObj performSelector:actionSel withObject:param];
        }else if([returnType isEqualToString:@"v"]||[returnType isEqualToString:@"V"]){
            
            [targetObj performSelector:actionSel withObject:param];
            return nil;
            
        }else{
            
            [targetObj performSelector:actionSel withObject:param];
            return nil;
        }
        
#pragma clang diagnostic pop
    }else{
        
        NSLog(@"error:%@没有%@方法", targetName, actionName);
        return nil;
    }
}

@end
