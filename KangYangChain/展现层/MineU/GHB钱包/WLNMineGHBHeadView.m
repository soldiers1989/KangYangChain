//
//  WLNMineGHBHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/24.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineGHBHeadView.h"

@implementation WLNMineGHBHeadView

- (void)reloadData{
    
    
    
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    
    self.balanceLab.text = dic[@"ghb2cny"];
    self.rmbLab.text = dic[@"ghb_amount"];
    
    
    
}

@end
