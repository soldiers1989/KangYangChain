//
//  WLNTradeAgreeCloseCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreeCloseCtr.h"

@interface WLNTradeAgreeCloseCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNTradeAgreeCloseCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeHangCell.class forCellReuseIdentifier:@"WLNTradeHangCell"];
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"closeAgreeLog:" param:dic];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    self.dataArr = data;
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
    
    WLNTradeHangCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeHangCell"];
    
    cell.dic = self.dataArr[indexPath.row];
    
    return cell;
    
    
}

@end
