//
//  PaymentViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/8/11.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "PaymentViewController.h"
#import "Masonry.h"


@interface PaymentViewController ()

@property (nonatomic ,strong)UILabel *moneyLabel;

@property (nonatomic ,strong)UIButton *selectedBtn;
//

@property (nonatomic ,strong)UIButton *confirmBtn;

@end

@implementation PaymentViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"支付";
    
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
    
    [self loadConfigUI];
    
    // Do any additional setup after loading the view.
}

#pragma mark Setter && Getter

- (UIButton *)confirmBtn{

    if (!_confirmBtn) {
        
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmBtn.frame = CGRectMake(0, kHeight - 24.5 *kScale, kWidth, 24.5 *kScale);
        [_confirmBtn setTitle:@"确认支付" forState:UIControlStateNormal];
        [_confirmBtn.titleLabel setFont:kFont(7)];
        [_confirmBtn.titleLabel setTextColor:UIColorFromRGBA(0xFFFFFF, 1.0)];
        _confirmBtn.backgroundColor = UIColorFromRGBA(0xFA6650, 1.0);
        [_confirmBtn addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _confirmBtn;
}

#pragma mark Private Method

- (void)loadConfigUI{

    UIView *view1 = [UIView new];
    view1.backgroundColor = UIColorFromRGBA(0xFFFFFF, 1.0);
    
    UILabel *actual = [UILabel new];
    actual.font = kFont(7);
    actual.textColor = UIColorFromRGBA(0x333338, 1.0);
    actual.text = @"实付款:";
    
    self.moneyLabel = [UILabel new];
    self.moneyLabel.font = kFont(9);
    self.moneyLabel.textColor = UIColorFromRGBA(0xFA6650, 1.0);
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f",self.factTotalPrice];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = UIColorFromRGBA(0xFFFFFF, 1.0);

    UIImageView *aliImage = [UIImageView new];
    aliImage.image = [UIImage imageNamed:@"ali_icon"];
    
    UILabel *aliText = [UILabel new];
    aliText.font = kFont(7);
    aliText.textColor = UIColorFromRGBA(0x333338, 1.0);
    aliText.text = @"支付宝";
    
    UIButton *aliBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [aliBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    [aliBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    [aliBtn addTarget:self action:@selector(aliPayClick:) forControlEvents:UIControlEventTouchUpInside];
    aliBtn.tag = 0;
    aliBtn.selected = YES;
    self.selectedBtn = aliBtn;
    
    UIView *view3 = [UIView new];
    view3.backgroundColor = UIColorFromRGBA(0xFFFFFF, 1.0);

    UIImageView *wechatImage = [UIImageView new];
    wechatImage.image = [UIImage imageNamed:@"wechat"];
    
    UILabel *wechatText = [UILabel new];
    wechatText.font = kFont(7);
    wechatText.textColor = UIColorFromRGBA(0x333338, 1.0);
    wechatText.text = @"微信支付";
    
    UIButton *wechatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [wechatBtn setImage:[UIImage imageNamed:@"unSelected"] forState:UIControlStateNormal];
    [wechatBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    [wechatBtn addTarget:self action:@selector(wechatPayClick:) forControlEvents:UIControlEventTouchUpInside];
    wechatBtn.tag = 1;
    
    [view1 addSubview:actual];
    [view1 addSubview:self.moneyLabel];
    
    [view2 addSubview:aliImage];
    [view2 addSubview:aliText];
    [view2 addSubview:aliBtn];
    [view2 addSubview:wechatImage];
    [view2 addSubview:wechatText];
    [view2 addSubview:wechatBtn];
    [view2 addSubview:view3];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:self.confirmBtn];
    
    [view1 makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth, 31*kScale));
        
        make.top.equalTo(self.view).offset(kTopBarHeight);
        
        make.centerX.equalTo(self.view);
    }];
    
    [actual makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view1);
        make.left.equalTo(view1).offset(10 *kScale);
    }];
    
    [self.moneyLabel makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(actual);
        make.left.equalTo(actual.mas_right);
    }];
    
    [view2 makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth, 66.5 *kScale));
        
        make.centerX.equalTo(self.view);

        make.top.equalTo(view1.mas_bottom).offset(5 *kScale);
    }];
    
    [aliImage makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(12 *kScale, 12 *kScale));
        
        make.centerY.equalTo(view2).offset(-10 *kScale);
        
        make.left.equalTo(view2).offset(10 *kScale);
    }];
    
    [aliText makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(aliImage);
        
        make.left.equalTo(aliImage.mas_right).offset(5.5 *kScale);
    }];
    
    [aliBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(9 *kScale, 9 *kScale));
        
        make.centerY.equalTo(aliImage);
        
        make.right.equalTo(view2).offset(-13*kScale);
    }];
    
    [wechatImage makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(12 *kScale, 12 *kScale));
        
        make.centerY.equalTo(view2).offset(10 *kScale);
        
        make.left.equalTo(view2).offset(10 *kScale);
    }];
    
    [wechatText makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(wechatImage);
        
        make.left.equalTo(wechatImage.mas_right).offset(5.5 *kScale);
    }];
    
    [wechatBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(9 *kScale, 9 *kScale));
        
        make.centerY.equalTo(wechatImage);
        
        make.right.equalTo(view2).offset(-13*kScale);
    }];
    
}

- (void)aliPayClick:(UIButton *)sender{

    if (self.selectedBtn.tag == sender.tag) {
        
        return;
    }
    self.selectedBtn.selected = NO;
    sender.selected = !sender.selected;
    self.selectedBtn = sender;
    
}
- (void)wechatPayClick:(UIButton *)sender{
    
    if (self.selectedBtn.tag == sender.tag) {
        
        return;
    }
    self.selectedBtn.selected = NO;
    sender.selected = !sender.selected;
    self.selectedBtn = sender;
}

- (void)confirmClick{


    NSLog(@"%ld",self.selectedBtn.tag);
}

- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
