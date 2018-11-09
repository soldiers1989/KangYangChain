//
//  WLNTradeAgreeOrderCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreeOrderCtr.h"

@interface WLNTradeAgreeOrderCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@end

@implementation WLNTradeAgreeOrderCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeAgreeOrderCell.class forCellReuseIdentifier:@"WLNTradeAgreeOrderCell"];
    
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"agreeOrder:" param:dic];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLNTradeAgreeOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeAgreeOrderCell"];
    
    
    return cell;
    
}

@end
