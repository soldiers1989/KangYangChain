//
//  WLNTradeLawBPublishCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBPublishCtr.h"

@interface WLNTradeLawBPublishCtr ()

@end

@implementation WLNTradeLawBPublishCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布委托单".Intl;
    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"购买",@"出售"]];
    
    [self.view addSubview:view];
    
    
}


@end
