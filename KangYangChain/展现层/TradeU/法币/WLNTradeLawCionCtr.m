//
//  WLNTradeLawCionCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawCionCtr.h"

@interface WLNTradeLawCionCtr ()<UITableViewDelegate,UITableViewDataSource,WLNSimpleHeadViewDelegate>
{
    NSInteger _currentType;

}
@property (nonatomic, strong) UIView *headBottomView;

@end

@implementation WLNTradeLawCionCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"法币(USDT)".Intl;
    
    [self tabType:1];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:WLNTradeLawCionCell.class forCellReuseIdentifier:@"WLNTradeLawCionCell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:@"add".image style:UIBarButtonItemStyleDone target:self action:@selector(addAction)];
    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"购买",@"出售",@"委托单",@"订单"]];
    self.tab.tableHeaderView = view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (_currentType == 0) {
        return 30;
    }else if (_currentType == 1){
        return 50;
    }else{
        return 0.1;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNTradeLawBHeaderView *view = [[WLNTradeLawBHeaderView alloc]init];
    view.layer.masksToBounds = YES;
    
    self.headBottomView = view.headBottomView;
    
    
    view.forwarder = self;
    
  
    if (_currentType == 2 || _currentType == 3) {
        return nil;
    }
    
    return view;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeLawCionCell *cell =[tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawCionCell"];
    cell.bottomView.hidden = _currentType == 2 ? NO :YES;
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}
- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    _currentType = tag;
    
    
    if (tag == 0) {
        
    }else if (tag == 1){
        
        
        
    }else if (tag == 2){
        
    }else{
        
        [self push:@"WLNTradeLawBOrderCtr".instance];
        
    }
    [self.tab reloadData];

    
}
- (void)addAction{
    
    if (_currentType == 0) {
        
        [self push:@"WLNTradeLawBuyCtr".instance];
        
    }else if (_currentType == 1){
        
        
        
    }else if(_currentType == 2){
        
        [self push:@"WLNTradeLawBPublishCtr".instance];
        
        
    }else{
        
    }
}
- (void)topAction:(UITapGestureRecognizer *)tap{
    
    NSInteger tag = tap.view.tag;
    
    if (tag == 0) {
        
        
        
    }else if (tag == 1){
        
        WLNFloatView *view  = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"所有金额",@"5万以上",@"10万以上",@"20万以上", nil];
        
        [view show];
        
        
    }else{
        
        WLNFloatView *view  = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"所有方式",@"银行卡",@"支付宝",@"微信支付", nil];
        
        [view show];
        
    }
    
}



@end
