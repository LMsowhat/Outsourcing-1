//
//  MyBarrelViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/8/17.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "MyBarrelViewController.h"
#import "Masonry.h"



@interface MyBarrelViewController ()

@end

@implementation MyBarrelViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"我的水桶";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 22, 17);
    [btn setImage:[UIImage imageNamed:@"naviBack"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(foreAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
    
    [self loadViewWithData:nil];
    // Do any additional setup after loading the view.
}

- (void)loadViewWithData:(id)responseObj{

    UIView *view2 = [UIView new];
    view2.backgroundColor = UIColorFromRGBA(0xFFFFFF, 1.0);
    
    UILabel *v2_label1 = [UILabel new];
    v2_label1.font = kFont(7);
    v2_label1.textColor = UIColorFromRGBA(0x333338, 1.0);
    v2_label1.text = @"水桶个数：";
    
    UILabel *v2_label2 = [UILabel new];
    v2_label2.font = kFont(9);
    v2_label2.textColor = UIColorFromRGBA(0x333338, 1.0);
    v2_label2.text = @"999个";
    v2_label2.textAlignment = NSTextAlignmentCenter;
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"icon_bucket"];

    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColorFromRGBA(0xDDDDDD, 1.0);
    
    UILabel *label1 = [UILabel new];
    label1.font = kFont(7);
    label1.textColor = UIColorFromRGBA(0x333338, 1.0);
    label1.text = @"可退金额：";
    
    UILabel *label2 = [UILabel new];
    label2.font = kFont(9);
    label2.textColor = UIColorFromRGBA(0xFA6650, 1.0);
    label2.text = @"￥400";
    
    [view2 addSubview:v2_label1];
    [view2 addSubview:v2_label2];
    [view2 addSubview:imageView];
    [view2 addSubview:lineView];
    [view2 addSubview:label1];
    [view2 addSubview:label2];
    
    [self.view addSubview:view2];
    
    
    [view2 makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth, 93 *kScale));
        
        make.centerX.equalTo(self.view);
        
        make.top.equalTo(self.view).offset(kTopBarHeight);
    }];
    
    [v2_label1 makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(10 *kScale);
    }];
    
    [v2_label2 makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view2).offset(25 *kScale);
        
        make.centerX.equalTo(view2);
    }];
    
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(10*kScale, 10*kScale));
        
        make.centerX.equalTo(view2);
        
        make.top.equalTo(v2_label2.mas_bottom).offset(5 *kScale);
    }];

    [lineView makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth - 10 *kScale, 1));
        
        make.centerX.equalTo(view2);
        
        make.top.equalTo(imageView.mas_bottom).offset(10 *kScale);
    }];
    
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(lineView.mas_bottom).offset(10 *kScale);
        
        make.left.equalTo(view2).offset(10 *kScale);
    }];
    
    [label2 makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(label1.mas_right);
        
        make.centerY.equalTo(label1);
    }];
}




- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
