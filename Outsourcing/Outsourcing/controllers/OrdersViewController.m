//
//  OrdersViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/14.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "OrdersViewController.h"
#import "Masonry.h"
#import "OrderListTableViewCell.h"



@interface OrdersViewController ()<UIScrollViewDelegate,UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong)UIView *topTabView;

@property (nonatomic ,strong)UILabel *finishedLabel;
@property (nonatomic ,strong)UILabel *unfinishedLabel;
@property (nonatomic ,strong)UIView *tagView;


@property (nonatomic ,strong)UIScrollView *mainSrollView;

@property (nonatomic ,strong)UITableView *finishedTableView;
@property (nonatomic ,strong)UITableView *unfinishedTableView;

@property (nonatomic ,strong)NSMutableArray *dataSource;

@property (nonatomic ,strong)NSMutableArray *finishedArr;
@property (nonatomic ,strong)NSMutableArray *unfinishedArr;


@end

@implementation OrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadConfigUI];
    // Do any additional setup after loading the view.
}

- (void)loadConfigUI{

    [self.view addSubview:self.topTabView];

    [self.view addSubview:self.finishedTableView];
}

-(UIView *)topTabView{

    if (!_topTabView) {
        
        _topTabView = [UIView new];
        _topTabView.backgroundColor = UIColorFromRGBA(0xFFFFFF, 1.0);
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkOutLabel:)];
        
        [_topTabView addGestureRecognizer:tap];
        
        self.finishedLabel = [UILabel new];
        self.finishedLabel.text = @"未完成";
        self.finishedLabel.font = kFont(28);
        self.finishedLabel.textColor = UIColorFromRGBA(0xFA6650, 1.0);
        self.finishedLabel.textAlignment = NSTextAlignmentCenter;
        
        self.unfinishedLabel = [UILabel new];
        self.unfinishedLabel.font = kFont(28);
        self.unfinishedLabel.text = @"已完成";
        self.unfinishedLabel.textColor = UIColorFromRGBA(0xFA6650, 1.0);
        self.unfinishedLabel.textAlignment = NSTextAlignmentCenter;
        
        [_topTabView addSubview:self.unfinishedLabel];
        [_topTabView addSubview:self.finishedLabel];
        
        [self.finishedLabel makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_topTabView).offset(-kWidth/3);
            make.left.equalTo(_topTabView);
            
        }];
        
        [self.unfinishedLabel makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_topTabView).offset(kWidth/3);
            make.right.equalTo(_topTabView);
            
        }];
        
    }

    return _topTabView;
}


-(UITableView *)finishedTableView {
    
    if (!_finishedTableView) {
        
        _finishedTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kTopBarHeight + 40, kWidth, kHeight - kTopBarHeight - 40) style:UITableViewStylePlain];
        
        _finishedTableView.delegate = self;
        _finishedTableView.dataSource = self;
        
    }
    
    return _finishedTableView;
}

-(UIScrollView *)mainSrollView{
    
    if (!_mainSrollView) {
        
        _mainSrollView = [UIScrollView new];
        _mainSrollView.delegate = self;
        _mainSrollView.contentSize = CGSizeMake(kWidth * 2, kHeight);
        _mainSrollView.pagingEnabled = YES;
        _mainSrollView.showsVerticalScrollIndicator = NO;
        _mainSrollView.showsHorizontalScrollIndicator = NO;
        _mainSrollView.bounces = NO;
        
    }
    
    return _mainSrollView;
}

- (void)checkOutLabel:(UITapGestureRecognizer *)sender{

    CGPoint point = [sender locationInView:self.view];
    if (CGRectContainsPoint(CGRectMake(0, kTopBarHeight, kWidth/2, 40), point))
        
    {
        
        // Do what you want
        
    }

}

#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
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
    
    return 260;
}


@end
