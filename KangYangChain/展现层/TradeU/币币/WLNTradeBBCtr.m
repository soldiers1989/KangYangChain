//
//  WLNTradeBBCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBCtr.h"

@interface WLNTradeBBCtr ()<UITableViewDelegate,UITableViewDataSource,WLNSimpleHeadViewDelegate>
{
    BOOL _isOpen;
    
}
@property (nonatomic, strong) WLNTradeBBOpenView *openView;

@end

@implementation WLNTradeBBCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"币币".Intl;
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeBBHeadCell.class forCellReuseIdentifier:@"WLNTradeBBHeadCell"];
    [self.tab registerClass:WLNTradeBBBodyCell.class forCellReuseIdentifier:@"WLNTradeBBBodyCell"];
    
    
    [self.view addSubview:self.openView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:@"catogry".image style:UIBarButtonItemStyleDone target:self action:@selector(menuAciton)];
    
    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"币币",@"杠杆"]];
    
    self.tab.tableHeaderView = view;
    
}
- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
    
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
        
        
    }
    return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNTradeBBHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBHeadCell"];
    
    cell.forwarder = self;
    
    return cell;
    
}

- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNTradeBBBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBBodyCell"];
    
    cell.forwarder = self;
    
    return cell;
    
    
}
- (void)menuAciton{
    
    
    NSArray *arr = @[@"",@"WLNTradeAgreeCloseCtr",@"WLNTradeAgreeOrderCtr"];
    
    WLNTradeAgreeCategoryView *view = [WLNTradeAgreeCategoryView shared];
    [view show];
    
    weakSelf(self);
    [view setDidClickBLock:^(NSInteger row, NSString * _Nonnull title) {
        
        NSString *vc = arr[row];
        
        [weakself push:vc.instance title:title];
        
        
    }];
    
}
- (void)openAction:(UITapGestureRecognizer *)tap{
    
    UIView *view = tap.view;
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    
    CGRect rect=[view convertRect: view.bounds toView:window];
    
    _isOpen = !_isOpen;
    
    
    self.openView.frame =  CGRectMake(0, rect.origin.y + rect.size.height, DEVICEWidth, DEVICEHEIGHT);
    
    
    self.openView.hidden = !_isOpen;
    
    
}
- (WLNTradeBBOpenView *)openView{
    if (_openView == nil) {
        _openView = [[WLNTradeBBOpenView alloc]init];
        _openView.hidden = YES;
        
    }
    return _openView;
    
}
@end
