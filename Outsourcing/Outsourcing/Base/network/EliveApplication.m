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

        case kUserGetInfoNetWork:
            
        {
            [self requestUserInfo:parms];
        }
            
            break;

        case kUserUploadNetWork:
            
        {
            [self requestUploadUserIcon:parms];
        }
            
            break;

        case kHomePageCirclesNetWork:
            
        {
            [self requestHomeCarousels:parms];
        }
            break;

        case kHomePageEliveFourthNetWork:
            
            
            break;
            
        case kHomePageHotNetWork:
        
        {
            [self requestHomeRecommendations:parms];
        }
            break;
 
        case kHomeCoursesCategoriesNetWork:
            
        {
            [self requestCourseCategories:parms];
        }
            
            break;
            
        case kHomeCourseListNetWork:
            
        {
            [self requestCourseList:parms];
        }
            
            break;
            
        case kHomeCourseDetailNetWork:
            
        {
            [self requestCourseDetail:parms];
        }
            
            break;
            
        case kUserSearchNetWork:
            
        {
            [self requestUserSearchAction:parms];
        }
            
            break;
            
        case kHomeSearchShowNetWork:
            
        {
            [self requestSearchSearchShowAction:parms];
        }
            
            break;
        
        case kSettingUserOrderListNetWork:
            
        {
            [self requestSettingUserOrder:parms];
        }
            
            break;

        case kCourseCreateOrderNetWork:
            
        {
            [self requestCreateOrder:parms];
        }
            
            break;

        case kGetTheOrderDetailNetWork:
            
        {
            [self requestGetTheOrderDetail:parms];
        }
            
            break;
            
        case kSettingUpdateUserInfoNetWork:
            
        {
            [self requestSettingUpdateUserInfo:parms];
        }
            
            break;
            
        case kAliPayNetWork:
            
        {
            [self requestAliPay:parms];
        }
            
            break;
            
        case kWechatPayNetWork:
            
        {
            [self requestAliPay:parms];
        }
            
            break;

        case kCourseAddCollectionNetWork:
            
        {
            [self requestCourseAddCollection:parms];
        }
            
            break;

        case kUserCollectionsListNetWork:
            
        {
            [self requestUserCollectionsList:parms];
        }
            
            break;
            
        case kCourseHasCollectNetWork:
            
        {
            [self requestCourseHasCollect:parms];
        }
            
            break;
            
        case kCourseHasPayForNetWork:
            
        {
            [self requestCourseHasPayFor:parms];
        }
            
            break;

        case kMyCourseListNetWork:
            
        {
            [self requestGetMyCourseList:parms];
        }
            
            break;
            
        case kUserMessageNetWork:
            
        {
            [self requestGetMyMessageList:parms];
        }
            
            break;
            
        case kUserTheMessageDetailNetWork:
            
        {
            [self requestGetTheMessageDetail:parms];
        }
            
            break;
            
        case kDeleteTheOrderDetailNetWork:
            
        {
            [self requestDeleteTheOrder:parms];
        }
            
            break;
            
        case kDeleteTheMessageNetWork:
            
        {
            [self requestDeleteTheMessage:parms];
        }
            
            break;
            
        default:
            break;
    }



}


@end
