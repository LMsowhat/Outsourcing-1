//
//  CouponsViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/8/10.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "CouponsViewController.h"
#import "CouponsTableViewCell.h"
#import "Masonry.h"

@interface CouponsViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong)UITableView *mainTableView;

@property (nonatomic ,strong)NSMutableArray *dataSource;


@end

@implementation CouponsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
    
    [self.view addSubview:self.mainTableView];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"优惠券";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 22, 17);
    [btn setImage:[UIImage imageNamed:@"naviBack"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(foreAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, 25*kScale, 8*kScale);
    btn2.titleLabel.font = kFont(5.5);
    [btn2 setTitle:@"使用须知" forState:UIControlStateNormal];
    [btn2 setTitleColor:UIColorFromRGBA(0xFA6650, 1.0) forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(useRules) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    
}

#pragma mark Setter && Getter

-(UITableView *)mainTableView{

    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kTopBarHeight +10, kWidth, kHeight - kTopBarHeight - 10) style:UITableViewStylePlain];
        
        _mainTableView.delegate = self;
        
        _mainTableView.dataSource = self;
        
        _mainTableView.backgroundColor = kWhiteColor;
        
        _mainTableView.showsVerticalScrollIndicator = NO;
        
        _mainTableView.showsHorizontalScrollIndicator = NO;
        
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _mainTableView.tableFooterView = [self createBottomView];
    }

    return _mainTableView;
}



#pragma mark Private Method

- (UIView *)createBottomView {

    UIView *bottom = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 40*kScale)];

    UILabel *label = [UILabel new];
    label.font = kFont(5.5);
    label.textColor = UIColorFromRGBA(0x8F9095, 1.0);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"最终解释权归公司所有";
    
    [bottom addSubview:label];
    
    [label makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(bottom);
        
        make.bottom.equalTo(bottom).offset(-15*kScale);
    }];
    
    return bottom;
}


- (void)useRules{


}

- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark TableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"CouponTableViewCell";
    CouponsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[CouponsTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
        
    }
    cell.couponTitle.text = @"卓玛泉桶装水优惠券";
    cell.couponTime.text = @"有效期至：2017-08-12";
    cell.couponValue.text = @"40";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 52*kScale;
}

@end
