//
//  WLNOrderCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNOrderCtr.h"

@interface WLNOrderCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@property (nonatomic, strong) UITableView *tab;
@property (nonatomic, strong) NSMutableArray *dataArrs;


@end

@implementation WLNOrderCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账单".Intl;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.view addSubview:self.tab];
    [self.tab registerClass:WLNOrderCell.class forCellReuseIdentifier:@"WLNOrderCell"];
    
    
    
    [self routeTargetName:@"WLNHandle" actionName:@"orderSearch:" param:@{DELEGATES:self}.mutableCopy];
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    self.dataArrs = (NSMutableArray *)data;
    [self.tab reloadData];
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArrs.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNOrderCell"];
 
    NSMutableDictionary *dic = self.dataArrs[indexPath.row];
    
    
    cell.timeLab.text = [self getTimeFromTimesTamp:dic[@"time"]];
    
    
    return cell;
    
    
}
- (NSString *)getTimeFromTimesTamp:(NSString *)timeStr

{
    double time = [timeStr doubleValue];
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSString *timeS = [formatter stringFromDate:myDate];
    return timeS;
    
}

- (UITableView *)tab{
    
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tab;
}

@end
