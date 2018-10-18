//
//  WLNMineHeadView.m
//  KangYangChain
//
//  Created by furao on 2018/10/2.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineHeadView.h"

@implementation WLNMineHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        self.backgroundColor = [UIColor redColor];
        self.nameLab.text = @"我是福报";
        self.headImg.image = [UIImage imageNamed:@"Snip20181002_2"];
        
        
    }
    
    
    return self;
}

@end
