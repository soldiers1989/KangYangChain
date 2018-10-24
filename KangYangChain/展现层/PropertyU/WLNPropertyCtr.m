//
//  WLNPropertyCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNPropertyCtr.h"

@interface WLNPropertyCtr ()<UITableViewDelegate,UITableViewDataSource>

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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNPropertyHeadView *view = [[WLNPropertyHeadView alloc]init];
    view.forwarder = self;
    
    return view;
    
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
- (void)changeBiAction{
    NSLog(@"trade");
}


@end
