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

-(instancetype)initWithFrame:(CGRect)frame AndModel:(SubmitOrderProModel *)model{

    self = [super initWithFrame:frame];
    
    if (self) {
    
        self.pIcon = [UIImageView new];
        self.pIcon.image = [UIImage imageNamed:@"2.jpg"];
        
        self.pPrice = [UILabel new];
        self.pPrice.font = kFont(7);
        self.pPrice.textColor = UIColorFromRGBA(0x333338, 1.0);
        self.pPrice.text = @"￥26.00";
       
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
        
        [self addSubview:self.pIcon];
        [self addSubview:self.pName];
        [self addSubview:self.pNum];
        [self addSubview:self.barrelPrice];
        [self addSubview:self.pPrice];
        
        
        [self.pIcon makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(45 *kScale, 45 *kScale));
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(10 *kScale);
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
        
    }
    return self;
}

@end
