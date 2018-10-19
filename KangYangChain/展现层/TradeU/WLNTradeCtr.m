//
//  WLNTradeCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeCtr.h"

@interface WLNTradeCtr ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tab;
@end

@implementation WLNTradeCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易所".Intl;
    
    [self.view addSubview:self.tab];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:WLNTradeCell.class forCellReuseIdentifier:@"WLNTradeCell"];

    WLNTradeHeadView *view = [WLNTradeHeadView shared];
    view.topArr = @[@"行情".Intl,@"法币".Intl,@"币币".Intl,@"合约".Intl].mutableCopy;
    view.bottomArr = @[@"ETC",@"USDT",@"BTC",@"ETH",@"自选".Intl].mutableCopy;
    
    
    [view setDidClickTopBLock:^(NSInteger tag) {
    
        
        
    }];
    
    
    
    
    
    
    
    self.tab.tableHeaderView = view;

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
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [SVProgressHUD showErrorWithStatus:@"功能开发中"];
    
}
- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 64) style:UITableViewStylePlain];
        
    }
    return _tab;
}




@end
