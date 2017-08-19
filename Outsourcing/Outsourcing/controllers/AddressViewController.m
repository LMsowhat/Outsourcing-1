//
//  AddressViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/8/16.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "AddressViewController.h"
#import "MBProgressHUDManager.h"
#import "EliveApplication.h"


#import "AddressTableViewCell.h"


@interface AddressViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong)UITableView *mainTableView;

@property (nonatomic ,strong)NSMutableArray *dataSource;

@end

@implementation AddressViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"我的地址";
    
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
    [self sendHttpRequest];
    // Do any additional setup after loading the view.
}

- (void)loadConfigUI{

    [self.view addSubview:self.mainTableView];
    
    UIButton *addNewAddress = [UIButton buttonWithType:UIButtonTypeCustom];
    addNewAddress.frame = CGRectMake(0, kHeight - 24.5 *kScale, kWidth, 24.5 *kScale);
    [addNewAddress setTitle:@"新增收货地址" forState:UIControlStateNormal];
    [addNewAddress.titleLabel setFont:kFont(7)];
    [addNewAddress.titleLabel setTextColor:UIColorFromRGBA(0xFFFFFF, 1.0)];
    addNewAddress.backgroundColor = UIColorFromRGBA(0xFA6650, 1.0);
    [addNewAddress addTarget:self action:@selector(addNewAddresClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:addNewAddress];
    
}


#pragma mark Setter && Getter

-(UITableView *)mainTableView{

    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kTopBarHeight, kWidth, kHeight - kTopBarHeight -25*kScale) style:UITableViewStyleGrouped];
     
        _mainTableView.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
        
        _mainTableView.delegate = self;
        
        _mainTableView.dataSource = self;
        
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _mainTableView;
}

#pragma mark Target

- (void)addNewAddresClick{

//    [self requestAddNewAddress];
}


- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark NetWorks

- (void)sendHttpRequest{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[kCurrentController] = self;
    parameters[@"lUserId"] = [UserTools userId];
    parameters[@"nMaxNum"] = @"1";
    parameters[@"nPage"] = @"5";
    
    [OutsourceNetWork onHttpCode:kUserAddressNetWork WithParameters:parameters];
  
}

- (void)requestAddNewAddress{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[kCurrentController] = self;
    parameters[@"lUserId"] = [UserTools userId];
    parameters[@"nMaxNum"] = @"1";
    parameters[@"nPage"] = @"5";
    
    [OutsourceNetWork onHttpCode:kUserAddressNetWork WithParameters:parameters];
    
}


- (void)getMyAddressList:(id)responseObj{

    self.dataSource = [NSMutableArray new];
    if ([responseObj[@"resCode"] isEqualToString:@"0"]) {
        
        
    }else{
    
    
    }
    
    NSLog(@"%@",responseObj);

}



#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 5 *kScale;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";
    AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.seleteBtn.selected = NO;
    
    if (cell == nil)
    {
        cell = [[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
    }

    cell.receiveName.text = [NSString stringWithFormat:@"李文华%ld",indexPath.section];
    cell.receivePhone.text = @"15011075120";
    cell.Address.text = @"北京市海淀区知春路113号银网中心A 座808";
    if (indexPath.section == 0) {
        
        cell.seleteBtn.selected = YES;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 75.5 *kScale;
}

@end
