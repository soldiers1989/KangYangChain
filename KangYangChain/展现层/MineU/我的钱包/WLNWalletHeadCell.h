//
//  WLNWalletHeadCell.h
//  WLNWallet
//
//  Created by furao on 2018/9/29.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNWalletHeadCell : FlexBaseTableCell
@property (nonatomic, strong) void (^didClickBlock)(NSInteger tag);
@property (nonatomic, strong) void (^didChangeBiBlock)(void);
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *balanceLab;
@property (nonatomic, strong) UILabel *rmbLab;


@end

NS_ASSUME_NONNULL_END
