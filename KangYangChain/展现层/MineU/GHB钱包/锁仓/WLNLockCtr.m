//
//  WLNLockCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNLockCtr.h"

@interface WLNLockCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@end

@implementation WLNLockCtr


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"锁仓".Intl;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNLockCell.class forCellReuseIdentifier:@"WLNLockCell"];
    

    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"我的锁仓" style:UIBarButtonItemStyleDone target:self action:@selector(lockList)];
    
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    
    dic[DELEGATES] = self;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:@"WLNHandle" actionName:@"lockConfig:" param:dic];
    
}
- (void)lockList{
    
    [self.navigationController pushViewController:@"WLNLockListCtr".instance animated:YES];
    
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

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNLockCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNLockCell"];
    
    cell.bizhongLab.text = @"币种";
    cell.zhuanruCountLab.text = @"转入数量";
    cell.lockTimeLab.text = @"锁仓时间";
    cell.reciveLab.text = @"收益";
    cell.statusLab.text = @"状态";
    
    return cell;
}

@end
