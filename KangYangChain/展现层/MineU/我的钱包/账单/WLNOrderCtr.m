//
//  WLNOrderCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNOrderCtr.h"

@interface WLNOrderCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>


@property (nonatomic, strong) NSMutableArray *dataArrs;


@end

@implementation WLNOrderCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账单".Intl;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self tabType:1];
    
    [self.tab registerClass:WLNOrderCell.class forCellReuseIdentifier:@"WLNOrderCell"];
    
    
    NSString *str = [NSString stringWithFormat:@"get%@Order:",[WLNSingle shared].currentType];
    
    [self routeTargetName:@"WLNHandle" actionName:str param:@{DELEGATES:self}.mutableCopy];
    
    [SVProgressHUD show];
    
    
    WLNOrderHeadView *view = [[WLNOrderHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 50)];
    view.forwarder = self;
    
    self.tab.tableHeaderView = view;
    
}
- (void)floatAction:(UITapGestureRecognizer *)tap{
    
    if (tap.view.tag == 0) {
        
        WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:BI_TITLE_ARR, nil];
        
        [view show];
        
    }else{
        WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"买入",@"卖出", nil];
        
        [view show];
        
    }
    
    
    
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    self.dataArrs = (NSMutableArray *)data;
    
    [self.tab reloadData];
    
    [SVProgressHUD dismiss];

    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
}




- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView fr_willDisplayCell:cell forRowAtIndexPath:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArrs.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNOrderCell"];
    
    NSMutableDictionary *dic = self.dataArrs[indexPath.row];
    
    
    cell.timeLab.text = [self getTimeFromTimesTamp:dic[@"time"]];
    //    cell.
    
    return cell;
    
    
}
- (NSString *)getTimeFromTimesTamp:(NSString *)timeStr

{
    double time = [timeStr doubleValue];
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"YYYY.MM.dd HH:mm"];
    NSString *timeS = [formatter stringFromDate:myDate];
    return timeS;
    
}


@end
