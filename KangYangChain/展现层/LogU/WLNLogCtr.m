//
//  WLNLogCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNLogCtr.h"
#import "WLNHandle.h"

@interface WLNLogCtr ()

@property (nonatomic, strong) UITextField *phoneT;
@property (nonatomic, strong) UITextField *pwdT;


@end

@implementation WLNLogCtr

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [self.phoneT setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.pwdT setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
  

}
- (UIEdgeInsets)getSafeArea:(BOOL)portrait{
    
    return UIEdgeInsetsZero;
    
}


/*
 登录
 */
- (void)logAction{
    
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[DELEGATES] = self;
    
    if (self.phoneT.text.length != 11) {
        
        [SVProgressHUD showErrorWithStatus:@"手机号码格式不正确".Intl];
        return;
        
    }else if (self.pwdT.text.length == 0){
        
        [SVProgressHUD showErrorWithStatus:@"密码格式不正确".Intl];
        return;
    }
    
    dic[@"account"] = self.phoneT.text;
    dic[@"pass"] = self.pwdT.text;
    dic[@"app"] = @(1);
    
    [SVProgressHUD show];
    
    [self routeTargetName:@"WLNHandle" actionName:@"log:" param:dic];
    
    
    
    


}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"log:"]) {
        
        
        if (data) {
            
            WLNMainTabBarCtr *tabbar = (WLNMainTabBarCtr *)self.tabBarController;

            NSUserDefaults *de = [NSUserDefaults standardUserDefaults];
            
            [de setValue:data forKey:@"log"];
            
            [tabbar isLog:YES];
        }
     
        
    }
    
}
- (void)registerAction{
    WLNRegisterCtr *vc = [WLNRegisterCtr new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

}
- (void)forgetAction{
    

    WLNForgetCtr *vc = [WLNForgetCtr new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    

}
- (void)hideAction{
    
    self.pwdT.secureTextEntry = !self.pwdT.secureTextEntry;
    
    
    
}



@end
