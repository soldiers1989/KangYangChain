//
//  WLNMineScavengingCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/11.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineScavengingCtr.h"

@interface WLNMineScavengingCtr ()<UITableViewDelegate,UITableViewDataSource,WLNReqstProtocol>

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *linkLab;
@property (nonatomic, strong) UITableView *tab;

@property (nonatomic, strong) NSMutableArray *dataArrs;



@end

@implementation WLNMineScavengingCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫码推广".Intl;
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.dataArrs = [NSMutableArray array];
    

    
    [self.tab registerClass:WLNMineScavengingCell.class forCellReuseIdentifier:@"WLNMineScavengingCell"];
    
    
    self.img.image = [[WLNQRCode new] jy_QRCodeFromString:@"http://kyl.linkhb.com" size:100];
    
    self.linkLab.text = [NSString stringWithFormat:@"http://kyl.linkhb.com/#/register-moblie?parent=%@",self.userModel.userid];
    
    
  
    NSMutableDictionary *dic = @{}.mutableCopy;
    
    dic[DELEGATES] = self;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:@"WLNHandle" actionName:@"yaoqingList:" param:dic];
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    self.dataArrs = data;
    
    [self.tab reloadData];
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}



- (void)copyAction{
    
    [SVProgressHUD showSuccessWithStatus:@"复制成功"];
    
    UIPasteboard * pastboard = [UIPasteboard generalPasteboard];
    
    pastboard.string = self.linkLab.text;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 65;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WLNMineScanHeadView *view = [WLNMineScanHeadView shared];
    view.topArr = @[@"邀请记录"].mutableCopy;
    view.bottomArr = @[@"时间",@"佣金",@"返佣者"].mutableCopy;
    
    
    [view setDidTopClick:^{
        
        
    }];
    

    
    
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArrs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineScavengingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineScavengingCell"];
    
    cell.dic = self.dataArrs[indexPath.row];
    
    return cell;
    
}

@end
