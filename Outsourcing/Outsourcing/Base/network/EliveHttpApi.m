//
//  EliveHttpApi.m
//  Eliveapp
//
//  Created by 李文华 on 2017/4/20.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "EliveHttpApi.h"
#import "AFNetWorkManagerConfig.h"
#import "AFNetworking.h"
#import "MBProgressHUDManager.h"

@implementation EliveHttpApi

-(id)init{

    self = [super init];

    return self;
}

- (void)dealWithError:(NSError *)error Task:(NSURLSessionDataTask *)task {

    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    
    

}

- (void)requestSendCodeGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    


}

/**
 注册

 @param params 参数
 @param result 回调函数
 */
- (void)requestRegistersGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"strMobile"] = params[@"strMobile"];
    parameters[@"strPassword"] = params[@"strPassword"];
    parameters[@"strUserSmsCode"] = params[@"strUserSmsCode"];
    
    [AFNetWorkManagerConfig POST:@"buyer/register" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        result(responseObject);
        
        NSLog(@"%@",responseObject[@"result"]);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}


/**
 登录

 @param params 参数
 @param result 回调函数
 */
- (void)requestLoginGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"strMobile"] = params[@"strMobile"];
    parameters[@"strPassword"] = params[@"strPassword"];
    
    [AFNetWorkManagerConfig POST:@"buyer/login" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        result(responseObject);
        
        NSLog(@"%@",responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];

}

/**
 获取用户地址列表

 @param params 参数
 @param result 回调函数
 */
- (void)requestGetUserAddressListWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"lUserId"] = params[@"lUserId"];
    parameters[@"nMaxNum"] = params[@"nMaxNum"];
    parameters[@"nPage"] = params[@"nPage"];
    
    [AFNetWorkManagerConfig POST:@"address/list" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        result(responseObject);
        
        NSLog(@"%@",responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];

}


/**
 新增地址

 @param params 参数
 @param result 回调函数
 */
- (void)requestAddUserAddressWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    
    parameters[@"lUserid"] = params[@"lUserid"];
    parameters[@"strReceiptusername"] = params[@"strReceiptusername"];
    parameters[@"strReceiptmobile"] = params[@"strReceiptmobile"];
    parameters[@"strLocation"] = params[@"strLocation"];
    parameters[@"strDetailaddress"] = params[@"strDetailaddress"];
    
    [AFNetWorkManagerConfig POST:@"address/add" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        result(responseObject);
        
        NSLog(@"%@",responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];


}


/**
 获取区域

 @param params 参数
 @param result 回调函数
 */
- (void)requestGetAddressAreaWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{
 
    [AFNetWorkManagerConfig GET:@"shop/allLocation" baseURL:URLHOST params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        result(responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);

    }];

}


/**
 首页商品列表

 @param params 参数
 @param result 结果回调
 */
- (void)requestHomeProducitonListRequest:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/goods/list",URLHOST];
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"nPage"] = @"1";
    parameters[@"nMaxNum"] = @"6";
    
    [AFNetWorkManagerConfig POST:urlString params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject[@"resCode"]) {
            
            result(responseObject[@"result"][@"dataList"]);
        }else{
        
            NSLog(@"%@",responseObject);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

/**
 商品详情

 @param params 参数
 @param result 结果回调
 */
- (void)requestProducitonDetailRequest:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/goods/detail/%@",URLHOST,params[@"goodsLid"]];
    
    [AFNetWorkManagerConfig GET:urlString params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject[@"resCode"]) {
            
            result(responseObject[@"result"]);
        }else{
            
            NSLog(@"%@",responseObject);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}


/**
 订单提交

 @param params 参数
 @param result 结果回调函数
 */
- (void)requestSubmitOrdersRequest:(NSDictionary *)params result:(void (^)(id responseObject))result{
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"lBuyerid"] = params[@"lBuyerid"];
    parameters[@"strBuyername"] = params[@"strBuyername"];
    parameters[@"nTotalprice"] = params[@"nTotalprice"];
    parameters[@"strInvoiceheader"] = params[@"strInvoiceheader"];
    parameters[@"strRemarks"] = params[@"strRemarks"];
    parameters[@"orderGoods"] = params[@"orderGoods"];

    [AFNetWorkManagerConfig POST:@"order/add" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"resCode"] isEqualToString:@"0"]) {
            
            result(responseObject);
        }else{
            
            NSLog(@"%@",responseObject);
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);

    }];
    

}

/**
 获取订单详情
 
 @param params 参数
 @param result 回调函数
 */
- (void)requestOrderDetailRequest:(NSDictionary *)params result:(void (^)(id responseObject))result{
    
    NSString *url = [NSString stringWithFormat:@"order/detail/%@",params[@"lOrderId"]];
    [AFNetWorkManagerConfig GET:url baseURL:URLHOST params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"resCode"] isEqualToString:@"0"]) {
            
            result(responseObject);
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
    
}

/**
 获取订单支付详情

 @param params 参数
 @param result 回调函数
 */
- (void)requestOrderPayDetailRequest:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *url = [NSString stringWithFormat:@"order/payDetail/%@",params[@"lOrderId"]];
    [AFNetWorkManagerConfig GET:url baseURL:URLHOST params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"resCode"] isEqualToString:@"0"]) {
            
            result(responseObject);
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
    }];


}

/**
 获取我的订单列表

 @param params 参数
 @param result 回调函数
 */
- (void)requestUserOrderListRequest:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"nPage"] = params[@"nPage"];
    parameters[@"nMaxNum"] = params[@"nMaxNum"];
    parameters[@"lBuyerid"] = params[@"lBuyerid"];
    parameters[@"nState"] = params[@"nState"];
    parameters[@"lDeliveryid"] = params[@"lDeliveryid"];
    
    [AFNetWorkManagerConfig POST:@"order/list" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        result(responseObject);

//        if ([responseObject[@"resCode"] isEqualToString:@"0"]) {
//            
//            result(responseObject);
//        }else{
//            
//            NSLog(@"%@",responseObject);
//        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
    
}


/**
 获取用户优惠券信息

 @param params 参数
 @param result 回调函数
 */
- (void)requestGetUserCoupons:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"nPage"] = params[@"nPage"];
    parameters[@"nMaxNum"] = params[@"nMaxNum"];
    parameters[@"lUserId"] = params[@"lUserId"];
 
    [AFNetWorkManagerConfig POST:@"coupon/list" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"resCode"] isEqualToString:@"0"]) {
            
            result(responseObject);
        }else{
            
            NSLog(@"%@",responseObject);
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
    
}

- (void)requestGetTicketList:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"nPage"] = params[@"nPage"];
    parameters[@"nMaxNum"] = params[@"nMaxNum"];
    
    [AFNetWorkManagerConfig POST:@"ticket/list" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"resCode"] isEqualToString:@"0"]) {
            
            result(responseObject);
        }else{
            
            NSLog(@"%@",responseObject);
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
    
}

- (void)requestGetTicketDetail:(NSDictionary *)params result:(void (^)(id responseObject))result{

    [AFNetWorkManagerConfig GET:[NSString stringWithFormat:@"ticket/detail/%@",params[@"goodsLid"]] baseURL:URLHOST params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"resCode"] isEqualToString:@"0"]) {
            
            result(responseObject);
        }else{
            
            NSLog(@"%@",responseObject);
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);

    }];
}


/**
 获取用户水票列表

 @param params 参数
 @param result 回调函数
 */
- (void)requestUserGetTicketList:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"nPage"] = params[@"nPage"];
    parameters[@"nMaxNum"] = params[@"nMaxNum"];
    parameters[@"lUserId"] = params[@"lUserId"];
    
    [AFNetWorkManagerConfig POST:@"ticket/myList" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"resCode"] isEqualToString:@"0"]) {
            
            result(responseObject);
        }else{
            
            NSLog(@"%@",responseObject);
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];

}

/**
 添加购物车

 @param params 参数
 @param result 回调函数
 */
- (void)requestUserAddShopCart:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"strUserName"] = params[@"strUserName"];
    parameters[@"lUserId"] = params[@"lUserId"];
    parameters[@"nPrice"] = params[@"nPrice"];
    parameters[@"lGoodsId"] = params[@"lGoodsId"];
    parameters[@"strGoodsname"] = params[@"strGoodsname"];
    parameters[@"strGoodsimgurl"] = params[@"strGoodsimgurl"];
    parameters[@"strStandard"] = params[@"strStandard"];

    [AFNetWorkManagerConfig POST:@"shopping/add" baseURL:URLHOST params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject[@"resCode"] isEqualToString:@"0"]) {
            
            result(responseObject);
        }else{
            
            NSLog(@"%@",responseObject);
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}


@end
