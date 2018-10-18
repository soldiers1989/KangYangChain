//
//  WLNMineHeadCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/2.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineHeadCell.h"

@implementation WLNMineHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)click:(UITapGestureRecognizer *)tap{
    
    if (_didClick) {
        _didClick(tap.view.tag);
    }
    
    
}
@end
