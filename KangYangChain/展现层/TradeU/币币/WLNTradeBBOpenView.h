//
//  WLNTradeBBOpenView.h
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeBBOpenView : FlexCustomBaseView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *leftTab;
@property (nonatomic, strong) UITableView *rightTab;

@end

NS_ASSUME_NONNULL_END
