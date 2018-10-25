//
//  WLNTradeBBCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBCtr.h"

@interface WLNTradeBBCtr ()
{
    BOOL _isOpen;
    
}
@property (nonatomic, strong) WLNTradeBBOpenView *openView;

@end

@implementation WLNTradeBBCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"币币".Intl;
    [self.view addSubview:self.openView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"币币订单" style:UIBarButtonItemStyleDone target:self action:@selector(bibiOrder)];
    
    
}

- (void)bibiOrder{
    
    [self push:@"WLNTradeBBOrderCtr".instance];
    
    
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
