//
//  AboutUsViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/9/16.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation AboutUsViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"关于我们";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 22, 17);
    [btn setImage:[UIImage imageNamed:@"naviBack"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(foreAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];

    // Do any additional setup after loading the view.
}

- (void)sendHttpRequest{
    
}

- (void)getMoreAboutUs:(id)responseObject{


    NSLog(@"%@",responseObject);
}



- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
