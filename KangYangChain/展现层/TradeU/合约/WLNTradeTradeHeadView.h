//
//  WLNTradeTradeHeadView.h
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeTradeHeadView : FlexCustomBaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tab;

@property (nonatomic, strong) UIView *backView;




@end

NS_ASSUME_NONNULL_END
