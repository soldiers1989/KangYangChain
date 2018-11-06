//
//  WLNMineGProblemCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGProblemCtr.h"

@interface WLNMineGProblemCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation WLNMineGProblemCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"常见问题".Intl;
    self.dataArr = [NSMutableArray array];
    self.tab.dataSource = self;
    self.tab.delegate = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self tabType:1];
    
    
    [self.tab registerClass:WLNMineGProblemCell.class forCellReuseIdentifier:@"WLNMineGProblemCell"];
    
  
    [self routeTargetName:Handle actionName:@"problemList:"];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineGProblemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGProblemCell"];
    
    return cell;
    
}




@end
