//
//  ProductionShowView.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/28.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "ProductionShowView.h"
#import "Masonry.h"


@implementation ProductionShowView

-(instancetype)init{

    self = [super init];

    if (self) {
        
        
        self.pIcon = [UIImageView new];
        self.pIcon.image = [UIImage imageNamed:@"2.jpg"];
        
        self.pPrice = [UILabel new];
        self.pPrice.text = @"26.00";
        
        self.oTotalTitle = [UILabel new];
        self.oTotalTitle.text = @"订单合计：";
        
        self.oTotalPrice = [UILabel new];
        self.oTotalPrice.text = @"26.00";
        
        self.pName = [UILabel new];
        self.pName.text = @"雀巢优活系列";
        
        self.pNum = [UILabel new];
        self.pNum.text = @"x2";
        
        self.lineView1 = [UIView new];
        self.lineView1.backgroundColor = kBlackColor;
        
        self.lineView2 = [UIView new];
        self.lineView2.backgroundColor = kBlackColor;
        
        self.oSendTimeTitle = [UILabel new];
        self.oSendTimeTitle.text = @"配送时间";
        
        self.oSendTime = [UILabel new];
        self.oSendTime.text = @"1小时内配送";
        
        self.oSendTimeSelect = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        
        [self addSubview:self.pIcon];
        [self addSubview:self.pName];
        [self addSubview:self.pNum];
        [self addSubview:self.pPrice];
        [self addSubview:self.lineView1];
        [self addSubview:self.lineView2];
        [self addSubview:self.oTotalPrice];
        [self addSubview:self.oTotalTitle];
        [self addSubview:self.oSendTimeTitle];
        [self addSubview:self.oSendTime];
        [self addSubview:self.oSendTimeSelect];
        
        
        [self.pIcon makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(50, 50));
            make.top.left.equalTo(self).offset(10);
            
        }];
        
        [self.pNum makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.pIcon);
            make.right.equalTo(self).offset(-100);
            
        }];
        
        [self.pName makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.pIcon);
            make.left.equalTo(self.pIcon.mas_right).offset(10);
            make.right.equalTo(self.pIcon).offset(-10);
            
        }];
        
        [self.pPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.pIcon);
            make.right.equalTo(self).offset(-15);
            
        }];
        
        [self.lineView1 makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(kWidth, 1));
            make.centerX.equalTo(self);
            make.top.equalTo(self.pPrice.mas_bottom).offset(15);
            
        }];
        
        [self.oTotalPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.lineView1.mas_bottom).offset(15);
            make.right.equalTo(self).offset(-15);
            
        }];
        
        [self.oTotalTitle makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.lineView1.mas_bottom).offset(15);
            make.right.equalTo(self.oTotalPrice.mas_left).offset(-10);
            
        }];
        
        [self.oSendTimeTitle makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.oTotalTitle.mas_bottom).offset(15);
            make.left.equalTo(self).offset(10);
            
        }];
        
        [self.oSendTime makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.oTotalTitle.mas_bottom).offset(15);
            make.right.equalTo(self).offset(-15);
            
        }];
        
        [self.oSendTimeSelect makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(self.oSendTime);
            make.center.equalTo(self.oSendTime);
            
        }];
        
        [self.lineView2 makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(kWidth, 1));
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(-5);
            
        }];
        
    }
    return self;
}

@end
