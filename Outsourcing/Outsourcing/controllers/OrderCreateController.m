//
//  OrderCreateController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/26.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "OrderCreateController.h"
#import "OrderDetailListCell.h"
#import "Masonry.h"
#import "EliveApplication.h"

#import "ProductionShowView.h"
#import "PaymentViewController.h"


@interface OrderCreateController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ,strong)ProductionShowView *proShowView;

@property (nonatomic ,strong)UILabel *oWTicket;

@property (nonatomic ,strong)UIButton *oSettlementBtn;

@property (nonatomic ,strong)UITableView *mainTableView;

@property (nonatomic ,strong)UIView *modalDialogView;
@property (nonatomic ,strong)UIView *tapView;
@property (nonatomic ,strong)UILabel *today;
@property (nonatomic ,strong)UILabel *tomorrow;
@property (nonatomic ,strong)UIScrollView *timeOption;
@property (nonatomic ,strong)UITableView *todayTableView;
@property (nonatomic ,strong)UITableView *tomorrowTableView;


@end

@implementation OrderCreateController

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    self.navigationItem.title = @"提交订单";
    
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

-(UITableView *)mainTableView{

    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kTopBarHeight, kWidth, kHeight) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _mainTableView;
}

-(ProductionShowView *)proShowView{
    
    if (!_proShowView) {
    
        _proShowView = [ProductionShowView new];
        
        [_proShowView.oSendTimeSelect addTarget:self action:@selector(oSendTimeClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _proShowView;
}

- (UILabel *)oWTicket{

    if (!_oWTicket) {
        
        _oWTicket = [UILabel new];
        _oWTicket.font = kFont(7);
        _oWTicket.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        _oWTicket.text = @"本次使用水票0张";
    }
    return _oWTicket;
}

-(UIButton *)oSettlementBtn{

    if (!_oSettlementBtn) {
        
        _oSettlementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _oSettlementBtn.frame = CGRectMake(0, kHeight - 24.5*kScale, kWidth, 24.5*kScale);
        [_oSettlementBtn.titleLabel setFont:kFont(7)];
        [_oSettlementBtn setTitle:@"去结算" forState:UIControlStateNormal];
        [_oSettlementBtn setTitleColor:UIColorFromRGBA(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        _oSettlementBtn.backgroundColor = UIColorFromRGBA(0xFA6650, 1.0);
        [_oSettlementBtn addTarget:self action:@selector(settlementClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _oSettlementBtn;
}


#pragma mark Click-Method

- (void)oSendTimeClick{


}

- (void)settlementClick{

    PaymentViewController *payMent = [PaymentViewController new];

    [self.navigationController pushViewController:payMent animated:YES];
}

- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark NetWorks

- (void)sendHttpRequest{

    //获取订单详情
    NSMutableDictionary *parametes = [NSMutableDictionary new];
    parametes[kCurrentController] = self;
    parametes[@"lOrderId"] = self.orderId;
    
    [OutsourceNetWork onHttpCode:kOrderDetailNetWork WithParameters:parametes];
    
    //获取优惠信息
    
    
    //获取水票信息
    
    
    //获取收货地址
    
}

- (void)orderGetDetail:(id)responseObj{

    
    
    NSLog(@"%@",responseObj);

}



#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";
    OrderDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[OrderDetailListCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
        
    }
    
    switch (indexPath.row) {
        case 0:
            
            cell.left_label.text = @"收获信息:";
            
            break;
        case 1:
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setLeftView:nil RightView:nil others:self.proShowView];
            break;
        case 2:
            
            cell.left_label.text = @"发票抬头";
            
            break;
        case 3:
            
            cell.left_label.text = @"备注";

            break;
        case 4:
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.left_label.text = @"使用水票";
            [cell setLeftView:nil RightView:self.oWTicket others:nil];
            
            break;
        case 5:
        {
            NSString *testStr = @"优惠（-￥5.00）";
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:testStr];
            [str addAttribute:NSForegroundColorAttributeName value:UIColorFromRGBA(0xFA6650, 1.0) range:NSMakeRange(3,testStr.length - 4)];
            cell.left_label.attributedText = str;
        }

            break;
        case 6:
        {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            NSString *testStr = @"共￥888.00";
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:testStr];
            [str addAttributes:@{NSForegroundColorAttributeName:UIColorFromRGBA(0xFA6650, 1.0),NSFontAttributeName:kFont(9)} range:NSMakeRange(1,testStr.length - 1)];
            cell.left_label.attributedText = str;
            [cell setLeftView:nil RightView:[UILabel new] others:nil];
        }
            
            break;
            
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%ld",indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        
        return 110*kScale;
    }
    return 20*kScale;
}


@end
