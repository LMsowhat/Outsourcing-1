//
//  ProductionCollectionViewCell.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/14.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "ProductionCollectionViewCell.h"
#import "Masonry.h"

@implementation ProductionCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];

    if (self) {
        
        self.icon = [UIImageView new];
        self.icon.image = [UIImage imageNamed:@"5.jpg"];
        
        self.pName = [UILabel new];
        self.pName.font = kFont(7);
        self.pName.textColor = UIColorFromRGBA(0x333338, 1.0);
        self.pName.textAlignment = NSTextAlignmentLeft;
        
        
        self.pStandard = [UILabel new];
        self.pStandard.font = kFont(6);
        self.pStandard.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        self.pStandard.textAlignment = NSTextAlignmentLeft;
        
        self.pPrice = [UILabel new];
        self.pPrice.font = kFont(7);
        self.pPrice.textColor = UIColorFromRGBA(0xFA6650, 1.0);
        self.pPrice.textAlignment = NSTextAlignmentLeft;
        
        self.pSales = [UILabel new];
        self.pSales.font = kFont(5.5);
        self.pSales.textColor = UIColorFromRGBA(0x8F9095, 1.0);
        self.pSales.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:self.icon];
        [self addSubview:self.pName];
        [self addSubview:self.pStandard];
        [self addSubview:self.pPrice];
        [self addSubview:self.pSales];
        
        [self.icon makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.equalTo(self.frame.size.width);
            make.centerX.equalTo(self);
            make.left.right.top.equalTo(self);
            
        }];
        
        [self.pName makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.icon.mas_bottom).offset(10);
            make.left.equalTo(self.icon);
            
        }];
        
        [self.pStandard makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.pName.mas_bottom).offset(10);
            make.left.equalTo(self.pName);
            
        }];

        [self.pPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self).offset(-10);
            make.left.equalTo(self);
            
        }];
        
        [self.pSales makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.pPrice);
            make.right.equalTo(self);
            
        }];
        
    }

    [self layoutIfNeeded];
    return self;
}

-(void)fitDataWith:(ProductionModel *)model{
   
    self.pName.text = model.strGoodsname;
    self.pStandard.text = @"规格： 19L*1/桶";
    self.pPrice.text = [NSString stringWithFormat:@"￥%.2f",[model.nPrice floatValue]];//
    self.pSales.text = [NSString stringWithFormat:@"已售%d",[model.nMothnumber intValue]];
    
}




@end
