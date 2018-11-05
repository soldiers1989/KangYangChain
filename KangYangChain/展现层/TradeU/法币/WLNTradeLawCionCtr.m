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
@end

@implementation WLNTradeLawCionCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"法币(USDT)".Intl;
    
    [self tabType:1];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:WLNTradeLawCionCell.class forCellReuseIdentifier:@"WLNTradeLawCionCell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(addAction)];
    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"购买",@"出售",@"委托单",@"订单"]];
    self.tab.tableHeaderView = view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNTradeLawBHeaderView *view = [[WLNTradeLawBHeaderView alloc]init];
    view.forwarder = self;
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
    
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}
- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    _currentType = tag;
    
    if (tag == 3) {
        
        [self push:@"WLNTradeLawBOrderCtr".instance];
        
    }
    
    
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
        
        WLNFloatView *view  = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"11",@"111", nil];
        
        [view show];
        
        
    }else{
        
        WLNFloatView *view  = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"11222",@"222", nil];
        
        [view show];
        
    }
    
}



@end
