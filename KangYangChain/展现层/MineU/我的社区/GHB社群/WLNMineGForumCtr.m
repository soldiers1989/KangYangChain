//
//  WLNMineGForumCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/10.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGForumCtr.h"

@interface WLNMineGForumCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tab;

@end

@implementation WLNMineGForumCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self.tab registerClass:WLNMineGForumCell.class forCellReuseIdentifier:@"WLNMineGForumCell"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineGForumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGForumCell"];
    
    
    return cell;
    
    
}

@end
