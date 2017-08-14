//
//  ProductionDetailViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/15.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "ProductionDetailViewController.h"
#import "Masonry.h"
#import "UIButton+myButton.h"
#import "ShoppingCart.h"
#import "OrderCreateController.h"

@interface ProductionDetailViewController ()<UIScrollViewDelegate>

@property (nonatomic ,strong)UIScrollView *mainScroll;

@property (nonatomic ,strong)UIImageView *pIcon;
@property (nonatomic ,strong)UILabel *pTitle;
@property (nonatomic ,strong)UILabel *pSales;
@property (nonatomic ,strong)UILabel *pPrice;
@property (nonatomic ,strong)UILabel *num;
@property (nonatomic ,strong)UILabel *specifications;

@property (nonatomic ,strong)ShoppingCart *shoppingCart;

@property (nonatomic ,assign)NSInteger pNumber;

@property (nonatomic ,strong)UIButton *submitBtn;


@end

@implementation ProductionDetailViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"商品详情";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 22, 17);
    [btn setImage:[UIImage imageNamed:@"naviBack"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(foreAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainScroll];
    
    [self configDefaultView];
    
    NSArray *images = @[@"3.jpg",@"4.jpg",@"2.jpg",@"3.jpg",@"5.jpg"];
    self.pNumber = 1;
    
    [self loadProductionData:images];
//    
//    self.shoppingCart = [ShoppingCart initWithData:nil];
////    self.shoppingCart.backgroundColor = UIColorFromRGBA(0xf1f1f1, 1.0);
//    self.shoppingCart.frame = CGRectMake(0, kHeight - kTabBarHeight, kWidth, kTabBarHeight);
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
//
//    [self.shoppingCart addGestureRecognizer:tap];
//    //展示购物车
//    [self.shoppingCart.shoppingBtn addTarget:self action:@selector(showShoppingCart:) forControlEvents:UIControlEventTouchUpInside];
//    //submit
//    [self.shoppingCart.submitBtn addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    
    [self.view addSubview:self.submitBtn];
    [self.submitBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth, kTabBarHeight));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view);
        
    }];
    
    // Do any additional setup after loading the view.
}


#pragma mark ---Setter & Getter
-(UIScrollView *)mainScroll{

    if (!_mainScroll) {
        
        _mainScroll = [UIScrollView new];
        
        _mainScroll.frame = CGRectMake(0, kTopBarHeight, kWidth, kHeight - kTopBarHeight - kTabBarHeight);
        _mainScroll.contentSize = CGSizeMake(kWidth, kHeight - kTopBarHeight - kTabBarHeight);
        _mainScroll.delegate = self;
        
        
    }

    return _mainScroll;
}

-(UIButton *)submitBtn{

    if (!_submitBtn) {
        
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitBtn setBackgroundColor:UIColorFromRGBA(0xFA6650, 1.0)];
        [_submitBtn setTitle:@"提交订单" forState:UIControlStateNormal];
        [_submitBtn.titleLabel setTextColor:UIColorFromRGBA(0xFFFFFF, 1.0)];
        [_submitBtn addTarget:self action:@selector(submitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }

    return _submitBtn;
}

- (void)configDefaultView{

    self.pIcon = [UIImageView new];
    
    self.pTitle = [UILabel new];
    self.pTitle.font = kFont(7);
    self.pTitle.textColor = UIColorFromRGBA(0x333338, 1.0);
    
    self.specifications = [UILabel new];
    self.specifications.font = kFont(6);
    self.specifications.textColor = UIColorFromRGBA(0x8F9095, 1.0);
    
    self.pSales = [UILabel new];
    self.pSales.font = kFont(5.5);
    self.pSales.textColor = UIColorFromRGBA(0x8F9095, 1.0);
    self.pSales.textAlignment = NSTextAlignmentRight;
    
    self.pPrice = [UILabel new];
    self.pPrice.font = kFont(9);
    self.pPrice.textColor = UIColorFromRGBA(0xFA6650, 1.0);
    
    UIImageView *calculate = [UIImageView new];
    calculate.image = [UIImage imageNamed:@"calculate"];
    
    UIButton *subtractionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [subtractionBtn setTitle:@"" forState:UIControlStateNormal];
    [subtractionBtn setBackgroundColor:kClearColor];
    [subtractionBtn addTarget:self action:@selector(subtractionClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"" forState:UIControlStateNormal];
    [addBtn setBackgroundColor:kClearColor];
    [addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.num = [UILabel new];
    self.num.font = kFont(7);
    self.num.textColor = kBlackColor;
    self.num.textAlignment = NSTextAlignmentCenter;
    
    UIView *segment = [UIView new];
    segment.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
    
    UILabel *pDescripution = [UILabel new];
    pDescripution.font = kFont(7);
    pDescripution.textColor = UIColorFromRGBA(0x8F9095, 1.0);
    pDescripution.text = @"商品介绍";
    
    [self.mainScroll addSubview:self.pIcon];
    [self.mainScroll addSubview:self.pTitle];
    [self.mainScroll addSubview:self.specifications];
    [self.mainScroll addSubview:self.pSales];
    [self.mainScroll addSubview:self.pPrice];
    [self.mainScroll addSubview:calculate];
    [self.mainScroll addSubview:subtractionBtn];
    [self.mainScroll addSubview:addBtn];
    [self.mainScroll addSubview:self.num];
    [self.mainScroll addSubview:segment];
    [self.mainScroll addSubview:pDescripution];
    
    [self.pIcon makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth, 190));
        make.centerX.equalTo(self.mainScroll);
        make.top.equalTo(self.mainScroll);
        
    }];
    
    [self.pTitle makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mainScroll).offset(20);
        make.top.equalTo(self.pIcon.mas_bottom).offset(20);
        
    }];
    
    [self.pSales makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.pTitle);
        make.right.equalTo(self.view.mas_right).offset(-20);
        
    }];
    
    [self.specifications makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.pTitle.mas_left);
        make.top.equalTo(self.pTitle.mas_bottom).offset(10);
        
    }];
    
    [self.pPrice makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.specifications.mas_left);
        make.top.equalTo(self.specifications.mas_bottom).offset(10);
        
    }];
  
    [self.num makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.pPrice);
        make.centerX.equalTo(calculate);
        
    }];
    
    [calculate makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(45 *kScale, 14 *kScale));
        make.centerY.equalTo(self.pPrice);
        make.right.equalTo(self.view).offset(-10 *kScale);
        
    }];
    
    [addBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(45/2 *kScale, 14*kScale));
        make.centerY.equalTo(calculate);
        make.right.equalTo(calculate);
        
    }];
    
    [subtractionBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(45/2 *kScale, 14*kScale));
        make.centerY.equalTo(calculate);
        make.left.equalTo(calculate);
        
    }];
    
    [segment makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth, 10));
        make.centerX.equalTo(self.view);
        make.top.equalTo(calculate.mas_bottom).offset(20);
        
    }];
    
    [pDescripution makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(segment.mas_bottom).offset(20);
        make.left.equalTo(self.mainScroll).offset(20);
        
    }];

    [self.view layoutIfNeeded];
}

#pragma mark - Private Method

- (void)loadProductionData:(NSArray *)images{

    self.pIcon.image = [UIImage imageNamed:images[0]];
    
    self.pTitle.text = @"桶装水的title";
    
    self.specifications.text = @"规格：300ml＊12瓶";
    
    self.pSales.text = @"销量12090";
    
    self.pPrice.text = @"￥20";
    
    self.num.text = [NSString stringWithFormat:@"%ld",self.pNumber];
    
    CGFloat dHeight = self.pPrice.frame.origin.y + 140;
    
    self.mainScroll.contentSize = CGSizeMake(kWidth, dHeight + 200*images.count);
    
    for (int i = 0; i < images.count; i++) {
        
        UIImageView *imageV = [UIImageView new];
        
        imageV.image = [UIImage imageNamed:images[i]];
        imageV.frame = CGRectMake(20, 200 * i + dHeight, kWidth - 40, 200);
        
        [self.mainScroll addSubview:imageV];
    }


}

- (void)subtractionClick{
    
    if (self.pNumber > 1) {
        
        self.pNumber -= 1;
        
        self.num.text = [NSString stringWithFormat:@"%ld",self.pNumber];
    }
    
    NSLog(@"dadfadsfa");

}

- (void)addClick{
    
    self.pNumber += 1;
    
    self.num.text = [NSString stringWithFormat:@"%ld",self.pNumber];

    NSLog(@"dadfadsfa");

}

- (void)showShoppingCart:(UIButton *)sender{

    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        self.shoppingCart.frame = self.view.bounds;
        
        [self.shoppingCart configWithType:YES];
        
    }else{
    
        self.shoppingCart.frame = CGRectMake(0, kHeight - kTabBarHeight, kWidth, kTabBarHeight);
    
        [self.shoppingCart configWithType:NO];
    }
    
    
    
}

- (void)submitBtnClick:(UIButton *)sender{

    OrderCreateController *create = [OrderCreateController new];
    [self.navigationController pushViewController:create animated:YES];

}

- (void)viewTap:(UIGestureRecognizer *)tap{
    
    CGPoint point = [tap locationInView:self.shoppingCart];
    
    if (point.y < kHeight/2) {
        
        self.shoppingCart.shoppingBtn.selected = NO;
        self.shoppingCart.frame = CGRectMake(0, kHeight - kTabBarHeight, kWidth, kTabBarHeight);

        [self.shoppingCart configWithType:NO];
    }
    
    
}


- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
