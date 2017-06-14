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
- (void)requestHomeCarousels:(NSDictionary*)parm;

//
- (void)requestHomeRecommendations:(NSDictionary*)parm;

//
- (void)requestCourseCategories:(NSDictionary *)parm;

//
- (void)requestCourseList:(NSDictionary *)parm;

//
- (void)requestCourseDetail:(NSDictionary*)parm;

//
- (void)requestUserSearchAction:(NSDictionary*)parm;

//
- (void)requestSearchSearchShowAction:(NSDictionary*)parm;

//
- (void)requestUserInfo:(NSDictionary*)parm;

//
- (void)requestUploadUserIcon:(NSDictionary*)parm;

//
- (void)requestSettingUserOrder:(NSDictionary*)parm;

//
- (void)requestCreateOrder:(NSDictionary*)parm;

//
- (void)requestGetTheOrderDetail:(NSDictionary*)parm;

//
- (void)requestSettingUpdateUserInfo:(NSDictionary*)parm;

//
- (void)requestAliPay:(NSDictionary*)parm;

//
- (void)requestCourseAddCollection:(NSDictionary *)parm;

//
- (void)requestUserCollectionsList:(NSDictionary*)parm;

//
- (void)requestCourseHasCollect:(NSDictionary*)parm;

//
- (void)requestCourseHasPayFor:(NSDictionary*)parm;

//
- (void)requestGetMyCourseList:(NSDictionary*)parm;

//
- (void)requestGetMyMessageList:(NSDictionary*)parm;

//
- (void)requestGetTheMessageDetail:(NSDictionary*)parm;

//
- (void)requestDeleteTheOrder:(NSDictionary*)parm;
//
- (void)requestDeleteTheMessage:(NSDictionary*)parm;


@end
