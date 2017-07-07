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
        
        self.sendTime = [UILabel new];
        
        self.line1 = [UIView new];
        
        self.orderNum = [UILabel new];
        self.oStatus = [UILabel new];
        
        self.oIcon = [UIImageView new];
        
        self.oName = [UILabel new];
        self.oNum = [UILabel new];
        self.oPrice = [UILabel new];
        self.bucket = [UILabel new];
        self.bucketMoney = [UILabel new];
        
        self.line2 = [UIView new];
        
        self.realMoney = [UILabel new];
        
        self.deleteOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.deleteOrderBtn setTitle:@"" forState:UIControlStateNormal];
        [self.deleteOrderBtn setTitleColor:kGrayColor forState:UIControlStateNormal];
        self.deleteOrderBtn.layer.borderWidth = 1;
        self.deleteOrderBtn.layer.borderColor = kBlackColor.CGColor;
        self.deleteOrderBtn.layer.cornerRadius = 3;
        self.deleteOrderBtn.hidden = YES;
        
        self.toPayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.toPayBtn setTitle:@"" forState:UIControlStateNormal];
        [self.toPayBtn setTitleColor:kGrayColor forState:UIControlStateNormal];
        self.toPayBtn.layer.borderWidth = 1;
        self.toPayBtn.layer.borderColor = kBlackColor.CGColor;
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
        [self addSubview:self.bucket];
        [self addSubview:self.bucketMoney];
        [self addSubview:self.line2];
        [self addSubview:self.realMoney];
        [self addSubview:self.deleteOrderBtn];
        [self addSubview:self.toPayBtn];
        
        [self.createTime makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.sendTime makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.line1 makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.orderNum makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.oStatus makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.oIcon makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.oName makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.oNum makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.oPrice makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.bucket makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.bucketMoney makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.line2 makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.realMoney makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.deleteOrderBtn makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        [self.toPayBtn makeConstraints:^(MASConstraintMaker *make) {
            
            
        }];
        
        
        
    }

    return self;
}



@end
