//
//  WLNPropertyCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNPropertyCtr.h"

@interface WLNPropertyCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) WLNPropertyHeadView *headView;

@property (nonatomic, strong) WLNFloatView *floatView;

@end

@implementation WLNPropertyCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资产".Intl;
    
    
    [self tabType:0];
    
    self.tab.dataSource = self;
    self.tab.delegate = self;
    
    self.tab.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.tab registerClass:WLNPropertyCell.class forCellReuseIdentifier:@"WLNPropertyCell"];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.headView reloadData];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
   
    self.headView.model = [WLNSingle shared].current_model;
    
    return self.headView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 250;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNPropertyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNPropertyCell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;;
    
    
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}




- (void)clickAction:(UITapGestureRecognizer *)tap{

    NSArray *arr = @[[WLNReceiveMoneyCtr new],[WLNRSendMoneyCtr new],[WLNChangeCtr new],[WLNOrderCtr new]];

    UIViewController *vc = arr[tap.view.tag];
    vc.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:vc animated:YES];

}
- (void)changeBiAction:(UITapGestureRecognizer *)tap{
    
  
    self.floatView = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:BI_TITLE_ARR, nil];
    
    [self.floatView show];
    
    
}

- (WLNPropertyHeadView *)headView{
    if (_headView == nil) {
        _headView = [[WLNPropertyHeadView alloc]init];
        _headView.forwarder = self;
        
    }
    return _headView;
}

@end
