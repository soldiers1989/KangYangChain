//
//  WLNTradeAgreementRightCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreementRightCtr.h"

@interface WLNTradeAgreementRightCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNTradeAgreementRightCtr
- (CGRect)resetTabFrame{
    return CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 84 - 64);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeHoldCell.class forCellReuseIdentifier:@"WLNTradeHoldCell"];
    
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeHoldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeHoldCell"];
    
    return cell;
    
}

@end
