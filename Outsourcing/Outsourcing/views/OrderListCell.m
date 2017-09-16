//
//  OrderListCell.m
//  Outsourcing
//
//  Created by 李文华 on 2017/9/12.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "OrderListCell.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation OrderListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)fitConfigWithModel:(ProductionModel *)model{

    [self.pIcon sd_setImageWithURL:[NSURL URLWithString:model.strGoodsimgurl] placeholderImage:[UIImage imageNamed:@"2.jpg"]];

    self.pName.text = model.strGoodsname;
 
    self.pPrice.text = [NSString stringWithFormat:@"￥%@",model.nPrice];
    
    self.pNum.text = [NSString stringWithFormat:@"x %@",model.nCount];
    
}


@end
