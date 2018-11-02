//
//  WLNHandle+EOS.m
//  KangYangChain
//
//  Created by furao on 2018/10/29.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+EOS.h"

@implementation WLNHandle (EOS)




- (void)getEOSKeys:(NSMutableDictionary *)dic{
    
    
    [EosEncode getEosKeys:^(NSString *privateKey, NSString *publicKey) {
    
        
        
        NSLog(@"%@,%@",publicKey,privateKey);
        
        
    }];
    
    
    
    
    
}
- (void)getEOSBalance:(NSMutableDictionary *)dic{
    
    
}


- (void)getEOSOrder:(NSMutableDictionary *)dic{
    
    
    
    
}

- (void)sendEOS:(NSMutableDictionary *)dic{
    
    
    
}




@end
