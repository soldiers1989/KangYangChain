//
//  WLNPropertyHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNPropertyHeadView.h"

@implementation WLNPropertyHeadView

- (void)clickAction:(UITapGestureRecognizer *)tap{
    
    if (_didClickBlock) {
        _didClickBlock(tap.view.tag);
        
    }
    
    
}

@end
