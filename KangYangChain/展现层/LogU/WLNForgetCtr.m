//
//  WLNForgetCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/9.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNForgetCtr.h"

@interface WLNForgetCtr ()<WLNReqstProtocol>
{
    int _count;
    UIView *_codeView;
    
}
@property (nonatomic, strong) UITextField *phoneTxt;
@property (nonatomic, strong) UITextField *pwdTxt;
@property (nonatomic, strong) UITextField *codeTxt;
@property (nonatomic, strong) UILabel *codeLab;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UITextField *sureCodeTxt;



@end

@implementation WLNForgetCtr
//- (UIEdgeInsets)getSafeArea:(BOOL)portrait{
//
//    return UIEdgeInsetsZero;
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"忘记密码".Intl;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成".Intl style:UIBarButtonItemStyleDone target:self action:@selector(doneAction)];


}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"getCode:"]) {
        
        [SVProgressHUD showSuccessWithStatus:@"获取验证码成功"];

        
    }else if ([sel isEqualToString:@"forGet:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"操作成功"];
        
        [self.navigationController popViewControllerAnimated:YES];

    }
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}
- (void)timeCut{
    
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    
    _count = 60;
    
    _codeView.userInteractionEnabled = NO;
    
}

- (void)timerAction{
    
    
    _count -- ;
    
    NSLog(@"%d",_count);
    
    self.codeLab.text = [NSString stringWithFormat:@"%ds",_count];
    
    if (_count == 0) {
        
        self.codeLab.text = @"获取";
        _codeView.userInteractionEnabled = YES;
        
        [self.timer invalidate];
        self.timer = nil;
        
    }
    
}

- (void)doneAction{
    
    if (self.phoneTxt.text.length != 11) {
        
        [SVProgressHUD showErrorWithStatus:@"手机号格式不正确"];
        return;
        
    }else if (self.pwdTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
        
    }else if (![self.pwdTxt.text isEqualToString:self.sureCodeTxt.text]){
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        return;
        
        
    }else if (self.codeTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
        return;
    }
    
    NSMutableDictionary *dic= @{}.mutableCopy;
    
    dic[DELEGATES] = self;
    
    
    dic[@"account"] = self.phoneTxt.text;
    dic[@"pass"] = self.pwdTxt.text;
    dic[@"verification_code"] = self.codeTxt.text;
    
    [self routeTargetName:@"WLNHandle" actionName:@"forGet:" param:dic];
    
    
}
- (void)codeAction:(UITapGestureRecognizer *)tap{
    
    if (self.phoneTxt.text.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"手机号格式不正确"];
        return;
        
    }else if (self.pwdTxt.text.length == 1){
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
        
    }else if (![self.pwdTxt.text isEqualToString:self.sureCodeTxt.text]){
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        return;
        
        
    }
    
    _codeView = tap.view;
    
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[DELEGATES] = self;
    dic[@"phone"] = self.phoneTxt.text;
    
    [self routeTargetName:@"WLNHandle" actionName:@"getCode:" param:dic];
 
    [self timeCut];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
@end
