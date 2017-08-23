//
//  BuyTicketViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/8/11.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "BuyTicketViewController.h"
#import "Masonry.h"
#import "EliveApplication.h"



@interface BuyTicketViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong)UITableView *mainTableView;
@property (nonatomic ,strong)NSMutableArray *dataSource;

@property (nonatomic ,strong)UIButton *settlementBtn;

@end

@implementation BuyTicketViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"购买水票";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 22, 17);
    [btn setImage:[UIImage imageNamed:@"naviBack"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(foreAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *headerView = [self createHeaderView];
    
    UIView *footerView = [self createFooterView];
    
    self.mainTableView.tableHeaderView = headerView;
    self.mainTableView.tableFooterView = footerView;
    
    [self.view addSubview:self.mainTableView];
    
    [self.view addSubview:self.settlementBtn];
    
    // Do any additional setup after loading the view.
}

#pragma mark Private Method

- (UIView *)createHeaderView{

    UIView *header = [UIView new];
    header.frame = CGRectMake(0, 0, kWidth, 126*kScale);
    header.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
    
    UIImageView *productionIcon = [UIImageView new];
    productionIcon.image = [UIImage imageNamed:@"2.jpg"];
    
    UIView *titleView = [UIView new];
    titleView.backgroundColor = UIColorFromRGBA(0xFFFFFF, 1.0);
    
    UILabel *title = [UILabel new];
    title.font = kFont(7);
    title.textColor = UIColorFromRGBA(0x333338, 1.0);
    title.text = @"依云桶装水 1箱";
    
    UILabel *price = [UILabel new];
    price.font = kFont(9);
    price.textColor = UIColorFromRGBA(0x333338, 1.0);
    price.text = @"¥ 80";
    price.textAlignment = NSTextAlignmentRight;

    [titleView addSubview:title];
    [titleView addSubview:price];
    [header addSubview:productionIcon];
    [header addSubview:titleView];
    
    [productionIcon makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth, 94 *kScale));
        
        make.centerX.equalTo(header);
        
        make.top.equalTo(header);
    }];
    
    [titleView makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(kWidth, 32 *kScale));
        
        make.centerX.equalTo(productionIcon);
        
        make.top.equalTo(productionIcon.mas_bottom);
    }];
    
    [title makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(titleView);
        
        make.left.equalTo(titleView).offset(10 *kScale);
    }];
    
    [price makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(titleView);
        
        make.right.equalTo(titleView).offset(-10 *kScale);
    }];
    
    return header;
}

- (UIView *)createFooterView{
    
    UIView *footer = [UIView new];
    
    
    
    return footer;
}
- (void)settlementClick{
    
    
}

- (void)foreAction{

    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark Setter && Getter

-(UITableView *)mainTableView{

    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kTopBarHeight, kWidth, kHeight - kTopBarHeight -24.5 *kScale) style:UITableViewStylePlain];
        
        _mainTableView.delegate = self;
        
        _mainTableView.dataSource = self;
        
        
        
    }

    return _mainTableView;
}

-(UIButton *)settlementBtn{

    if (!_settlementBtn) {
        
        _settlementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _settlementBtn.frame = CGRectMake(0, kHeight - 24.5*kScale, kWidth, 24.5*kScale);
        [_settlementBtn.titleLabel setFont:kFont(7)];
        [_settlementBtn setTitle:@"去结算" forState:UIControlStateNormal];
        [_settlementBtn setTitleColor:UIColorFromRGBA(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        _settlementBtn.backgroundColor = UIColorFromRGBA(0xFA6650, 1.0);
        [_settlementBtn addTarget:self action:@selector(settlementClick) forControlEvents:UIControlEventTouchUpInside];
        
    }

    return _settlementBtn;
}


#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
        
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 42 *kScale;
}

@end
