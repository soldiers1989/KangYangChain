//
//  WLNHTMLCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNHTMLCtr.h"

#import <WebKit/WebKit.h>

@interface WLNHTMLCtr ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) WLNHTMLProgressView *progressView;

@end

@implementation WLNHTMLCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];

    [self.webView loadRequest:[self myLoadWithURL:@"http://kylvue.cpyu8.com/#/mine/identity"]];
     
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];

    
    
}
- (UIEdgeInsets)getSafeArea:(BOOL)portrait{
    
    return UIEdgeInsetsZero;
    
}
- (WKWebView *)webView{
    if (_webView == nil) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth,DEVICEHEIGHT)];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        [_webView.configuration.userContentController addScriptMessageHandler:self name:@"exitNowPage"];
        
    }
    return _webView;
}
- (NSURLRequest *)myLoadWithURL:(NSString *)str{
    
    NSURL *url  = [NSURL URLWithString:str];
    NSURLRequest *requst =  [[NSURLRequest alloc] initWithURL:url];
    return requst;
}
- (WLNHTMLProgressView *)progressView{
    if (_progressView == nil) {
        _progressView = [[WLNHTMLProgressView alloc]initWithFrame:self.view.frame webView:self.webView];
        
    }
    return _progressView;
}

@end
