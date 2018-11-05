//
//  WLNTradeAgreementCenterCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreementCenterCtr.h"

@interface WLNTradeAgreementCenterCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNTradeAgreementCenterCtr
- (CGRect)resetTabFrame{
    return CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 84 - 64);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeHangCell.class forCellReuseIdentifier:@"WLNTradeHangCell"];
    
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeHangCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeHangCell"];
    
    return cell;
    
}

@end
