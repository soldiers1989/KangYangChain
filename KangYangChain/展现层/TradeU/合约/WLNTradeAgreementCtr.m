//
//  WLNTradeAgreementCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreementCtr.h"

@interface WLNTradeAgreementCtr ()<WLNSimpleHeadViewDelegate>
{
    NSInteger _currentType;
    NSArray *_vcArr;
}
@property (nonatomic, strong) WLNTradeAgreementLeftCtr *leftVc;
@property (nonatomic, strong) WLNTradeAgreementCenterCtr *centerVc;
@property (nonatomic, strong) WLNTradeAgreementRightCtr *rightVc;

@end

@implementation WLNTradeAgreementCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"合约";
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    _vcArr = @[self.leftVc.view,self.centerVc.view,self.rightVc.view];
    
    

    [self.view addSubview:_vcArr.firstObject];
    
    

    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"交易",@"挂单",@"持仓"]];

    [self.view addSubview:view];
    
    
    WLNTradeTradeHeadView *viewb = [[WLNTradeTradeHeadView alloc]initWithFrame:CGRectMake(0, 46, DEVICEWidth, 40)];
    
    [self.view addSubview:viewb];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:@"add".image style:UIBarButtonItemStyleDone target:self action:@selector(menuAciton)];
    
    
    
}
- (void)menuAciton{
    
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.leftVc.view.frame = CGRectMake(0, 84, DEVICEWidth, DEVICEHEIGHT - 84 - 64);
    self.centerVc.view.frame = CGRectMake(0, 84, DEVICEWidth, DEVICEHEIGHT - 84 - 64);
    self.rightVc.view.frame = CGRectMake(0, 84, DEVICEWidth, DEVICEHEIGHT - 84 - 64);
}

- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    _currentType = tag;
    
    for (int i =0 ;i < _vcArr.count; i ++) {
        UIView *view = _vcArr[i];
        if (i == tag) {
            [self.view addSubview:view];
        }else{
            [view removeFromSuperview];
        }
    }
    
    
    
    
}

- (WLNTradeAgreementLeftCtr *)leftVc{
    if (_leftVc == nil) {
        _leftVc = [[WLNTradeAgreementLeftCtr alloc]init];
    }
    return _leftVc;
}
- (WLNTradeAgreementCenterCtr *)centerVc{
    if (_centerVc == nil) {
        _centerVc = [[WLNTradeAgreementCenterCtr alloc]init];
        
    }
    return _centerVc;
}
- (WLNTradeAgreementRightCtr *)rightVc{
    if (_rightVc == nil) {
        _rightVc = [[WLNTradeAgreementRightCtr alloc]init];
        
    }
    return _rightVc;
    
}

@end
