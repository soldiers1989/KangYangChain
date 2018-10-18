//
//  WLNLockCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNLockCtr.h"

@interface WLNLockCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>
@property (nonatomic, strong) UITableView *tab;

@end

@implementation WLNLockCtr


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"锁仓".Intl;
    
    [self.tab registerClass:WLNLockCell.class forCellReuseIdentifier:@"WLNLockCell"];
    
    [self.view addSubview:self.tab];
    
 
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 50)];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, DEVICEWidth - 40, 40)];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setBackgroundColor:UIColor.blueColor];
    button.layer.cornerRadius = 7;
    
    [view addSubview:button];
    
    [button addTarget:self action:@selector(lockActions) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.tab.tableFooterView = view;
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    
    dic[DELEGATES] = self;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:@"WLNHandle" actionName:@"lockConfig:" param:dic];
    
}
- (void)lockActions{
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[DELEGATES] = self;
    dic[@"ghb"] = @"100";
    dic[@"ghb_lock_category_id"] = @"1";
    
    [self routeTargetName:@"WLNHandle" actionName:@"lockAction:" param:dic];

}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"lockConfig:"]) {
        

        
    }else if ([sel isEqualToString:@"lockAction:"]){
        
        
        [SVProgressHUD showSuccessWithStatus:@"锁仓成功"];
        
        
        
    }
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 1 : 5;;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
 
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLNLockCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNLockCell"];
    
    cell.bizhongLab.text = @"币种";
    cell.zhuanruCountLab.text = @"转入数量";
    cell.lockTimeLab.text = @"锁仓时间";
    cell.reciveLab.text = @"收益";
    cell.statusLab.text = @"状态";
    
    return cell;

}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLNLockCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNLockCell"];
    
    
    
    return cell;
    
}

- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tab.delegate = self;
        _tab.dataSource = self;
        
    }
    return _tab;
}
@end
