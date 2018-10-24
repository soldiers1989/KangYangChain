//
//  WLNWalletHeadView.h
//  KangYangChain
//
//  Created by edz on 2018/10/18.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNWalletHeadView : FlexCustomBaseView

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *balanceLab;
@property (nonatomic, strong) UILabel *rmbLab;
@property (nonatomic, strong) UILabel *bizhongChoseLab;
@property (nonatomic, strong) UILabel *bizhongTypeLab;
@property (nonatomic, strong) NSString  *currentType;

@end

NS_ASSUME_NONNULL_END
