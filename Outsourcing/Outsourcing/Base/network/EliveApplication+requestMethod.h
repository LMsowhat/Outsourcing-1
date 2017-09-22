//
//  EliveApplication+requestMethod.h
//  Eliveapp
//
//  Created by 李文华 on 2017/4/20.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "EliveApplication.h"

@interface EliveApplication (requestMethod)


//
- (void)requestAPPCheckVersion:(NSDictionary*)parm;


//
- (void)requestSendCodeAction:(NSDictionary*)parm;

//
- (void)requestLoginAction:(NSDictionary*)parm;

//
- (void)requestRegisterAction:(NSDictionary*)parm;

//
- (void)requestGetUserAddress:(NSDictionary*)parm;

//
- (void)requestAddNewAddress:(NSDictionary*)parm;

//
- (void)requestSetDefultAddress:(NSDictionary*)parm;

//
- (void)requestDeleteTheAddress:(NSDictionary*)parm;

//
- (void)requestSetupAddress:(NSDictionary*)parm;

//
- (void)requestGetAddressArea:(NSDictionary*)parm;

//
- (void)requestHomeCarousels:(NSDictionary*)parm;

//
- (void)requestHomeProducitonList:(NSDictionary*)parm;

//
- (void)requestProducitonDetail:(NSDictionary*)parm;

//
- (void)requestSubmitOrder:(NSDictionary*)parm;

//
- (void)requestGetOrderDetail:(NSDictionary*)parm;

//
- (void)requestGetPayOrderDetail:(NSDictionary*)parm;

//
- (void)requestGetUserOrderList:(NSDictionary*)parm;

//
- (void)requestGoOrderClearingDetail:(NSDictionary*)parm;

//
- (void)requestGetUserCoupons:(NSDictionary*)parm;

//
- (void)requestGetTicketList:(NSDictionary*)parm;

//
- (void)requestPayForTicket:(NSDictionary*)parm;

//
//- (void)requestGetUserCoupons:(NSDictionary*)parm;

//
- (void)requestUserGetTicketList:(NSDictionary*)parm;

//
- (void)requestGetTicketDetail:(NSDictionary*)parm;

//
- (void)requestAddShopCartAction:(NSDictionary*)parm;

//
- (void)requestAddUserFeedbackAction:(NSDictionary*)parm;

//
- (void)requestSettingGetMoreAction:(NSDictionary*)parm;


@end
