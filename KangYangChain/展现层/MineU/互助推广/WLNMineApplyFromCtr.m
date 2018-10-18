//
//  WLNMineApplyFromCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/15.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineApplyFromCtr.h"


@interface WLNMineApplyFromCtr ()<WLNReqstProtocol>

@property (nonatomic, strong) UILabel *lowBuyLab;
@property (nonatomic, strong) UILabel *interestLab;
@property (nonatomic, strong) UITextField *countTxt;


@end

@implementation WLNMineApplyFromCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"买入".Intl;
    
    [self baseInfo];
    
}
- (void)baseInfo{
    
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[DELEGATES] = self;
    dic[@"uid"] = [self userModel].userid;    
    [self routeTargetName:@"WLNHandle" actionName:@"buyInfo:" param:dic];
    
    
    
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"buyInfo:"]) {
        
        self.lowBuyLab.text = [NSString stringWithFormat:@"最低可购买:%@GHB",data[@"minmum"]];
        self.interestLab.text = [NSString stringWithFormat:@"%@ %% ",data[@"scale"]];
        
        
    }else if ([sel isEqualToString:@"buyGHB:"]){
        
      
        if (_didSucessBlock) {
            _didSucessBlock();
            
        }
        [SVProgressHUD showSuccessWithStatus:@"购买成功!"];
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    
}
- (void)buyAction{
    
    
    
    NSMutableDictionary *dic =@{}.mutableCopy;
  
    dic[DELEGATES] = self;
    dic[@"uid"] = [self userModel].userid;
    dic[@"num"] = self.countTxt.text;
    
    
    
    [self routeTargetName:@"WLNHandle" actionName:@"buyGHB:" param:dic];
    
    
    
    
    
}



@end
