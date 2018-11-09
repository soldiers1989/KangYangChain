//
//  WLNTradeAgreementRightCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreementRightCtr.h"

@interface WLNTradeAgreementRightCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, assign) NSInteger closeTag;;

@end

@implementation WLNTradeAgreementRightCtr
- (CGRect)resetTabFrame{
    return CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 84 - 64);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeHoldCell.class forCellReuseIdentifier:@"WLNTradeHoldCell"];
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    
    [self routeTargetName:Handle actionName:@"holdAgreeLog:" param:dic];
    
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"holdAgreeLog:"]) {
        
        self.dataArr = [data mutableCopy];

    }else if ([sel isEqualToString:@"closeAgree:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"平常成功"];
        
        [self.dataArr removeObjectAtIndex:_closeTag];
        
        
    }else if ([sel isEqualToString:@"yingSunSet:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"设置成功"];
        
    }
    [self.tab reloadData];
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeHoldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeHoldCell"];
    cell.forwarder = self;
    
    cell.dic = self.dataArr[indexPath.row];
    cell.closeView.tag = indexPath.row;
    cell.setView.tag = indexPath.row;
    
    
    return cell;
    
}
/*
 平仓
 */
- (void)closeAction:(UITapGestureRecognizer *)tap{
    
    _closeTag = tap.view.tag;
    
    
    HYAlertView *alert = [[HYAlertView alloc]initWithTitle:@"温馨提示" message:@"确定平仓吗?" buttonTitles:@"取消",@"确定", nil];
    weakSelf(self);
    
    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
    
        if (selectIndex == 1) {
            
            NSMutableDictionary *dic =@{}.mutableCopy;
            dic[@"uid"] = weakself.userModel.userid;
            dic[@"id"] = weakself.dataArr[weakself.closeTag][@"id"];
            [weakself routeTargetName:Handle actionName:@"closeAgree:" param:dic];
            
        }
        
    }];
    
    
    
    
 
    
}
/**
 设置止盈止损
 *
 */
- (void)setAction:(UITapGestureRecognizer *)tap{
    
    
    _closeTag = tap.view.tag;
    
    weakSelf(self);
    
    WLNYingSunView *view = [WLNYingSunView shared];
    
    [view show];
    
    [view setDidDoneBlock:^(NSInteger yingsunTag, NSString * num) {
        
        NSMutableDictionary *dic =@{}.mutableCopy;
        
        dic[@"uid"] = weakself.userModel.userid;
        dic[@"id"] = weakself.dataArr[weakself.closeTag][@"id"];
        dic[@"type"] = @(yingsunTag);
        dic[@"num"] = num;
        
        [weakself routeTargetName:Handle actionName:@"yingSunSet:" param:dic];
        
        
        
    }];
    
}

@end
