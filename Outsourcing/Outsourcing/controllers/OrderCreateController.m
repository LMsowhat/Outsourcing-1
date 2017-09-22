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
#import "MBProgressHUDManager.h"

#import "ProductionShowView.h"
#import "InputTextView.h"
#import "SubmitOrderProModel.h"
#import "OrderDetailViewController.h"
#import "MJExtension.h"

#import "AddressViewController.h"
#import "CouponsViewController.h"
#import "OrderInputView.h"



@interface OrderCreateController ()<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>

//水票
@property (nonatomic ,strong)UILabel *oWTicket;

//提交订单按钮
@property (nonatomic ,strong)UIButton *oSettlementBtn;

//订单商品列表
@property (nonatomic ,strong)UITableView *mainTableView;

@property (nonatomic ,strong)NSDictionary *dataSource;

//地址UILabel *
@property (nonatomic ,strong)UIView *addressView;
@property (nonatomic ,strong)UILabel *placeHolder;

@property (nonatomic ,strong)UILabel *receiveName;
@property (nonatomic ,strong)UILabel *receiveAddress;
@property (nonatomic ,strong)NSMutableDictionary *addressDict;

//商品底部展示
@property (nonatomic ,strong)UIView *proBottomView;

@property (nonatomic ,strong)UIImageView *buttonBackground;//加减按钮图片
@property (nonatomic ,strong)UIButton *substractBtn;//减按钮
@property (nonatomic ,strong)UIButton *addBtn;//加按钮
@property (nonatomic ,strong)UILabel *nBucketPrice;//桶押金
@property (nonatomic ,strong)NSString *totalBucketPrice;
@property (nonatomic ,strong)UILabel *nBucketNum;//押桶个数
@property (nonatomic ,assign)NSInteger totalBucketNum;



@property (nonatomic ,strong)UILabel *oTotalPrice;

//获取地址回调

@property (nonatomic ,assign)void (^addressBlock)(NSDictionary *);

//获取优惠券回调
@property (nonatomic ,assign)void (^couponBlock)(NSString *);
@property (nonatomic ,strong)NSMutableDictionary *couponDict;

//最终价格
@property (nonatomic ,copy)NSString *submitPrice;


//输入备注，发票抬头view
@property (nonatomic ,strong)OrderInputView *inputView;
@property (nonatomic ,strong)NSMutableDictionary *inputArray;



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
    
    self.inputView = [[NSBundle mainBundle] loadNibNamed:@"OrderInputView" owner:nil options:nil].lastObject;
    self.inputView.frame = self.view.frame;
    self.inputView.hidden = YES;
    self.inputView.myTextView.delegate = self;
    [self.inputView.saveButon addTarget:self action:@selector(saveClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.oSettlementBtn];
    [self.view addSubview:self.inputView];

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
//        _oWTicket.text = @"本次使用水票0张";
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
        
        self.placeHolder = [UILabel new];
        self.placeHolder.font = kFont(8);
        self.placeHolder.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        self.placeHolder.textAlignment = NSTextAlignmentCenter;
        self.placeHolder.text = @"请选择送货地址";
        
        self.receiveName = [UILabel new];
        self.receiveName.font = kFont(6);
        self.receiveName.textColor = UIColorFromRGBA(0x8F9095, 1.0);
//        self.receiveName.text = @"李文华  15011075120";
        
        self.receiveAddress = [UILabel new];
        self.receiveAddress.font = kFont(6);
        self.receiveAddress.textColor = UIColorFromRGBA(0x8F9095, 1.0);
//        self.receiveAddress.text = @"北京市海淀区知春路113号银网中心A座808";
        
        UIView *lineView1 = [UIView new];
        lineView1.backgroundColor = UIColorFromRGBA(0xDDDDDD, 1.0);
        
        if ([UserTools userAddress]) {
            
            NSDictionary *address = [UserTools userAddress];
            self.receiveName.text = [NSString stringWithFormat:@"%@   %@",address[@"strReceiptusername"],address[@"strReceiptmobile"]];
            self.receiveAddress.text = [NSString stringWithFormat:@"%@%@",address[@"strLocation"],address[@"strDetailaddress"]];
            self.receiveName.hidden = NO;
            self.receiveAddress.hidden = NO;
            self.placeHolder.hidden = YES;
            
        }else{
        
            self.receiveName.hidden = YES;
            self.receiveAddress.hidden = YES;
            self.placeHolder.hidden = NO;
        }
        
        [_addressView addSubview:self.placeHolder];
        [_addressView addSubview:self.receiveName];
        [_addressView addSubview:self.receiveAddress];
        [_addressView addSubview:lineView1];
        
        [self.placeHolder makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(_addressView);
            
            make.center.equalTo(_addressView);
        }];
        
        [self.receiveName makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(_addressView).offset(10 *kScale);
            
            make.top.equalTo(_addressView).offset(3 *kScale);
        }];
        
        [self.receiveAddress makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(_addressView).offset(10 *kScale);
            
            make.top.equalTo(self.receiveName.mas_bottom).offset(2 *kScale);
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
        
        self.buttonBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calculate"]];
        
        self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.addBtn setTitle:@"" forState:UIControlStateNormal];
        [self.addBtn setBackgroundColor:kClearColor];
        [self.addBtn addTarget:self action:@selector(addtionClick) forControlEvents:UIControlEventTouchUpInside];
        
        self.substractBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.substractBtn setTitle:@"" forState:UIControlStateNormal];
        [self.substractBtn setBackgroundColor:kClearColor];
        [self.substractBtn addTarget:self action:@selector(subtractionClick) forControlEvents:UIControlEventTouchUpInside];
        
        self.nBucketPrice = [UILabel new];
        self.nBucketPrice.font = kFont(6);
        self.nBucketPrice.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        
        self.nBucketNum = [UILabel new];
        self.nBucketNum.font = kFont(6);
        self.nBucketNum.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        
        UILabel *oTotalTitle = [UILabel new];
        oTotalTitle = [UILabel new];
        oTotalTitle.font = kFont(7);
        oTotalTitle.textColor = UIColorFromRGBA(0x333338, 1.0);
        oTotalTitle.text = @"订单合计：";
        
        self.oTotalPrice = [UILabel new];
        self.oTotalPrice.font = kFont(7);
        self.oTotalPrice.textColor = UIColorFromRGBA(0x333338, 1.0);
        
        UIView *line = [UIView new];
        line.backgroundColor = UIColorFromRGBA(0xDDDDDD, 1.0);

        [_proBottomView addSubview:self.buttonBackground];
        [_proBottomView addSubview:self.addBtn];
        [_proBottomView addSubview:self.substractBtn];
        [_proBottomView addSubview:self.nBucketNum];
        [_proBottomView addSubview:self.nBucketPrice];
        [_proBottomView addSubview:oTotalTitle];
        [_proBottomView addSubview:self.oTotalPrice];
        [_proBottomView addSubview:line];
        
        [self.nBucketPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_proBottomView);
            
            make.left.equalTo(_proBottomView).offset(10 *kScale);
        }];
        
        [self.buttonBackground makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(30 *kScale, 7*kScale));
            
            make.centerY.equalTo(self.nBucketPrice);
            
            make.left.equalTo(self.nBucketPrice.mas_right).offset(20);
        }];
        
        [self.nBucketNum makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self.buttonBackground);
            
        }];
        
        [self.substractBtn makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(15 *kScale, 7 *kScale));
            
            make.centerY.equalTo(self.buttonBackground);
            
            make.left.equalTo(self.buttonBackground.mas_left);
        }];
        
        [self.addBtn makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(15 *kScale, 7 *kScale));
            
            make.centerY.equalTo(self.buttonBackground);
            
            make.right.equalTo(self.buttonBackground.mas_right);
        }];
 
        
        [self.oTotalPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_proBottomView);
            
            make.right.equalTo(_proBottomView).offset(-10 *kScale);
        }];
        
        [oTotalTitle makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_proBottomView);
            
            make.right.equalTo(self.oTotalPrice.mas_left).offset(-2 *kScale);
        }];
        
        [line makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(kWidth - 10 *kScale, 1));
            
            make.centerX.equalTo(_proBottomView);
            
            make.bottom.equalTo(_proBottomView).offset(-1);
        }];
    }
    return _proBottomView;
}

-(NSMutableDictionary *)addressDict{
    
    if (!_addressDict) {
        
        _addressDict = [NSMutableDictionary new];
    }

    return _addressDict;
}

-(NSMutableDictionary *)couponDict{
    
    if (!_couponDict) {
        
        _couponDict = [NSMutableDictionary new];
    }
    
    return _couponDict;
}


- (UIView *)createProCell:(NSIndexPath *)indexPath{

    SubmitOrderProModel *model = [SubmitOrderProModel mj_objectWithKeyValues:self.dataSource[@"orderGoods"][indexPath.row - 2]];
    
    ProductionShowView *cell = [[ProductionShowView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 45 *kScale) AndModel:model];
    
    return cell;
}

#pragma mark Click-Method

- (void)addtionClick{

    if (!self.totalBucketNum) {
        
        self.totalBucketNum = 0;
    }
    self.totalBucketNum += 1;
    //总共桶押金
    self.nBucketNum.text = [NSString stringWithFormat:@"%ld",self.totalBucketNum];
    self.nBucketPrice.text = [NSString stringWithFormat:@"桶押金：￥%ld",self.totalBucketNum * [self.dataSource[@"nBucketmoney"] integerValue]/100];
    
    //订单实际总价格
    self.submitPrice = [NSString stringWithFormat:@"%ld",[self.submitPrice integerValue] + [self.dataSource[@"nBucketmoney"] integerValue]];
    
    [self.mainTableView reloadData];
}
- (void)subtractionClick{
    
    if (!self.totalBucketNum || self.totalBucketNum == 0) return;
    
    self.totalBucketNum -= 1;

    self.nBucketNum.text = [NSString stringWithFormat:@"%ld",self.totalBucketNum];
    self.nBucketPrice.text = [NSString stringWithFormat:@"桶押金：￥%ld",self.totalBucketNum * [self.dataSource[@"nBucketmoney"] integerValue]/100];
    
    self.submitPrice = [NSString stringWithFormat:@"%ld",[self.submitPrice integerValue] - [self.dataSource[@"nBucketmoney"] integerValue]];

    [self.mainTableView reloadData];
}



- (void)settlementClick{
    
    //去结算
    NSMutableDictionary *parametes = [NSMutableDictionary new];
    parametes[kCurrentController] = self;
    parametes[@"lId"] = self.orderId;//订单id
    parametes[@"lBuyerid"] = [UserTools userId];//用户id
    parametes[@"lAddressid"] = self.addressDict[@"lId"] ? self.addressDict[@"lId"] : [UserTools userAddress][@"lId"];//地址id
    parametes[@"strReceiptusername"] = self.addressDict[@"strReceiptusername"] ?
                                       self.addressDict[@"strReceiptusername"] :
                                       [UserTools userAddress][@"strReceiptusername"];//收货人姓名
    parametes[@"strReceiptmobile"] =   self.addressDict[@"strReceiptmobile"] ?
                                       self.addressDict[@"strReceiptmobile"] :
                                       [UserTools userAddress][@"strReceiptmobile"];//电话
    parametes[@"strLocation"] =        self.addressDict[@"strLocation"] ?
                                       self.addressDict[@"strLocation"] :
                                       [UserTools userAddress][@"strLocation"];//所在区域
    parametes[@"strDetailaddress"] =   self.addressDict[@"strDetailaddress"] ?
                                       self.addressDict[@"strDetailaddress"] :
                                       [UserTools userAddress][@"strDetailaddress"];//详细地址
    parametes[@"strInvoiceheader "] = self.inputArray[@"strInvoiceheader"];//发票抬头
    parametes[@"strRemarks"] = self.inputArray[@"strInvoiceheader"];//备注
    parametes[@"nFactPrice"] = self.submitPrice;//实际支付价格
    parametes[@"nTotalprice"] = self.dataSource[@"nTotalprice"];//订单总价
    parametes[@"lMyCouponId"] = self.couponDict[@"lLd"];//优惠券id
    parametes[@"nCouponPrice"] = self.couponDict[@"nPrice"];//优惠券金额
    parametes[@"nBucketnum"] = [NSString stringWithFormat:@"%ld",self.totalBucketNum];//押桶个数
    
    parametes[@"orderGoods"] = self.dataSource[@"orderGoods"];//商品信息
    
    [OutsourceNetWork onHttpCode:kOrderClearingNetWork WithParameters:parametes];
}

- (void)saveClick:(UIButton *)sender{
    
    self.inputView.myTextView.text = @"";
    self.inputView.hidden = YES;

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
    
    [MBProgressHUDManager showHUDAddedTo:self.view];
}

- (void)orderGetDetail:(id)responseObj{

    [MBProgressHUDManager hideHUDForView:self.view];

    if ([responseObj[@"resCode"] isEqualToString:@"0"] && responseObj[@"result"]) {
        
        self.dataSource = responseObj[@"result"];
        
        NSInteger nBucketmoney = [self.dataSource[@"nBucketmoney"] integerValue];
        NSInteger ticketNum = 0;
        for (NSDictionary *temp in self.dataSource[@"orderGoods"]) {
            
            NSInteger num = [temp[@"nWatertickets"] integerValue];
            
            ticketNum += num;
        }
        self.totalBucketNum = [self.dataSource[@"nBucketnum"] integerValue];
        self.nBucketNum.text = [NSString stringWithFormat:@"%ld",self.totalBucketNum];
        self.nBucketPrice.text = [NSString stringWithFormat:@"桶押金 ￥%ld",self.totalBucketNum * nBucketmoney/100];
        self.submitPrice = self.dataSource[@"nFactPrice"];
        self.oWTicket.text = [NSString stringWithFormat:@"本次使用水票%ld张",ticketNum];
        
        self.oTotalPrice.text = [NSString stringWithFormat:@"￥%ld",[self.dataSource[@"nTotalprice"] integerValue]/100];

        [self.mainTableView reloadData];
        
    }else{
        
        [MBProgressHUDManager showTextHUDAddedTo:self.view WithText:responseObj[@"result"] afterDelay:1.0f];
    }
    
    NSLog(@"%@",responseObj);

}

- (void)resultOfClearing:(id)responseObj{

    if ([responseObj[@"resCode"] isEqualToString:@"0"] && responseObj[@"result"]) {
        
        OrderDetailViewController *orderDetail = [OrderDetailViewController new];
        orderDetail.orderId = self.orderId;
        
        [self.navigationController pushViewController:orderDetail animated:YES];
    }else{
    
        [MBProgressHUDManager showTextHUDAddedTo:self.view WithText:responseObj[@"result"] afterDelay:1.0f];
    }
    

}

#pragma mark TableViewDelegate
/**
 内容发生改变编辑 自定义文本框placeholder
 有时候我们要控件自适应输入的文本的内容的高度，只要在textViewDidChange的代理方法中加入调整控件大小的代理即可
 @param textView textView
 */
- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.markedTextRange == nil) {
        
        if (!self.inputArray) {
            
            self.inputArray = [NSMutableDictionary new];
        }
        if (self.inputView.isRemark == 1) {
            
            self.inputArray[@"strRemarks"] = textView.text;
            
        }else if (self.inputView.isRemark == 2){
        
            self.inputArray[@"strInvoiceheader"] = textView.text;
        }
    }
    
    
}

#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 12;
    return 8 + [self.dataSource[@"orderGoods"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";
    OrderDetailListCell *cell = [[OrderDetailListCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    
    NSInteger dCount = [self.dataSource[@"orderGoods"] count];
    if (indexPath.row == 0) {
        
        cell.left_label.text = @"收货信息:";
    }
    if (indexPath.row == 1) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLeftView:nil RightView:nil others:self.addressView];
    }
    if (indexPath.row > 1 && indexPath.row < dCount +2) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLeftView:nil RightView:nil others:[self createProCell:indexPath]];
        
    }
    if (indexPath.row == dCount +2) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLeftView:nil RightView:nil others:self.proBottomView];
    }
    
    if (indexPath.row == dCount +3) {
        
        cell.left_label.text = @"发票抬头";

    }
    if (indexPath.row == dCount +4) {
        
        cell.left_label.text = @"备注";

    }
    if (indexPath.row == dCount +5) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.left_label.text = @"使用水票";
        [cell setLeftView:nil RightView:self.oWTicket others:nil];
    }
    if (indexPath.row == dCount +6) {
        
        NSString *testStr = [NSString stringWithFormat:@"优惠（-￥%.2f）",self.couponDict ? [self.couponDict[@"nPrice"] floatValue]/100 : 0];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:testStr];
        [str addAttribute:NSForegroundColorAttributeName value:UIColorFromRGBA(0xFA6650, 1.0) range:NSMakeRange(3,testStr.length - 4)];
        cell.left_label.attributedText = str;
    }
    if (indexPath.row == dCount +7) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString *testStr = [NSString stringWithFormat:@"共￥%ld",[self.submitPrice integerValue]/100];
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
    
    NSInteger nCount = [self.dataSource[@"orderGoods"] count];
    if (indexPath.row == 0) {
        
        AddressViewController *address = [AddressViewController new];
        address.isSelectedAddress = YES;
        WeakSelf(weakSelf);
        address.passAddress = ^(NSDictionary * address) {

            weakSelf.addressDict = [NSMutableDictionary dictionaryWithDictionary:address];
            weakSelf.receiveName.text = [NSString stringWithFormat:@"%@   %@",address[@"strReceiptusername"],address[@"strReceiptmobile"]];
            weakSelf.receiveAddress.text = [NSString stringWithFormat:@"%@%@",address[@"strLocation"],address[@"strDetailaddress"]];
            weakSelf.receiveName.hidden = NO;
            weakSelf.receiveAddress.hidden = NO;
            weakSelf.placeHolder.hidden = YES;
            
            [tableView reloadData];
            
            NSLog(@"此处订单回调地址%@",address);
        };
        
        [self.navigationController pushViewController:address animated:YES];
    }
    if (indexPath.row == nCount +6) {
        
        CouponsViewController *coupon = [CouponsViewController new];
        coupon.nFullPrice = self.submitPrice;
        coupon.isSelectedCoupons = YES;
        WeakSelf(weakSelf);
        coupon.passCoupons = ^(NSDictionary *couponDict) {
            
            weakSelf.couponDict = [NSMutableDictionary dictionaryWithDictionary:couponDict];
            
            NSInteger orderTotal = [self.submitPrice integerValue] - [self.couponDict[@"nPrice"] integerValue];
            orderTotal = orderTotal < 0 ? 0: orderTotal;
            self.submitPrice = [NSString stringWithFormat:@"%ld",orderTotal];
            
            [tableView reloadData];
            NSLog(@"此处订单回调优惠券价格%@",couponDict);
        };
        
        [self.navigationController pushViewController:coupon animated:YES];
    }
    
    if (indexPath.row == nCount + 3) {
        
        self.inputView.isRemark = 2;
        self.inputView.hidden = NO;
    }
    if (indexPath.row == nCount + 4) {
        
        self.inputView.isRemark = 1;
        self.inputView.hidden = NO;
    }
    
    
    NSLog(@"%ld",indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        
        return 25*kScale;
    }
    if (indexPath.row > 1 && indexPath.row < [self.dataSource[@"orderGoods"] count] +2) {
        
        return 30 *kScale;
    }
    
    if (indexPath.row == [self.dataSource[@"orderGoods"] count] + 2) {
        
        return 25 *kScale;
    }
    
    return 20*kScale;
}


@end
