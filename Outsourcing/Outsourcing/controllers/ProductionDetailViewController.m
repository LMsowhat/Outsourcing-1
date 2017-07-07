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

@property (nonatomic ,strong)ShoppingCart *shoppingCart;

@property (nonatomic ,assign)NSInteger pNumber;

@end

@implementation ProductionDetailViewController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"商品详情";
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainScroll];
    
    [self configDefaultView];
    
    NSArray *images = @[@"3.jpg",@"4.jpg",@"2.jpg",@"3.jpg",@"5.jpg"];
    self.pNumber = 1;
    
    [self loadProductionData:images];
    
    self.shoppingCart = [ShoppingCart initWithData:nil];
//    self.shoppingCart.backgroundColor = UIColorFromRGBA(0xf1f1f1, 1.0);
    self.shoppingCart.frame = CGRectMake(0, kHeight - kTabBarHeight, kWidth, kTabBarHeight);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];

    [self.shoppingCart addGestureRecognizer:tap];
    //展示购物车
    [self.shoppingCart.shoppingBtn addTarget:self action:@selector(showShoppingCart:) forControlEvents:UIControlEventTouchUpInside];
    //submit
    [self.shoppingCart.submitBtn addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:self.shoppingCart];
    
    
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



- (void)configDefaultView{

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
    
    UILabel *numTitle = [UILabel new];
    numTitle.font = kFont(14);
    numTitle.textColor = kBlackColor;
    numTitle.textAlignment = NSTextAlignmentCenter;
    numTitle.text = @"数量";
    
    UIButton *subtractionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [subtractionBtn setTitle:@"-" forState:UIControlStateNormal];
    [subtractionBtn setTitleColor:kBlackColor forState:UIControlStateNormal];
    [subtractionBtn setBackgroundColor:kWhiteColor];
    [subtractionBtn addTarget:self action:@selector(subtractionClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    [addBtn setTitleColor:kBlackColor forState:UIControlStateNormal];
    [addBtn setBackgroundColor:kWhiteColor];
    [addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.num = [UILabel new];
    self.num.font = kFont(14);
    self.num.textColor = kBlackColor;
    self.num.textAlignment = NSTextAlignmentCenter;
    
    UILabel *pDescripution = [UILabel new];
    pDescripution.font = kFont(14);
    pDescripution.textColor = kBlackColor;
    pDescripution.text = @"商品介绍";
    
    [self.mainScroll addSubview:self.pIcon];
    [self.mainScroll addSubview:self.pTitle];
    [self.mainScroll addSubview:self.pSales];
    [self.mainScroll addSubview:self.pPrice];
    [self.mainScroll addSubview:numTitle];
    [self.mainScroll addSubview:subtractionBtn];
    [self.mainScroll addSubview:addBtn];
    [self.mainScroll addSubview:self.num];
    [self.mainScroll addSubview:pDescripution];
    
    [self.pIcon makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth, 200));
        make.centerX.equalTo(self.mainScroll);
        make.top.equalTo(self.mainScroll);
        
    }];
    
    [self.pTitle makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mainScroll).offset(20);
        make.top.equalTo(self.pIcon.mas_bottom).offset(20);
        
    }];
    
    [self.pSales makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.pTitle.mas_left);
        make.top.equalTo(self.pTitle.mas_bottom).offset(15);
        
    }];
    
    [self.pPrice makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.pSales.mas_left);
        make.top.equalTo(self.pSales.mas_bottom).offset(15);
        
    }];
    
    [numTitle makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.pPrice);
        make.centerX.equalTo(self.view);
        
    }];
    
    [addBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(self.pPrice);
        make.right.equalTo(self.view).offset(-20);
        
    }];
    
    [self.num makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.pPrice);
        make.right.equalTo(addBtn.mas_left).offset(-20);
        
    }];
    
    [subtractionBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(self.pPrice);
        make.right.equalTo(addBtn.mas_left).offset(-60);
        
    }];
    
    [pDescripution makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.pPrice.mas_bottom).offset(50);
        make.left.equalTo(self.mainScroll).offset(20);
        
    }];

    [self.view layoutIfNeeded];
}

#pragma mark - Private Method

- (void)loadProductionData:(NSArray *)images{

    self.pIcon.image = [UIImage imageNamed:images[0]];
    
    self.pTitle.text = @"桶装水的title";
    
    self.pSales.text = @"销量12090";
    
    self.pPrice.text = @"￥20";
    
    self.num.text = [NSString stringWithFormat:@"%ld",self.pNumber];
    
    CGFloat dHeight = self.pPrice.frame.origin.y + 120;
    
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

- (void)submitClick{

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



@end
