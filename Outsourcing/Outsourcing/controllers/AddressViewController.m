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
#import "MJExtension.h"

#import "AddressTableViewCell.h"
#import "NewAddressViewController.h"
#import "AddressModel.h"


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
    
    [self sendHttpRequest];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
    
    [self loadConfigUI];
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

    NewAddressViewController *newAddress = [NewAddressViewController new];
    
    [self.navigationController pushViewController:newAddress animated:YES];

}


- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark NetWorks

- (void)sendHttpRequest{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[kCurrentController] = self;
    parameters[@"lUserId"] = [UserTools userId];
    parameters[@"nMaxNum"] = @"10";
    parameters[@"nPage"] = @"1";
    
    [OutsourceNetWork onHttpCode:kUserAddressNetWork WithParameters:parameters];
}

- (void)setupDefaultAddress:(NSInteger)index{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[kCurrentController] = self;
    parameters[@"lUserId"] = [UserTools userId];
    parameters[@"nMaxNum"] = @"10";
    parameters[@"nPage"] = @"1";
    
    [OutsourceNetWork onHttpCode:kUserAddressNetWork WithParameters:parameters];
}






- (void)getMyAddressList:(id)responseObj{

    self.dataSource = [NSMutableArray new];
    if ([responseObj[@"resCode"] isEqualToString:@"0"]) {
        
        self.dataSource = responseObj[@"result"][@"dataList"];
        
        [self.mainTableView reloadData];
    }
    
    NSLog(@"%@",responseObj);

}




#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.dataSource.count;
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

    AddressModel *model = [AddressModel mj_objectWithKeyValues:self.dataSource[indexPath.section]];
    
    [cell fitDataWithModel:model];
    
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
