//
//  OrderListTableViewCell.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/28.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "OrderListTableViewCell.h"
#import "Masonry.h"


@implementation OrderListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.createTime = [UILabel new];
        self.createTime.font = kFont(11);
        self.createTime.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        self.createTime.textAlignment = NSTextAlignmentCenter;
        
        self.sendTime = [UILabel new];
        self.sendTime.font = kFont(11);
        self.sendTime.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        self.sendTime.textAlignment = NSTextAlignmentCenter;
        
        self.line1 = [UIView new];
        self.line1.backgroundColor = UIColorFromRGBA(0xDDDDDD, 1.0);
        
        self.orderNum = [UILabel new];
        self.orderNum.font = kFont(11);
        self.orderNum.textColor = UIColorFromRGBA(0x333338, 1.0);
        self.orderNum.textAlignment = NSTextAlignmentLeft;
        
        self.oStatus = [UILabel new];
        
        
        
        self.oIcon = [UIImageView new];
        
        self.oName = [UILabel new];
        self.oNum = [UILabel new];
        self.oPrice = [UILabel new];
        self.bucketMoney = [UILabel new];
        
        self.line2 = [UIView new];
        
        self.realMoney = [UILabel new];
        
        self.deleteOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.deleteOrderBtn setTitle:@"删除订单" forState:UIControlStateNormal];
        [self.deleteOrderBtn setTitleColor:UIColorFromRGBA(0x8F9095, 1.0) forState:UIControlStateNormal];
        self.deleteOrderBtn.layer.borderWidth = 1;
        self.deleteOrderBtn.layer.borderColor = UIColorFromRGBA(0x8F9095, 1.0).CGColor;
        self.deleteOrderBtn.layer.cornerRadius = 3;
        self.deleteOrderBtn.hidden = YES;
        
        self.toPayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.toPayBtn setTitle:@"立即支付" forState:UIControlStateNormal];
        [self.toPayBtn setTitleColor:UIColorFromRGBA(0xFA6650, 1.0) forState:UIControlStateNormal];
        self.toPayBtn.layer.borderWidth = 1;
        self.toPayBtn.layer.borderColor = UIColorFromRGBA(0xFA6650, 1.0).CGColor;
        self.toPayBtn.layer.cornerRadius = 3;
        self.toPayBtn.hidden = YES;
        
        
        [self addSubview:self.createTime];
        [self addSubview:self.sendTime];
        [self addSubview:self.line1];
        [self addSubview:self.orderNum];
        [self addSubview:self.oStatus];
        [self addSubview:self.oIcon];
        [self addSubview:self.oName];
        [self addSubview:self.oNum];
        [self addSubview:self.oPrice];
        [self addSubview:self.bucketMoney];
        [self addSubview:self.line2];
        [self addSubview:self.realMoney];
        [self addSubview:self.deleteOrderBtn];
        [self addSubview:self.toPayBtn];
        
        [self.createTime makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self).offset(-kWidth/3);
            make.top.equalTo(self).offset(10);
            
        }];
        
        [self.sendTime makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self).offset(kWidth/3);
            make.top.equalTo(self).offset(10);
        }];
        
        [self.line1 makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(kWidth - 40, 1));
            make.centerX.equalTo(self);
            make.top.equalTo(self.createTime.mas_bottom).offset(10);
        }];
        
        [self.orderNum makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.line1.mas_bottom).offset(10);
            make.left.equalTo(self).offset(20);
            
        }];
        
        [self.oStatus makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.line1.mas_bottom).offset(10);
            make.right.equalTo(self).offset(-20);
            
        }];
        
        [self.oIcon makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(90, 90));
            make.top.equalTo(self.orderNum.mas_bottom).offset(20);
            make.left.equalTo(self).offset(20);
            
        }];
        
        [self.oName makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.oIcon.mas_top);
            make.left.equalTo(self.oIcon.mas_right).offset(10);
            
        }];
        
        [self.oPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.oName);
            make.right.equalTo(-20);
            
        }];
        
        [self.bucketMoney makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.oName.mas_bottom).offset(10);
            make.left.equalTo(self.oIcon.mas_right).offset(10);
            
        }];
        
        [self.oNum makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.bucketMoney);
            make.right.equalTo(self).offset(-20);
            
        }];
        
        [self.line2 makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(kWidth - 40, 1));
            make.centerX.equalTo(self);
            make.top.equalTo(self.oIcon.mas_bottom).offset(20);
            
        }];
        
        [self.realMoney makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.line2.mas_bottom).offset(25);
            make.left.equalTo(self).offset(20);
            
        }];
        
        
        [self.toPayBtn makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.realMoney);
            make.right.equalTo(self).offset(-20);
        }];
    
        [self.deleteOrderBtn makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.realMoney);
            make.right.equalTo(self.toPayBtn.mas_left).offset(-20);
            
        }];
        
        
    }

    return self;
}


- (void)fitDataWithModel:(OrderModel *)model{




}



@end
