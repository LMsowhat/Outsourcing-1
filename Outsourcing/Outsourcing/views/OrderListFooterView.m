//
//  OrderListFooterView.m
//  Outsourcing
//
//  Created by 李文华 on 2017/9/12.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "OrderListFooterView.h"

@implementation OrderListFooterView

- (void)fitDataWithModel:(OrderModel *)model{

    self.bPrice.text = [NSString stringWithFormat:@"桶押金：￥%.2f",[model.nBucketmoney floatValue]/100];

    self.oTotalPrice.text = [NSString stringWithFormat:@"实付款：￥%.2f",[model.nTotalprice floatValue]/100];

    if (model.nState != 0) {
        
        self.deleteButton.hidden = YES;
        
        self.payButton.hidden = YES;
    }
    
}


@end
