//
//  MyTicketViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/8/17.
//  Copyright © 2017年 李文华. All rights reserved.
//



#import "MyTicketViewController.h"
#import "MyTicketTableViewCell.h"
#import "EliveApplication.h"




@interface MyTicketViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong)UITableView *mainTableView;

@property (nonatomic ,strong)NSMutableArray *dataSource;

@end

@implementation MyTicketViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"我的水票";
    
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
    
//    [self sendRequestHttp];
    // Do any additional setup after loading the view.
}


#pragma  mark Setter && Getter

-(UITableView *)mainTableView{

    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kTopBarHeight, kWidth, kHeight - kTopBarHeight) style:UITableViewStylePlain];
        
        _mainTableView.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
        
        _mainTableView.delegate = self;
        
        _mainTableView.dataSource = self;
        
        _mainTableView.separatorColor = UIColorFromRGBA(0xDDDDDD, 1.0);
        
        UIView *foot = [UIView new];
//        foot.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
        _mainTableView.tableFooterView = foot;
    }
    return _mainTableView;
}

-(NSMutableArray *)dataSource{

    if (!_dataSource) {
        
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

#pragma mark Target

- (void)foreAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark NetWorks




#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";
    MyTicketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[MyTicketTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
        
    }
    cell.tTitle.text = @"怡宝雀巢桶装水通用水票";
    cell.tDate.text = @"2019-07-16 14:29";
    cell.tNumber.text = @"28张";
    
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
