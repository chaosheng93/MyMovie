//
//  NewsDetailViewController.m
//  HWmovie
//
//  Created by huiwenjiaoyu on 15/7/27.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //01从网络加载
    //创建webview url
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    NSURL *url = [NSURL URLWithString:@"http://news.baidu.com"];
//    //创建网络请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
    
    //02 从本地加载
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"4.html" ofType:nil];
    NSString *htmlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    [webView loadHTMLString:htmlStr baseURL:nil];
    
    [self.view addSubview:webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
