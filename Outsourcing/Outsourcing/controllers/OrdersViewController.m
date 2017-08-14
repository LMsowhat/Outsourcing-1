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

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    self.navigationItem.title = @"订单";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadConfigUI];
    // Do any additional setup after loading the view.
}

- (void)loadConfigUI{

    [self.view addSubview:self.topTabView];

    [self.mainSrollView addSubview:self.unfinishedTableView];
    
    [self.mainSrollView addSubview:self.finishedTableView];
    
    [self.view addSubview:self.mainSrollView];
}

-(UIView *)topTabView{

    if (!_topTabView) {
        
        _topTabView = [[UIView alloc] initWithFrame:CGRectMake(0, kTopBarHeight, kWidth, 40)];
        _topTabView.backgroundColor = UIColorFromRGBA(0xFFFFFF, 1.0);
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkOutLabel:)];
        
        [_topTabView addGestureRecognizer:tap];
        
        self.finishedLabel = [UILabel new];
        self.finishedLabel.text = @"未完成";
        self.finishedLabel.font = kFont(7);
        self.finishedLabel.textColor = UIColorFromRGBA(0xFA6650, 1.0);
        self.finishedLabel.textAlignment = NSTextAlignmentCenter;
        
        self.unfinishedLabel = [UILabel new];
        self.unfinishedLabel.font = kFont(7);
        self.unfinishedLabel.text = @"已完成";
        self.unfinishedLabel.textColor = UIColorFromRGBA(0x333338, 1.0);
        self.unfinishedLabel.textAlignment = NSTextAlignmentCenter;
        
        self.tagView = [UIView new];
        self.tagView.backgroundColor = UIColorFromRGBA(0xFA6650, 1.0);
        
        [_topTabView addSubview:self.unfinishedLabel];
        [_topTabView addSubview:self.finishedLabel];
        [_topTabView addSubview:self.tagView];
        
        [self.finishedLabel makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_topTabView).offset(-kWidth/4);
            make.centerY.equalTo(_topTabView);
            
        }];
        
        [self.unfinishedLabel makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_topTabView).offset(kWidth/4);
            make.centerY.equalTo(_topTabView);
            
        }];
     
        [self.tagView makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(kWidth/4, 2));
            make.centerX.equalTo(_topTabView).offset(-kWidth/4);;
            make.top.equalTo(_topTabView);
            
        }];
        
    }

    return _topTabView;
}


-(UITableView *)finishedTableView {
    
    if (!_finishedTableView) {
        
        _finishedTableView = [[UITableView alloc] initWithFrame:CGRectMake(kWidth, 0, kWidth, kHeight - kTopBarHeight - 40 - kTabBarHeight) style:UITableViewStylePlain];
        
        _finishedTableView.delegate = self;
        _finishedTableView.dataSource = self;
        _finishedTableView.separatorColor = kClearColor;
        
    }
    
    return _finishedTableView;
}

-(UITableView *)unfinishedTableView{

    if (!_unfinishedTableView) {
        
        _unfinishedTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - kTopBarHeight - 40 - kTabBarHeight) style:UITableViewStylePlain];
        
        _unfinishedTableView.delegate = self;
        _unfinishedTableView.dataSource = self;
        _unfinishedTableView.separatorColor = kClearColor;
    }

    return _unfinishedTableView;
}


-(UIScrollView *)mainSrollView{
    
    if (!_mainSrollView) {
        
        _mainSrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kTopBarHeight + 40, kWidth, kHeight - kTopBarHeight - 40 - kTabBarHeight)];
        _mainSrollView.delegate = self;
        _mainSrollView.contentSize = CGSizeMake(kWidth * 2, 0);
        _mainSrollView.pagingEnabled = YES;
        _mainSrollView.showsVerticalScrollIndicator = NO;
        _mainSrollView.showsHorizontalScrollIndicator = NO;
        _mainSrollView.bounces = NO;
        
    }
    
    return _mainSrollView;
}

#pragma mark Click-Method

- (void)deleteOrderBtnClick:(UIButton *)sender{



}

- (void)toPayBtnClick:(UIButton *)sender{
    
    
    
}


- (void)checkOutLabel:(UITapGestureRecognizer *)sender{

    CGPoint point = [sender locationInView:self.view];
    NSLog(@"+++++x=%f,y=%f",point.x,point.y);

    if (CGRectContainsPoint(CGRectMake(0, kTopBarHeight, kWidth/2, 40), point))
    {
        [self checkOutLabelWith:0];
        
        self.mainSrollView.contentOffset = CGPointMake(0, 0);
        
    }else{
    
        [self checkOutLabelWith:1];
        
        self.mainSrollView.contentOffset = CGPointMake(kWidth, 0);

    }

}

- (void)checkOutLabelWith:(NSInteger)tag{

    if (tag == 0){
        
        self.finishedLabel.textColor = UIColorFromRGBA(0xFA6650, 1.0);
        self.unfinishedLabel.textColor = UIColorFromRGBA(0x333338, 1.0);
        
        [self.tagView updateConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_topTabView).offset(-kWidth/4);;
            
        }];
        
        
    }else{
        
        self.unfinishedLabel.textColor = UIColorFromRGBA(0xFA6650, 1.0);
        self.finishedLabel.textColor = UIColorFromRGBA(0x333338, 1.0);
        
        [self.tagView updateConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_topTabView).offset(kWidth/4);;
            
        }];
        
    }

}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView == self.mainSrollView) {
        
        NSInteger tag = (NSInteger)scrollView.contentOffset.x/kWidth;
        
        [self checkOutLabelWith:tag];
        
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
    OrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[OrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    [cell fitDataWithModel:nil];
    
    if (tableView == self.finishedTableView) {
        
        cell.deleteOrderBtn.hidden = YES;

        cell.toPayBtn.hidden = YES;
    }
    if (tableView == self.unfinishedTableView) {
        
        [cell.deleteOrderBtn addTarget:self action:@selector(deleteOrderBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.toPayBtn addTarget:self action:@selector(toPayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 280;
}


@end
