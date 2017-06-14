//
//  EliveHttpApi.h
//  Eliveapp
//
//  Created by 李文华 on 2017/4/20.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EliveHttpApi : NSObject

-(id)init;


- (void)requestAPPCheckVersionGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;


- (void)requestSendCodeGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;


- (void)requestLoginGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;


- (void)requestRegistersGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;


- (void)requestHomeCarouselGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;


- (void)requestHomeRecommendationsGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;


- (void)requestCourseCategoriesGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestCourseAllListGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestCourseDetailGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestCourseHasCollectGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestCourseHasPayForGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestCourseAddCollectionGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestSearchSearchActionGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestSearchSearchShowActionGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestSettingUserInfoGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestSettingUploadUserIconGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestSettingUserOrderGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestCreateOrderGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestGetTheOrderGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestSettingUpdateUserInfoGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

//- (void)requestHomeEliveListGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;
//
//- (void)requestHomeHotListGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestAliPayGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestUserCollectionsListGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestUserMyCourseListGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestUserMessageListGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestUserTheMessageDetailGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestUserDeleteTheOrderGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestUserDeleteTheMessageGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;


@end
