//
//  WLNRSendMoneyCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNRSendMoneyCtr.h"

@interface WLNRSendMoneyCtr ()<WMYActionSheetDelegate,WLNReqstProtocol>

@property (nonatomic,strong) UITableView *tab;
@property (nonatomic, strong) UITextField *addressTxt;
@property (nonatomic, strong) UITextField *numTxt;


@end

@implementation WLNRSendMoneyCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提币".Intl;
    
    self.addressTxt.text = @"1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY";
    
    
    [self.addressTxt letPadding:10];
    [self.numTxt letPadding:10];
    
  
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    [SVProgressHUD showSuccessWithStatus:@"发送成功"];
    [self.navigationController popViewControllerAnimated:YES];
    

}
- (void)faild:(id)data sel:(NSString *)sel{
    
    [SVProgressHUD showErrorWithStatus:@"发送失败"];
    
    
}

- (void)sendAction{
    
    if (self.addressTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"地址格式不正确"];
        return;
    }
    if (self.numTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入数量"];
        return;
    }
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    
    dic[DELEGATES] = self;
    
    dic[@"sendAddress"] = self.addressTxt.text;
    
    dic[@"sendNum"] = self.numTxt.text;
    
    [self routeTargetName:@"WLNHandle" actionName:@"send:" param:dic];
    
    
}
- (void)chooseAction{
    
    WMYActionSheet *sheet = [[WMYActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"BTC",@"USDT", nil];
    
    
    
    [sheet show];

}
- (void)actionSheet:(WMYActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    
}
- (void)saoAction{
    
    
    
    
}
- (void)allAction{
    
    self.numTxt.text = [NSString stringWithFormat:@"%.5f",[WLNWalletSingle shared].changeBalance];
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
