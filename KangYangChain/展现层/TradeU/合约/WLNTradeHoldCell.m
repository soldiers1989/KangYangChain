//
//  WLNTradeHoldCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeHoldCell.h"

@implementation WLNTradeHoldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    
    self.priceLab.text = [NSString stringWithFormat:@"持仓价格:%@",dic[@"price"]];
    
    self.amountLab.text = [NSString stringWithFormat:@"冻结:%@",dic[@"amount"]];
    self.accessLab.text = [NSString stringWithFormat:@"亏盈:%@",dic[@"access"]];
    self.numLab.text = [NSString stringWithFormat:@"持仓量:%@",dic[@"num"]];
    
    self.boom_priceLab.text = [NSString stringWithFormat:@"强平价:%@",dic[@"boom_price"]];
    self.maxlineLab.text = [NSString stringWithFormat:@"止盈:%@",dic[@"maxline"]];
    self.minlineLab.text = [NSString stringWithFormat:@"止损:%@",dic[@"minline"]];

    
    if ([dic[@"type"] integerValue]== 1) {
        
        self.typeLab.text = @"买涨";
        self.typeLab.textColor = rgba(49, 177, 98, 1);

    }else if([dic[@"type"] integerValue] == 2){
        self.typeLab.text = @"买跌";
        self.typeLab.textColor = rgba(232, 42, 23, 1);
    }
    
    
    
    
}
@end
