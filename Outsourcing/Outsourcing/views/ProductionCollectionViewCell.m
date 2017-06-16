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
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = kGrayColor.CGColor;
        
        self.icon = [UIImageView new];
        self.icon.image = [UIImage imageNamed:@"5.jpg"];
        
        self.pName = [UILabel new];
        self.pName.font = kFont(14);
        self.pName.textAlignment = NSTextAlignmentLeft;
        
        
        self.pStandard = [UILabel new];
        self.pStandard.font = kFont(14);
        self.pStandard.textAlignment = NSTextAlignmentLeft;
        
        
        self.dottedLine = [UIView new];
//        self.dottedLine.backgroundColor = kBlackColor;
        
        self.pPrice = [UILabel new];
        self.pPrice.font = kFont(14);
        self.pPrice.textAlignment = NSTextAlignmentLeft;
        
        self.pShoppingCart = [UIButton new];
        [self.pShoppingCart setImage:[UIImage imageNamed:@"public"] forState:UIControlStateNormal];
        
        
        [self addSubview:self.icon];
        [self addSubview:self.pName];
        [self addSubview:self.pStandard];
        [self addSubview:self.dottedLine];
        [self addSubview:self.pPrice];
        [self addSubview:self.pShoppingCart];
        
        [self.icon makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self);
            
            make.top.left.equalTo(self).offset(10);

            make.right.equalTo(self).offset(-10);
            
            make.height.equalTo(@(self.bounds.size.height/2));
            
        }];
        
        [self.pName makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.icon.mas_bottom).offset(5);
            make.left.equalTo(self.icon);
            
            
        }];
        
        [self.pStandard makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.pName.mas_bottom).offset(5);
            make.left.equalTo(self.pName);
            
        }];
        
        [self.dottedLine makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.equalTo(self);
            make.height.equalTo(@1);
            make.centerX.equalTo(self);
            make.top.equalTo(self.pStandard.mas_bottom).offset(15);
            
        }];
     
        [self.pPrice makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self).offset(-10);
            make.left.equalTo(self).offset(10);
            
        }];
        
        [self.pShoppingCart makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(20, 20));
            make.centerY.equalTo(self.pPrice);
            make.right.equalTo(self).offset(-10);
            
        }];
        
    }

    [self layoutIfNeeded];
    return self;
}

-(void)fitDataWith:(ProductionModel *)model{

    self.pName.text = @"桶装水";
    self.pStandard.text = @"规格： 19L*1/桶";
    self.pPrice.text = @"￥20.00";
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, -5, kWidth, 1);
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
    
    [shapeLayer setLineWidth:CGRectGetHeight(self.dottedLine.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:1], nil]];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(self.dottedLine.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    [self.dottedLine.layer addSublayer:shapeLayer];
    
}




@end
