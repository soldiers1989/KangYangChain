//
//  WLNTradeTradeHeadView.h
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeTradeHeadView : FlexCustomBaseView<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@property (nonatomic, strong) UITableView *tab;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) void (^didClickBlock)();

@property (nonatomic, strong) NSMutableArray *dataArrs;



@end

NS_ASSUME_NONNULL_END
