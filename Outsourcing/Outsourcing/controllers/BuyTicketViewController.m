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
#import "MJExtension.h"
#import "MBProgressHUDManager.h"

#import "TicketModel.h"
#import "TicketContentsCell.h"



@interface BuyTicketViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong)UITableView *mainTableView;
@property (nonatomic ,strong)NSMutableArray *dataSource;

@property (nonatomic ,strong)UIButton *settlementBtn;

@property (nonatomic ,strong)TicketModel *tModel;

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
    
    [self sendHttpRequest];

    [self.view addSubview:self.mainTableView];
    
    [self.view addSubview:self.settlementBtn];
    
    // Do any additional setup after loading the view.
}

#pragma mark Private Method

- (UIView *)createHeaderView{

    UIView *header = [UIView new];
    header.frame = CGRectMake(0, 0, kWidth, 131*kScale);
    header.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
    
    UIImageView *productionIcon = [UIImageView new];
    productionIcon.image = [UIImage imageNamed:@"2.jpg"];
    
    UIView *titleView = [UIView new];
    titleView.backgroundColor = UIColorFromRGBA(0xFFFFFF, 1.0);
    
    UILabel *title = [UILabel new];
    title.font = kFont(7);
    title.textColor = UIColorFromRGBA(0x333338, 1.0);
    title.text = self.tModel.strGoodsName;
    
    UILabel *price = [UILabel new];
    price.font = kFont(9);
    price.textColor = UIColorFromRGBA(0x333338, 1.0);
    price.text = [NSString stringWithFormat:@"￥%@",self.tModel.nPrice];
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
    footer.frame = CGRectMake(0, 0, kWidth, 60*kScale);

    UILabel *preferential = [UILabel new];
    preferential.font = kFont(7);
    preferential.textColor = UIColorFromRGBA(0x002A20, 1.0);
    
    NSString *testStr = @"优惠：-¥ 5";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:testStr];
    [str addAttributes:@{NSForegroundColorAttributeName:UIColorFromRGBA(0xFA6650, 1.0),NSFontAttributeName:kFont(7)} range:NSMakeRange(3,testStr.length - 3)];
    preferential.attributedText = str;
    
    UILabel *total = [UILabel new];
    total.font = kFont(7);
    total.textColor = UIColorFromRGBA(0x333338, 1.0);
    
    NSString *testStr1 = @"共：¥ 400";
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:testStr1];
    [str1 addAttributes:@{NSForegroundColorAttributeName:UIColorFromRGBA(0xFA6650, 1.0),NSFontAttributeName:kFont(9)} range:NSMakeRange(2,testStr1.length - 2)];
    total.attributedText = str1;
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"more"];
    
    [footer addSubview:preferential];
    [footer addSubview:total];
    [footer addSubview:imageView];
    
    [preferential makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(footer).offset(10 *kScale);
    }];

    [imageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(preferential);
        
        make.right.equalTo(footer).offset(-10 *kScale);
    }];
    
    [total makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(preferential.mas_bottom).offset(10 *kScale);
        
        make.left.equalTo(footer).offset(10 *kScale);
    }];
    
    return footer;
}



- (void)selectClik:(UIButton *)sender{

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    
    TicketContentsCell *cell = [self.mainTableView cellForRowAtIndexPath:indexPath];
    
    sender.selected = !sender.selected;

    if (sender.selected) {
        
        cell.cPrice.textColor = UIColorFromRGBA(0xFA6650, 1.0);
    }else{

        cell.cPrice.textColor = UIColorFromRGBA(0x333338, 1.0);
    }

}



- (void)settlementClick{
    
    
}

- (void)foreAction{

    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark NetWorks

- (void)sendHttpRequest{
    
    //获取水票详情
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[kCurrentController] = self;
    parameters[@"lTicketId"] = self.ticketId;
    
    [OutsourceNetWork onHttpCode:kProductionDetailNetWork WithParameters:parameters];
    
    [MBProgressHUDManager showHUDAddedTo:self.view];
}

- (void)getTicketDetail:(id)responseObj{

    if ([responseObj[@"resCode"] isEqualToString:@"0"]) {
        
        [MBProgressHUDManager hideHUDForView:self.view];
        
        self.tModel = [TicketModel mj_objectWithKeyValues:responseObj[@"result"]];
        
        self.dataSource = responseObj[@"result"][@"ticketcontents"];
        
        UIView *headerView = [self createHeaderView];
        
        UIView *footerView = [self createFooterView];
        
        self.mainTableView.tableHeaderView = headerView;
        self.mainTableView.tableFooterView = footerView;
        
        [self.mainTableView reloadData];
        NSLog(@"%@",responseObj);
    }
    
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
    
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"TicketDetailTableViewCell";
    TicketContentsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[TicketContentsCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
        
    }
    ContentTicketModel *model = [ContentTicketModel mj_objectWithKeyValues:self.dataSource[indexPath.row]];
    
    [cell fitDataWithModel:model];
    
    cell.selectBtn.tag = indexPath.row;
    [cell.selectBtn addTarget:self action:@selector(selectClik:) forControlEvents:UIControlEventTouchUpInside];
    
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
