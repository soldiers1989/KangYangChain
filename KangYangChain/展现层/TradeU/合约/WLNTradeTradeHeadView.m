//
//  WLNTradeTradeHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeTradeHeadView.h"

@implementation WLNTradeTradeHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataArrs = [NSMutableArray array];
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[@"uid"] = @"1";
        
        [self routeTargetName:Handle actionName:@"cionChooseList:" param:dic];
    }
    return self;
}
- (void)result:(id)data sel:(NSString *)sel{
    
    self.dataArrs = data;
    [self.tab reloadData];
    
}

- (void)headClickAction:(UITapGestureRecognizer *)tap{
    
    
    CGRect rect = windowFrame(tap.view);
    
    self.tab.frame  = CGRectMake(0, rect.origin.y + rect.size.height, DEVICEWidth, 250);
    [self.tab shadow];

    [[UIApplication sharedApplication].keyWindow addSubview:self.backView];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 0)];
    view.backgroundColor = maingray;
    
    UILabel *leftLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth / 3, 44)];
    leftLab.text = @"合约";
    leftLab.textAlignment = 1;
    leftLab.font = [UIFont systemFontOfSize:12];
    [view addSubview:leftLab];
    
    UILabel *centerLab = [[UILabel alloc]initWithFrame:CGRectMake(DEVICEWidth / 3, 0, DEVICEWidth / 3, 44)];
    centerLab.text = @"最新价";
    centerLab.textAlignment = 1;
    centerLab.font = [UIFont systemFontOfSize:12];
    [view addSubview:centerLab];
    
    UILabel *rightLab = [[UILabel alloc]initWithFrame:CGRectMake(DEVICEWidth / 3 * 2, 0, DEVICEWidth / 3, 44)];
    rightLab.text = @"24H涨跌幅";
    rightLab.textAlignment = 1;
    rightLab.font = [UIFont systemFontOfSize:12];
    [view addSubview:rightLab];
    
    return view;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArrs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeTradeHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeHeadCell"];
    
    cell.dic = self.dataArrs[indexPath.row];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_didClickBlock) {
        _didClickBlock();
        
    }
}
- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tab.delegate = self;
        _tab.dataSource = self;
        _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tab registerClass:WLNTradeTradeHeadCell.class forCellReuseIdentifier:@"WLNTradeTradeHeadCell"];
        
        
    }
    return _tab;
}
- (UIView *)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.1];
        [_backView addSubview:self.tab];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dissAction)];
        
        [_backView addGestureRecognizer:tap];
        
    }
    return _backView;
}
- (void)dissAction{
    
    
    [self.backView removeFromSuperview];
    
    
    
}

@end
