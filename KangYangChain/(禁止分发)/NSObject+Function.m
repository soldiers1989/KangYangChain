//
//  NSObject+Function.m
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "NSObject+Function.h"

@implementation NSObject (Function)


- (User *)userModel{
    
    NSUserDefaults *de =[NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dic = [de objectForKey:@"log"];
    User *model = [[User alloc]initWithDictionary:dic];
    return model;
    
}

@end
