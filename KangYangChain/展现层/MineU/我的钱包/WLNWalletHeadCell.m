//
//  WLNWalletHeadCell.m
//  WLNWallet
//
//  Created by furao on 2018/9/29.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNWalletHeadCell.h"

@implementation WLNWalletHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (void)clickAction:(UITapGestureRecognizer *)tap{
    
    if (_didClickBlock) {
        _didClickBlock(tap.view.tag);
    }
    
}

@end
