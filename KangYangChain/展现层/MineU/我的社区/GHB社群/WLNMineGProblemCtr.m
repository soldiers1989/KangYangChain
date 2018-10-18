//
//  WLNMineGProblemCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGProblemCtr.h"

@interface WLNMineGProblemCtr ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tab;
@end

@implementation WLNMineGProblemCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab.dataSource = self;
    self.tab.delegate = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tab registerClass:WLNMineGProblemCell.class forCellReuseIdentifier:@"WLNMineGProblemCell"];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineGProblemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGProblemCell"];
    
    return cell;
    
}




@end
