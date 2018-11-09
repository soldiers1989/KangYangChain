//
//  WLNTradeHangCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeHangCell.h"

@implementation WLNTradeHangCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.timeLab.text = dic[@"time"];
    self.amountLab.text = [NSString stringWithFormat:@"冻结:%@",dic[@"amount"]];
    self.accessLab.text = [NSString stringWithFormat:@"盈亏:%@",dic[@"access"]];
    self.maxlineLab.text = [NSString stringWithFormat:@"止盈:%@",dic[@"maxline"]];
    self.minlineLab.text = [NSString stringWithFormat:@"止损:%@",dic[@"minline"]];
    self.numLab.text = [NSString stringWithFormat:@"数量:%@",dic[@"num"]];
    
    if ([dic[@"type"] integerValue] == 1) {
        
        self.typeLab.text = @"买涨";
        self.typeLab.textColor = cusgreen;
        
    }else if([dic[@"type"] integerValue] == 2){
        self.typeLab.text = @"买跌";
        self.typeLab.textColor = cusred;

    }
    
    
}

@end
