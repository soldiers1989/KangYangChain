//
//  WLNMineGForumDetailCtr.m
//  KangYangChain
//
//  Created by furao on 2018/11/6.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGForumDetailCtr.h"

@interface WLNMineGForumDetailCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>
@property (nonatomic, strong) NSMutableArray *commentArrs;
@property (nonatomic, strong) LTInputAccessoryView *inputView;

@end

@implementation WLNMineGForumDetailCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"社区详情".Intl;
    
    self.commentArrs = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    
    [self.tab registerClass:WLNMineForumDetailCommentCell.class forCellReuseIdentifier:@"WLNMineForumDetailCommentCell"];
    [self.tab registerClass:WLNMineGForumDetailCell.class forCellReuseIdentifier:@"WLNMineGForumDetailCell"];

    NSMutableDictionary *dic = @{}.mutableCopy;
    
    dic[@"id"] = self.infoDic[@"id"];
    
    [self routeTargetName:Handle actionName:@"commentList:" param:dic];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"commentList:"]){
        
        self.commentArrs = data;
        
    }
    [self.tab reloadData];
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 1 : 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self info_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self comment_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
}
- (UITableViewCell *)info_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineGForumDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGForumDetailCell"];
    
    cell.dic = self.infoDic;
    
    return cell;
}
- (UITableViewCell *)comment_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLNMineForumDetailCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineForumDetailCommentCell"];
    return cell;
}

@end
