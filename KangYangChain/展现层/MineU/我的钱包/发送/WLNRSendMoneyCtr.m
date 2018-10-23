//
//  WLNRSendMoneyCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNRSendMoneyCtr.h"

@interface WLNRSendMoneyCtr ()<WMYActionSheetDelegate,WLNReqstProtocol,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITextField *addressTxt;
@property (nonatomic, strong) UITextField *numTxt;

@property (nonatomic, strong) UILabel *typeLab;
@property (nonatomic, strong) UILabel *bottomLab;

@property (nonatomic, strong) GalenPayPasswordView *pwd;


@end

@implementation WLNRSendMoneyCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提币".Intl;
    
    [self tabType:1];

    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    
    
    [self.tab registerClass:WLNRSendMoneyCell.class forCellReuseIdentifier:@"WLNRSendMoneyCell"];
    
    
    self.addressTxt.text = @"1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY";
    
    self.typeLab.text = [WLNWalletSingle shared].currentType;
    
    self.bottomLab.text = [NSString stringWithFormat:@"请确保正在发送的是一个 %@ 地址 否则字长丢失且无法找回",[WLNWalletSingle shared].currentType];
    
    [self.addressTxt letPadding:10];
    [self.numTxt letPadding:10];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(cashList)];
    
  
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNRSendMoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNRSendMoneyCell"];
    
    
    return cell;
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)cashList{
    
    
    
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    [self.pwd showSuccess:@"发送成功"];
    
    [self.navigationController popViewControllerAnimated:YES];
    

}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    [self.pwd hiddenPayPasswordView];
    
    [SVProgressHUD showErrorWithStatus:@"发送失败"];
    
    
}

- (void)showPwd{
    
    if (self.addressTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"地址格式不正确"];
        return;
    }
    if (self.numTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入数量"];
        return;
    }
    
    self.pwd = [GalenPayPasswordView tradeView];
    
    [self.pwd showInView:self.view.window];
    
    __block typeof(GalenPayPasswordView *) blockPay=self.pwd;
    
    weakSelf(self);
    
    [self.pwd setFinish:^(NSString * pwd) {
        
        [blockPay showProgressView:@"正在处理..."];
        
        [weakself sendAction];
        
        
    }];
    
    
}
- (void)sendAction{
    
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
    
    if (buttonIndex == 0) {
        return;
    }
    
    
    
    
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
