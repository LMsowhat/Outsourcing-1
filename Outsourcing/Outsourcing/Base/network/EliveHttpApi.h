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


//- (void)requestAPPCheckVersionGetData:(NSDictionary *)params result:(void (^)(id responseObject))result;
//
//
- (void)requestSendCodeGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;
//
//
- (void)requestLoginGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;
//
//
- (void)requestRegistersGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;
//
- (void)requestGetUserAddressListWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;
//
//- (void)requestHomeCarouselGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestHomeProducitonListRequest:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestProducitonDetailRequest:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestSubmitOrdersRequest:(NSDictionary *)params result:(void (^)(id responseObject))result;

- (void)requestOrderDetailRequest:(NSDictionary *)params result:(void (^)(id responseObject))result;


@end
