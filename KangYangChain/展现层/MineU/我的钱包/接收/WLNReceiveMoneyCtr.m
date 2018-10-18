//
//  WLNReceiveMoneyCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNReceiveMoneyCtr.h"

@interface WLNReceiveMoneyCtr ()

@end

@implementation WLNReceiveMoneyCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充币".Intl;
    
    self.img.image = [[WLNQRCode new] jy_QRCodeFromString:[WLNWalletSingle shared].address size:100];

    self.addressLab.text = [WLNWalletSingle shared].address;
    
    
}

- (void)copyAddressAction{
    
    [SVProgressHUD showSuccessWithStatus:@"复制成功"];
    
    
    
}


@end
