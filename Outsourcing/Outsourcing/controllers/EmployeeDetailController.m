//
//  EmployeeDetailController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/9/28.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "EmployeeDetailController.h"
#import "EliveApplication.h"
#import "MJExtension.h"
#import "MBProgressHUDManager.h"

#import "OrderDetailListCell.h"
#import "SubmitOrderProModel.h"
#import "ProductionShowView.h"


@interface EmployeeDetailController ()<UITableViewDelegate,UITableViewDataSource>

//提交订单按钮
@property (nonatomic ,strong)UIButton *oSettlementBtn;

//订单商品列表
@property (nonatomic ,strong)UITableView *mainTableView;

@property (nonatomic ,strong)NSDictionary *dataSource;

@end

@implementation EmployeeDetailController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"配送单详情";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 22, 17);
    [btn setImage:[UIImage imageNamed:@"naviBack"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(foreAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.oSettlementBtn];
    
    [self sendHttpRequest];
    // Do any additional setup after loading the view.
}

#pragma mark Setter && Getter

-(UITableView *)mainTableView{
    
    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kTopBarHeight, kWidth, kHeight - kTopBarHeight - 24.5 *kScale) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _mainTableView;
}

-(NSDictionary *)dataSource{
    
    if (!_dataSource) {
        
        _dataSource = [NSDictionary new];
    }
    return _dataSource;
}

-(UIButton *)oSettlementBtn{
    
    if (!_oSettlementBtn) {
        
        _oSettlementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _oSettlementBtn.frame = CGRectMake(0, kHeight - 24.5*kScale, kWidth, 24.5*kScale);
        [_oSettlementBtn.titleLabel setFont:kFont(7)];
        [_oSettlementBtn setTitle:@"确认配送" forState:UIControlStateNormal];
        [_oSettlementBtn setTitleColor:UIColorFromRGBA(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        _oSettlementBtn.backgroundColor = UIColorFromRGBA(0xFA6650, 1.0);
        [_oSettlementBtn addTarget:self action:@selector(settlementClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _oSettlementBtn;
}


- (UIView *)createProCell:(NSIndexPath *)indexPath{
    
    SubmitOrderProModel *model = [SubmitOrderProModel mj_objectWithKeyValues:self.dataSource[@"orderGoods"][indexPath.row - 3]];
    
    ProductionShowView *cell = [[ProductionShowView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 45 *kScale) AndModel:model];
    
    return cell;
}


#pragma mark NetWorks

- (void)sendHttpRequest{
    
    //获取订单详情
    NSMutableDictionary *parametes = [NSMutableDictionary new];
    parametes[kCurrentController] = self;
    parametes[@"lOrderId"] = self.orderId;
    
    [OutsourceNetWork onHttpCode:kOrderDetailTwoNetWork WithParameters:parametes];
    
}


- (void)deliveryGetDetail:(id)responseObj{
    
    if ([responseObj[@"resCode"] isEqualToString:@"0"] && responseObj[@"result"]) {
        
        
        [self.mainTableView reloadData];
        
    }else{
        
        [MBProgressHUDManager showTextHUDAddedTo:self.view WithText:responseObj[@"result"] afterDelay:1.0f];
    }
}



#pragma mark Target

- (void)settlementClick{
    
    
}


- (void)foreAction{
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}





#pragma mark TableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.dataSource[@"orderGoods"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";
    OrderDetailListCell *cell = [[OrderDetailListCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setLeftView:nil RightView:nil others:[self createProCell:indexPath]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%ld",indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30*kScale;
}


@end
