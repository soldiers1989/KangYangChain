//
//  WLNMineGProblemCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGProblemCtr.h"

@interface WLNMineGProblemCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNMineGProblemCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tab.dataSource = self;
    self.tab.delegate = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tab tabType:1];
    
    
    [self.tab registerClass:WLNMineGProblemCell.class forCellReuseIdentifier:@"WLNMineGProblemCell"];
    
    
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
