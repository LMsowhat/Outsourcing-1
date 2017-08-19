//
//  MyViewController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/14.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "MyViewController.h"
#import "UIButton+myButton.h"
#import "Masonry.h"

#import "CouponsViewController.h"
#import "MyInvitationViewController.h"
#import "AddressViewController.h"
#import "MyBarrelViewController.h"
#import "MyTicketViewController.h"
#import "MoreViewController.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)UITableView *mainTableView;

@property (nonatomic ,strong)NSMutableArray *dataSource;

@property (nonatomic ,strong)UIImageView *userIcon;

@property (nonatomic ,strong)UILabel *userPhone;



@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    
    self.view.backgroundColor = UIColorFromRGBA(0xF7F7F7, 1.0);
    self.dataSource = [[NSMutableArray alloc] initWithObjects:@[@[@"icon_coupon",@"我的优惠券"],@[@"icon_invite",@"我要邀请"],@[@"icon_address",@"我的地址"]],@[@[@"icon_bucket",@"我的水桶"],@[@"icon_ticket",@"我的水票"],@[@"icon_more",@"更多"]], nil];
    
    [self.view addSubview:self.mainTableView];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
   
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 20, 20);
    [rightBtn setImage:[UIImage imageNamed:@"icon_massage"] forState:UIControlStateNormal];
    [rightBtn setBadgeValue:@"0"];
    [rightBtn setBadgeFont:kFont(5)];
    [rightBtn setBadgeBGColor:UIColorFromRGBA(0xE96F59, 1.0)];
    [rightBtn setBadgeTextColor:UIColorFromRGBA(0xFFFFFF, 1.0)];
    [rightBtn setBadgeOriginX:12];
    [rightBtn setBadgeOriginY:-6];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    self.navigationController.navigationBar.barTintColor = UIColorFromRGBA(0xFFFFFF, 1.0);
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:UIColorFromRGBA(0x1C1F2D, 1.0)};
    
}

#pragma mark Setter && Getter

-(UITableView *)mainTableView{

    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kTopBarHeight, kWidth, kHeight - kTopBarHeight) style:UITableViewStyleGrouped];
        
        _mainTableView.delegate = self;
        
        _mainTableView.dataSource = self;
        
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _mainTableView.showsVerticalScrollIndicator = NO;
        
        _mainTableView.showsHorizontalScrollIndicator = NO;
        
    }

    return _mainTableView;
}

-(UIImageView *)userIcon{

    if (!_userIcon) {
        
        _userIcon = [UIImageView new];
        
        _userIcon.image = [UIImage imageNamed:@"icon_avatar"];
    }
    return _userIcon;
}

-(UILabel *)userPhone{

    if (!_userPhone) {
        
        _userPhone = [UILabel new];
        
        _userPhone.font = kFont(7);
        
        _userPhone.text = @"15011075120";
    }

    return _userPhone;
}


#pragma mark Private Method

- (UIView *)createUserView{

    UIView *userView = [UIView new];
    
    [userView addSubview:self.userIcon];
    [userView addSubview:self.userPhone];

    [self.userIcon makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(25*kScale, 25*kScale));
        
        make.centerY.equalTo(userView);
        
        make.left.equalTo(userView).offset(10*kScale);
    }];
    
    [self.userPhone makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(userView);
        
        make.left.equalTo(self.userIcon.mas_right).offset(5*kScale);
        
    }];
    
    return userView;
}

- (UIView *)createTableViewCell:(NSString *)imageName Text:(NSString *)text{

    UIView *cell = [UIView new];

    UIImageView *leftImage = [UIImageView new];
    leftImage.image = [UIImage imageNamed:imageName];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = kFont(7);
    titleLabel.text = text;
    
    UIImageView *rightImage = [UIImageView new];
    rightImage.image = [UIImage imageNamed:@"more"];
    
    [cell addSubview:rightImage];
    [cell addSubview:leftImage];
    [cell addSubview:titleLabel];
    
    [leftImage makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(cell);
        
        make.size.equalTo(CGSizeMake(24, 24));
        
        make.left.equalTo(cell).offset(20 *kScale);
    }];
    
    [titleLabel makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(cell);
        
        make.left.equalTo(leftImage.mas_right).offset(5*kScale);
        
    }];
    
    [rightImage makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(cell);
        
        make.size.equalTo(CGSizeMake(10, 20));
        
        make.right.equalTo(cell).offset(-10*kScale);
    }];
    
    return cell;
}


#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            
            return 1;
            break;
            
        case 1:
            
            return 3;
            break;
            
        case 2:
            
            return 3;
            break;
            
        default:
            
            return 1;
            break;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 5*kScale;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID] ;
        
    }
    switch (indexPath.section) {
        case 0:
        {
            UIView *userView = [self createUserView];
            
            [cell addSubview:userView];
            
            [userView makeConstraints:^(MASConstraintMaker *make) {
                
                make.size.equalTo(cell);
            }];
        }
            break;
        case 1:
            
            switch (indexPath.row) {
                case 0:
                {
                    UIView *cellView = [self createTableViewCell:self.dataSource[indexPath.section -1][indexPath.row][0] Text:self.dataSource[indexPath.section -1][indexPath.row][1]];
                    
                    [cell addSubview:cellView];
                    [cellView makeConstraints:^(MASConstraintMaker *make) {
                        
                        make.size.equalTo(cell);
                    }];
                }
                    break;
                case 1:
                {
                    UIView *cellView = [self createTableViewCell:self.dataSource[indexPath.section -1][indexPath.row][0] Text:self.dataSource[indexPath.section -1][indexPath.row][1]];
                    
                    [cell addSubview:cellView];
                    [cellView makeConstraints:^(MASConstraintMaker *make) {
                        
                        make.size.equalTo(cell);
                    }];
                }
                    
                    break;
                    
                case 2:
                {
                    UIView *cellView = [self createTableViewCell:self.dataSource[indexPath.section -1][indexPath.row][0] Text:self.dataSource[indexPath.section -1][indexPath.row][1]];
                    
                    [cell addSubview:cellView];
                    [cellView makeConstraints:^(MASConstraintMaker *make) {
                        
                        make.size.equalTo(cell);
                    }];
                }
                    
                    break;
                    
                    
                default:
                    break;
            }
            
            break;
        case 2:
            
            switch (indexPath.row) {
                case 0:
                {
                    UIView *cellView = [self createTableViewCell:self.dataSource[indexPath.section -1][indexPath.row][0] Text:self.dataSource[indexPath.section -1][indexPath.row][1]];
                    
                    [cell addSubview:cellView];
                    [cellView makeConstraints:^(MASConstraintMaker *make) {
                        
                        make.size.equalTo(cell);
                    }];
                }
                    break;
                case 1:
                {
                    UIView *cellView = [self createTableViewCell:self.dataSource[indexPath.section -1][indexPath.row][0] Text:self.dataSource[indexPath.section -1][indexPath.row][1]];
                    
                    [cell addSubview:cellView];
                    [cellView makeConstraints:^(MASConstraintMaker *make) {
                        
                        make.size.equalTo(cell);
                    }];
                }
                    
                    break;
                    
                case 2:
                {
                    UIView *cellView = [self createTableViewCell:self.dataSource[indexPath.section -1][indexPath.row][0] Text:self.dataSource[indexPath.section -1][indexPath.row][1]];
                    
                    [cell addSubview:cellView];
                    [cellView makeConstraints:^(MASConstraintMaker *make) {
                        
                        make.size.equalTo(cell);
                    }];
                }
                    break;
                    
                    
                default:
                    break;
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
    
    switch (indexPath.section) {
        case 0:
            
            
            break;
            
        case 1:
            
            switch (indexPath.row) {
                case 0:
                {
                    CouponsViewController *coupon = [CouponsViewController new];
                
                    [self.navigationController pushViewController:coupon animated:YES];
                }
                    break;
                    
                case 1:
                {
                    MyInvitationViewController *invitate = [MyInvitationViewController new];
                    
                    [self.navigationController pushViewController:invitate animated:YES];
                }
                    break;
                    
                case 2:
                {
                    AddressViewController *address = [AddressViewController new];
                    
                    [self.navigationController pushViewController:address animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
            
            break;
            
        case 2:
            
            switch (indexPath.row) {
                case 0:
                {
                    MyBarrelViewController *barrel = [MyBarrelViewController new];
                    
                    [self.navigationController pushViewController:barrel animated:YES];
                }
                    break;
                    
                case 1:
                {
                    MyTicketViewController *ticket = [MyTicketViewController new];
                    
                    [self.navigationController pushViewController:ticket animated:YES];
                }
                    break;
                    
                case 2:
                {
                    MoreViewController *more = [MoreViewController new];
                    
                    [self.navigationController pushViewController:more animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
            
            break;
            
        default:
            break;
    }
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 45 * kScale;
    }
    return 27 * kScale;
}



@end
