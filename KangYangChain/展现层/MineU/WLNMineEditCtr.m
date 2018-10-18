//
//  WLNMineEditCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/13.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineEditCtr.h"

@interface WLNMineEditCtr ()

@end

@implementation WLNMineEditCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑姓名".Intl;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(saveChange)];

    
    
}
- (void)saveChange{
    
    [self routeTargetName:@"WLNHandle" actionName:@"resetName:" param:nil];
    
    
    
}

@end
