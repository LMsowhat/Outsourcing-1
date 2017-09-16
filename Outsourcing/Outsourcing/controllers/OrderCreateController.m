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
#import "InputTextView.h"
#import "SubmitOrderProModel.h"

@interface OrderCreateController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ,strong)UILabel *oWTicket;

@property (nonatomic ,strong)UIButton *oSettlementBtn;

@property (nonatomic ,strong)UITableView *mainTableView;

@property (nonatomic ,strong)NSDictionary *dataSource;

@property (nonatomic ,strong)UIView *addressView;

@property (nonatomic ,strong)UIView *proBottomView;





@property (nonatomic ,strong)InputTextView *inputText;


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

-(UIView *)addressView{

    if (!_addressView) {
        
        _addressView = [UIView new];
        
        UILabel *receiveName = [UILabel new];
        receiveName.font = kFont(6);
        receiveName.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        receiveName.text = @"李文华  15011075120";
        
        UILabel *receiveAddress = [UILabel new];
        receiveAddress = [UILabel new];
        receiveAddress.font = kFont(6);
        receiveAddress.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        receiveAddress.text = @"北京市海淀区知春路113号银网中心A座808";
        
        UIView *lineView1 = [UIView new];
        lineView1.backgroundColor = UIColorFromRGBA(0xDDDDDD, 1.0);

        [_addressView addSubview:receiveName];
        [_addressView addSubview:receiveAddress];
        [_addressView addSubview:lineView1];
        
        [receiveName makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(_addressView).offset(10 *kScale);
            
            make.top.equalTo(_addressView).offset(3 *kScale);
        }];
        
        [receiveAddress makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(_addressView).offset(10 *kScale);
            
            make.top.equalTo(receiveName.mas_bottom).offset(2 *kScale);
        }];
        
        [lineView1 makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_addressView);
            
            make.size.equalTo(CGSizeMake(kWidth - 10 *kScale, 1));
            
            make.bottom.equalTo(_addressView).offset(-1);
        }];
        
    }

    return _addressView;
}

-(UIView *)proBottomView{

    if (!_proBottomView) {
        
        _proBottomView = [UIView new];
        
        UILabel *nBucketPrice = [UILabel new];
        nBucketPrice = [UILabel new];
        nBucketPrice.font = kFont(6);
        nBucketPrice.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        nBucketPrice.text = @"桶押金 ￥88";
        
        UILabel *nBucketNum = [UILabel new];
        nBucketNum = [UILabel new];
        nBucketNum.font = kFont(6);
        nBucketNum.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        nBucketNum.text = @"(x 15)";
        
        UILabel *oTotalTitle = [UILabel new];
        oTotalTitle = [UILabel new];
        oTotalTitle.font = kFont(7);
        oTotalTitle.textColor = UIColorFromRGBA(0x333338, 1.0);
        oTotalTitle.text = @"订单合计：";
        
        UILabel *oTotalPrice = [UILabel new];
        oTotalPrice = [UILabel new];
        oTotalPrice.font = kFont(7);
        oTotalPrice.textColor = UIColorFromRGBA(0x333338, 1.0);
        oTotalPrice.text = @"￥26.00";
        
        UIView *line = [UIView new];
        line.backgroundColor = UIColorFromRGBA(0xDDDDDD, 1.0);

        [_proBottomView addSubview:nBucketNum];
        [_proBottomView addSubview:nBucketPrice];
        [_proBottomView addSubview:oTotalTitle];
        [_proBottomView addSubview:oTotalPrice];
        [_proBottomView addSubview:line];
        
        [nBucketPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_proBottomView);
            
            make.left.equalTo(_proBottomView).offset(10 *kScale);
        }];
        
        [nBucketNum makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_proBottomView);
            
            make.left.equalTo(nBucketPrice.mas_right).offset(2 *kScale);
        }];
        
        [oTotalPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_proBottomView);
            
            make.right.equalTo(_proBottomView).offset(-10 *kScale);
        }];
        
        [oTotalTitle makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_proBottomView);
            
            make.right.equalTo(oTotalPrice.mas_left).offset(-2 *kScale);
        }];
        
        [line makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(kWidth - 10 *kScale, 1));
            
            make.centerX.equalTo(_proBottomView);
            
            make.bottom.equalTo(_proBottomView).offset(-1);
        }];
    }
    return _proBottomView;
}


- (UIView *)createProCell:(NSIndexPath *)indexPath{

    ProductionShowView *cell = [[ProductionShowView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 45 *kScale) AndModel:nil];
    
    return cell;
}

#pragma mark Click-Method

- (void)settlementClick{

    PaymentViewController *payMent = [PaymentViewController new];

    [self.navigationController pushViewController:payMent animated:YES];
}

- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark NetWorks

- (void)sendHttpRequest{

    //获取收货地址

    
    //获取订单详情
    NSMutableDictionary *parametes = [NSMutableDictionary new];
    parametes[kCurrentController] = self;
    parametes[@"lOrderId"] = self.orderId;
    
    [OutsourceNetWork onHttpCode:kOrderDetailNetWork WithParameters:parametes];
    
    //获取优惠信息
    
    
    //获取水票信息
    
    
    
}

- (void)orderGetDetail:(id)responseObj{

    if ([responseObj[@"resCode"] isEqualToString:@"0"] && responseObj[@"result"]) {
        
        self.dataSource = responseObj[@"result"];
        
        [self.mainTableView reloadData];
    }
    
    NSLog(@"%@",responseObj);

}



#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
//    return 8 + [self.dataSource[@"orderGoods"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";
    OrderDetailListCell *cell = [[OrderDetailListCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    
    NSInteger dCount = [self.dataSource[@"orderGoods"] count];
    if (indexPath.row == 0) {
        
        cell.left_label.text = @"收获信息:";
    }
    if (indexPath.row == 1) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLeftView:nil RightView:nil others:self.addressView];
    }
//    if (indexPath.row > 1 && indexPath.row < dCount +2) {
//        
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell setLeftView:nil RightView:nil others:[self createProCell:indexPath]];
//    }
//    if (indexPath.row == dCount +2) {
//        
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell setLeftView:nil RightView:nil others:self.proBottomView];
//    }
//    
//    if (indexPath.row == dCount +3) {
//        
//        cell.left_label.text = @"发票抬头";
//
//    }
//    if (indexPath.row == dCount +4) {
//        
//        cell.left_label.text = @"备注";
//
//    }
//    if (indexPath.row == dCount +5) {
//        
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.left_label.text = @"使用水票";
//        [cell setLeftView:nil RightView:self.oWTicket others:nil];
//    }
//    if (indexPath.row == dCount +6) {
//        
//        NSString *testStr = @"优惠（-￥5.00）";
//        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:testStr];
//        [str addAttribute:NSForegroundColorAttributeName value:UIColorFromRGBA(0xFA6650, 1.0) range:NSMakeRange(3,testStr.length - 4)];
//        cell.left_label.attributedText = str;
//    }
//    if (indexPath.row == dCount +7) {
//        
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        NSString *testStr = @"共￥888.00";
//        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:testStr];
//        [str addAttributes:@{NSForegroundColorAttributeName:UIColorFromRGBA(0xFA6650, 1.0),NSFontAttributeName:kFont(9)} range:NSMakeRange(1,testStr.length - 1)];
//        cell.left_label.attributedText = str;
//        [cell setLeftView:nil RightView:[UILabel new] others:nil];
//    }
//
    if (indexPath.row > 1 && indexPath.row < 6) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLeftView:nil RightView:nil others:[self createProCell:indexPath]];
    }
    if (indexPath.row == 6) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLeftView:nil RightView:nil others:self.proBottomView];
    }
    
    if (indexPath.row == 7) {
        
        cell.left_label.text = @"发票抬头";
        
    }
    if (indexPath.row == 8) {
        
        cell.left_label.text = @"备注";
        
    }
    if (indexPath.row == 9) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.left_label.text = @"使用水票";
        [cell setLeftView:nil RightView:self.oWTicket others:nil];
    }
    if (indexPath.row == 10) {
        
        NSString *testStr = @"优惠（-￥5.00）";
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:testStr];
        [str addAttribute:NSForegroundColorAttributeName value:UIColorFromRGBA(0xFA6650, 1.0) range:NSMakeRange(3,testStr.length - 4)];
        cell.left_label.attributedText = str;
    }
    if (indexPath.row == 11) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString *testStr = @"共￥888.00";
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:testStr];
        [str addAttributes:@{NSForegroundColorAttributeName:UIColorFromRGBA(0xFA6650, 1.0),NSFontAttributeName:kFont(9)} range:NSMakeRange(1,testStr.length - 1)];
        cell.left_label.attributedText = str;
        [cell setLeftView:nil RightView:[UILabel new] others:nil];
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
        
        return 30*kScale;
    }
//    if (indexPath.row > 1 && indexPath.row < [self.dataSource[@"orderGoods"] count] +2) {
//        
//        return 45 *kScale;
//    }
//    if (indexPath.row == [self.dataSource[@"orderGoods"] count] + 2) {
//        
//        return 30 *kScale;
//    }
    if (indexPath.row > 1 && 12 - indexPath.row > 6) {
        
        return 55 *kScale;
    }
    if (indexPath.row == 7) {
        
        return 30 *kScale;
    }
    return 20*kScale;
}


@end
