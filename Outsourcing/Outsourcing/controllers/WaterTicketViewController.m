//
//  WaterTicketViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/14.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "WaterTicketViewController.h"
#import "Masonry.h"
#import "ProductionModel.h"
#import "TicketListTableViewCell.h"
#import "BuyTicketViewController.h"


@interface WaterTicketViewController ()<UIScrollViewDelegate,UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong)UIView *topTabView;

@property (nonatomic ,strong)UILabel *myTicketLabel;
@property (nonatomic ,strong)UILabel *buyTicketLabel;
@property (nonatomic ,strong)UIView *tagView;


@property (nonatomic ,strong)UIScrollView *mainSrollView;

@property (nonatomic ,strong)UITableView *myTicketTableView;
@property (nonatomic ,strong)UITableView *buyTicketTableView;

@property (nonatomic ,strong)NSMutableArray *dataSource;

@property (nonatomic ,strong)NSMutableArray *myTicketArr;
@property (nonatomic ,strong)NSMutableArray *buyTicketArr;


@end

@implementation WaterTicketViewController


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"水票";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadConfigUI];
    // Do any additional setup after loading the view.
}

- (void)loadConfigUI{
    
    [self.view addSubview:self.topTabView];
    
    [self.mainSrollView addSubview:self.buyTicketTableView];
    
    [self.mainSrollView addSubview:self.myTicketTableView];
    
    [self.view addSubview:self.mainSrollView];
}


#pragma mark Setter & Getter

-(UIView *)topTabView{
    
    if (!_topTabView) {
        
        _topTabView = [[UIView alloc] initWithFrame:CGRectMake(0, kTopBarHeight, kWidth, 40)];
        _topTabView.backgroundColor = UIColorFromRGBA(0xFFFFFF, 1.0);
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkOutLabel:)];
        
        [_topTabView addGestureRecognizer:tap];
        
        self.myTicketLabel = [UILabel new];
        self.myTicketLabel.text = @"购买水票";
        self.myTicketLabel.font = kFont(7);
        self.myTicketLabel.textColor = UIColorFromRGBA(0xFA6650, 1.0);
        self.myTicketLabel.textAlignment = NSTextAlignmentCenter;
        
        self.buyTicketLabel = [UILabel new];
        self.buyTicketLabel.font = kFont(7);
        self.buyTicketLabel.text = @"我的水票";
        self.buyTicketLabel.textColor = UIColorFromRGBA(0x333338, 1.0);
        self.buyTicketLabel.textAlignment = NSTextAlignmentCenter;
        
        self.tagView = [UIView new];
        self.tagView.backgroundColor = UIColorFromRGBA(0xFA6650, 1.0);
        
        [_topTabView addSubview:self.myTicketLabel];
        [_topTabView addSubview:self.buyTicketLabel];
        [_topTabView addSubview:self.tagView];
        
        [self.myTicketLabel makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_topTabView).offset(-kWidth/4);
            make.centerY.equalTo(_topTabView);
            
        }];
        
        [self.buyTicketLabel makeConstraints:^(MASConstraintMaker *make) {
            
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


-(UITableView *)myTicketTableView {
    
    if (!_myTicketTableView) {
        
        _myTicketTableView = [[UITableView alloc] initWithFrame:CGRectMake(kWidth, 0, kWidth, kHeight - kTopBarHeight - 40 - kTabBarHeight) style:UITableViewStylePlain];
        
        _myTicketTableView.delegate = self;
        _myTicketTableView.dataSource = self;
        _myTicketTableView.separatorColor = kClearColor;
        
    }
    
    return _myTicketTableView;
}

-(UITableView *)buyTicketTableView{
    
    if (!_buyTicketTableView) {
        
        _buyTicketTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - kTopBarHeight - 40 - kTabBarHeight) style:UITableViewStylePlain];
        
        _buyTicketTableView.delegate = self;
        _buyTicketTableView.dataSource = self;
        _buyTicketTableView.separatorColor = kClearColor;
    }
    
    return _buyTicketTableView;
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

#pragma mark Click_Method

- (void)buyBtnClick:(UIButton *)sender{

    BuyTicketViewController *buyTicket = [BuyTicketViewController new];

    [self.navigationController pushViewController:buyTicket animated:YES];

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
        
        self.myTicketLabel.textColor = UIColorFromRGBA(0xFA6650, 1.0);
        self.buyTicketLabel.textColor = UIColorFromRGBA(0x333338, 1.0);
        
        [self.tagView updateConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_topTabView).offset(-kWidth/4);;
            
        }];
        
        
    }else{
        
        self.buyTicketLabel.textColor = UIColorFromRGBA(0xFA6650, 1.0);
        self.myTicketLabel.textColor = UIColorFromRGBA(0x333338, 1.0);
        
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
    static NSString *ID = @"TicketCell";
    TicketListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[TicketListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    if (tableView == self.myTicketTableView) {
        
        [cell myTicketFitData:nil];
    }else{
    
        [cell buyTicketFitData:nil];
    
        [cell.buyBtn addTarget:self action:@selector(buyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 150;
}


@end
