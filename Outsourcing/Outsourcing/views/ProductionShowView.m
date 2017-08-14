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
        
        self.receiveName = [UILabel new];
        self.receiveName.font = kFont(6);
        self.receiveName.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        self.receiveName.text = @"李文华  15011075120";
        
        self.receiveAddress = [UILabel new];
        self.receiveAddress.font = kFont(6);
        self.receiveAddress.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        self.receiveAddress.text = @"北京市海淀区知春路113号银网中心A座808";
        
        self.pIcon = [UIImageView new];
        self.pIcon.image = [UIImage imageNamed:@"2.jpg"];
        
        self.pPrice = [UILabel new];
        self.pPrice.font = kFont(7);
        self.pPrice.textColor = UIColorFromRGBA(0x333338, 1.0);
        self.pPrice.text = @"￥26.00";
        
        self.oTotalTitle = [UILabel new];
        self.oTotalTitle.font = kFont(7);
        self.oTotalTitle.textColor = UIColorFromRGBA(0x333338, 1.0);
        self.oTotalTitle.text = @"订单合计：";
        
        self.oTotalPrice = [UILabel new];
        self.oTotalPrice.font = kFont(7);
        self.oTotalPrice.textColor = UIColorFromRGBA(0x333338, 1.0);
        self.oTotalPrice.text = @"￥26.00";
        
        self.pName = [UILabel new];
        self.pName.font = kFont(7);
        self.pName.textColor = UIColorFromRGBA(0x333338, 1.0);
        self.pName.text = @"雀巢优活系列";
        
        self.barrelPrice = [UILabel new];
        self.barrelPrice.font = kFont(6);
        self.barrelPrice.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        self.barrelPrice.textAlignment = NSTextAlignmentRight;
        self.barrelPrice.text = @"桶押金0.00";
        
        self.pNum = [UILabel new];
        self.pNum.font = kFont(5.5);
        self.pNum.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        self.pNum.textAlignment = NSTextAlignmentRight;
        self.pNum.text = @"x2";
        
        self.lineView1 = [UIView new];
        self.lineView1.backgroundColor = UIColorFromRGBA(0xDDDDDD, 1.0);
        
        self.lineView2 = [UIView new];
        self.lineView2.backgroundColor = UIColorFromRGBA(0xDDDDDD, 1.0);
        
//        self.oSendTimeTitle = [UILabel new];
//        self.oSendTimeTitle.text = @"配送时间";
//        
//        self.oSendTime = [UILabel new];
//        self.oSendTime.text = @"1小时内配送";
//        
//        self.oSendTimeSelect = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        [self addSubview:self.receiveName];
        [self addSubview:self.receiveAddress];
        [self addSubview:self.pIcon];
        [self addSubview:self.pName];
        [self addSubview:self.pNum];
        [self addSubview:self.barrelPrice];
        [self addSubview:self.pPrice];
        [self addSubview:self.lineView1];
        [self addSubview:self.lineView2];
        [self addSubview:self.oTotalPrice];
        [self addSubview:self.oTotalTitle];
//        [self addSubview:self.oSendTimeTitle];
//        [self addSubview:self.oSendTime];
//        [self addSubview:self.oSendTimeSelect];
        
        [self.receiveName makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self);
            
            make.top.left.equalTo(self).offset(20);
            
        }];
        
        [self.receiveAddress makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.receiveName.mas_bottom).offset(5);
            make.left.equalTo(self.receiveName.mas_left);
            
        }];
        
        [self.lineView1 makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(kWidth - 20*kScale, 1));
            make.centerX.equalTo(self);
            make.top.equalTo(self.receiveAddress.mas_bottom).offset(10 *kScale);
            
        }];
        
        [self.pIcon makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(90, 90));
            make.top.equalTo(self.lineView1.mas_bottom).offset(20);
            make.left.equalTo(self.lineView1.mas_left);
        }];
        
        [self.pName makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.pIcon.mas_top);
            make.left.equalTo(self.pIcon.mas_right).offset(10);
            
        }];
        
        [self.pPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.pName);
            make.right.equalTo(self).offset(-20);
            
        }];
        
        [self.barrelPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.pName.mas_bottom).offset(3*kScale);
            make.left.equalTo(self.pName);
            
        }];
        
        [self.pNum makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.barrelPrice);
            make.right.equalTo(self).offset(-10*kScale);
            
        }];
        
        [self.oTotalTitle makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.pIcon.mas_bottom).offset(8*kScale);
            make.right.equalTo(self.oTotalPrice.mas_left).offset(-10);
            
        }];
        
        [self.oTotalPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.oTotalTitle);
            make.right.equalTo(self).offset(-10*kScale);
            
        }];
        
        [self.lineView2 makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(kWidth - 20*kScale, 1));
            make.centerX.equalTo(self);
            make.top.equalTo(self.oTotalTitle.mas_bottom).offset(10*kScale);
            
        }];
        
//        [self.oSendTimeTitle makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.top.equalTo(self.oTotalTitle.mas_bottom).offset(15);
//            make.left.equalTo(self).offset(10);
//            
//        }];
//        
//        [self.oSendTime makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.top.equalTo(self.oTotalTitle.mas_bottom).offset(15);
//            make.right.equalTo(self).offset(-15);
//            
//        }];
//        
//        [self.oSendTimeSelect makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.size.equalTo(self.oSendTime);
//            make.center.equalTo(self.oSendTime);
//            
//        }];
        
        
    }
    return self;
}

@end
