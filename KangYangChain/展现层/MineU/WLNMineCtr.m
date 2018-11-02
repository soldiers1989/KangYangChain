//
//  WLNMineCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineCtr.h"

typedef void (^CellBlock)(void);

@interface WLNMineCtr ()<UITableViewDataSource, UITableViewDelegate ,WMYActionSheetDelegate,WLNReqstProtocol>
{
 
    WMYActionSheet *_headSheet;
    WMYActionSheet *_outLogSheet;
    
}
@property (nonatomic, nullable, strong) NSArray *t_p_a_Arr; //title picture action

@end

@implementation WLNMineCtr

- (NSArray *)t_p_a_Arr{
    if (!_t_p_a_Arr) {
        _t_p_a_Arr = @[
  @[@{}],
  @[@{TK:@"币币账户".Intl,PK:@"account",BK:^{[self push:@"WLNWalletCtr".instance];}},
  @{TK:@"法币账户".Intl,PK:@"account",BK:^{[self push:@"WLNMineLawWalletCtr".instance];}},
  @{TK:@"合约账户".Intl,PK:@"contract",BK:^{[self push:@"WLNMineAgreeWalletCtr".instance];}}],
  
  @[@{TK:@"扫码赠送".Intl,PK:@"tuiguang",BK:^{[self push:@"WLNMineScavengingCtr".instance];}},
  @{TK:@"算力挖矿".Intl,PK:@"fenxiang",BK:^{[self push:@"WLNMineExtensionCtr".instance];}}],
  
  @[@{TK:@"身份认证".Intl,PK:@"identity",BK:^{[self push:@"WLNHTMLCtr".instance];}},
  @{TK:@"账户安全".Intl,PK:@"suotou",BK:^{[self push:@"WLNHTMLCtr".instance];}},
  @{TK:@"支付设置".Intl,PK:@"pay",BK:^{[self push:@"WLNHTMLCtr".instance];}},
  @{TK:@"手续费等级".Intl,PK:@"charge",BK:^{[self push:@"WLNHTMLCtr".instance];}}]];
        
    }
 
    return _t_p_a_Arr;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的".Intl;
    //,@[@"GHB钱包".Intl]
  
    [self tabType:0];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.tab registerClass:WLNMineSimpleCell.class forCellReuseIdentifier:@"WLNMineSimpleCell"];
    [self.tab registerClass:WLNMineHeadCell.class forCellReuseIdentifier:@"WLNMineHeadCell"];
    
    
    
    UIView *outView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth,60)];
    outView.backgroundColor =rgba(245, 245, 245, 1);
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"退出登录".Intl forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = rgba(225, 225, 225, 1);
    button.layer.cornerRadius= 7;
    button.frame = CGRectMake(10, 10, DEVICEWidth - 20,40);
    [button addTarget:self action:@selector(outAction) forControlEvents:UIControlEventTouchUpInside];
    [outView addSubview:button];
    
    
    self.tab.tableFooterView = outView;

}
- (void)result:(id)data sel:(NSString *)sel{
    
    [self outLog];
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    [self outLog];
}

#pragma mark - UITableView dataSource & delegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"  ";
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView fr_willDisplayCell:cell forRowAtIndexPath:indexPath];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0.1 : 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.t_p_a_Arr[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.t_p_a_Arr.count;
}
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self simple_tableView:tableView cellForRowAtIndexPath:indexPath];

}
 
- (UITableViewCell *)head_tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineHeadCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.forwarder = self;
    
    return cell;
    
}

- (UITableViewCell *)simple_tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineSimpleCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.img.image = [UIImage imageNamed:self.t_p_a_Arr[indexPath.section][indexPath.row][PK]];
    
    cell.lab.text = self.t_p_a_Arr[indexPath.section][indexPath.row][TK];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    CellBlock block = self.t_p_a_Arr[indexPath.section][indexPath.row][BK];
    if (block) {
        block();
    }
}
#pragma mark - 自定义方法

- (void)actionSheet:(WMYActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        return;
    }
    if (actionSheet == _headSheet) {
        
        if (buttonIndex == 1) {
            
        }else{
            
        }
        
    }else if (actionSheet == _outLogSheet){
        
        [self routeTargetName:@"WLNHandle" actionName:@"logout:" param:@{DELEGATES:self}.mutableCopy];
        
        
    }
    
}
- (void)click:(UITapGestureRecognizer *)tap{
    
    NSInteger tag = tap.view.tag;
    
    if (tag == 7) {
        
        [self chooseHead];
        
        return;
    }
    
    NSArray *arr = @[@"WLNMineGHBWalletCtr".instance,@"WLNMineCommunityCtr".instance,@"WLNMineOrderCtr".instance,@"WLNMineBusinessCtr".instance,@"".instance,@"".instance,@"WLNMineEditCtr".instance];
    
    [self.navigationController pushViewController:arr[tag] animated:YES];
    
}
/**
 退出登录
 */
- (void)outAction{
    _outLogSheet = [[WMYActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"取消".Intl destructiveButtonTitle:nil otherButtonTitles:@"退出登录".Intl, nil];
    
    [_outLogSheet show];
    
}
/**
 前往子页面
 */
- (void)chooseHead{
    
    _headSheet = [[WMYActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
    
    [_headSheet show];
    
}
- (void)outLog{
    
    NSUserDefaults *de = [NSUserDefaults standardUserDefaults];
    
    [de removeObjectForKey:@"log"];
    
    WLNMainTabBarCtr *tabbar = (WLNMainTabBarCtr *)self.tabBarController;
    
    [tabbar isLog:NO];
    
    [SVProgressHUD showSuccessWithStatus:@"退出成功"];
}

@end
