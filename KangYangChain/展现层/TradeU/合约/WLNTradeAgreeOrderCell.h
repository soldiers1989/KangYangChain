//
//  WLNTradeAgreeOrderCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeAgreeOrderCell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *numLab;

@property (nonatomic, strong) NSMutableDictionary *dic;
@end

NS_ASSUME_NONNULL_END
