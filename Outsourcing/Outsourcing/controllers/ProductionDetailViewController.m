//
//  ProductionDetailViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/15.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "ProductionDetailViewController.h"

@interface ProductionDetailViewController ()

@property (nonatomic ,strong)UIImageView *pIcon;
@property (nonatomic ,strong)UILabel *pTitle;
@property (nonatomic ,strong)UILabel *pSales;
@property (nonatomic ,strong)UILabel *pPrice;


@end

@implementation ProductionDetailViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"商品详情";
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pIcon = [UIImageView new];
    self.pIcon.image = [UIImage imageNamed:@""];
    
    
    self.pTitle = [UILabel new];
    self.pTitle.font = kFont(14);
    self.pTitle.textColor = kBlackColor;
    
    self.pSales = [UILabel new];
    self.pSales.font = kFont(14);
    self.pSales.textColor = kBlackColor;
    
    self.pPrice = [UILabel new];
    self.pPrice.font = kFont(14);
    self.pPrice.textColor = kRedColor;
    
    
    
    
    
    // Do any additional setup after loading the view.
}











@end
