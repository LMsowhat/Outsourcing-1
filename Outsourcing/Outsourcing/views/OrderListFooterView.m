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

    float total = [model.nBucketnum floatValue] * [model.nBucketmoney floatValue];
    self.bPrice.text = [NSString stringWithFormat:@"桶押金：￥%.2f",total/100];

    self.oTotalPrice.text = [NSString stringWithFormat:@"实付款：￥%.2f",[model.nFactPrice floatValue]/100];
    
    if (model.conState == 2) {
        
        self.deleteButton.hidden = YES;
        
        self.payButton.hidden = YES;
        
        if (model.nSendState != 1) {
            
            self.sendButton.hidden = NO;
        }else{

            self.sendButton.hidden = YES;
        }
        
    }else{
        
        self.sendButton.hidden = YES;
        
        if (model.nState == 3) {
            
            self.deleteButton.hidden = YES;
            
            self.payButton.hidden = YES;
        }else if (model.nState == 0){
            
            [self.payButton setTitle:@"去结算" forState:UIControlStateNormal];
            
            self.deleteButton.hidden = NO;
            
            self.payButton.hidden = NO;
        }else{
            [self.payButton setTitle:@"立即支付" forState:UIControlStateNormal];
            
            self.deleteButton.hidden = NO;
            
            self.payButton.hidden = NO;
        }
    }
    
    
    
}


@end
