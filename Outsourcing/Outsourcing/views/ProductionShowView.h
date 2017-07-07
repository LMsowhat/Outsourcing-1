//
//  ProductionShowView.h
//  Outsourcing
//
//  Created by 李文华 on 2017/6/28.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductionShowView : UIView

@property (nonatomic ,strong)UIView *proShowView;
@property (nonatomic ,strong)UIImageView *pIcon;
@property (nonatomic ,strong)UILabel *pName;
@property (nonatomic ,strong)UILabel *pNum;
@property (nonatomic ,strong)UILabel *pPrice;
@property (nonatomic ,strong)UILabel *oTotalTitle;
@property (nonatomic ,strong)UILabel *oTotalPrice;

@property (nonatomic ,strong)UIView *lineView1;
@property (nonatomic ,strong)UIView *lineView2;

@property (nonatomic ,strong)UILabel *oSendTimeTitle;
@property (nonatomic ,strong)UILabel *oSendTime;
@property (nonatomic ,strong)UIButton *oSendTimeSelect;

@end
