//
//  WLNReceiveMoneyCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNReceiveMoneyCtr.h"

@interface WLNReceiveMoneyCtr ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *bottomLab;

@end

@implementation WLNReceiveMoneyCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充币".Intl;
    
    self.titleLab.text = [NSString stringWithFormat:@"向如下地址发送%@",[WLNWalletSingle shared].currentType];
    
    self.bottomLab.text = [NSString stringWithFormat:@"请确保向改地址发送的是%@,否则资产将会丢失且无法找回",[WLNWalletSingle shared].currentType];
    
    self.img.image = [[WLNQRCode new] jy_QRCodeFromString:[WLNWalletSingle shared].address size:100];

    self.addressLab.text = [WLNWalletSingle shared].address;
    
    
}

- (void)copyAddressAction{
    
    [SVProgressHUD showSuccessWithStatus:@"复制成功"];
 
}


@end
