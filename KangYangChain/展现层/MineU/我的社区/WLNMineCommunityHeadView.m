//
//  WLNMineCommunityHeadView.m
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineCommunityHeadView.h"

@implementation WLNMineCommunityHeadView

- (void)integralAction{
    
    if (_didIntegralBLock) {
        _didIntegralBLock();
        
    }
    
    
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    _dic = dic;
    
    [self.headImg sd_setImageWithURL:self.userModel.avatar.url];
    
    self.nameLab.text = [NSString stringWithFormat:@"%@级代理",dic[@"membership_grade"]];
    
    self.scoreLab.text = [NSString stringWithFormat:@"积分:%@",dic[@"integral"]];
    
    
}

@end
