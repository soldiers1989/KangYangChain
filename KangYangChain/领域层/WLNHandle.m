//
//  WLNHandle.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle() 

@property (nonatomic, assign ) BOOL isImpMented;
@property (nonatomic, strong ) id <Interface> impl;
@property (nonatomic, assign ) Class cls;

@end
@implementation WLNHandle

- (void)implementWith:(id<Interface>)impl{
    
    self.impl = impl;
    self.cls = [impl class];
    
    
    
}
- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    if (self.impl && [self.impl respondsToSelector:aSelector]) {
        
        return self.impl;
        
    }else if (self.cls && [self.cls respondsToSelector:aSelector]){
        
        return self.cls;
        
    }else{
        
        return nil;
    }
  
    
}

@end
