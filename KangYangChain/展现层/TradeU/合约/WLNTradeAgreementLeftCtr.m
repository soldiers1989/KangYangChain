//
//  WLNTradeAgreementLeftCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreementLeftCtr.h"

@interface WLNTradeAgreementLeftCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@property (nonatomic, strong) NSMutableArray *clistDataArr;
@property (nonatomic, strong) NSMutableArray *plistDataArr;

@end

@implementation WLNTradeAgreementLeftCtr

- (CGRect)resetTabFrame{
    return CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 44 - 64);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.clistDataArr = [NSMutableArray array];
    self.plistDataArr = [NSMutableArray array];
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeTradeCell.class forCellReuseIdentifier:@"WLNTradeTradeCell"];
    [self.tab  registerClass:WLNTradeTradeBodyCell.class forCellReuseIdentifier:@"WLNTradeTradeBodyCell"];
    
    
    
    
    WLNTradeTradeHeadView *view = [[WLNTradeTradeHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 40)];
    
    self.tab.tableHeaderView = view;
    
    
    
  
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = @"1";
    dic[@"coinid"] = @"2";
    
    [self routeTargetName:Handle actionName:@"agreeTradeList:" param:dic];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"agreeTradeList:"]) {
        
        self.clistDataArr = data[@"clist"];
        self.plistDataArr = data[@"plist"];
        [self.tab reloadData];
        
    }else if ([sel isEqualToString:@"createAgree:"]){
        
    }
    
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WLNTradeAgreementLeftHeadView *view = [[WLNTradeAgreementLeftHeadView alloc]init];
    view.layer.masksToBounds = YES;
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0.1 :  80;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ?  self.clistDataArr.count : self.plistDataArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
       return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeCell"];
    cell.forwarder = self;
    
    
    return cell;
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeBodyCell"];
    
    return cell;
    
}
#pragma mark - 买涨买跌
- (void)maizhangAction{
    
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    
    dic[@"uid"] = self.userModel.userid;
    dic[@"ctype"] = @"1";
    dic[@"coinid"] = @"1";
    dic[@"lever"] = @"1";
    dic[@"price"] = @"1";
    dic[@"num"]= @"1";
    dic[@"type"] = @"1";
    dic[@"maxline"] = @"1000";
    dic[@"minline"] = @"100";
    
    
    
    [self routeTargetName:Handle actionName:@"createAgree:" param:dic];
    
    
}
- (void)chooseAction:(UITapGestureRecognizer *)tap{
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"20X",@"30X",@"50X", nil];
    
    [view show];
    
    
}
- (void)danChooseAction:(UITapGestureRecognizer *)tap{
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"现价单",@"市价单", nil];
    
    [view show];
    
}
- (void)maidieAction{
    
    
    
    
    
    
}








@end
