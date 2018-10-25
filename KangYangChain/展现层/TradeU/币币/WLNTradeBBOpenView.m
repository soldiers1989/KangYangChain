//
//  WLNTradeBBOpenView.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBOpenView.h"

@implementation WLNTradeBBOpenView

- (instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
        
        
        
        self.leftTab.delegate = self;
        self.leftTab.dataSource = self;
        self.rightTab.delegate = self;
        self.rightTab.dataSource = self;
        
        [self.leftTab registerClass:WLNTradeBBOpenLeftCell.class forCellReuseIdentifier:@"WLNTradeBBOpenLeftCell"];
        [self.rightTab registerClass:WLNTradeBBOpenRightCell.class forCellReuseIdentifier:@"WLNTradeBBOpenRightCell"];
        
        
    }
    return self;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.leftTab) {
        return [self l_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self r_tableView:tableView cellForRowAtIndexPath:indexPath];
    
}
- (UITableViewCell *)l_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeBBOpenLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBOpenLeftCell"];
    
    return cell;
    
}

- (UITableViewCell *)r_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeBBOpenRightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBOpenRightCell"];
    return cell;
    
    
}


@end
