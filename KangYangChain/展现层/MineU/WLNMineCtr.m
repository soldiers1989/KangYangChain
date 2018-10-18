//
//  WLNMineCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineCtr.h"

@interface WLNMineCtr ()<UITableViewDataSource, UITableViewDelegate ,WMYActionSheetDelegate>
{
    NSArray *_titleArr;
    NSArray *_imgArr;
    WMYActionSheet *_headSheet;
    WMYActionSheet *_outLogSheet;
    
}
@property (nonatomic, strong) UITableView *tab;

@end

@implementation WLNMineCtr
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
- (void)actionSheet:(WMYActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (actionSheet == _headSheet) {
        
 
        
    }else if (actionSheet == _outLogSheet){
        
        NSUserDefaults *de = [NSUserDefaults standardUserDefaults];
        
        [de removeObjectForKey:@"log"];
        
        WLNMainTabBarCtr *tabbar = (WLNMainTabBarCtr *)self.tabBarController;
        
        [tabbar isLog:NO];
        
        
    }
    
}
- (void)gotoNextWith:(NSInteger)tag{
    
    if (tag == 7) {
        
        [self chooseHead];
        
        return;
    }
    
    NSArray *arr = @[@"WLNWalletCtr".instance,@"WLNMineCommunityCtr".instance,@"WLNMineOrderCtr".instance,@"".instance,@"".instance,@"".instance,@"WLNMineEditCtr".instance];
    
    [self.navigationController pushViewController:arr[tag] animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的".Intl;
    
    _titleArr =  @[@[@""],@[@"法币账户".Intl,@"币币账户".Intl,@"合约账户".Intl],@[@"GHB钱包".Intl],@[@"扫码推广".Intl,@"互助推广".Intl],@[@"身份认证".Intl,@"账户安全".Intl,@"支付设置".Intl,@"手续费等级".Intl]];
    _imgArr = @[@[@""],@[@"account",@"account",@"contract"],@[@"money"],@[@"tuiguang",@"fenxiang"],@[@"identity",@"suotou",@"pay",@"charge"]];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"  ";
}

#pragma mark - UITableView dataSource & delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView fr_willDisplayCell:cell forRowAtIndexPath:indexPath];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0.1 : 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_titleArr[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titleArr.count;
}
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self simple_tableView:tableView cellForRowAtIndexPath:indexPath];
    
  
}
 
- (UITableViewCell *)head_tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineHeadCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    weakSelf(self);
    
    [cell setDidClick:^(NSInteger tag){
        
        [weakself gotoNextWith:tag];

    }];
    return cell;
    
}

- (UITableViewCell *)simple_tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineSimpleCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.img.image = [UIImage imageNamed:_imgArr[indexPath.section][indexPath.row]];
    
    cell.lab.text = _titleArr[indexPath.section][indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 || indexPath.section == 1) {
        return;
    }
    NSArray *arr = @[@[],
                     @[@"UIViewController",@"UIViewController",@"UIViewController"],
                     @[@"WLNMineGHBWalletCtr".instance],

                     @[@"WLNMineScavengingCtr".instance,@"WLNMineExtensionCtr".instance],
                  @[@"WLNMineIDCertifiedCtr".instance,@"WLNMineSecurityCtr".instance,@"WLNMinePaySetCtr".instance,@"WLNMineChargeCtr".instance]];
    
    [self.navigationController pushViewController:arr[indexPath.section][indexPath.row] animated:YES];
    
    
}





@end
