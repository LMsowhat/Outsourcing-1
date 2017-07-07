//
//  OrderListTableViewCell.h
//  Outsourcing
//
//  Created by 李文华 on 2017/6/28.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *        createTime;
@property (nonatomic,strong) UILabel *        sendTime;
@property (nonatomic,strong) UIView *        line1;
@property (nonatomic,strong) UILabel *        orderNum;
@property (nonatomic,strong) UILabel *        oStatus;
@property (nonatomic,strong) UIImageView *        oIcon;
@property (nonatomic,strong) UILabel *        oName;
@property (nonatomic,strong) UILabel *        oNum;
@property (nonatomic,strong) UILabel *        oPrice;
@property (nonatomic,strong) UILabel *        bucket;
@property (nonatomic,strong) UILabel *        bucketMoney;
@property (nonatomic,strong) UIView *        line2;
@property (nonatomic,strong) UILabel *        realMoney;

@property (nonatomic,strong) UIButton *        deleteOrderBtn;
@property (nonatomic,strong) UIButton *        toPayBtn;

@end
