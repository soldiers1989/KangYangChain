//
//  WLNHomeHotCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/2.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHomeHotCell.h"

@implementation WLNHomeHotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.nameLab.text = dic[@"user"][@"nickname"];
   
    self.contentLab.text = dic[@"content"];
    
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:dic[@"avatar"]] placeholderImage:HolderImage];
    
    [self.contentImg sd_setImageWithURL:[NSURL URLWithString:dic[@"image1"]] placeholderImage:HolderImage];
    
}
@end
