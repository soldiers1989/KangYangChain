//
//  WLNTradeCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeCtr.h"

@interface WLNTradeCtr ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isChange;
    
}
@end

@implementation WLNTradeCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易所".Intl;
    
    [self tabType:0];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:WLNTradeCell.class forCellReuseIdentifier:@"WLNTradeCell"];
    
    WLNTradeHeadView *view = [WLNTradeHeadView shared];
    view.topArr = @[@"行情".Intl,@"法币".Intl,@"币币".Intl,@"合约".Intl].mutableCopy;
    view.bottomArr = @[@"ETC",@"USDT",@"BTC",@"ETH",@"自选".Intl].mutableCopy;
    
    
    weakSelf(self);
    
    [view setDidClickTopBLock:^(NSInteger tag) {
    
        
        [weakself gotoNext:tag];
        
        
    }];
    
    [view setDidClickBottomBLock:^(NSInteger tag) {
       
        [weakself changeDataSource:tag];
        
    }];
    
    self.tab.tableHeaderView = view;

}
- (void)changeDataSource:(NSInteger)tag{
    
    if (tag == 4) {
        
        _isChange = YES;
        
    }else{
        _isChange = NO;
        
    }
    [self.tab reloadData];

}
- (void)gotoNext:(NSInteger)tag{
    
    if (tag == 1) {
        [self.navigationController pushViewController:@"WLNTradeLawCionCtr".instance animated:YES];
        
    }else if (tag == 2){
        [self.navigationController pushViewController:@"WLNTradeBBCtr".instance animated:YES];
        
    }else{
        [self.navigationController pushViewController:@"WLNTradeAgreementCtr".instance animated:YES];
        
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"RGH";
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    cell.cellect.hidden = !_isChange;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


@end
