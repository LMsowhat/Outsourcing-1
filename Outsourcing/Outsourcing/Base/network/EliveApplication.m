//
//  EliveApplication.m
//  Eliveapp
//
//  Created by 李文华 on 2017/4/20.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "EliveApplication.h"
#import "EliveApplication+requestMethod.h"


@implementation EliveApplication
static EliveApplication *elive;


+(EliveApplication *)shareStance{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        elive = [[EliveApplication alloc] init];
        
    });

    return elive;
}

-(void)onHttpCode:(int)httpCode WithParameters:(NSDictionary *)parms{

    switch (httpCode) {
        case kAPPCheckVersion:
        
        {
            [self requestAPPCheckVersion:parms];
        }
            
            break;

        case kUserLogoutNetWork:
            
            
            break;

        case kUserLoginNetWork:
            
        {
            [self requestLoginAction:parms];
        }
            
            break;

        case kUserRegisterNetWork:
            
        {
            [self requestRegisterAction:parms];
        }
            
            break;

        case kUserSendCodeNetWork:
            
        {
            [self requestSendCodeAction:parms];
        }
            
            break;
            
        case kUserAddressNetWork:
            
        {
            [self requestGetUserAddress:parms];
        }
            
            break;

        case kUserAddNewAddressNetWork:
            
        {
            [self requestAddNewAddress:parms];
        }
            
            break;
            
        case kUserGetAddressAreaNetWork:
            
        {
            [self requestGetAddressArea:parms];
        }
            
            break;

        case kUserGetTicketListNetWork:
            
        {
            [self requestUserGetTicketList:parms];
        }
            
            break;
            
        case kHomePageCirclesNetWork:
            
        {
            [self requestHomeCarousels:parms];
        }
            break;

        case kHomePageProductionListNetWork:
        {
        
            [self requestHomeProducitonList:parms];
        }
            break;
        case kProductionDetailNetWork:
        {
            
            [self requestGetTicketDetail:parms];
        }
            break;
        case kSubmitOrderNetWork:
        {
            
            [self requestSubmitOrder:parms];
        }
            break;
        case kOrderDetailNetWork:
        {
            
            [self requestGetOrderDetail:parms];
        }
            break;

        case kUserGetCouponsNetWork:
        {
            
            [self requestGetUserCoupons:parms];
        }
            break;
            
        case kProductionTicketListNetWork:
        {
            
            [self requestGetTicketList:parms];
        }
            break;
            
        case kProductionTicketDetailNetWork:
        {
            
            [self requestGetTicketDetail:parms];
        }
            break;
            
        case kProductionTicketPayNetWork:
        {
            
            [self requestGetUserCoupons:parms];
        }
            break;
            
        default:
            break;
    }



}


@end
