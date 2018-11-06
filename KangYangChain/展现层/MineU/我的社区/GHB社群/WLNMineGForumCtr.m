//
//  WLNMineGForumCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/10.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGForumCtr.h"

@interface WLNMineGForumCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@property (nonatomic, strong) UIButton *addBtn;

@end

@implementation WLNMineGForumCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"社区".Intl;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNMineGForumCell.class forCellReuseIdentifier:@"WLNMineGForumCell"];
    
    [self routeTargetName:Handle actionName:@"cardList:"];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineGForumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGForumCell"];
    
    
    return cell;
    
    
}
- (void)publishAction{
    
    [self push:@"WLNMineCardPublishCtr".instance];
    
    
    
    
}
- (UIButton *)addBtn{
    if (_addBtn == nil) {
        _addBtn = [[UIButton alloc]initWithFrame:CGRectMake( DEVICEWidth / 2, DEVICEHEIGHT - 100, 50, 50)];
        [_addBtn addTarget:self action:@selector(publishAction) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    
    return _addBtn;
}
@end
