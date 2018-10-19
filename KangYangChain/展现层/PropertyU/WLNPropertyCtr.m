//
//  WLNPropertyCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNPropertyCtr.h"

@interface WLNPropertyCtr ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tab;
@end

@implementation WLNPropertyCtr
- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 64) style:UITableViewStylePlain];
        _tab.backgroundColor = maingray;
        
    }
    return _tab;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资产".Intl;
    [self.view addSubview:self.tab];
    self.tab.dataSource = self;
    self.tab.delegate = self;
    self.tab.separatorStyle =UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return [self top_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self bottom_tableView:tableView cellForRowAtIndexPath:indexPath];
  
    
    
}
-(UITableViewCell *)top_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"WLNPropertyCell";
    
    WLNPropertyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WLNPropertyCell alloc] initWithFlex:nil reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;;
        
    }
    
    return cell;
}
-(UITableViewCell *)bottom_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    static NSString *identifier = @"WLNPropertyValuationCell";
    
    WLNPropertyValuationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WLNPropertyValuationCell alloc] initWithFlex:nil reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;;
        
    }
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
@end
