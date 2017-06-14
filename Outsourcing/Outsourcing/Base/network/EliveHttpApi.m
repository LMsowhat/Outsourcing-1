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


@implementation EliveHttpApi

-(id)init{

    self = [super init];

    return self;
}

- (void)dealWithError:(NSError *)error Task:(NSURLSessionDataTask *)task {

    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    
    

}


- (void)requestAPPCheckVersionGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

//    NSString *urlString = [NSString stringWithFormat:@"%@/polling",URLHOST];

    NSString *url = @"https://itunes.apple.com/lookup?id=1241117233";
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [AFNetWorkManagerConfig POST:url token:nil params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        if (responseObject) {
            
            result(responseObject);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}


- (void)requestSendCodeGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/sendCode",URLHOST];
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"phone"] = params[@"phone"];
    parameters[@"sms_template_code"] = params[@"sms_template_code"];

    [AFNetWorkManagerConfig POST:urlString token:nil params:parameters success:^(NSURLSessionDataTask *task, id responseObject){
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}


- (void)requestLoginGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/login",URLHOST];

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"phone"] = params[@"phone"];
    parameters[@"sms_code"] = params[@"sms_code"];
    parameters[@"sms_template_code"] = params[@"sms_template_code"];
    
    [AFNetWorkManagerConfig POST:urlString token:nil params:parameters success:^(NSURLSessionDataTask *task, id responseObject){
        
        if (responseObject) {
            
            result(responseObject);
        }
        

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];
    
}


- (void)requestRegistersGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/register",URLHOST];
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"phone"] = params[@"phone"];
    parameters[@"sms_code"] = params[@"sms_code"];
    parameters[@"sms_template_code"] = params[@"sms_template_code"];
    
    [AFNetWorkManagerConfig POST:urlString token:nil params:parameters success:^(NSURLSessionDataTask *task, id responseObject){
        
        if (responseObject) {
            
            result(responseObject);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];


}


- (void)requestHomeCarouselGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/carousels/2",URLHOST];
    
    [AFNetWorkManagerConfig GET:urlString token:nil params:nil success:^(NSURLSessionDataTask *task, id responseObject){
        
        if (responseObject &&[responseObject isKindOfClass:[NSDictionary class]]) {
            
            result(responseObject);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}


- (void)requestHomeRecommendationsGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/recommendations/1",URLHOST];
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"per_page"] = params[@"per_page"];
    parameters[@"source"] = params[@"source"];
    parameters[@"include"] = params[@"include"];
    parameters[@"page"] = params[@"page"];
    
    
    [AFNetWorkManagerConfig GET:urlString token:nil params:parameters success:^(NSURLSessionDataTask *task, id responseObject){
        
        if (responseObject) {
            
            result(responseObject);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}

- (void)requestCourseCategoriesGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/categories/1",URLHOST];

    [AFNetWorkManagerConfig GET:urlString token:nil params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject[@"data"]) {
            
            result(responseObject[@"data"]);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}

- (void)requestCourseAllListGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/courses",URLHOST];
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"category"] = params[@"category"];
    parameters[@"type"] = params[@"type"];
    parameters[@"per_page"] = params[@"per_page"];
    parameters[@"source"] = params[@"source"];
    parameters[@"include"] = params[@"include"];
    parameters[@"page"] = params[@"page"];
 
    [AFNetWorkManagerConfig GET:urlString token:nil params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}


- (void)requestCourseDetailGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *api = [params objectForKey:@"api"];

    NSString *urlString = [NSString stringWithFormat:@"%@/%@",URLHOST,api];

    NSMutableDictionary *parm = [NSMutableDictionary new];
    
    parm[@"include"] = params[@"include"];
    
    [AFNetWorkManagerConfig GET:urlString token:nil params:parm success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject[@"data"]) {
            
            result(responseObject[@"data"]);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}

- (void)requestCourseHasCollectGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user/collects/%@/show",URLHOST,params[@"courseId"]];

    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}

- (void)requestCourseHasPayForGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/courses/%@/course",URLHOST,params[@"courseId"]];
    
    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}


- (void)requestCourseAddCollectionGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{
    
    NSString *urlString = [NSString stringWithFormat:@"%@/user/collects/%@",URLHOST,params[@"courseId"]];
    
    //    NSMutableDictionary *parameters = [NSMutableDictionary new];
    //    parameters[@"courseId"];
    //
    [AFNetWorkManagerConfig POST:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];
    
}

- (void)requestSearchSearchActionGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/search/store",URLHOST];

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"keyword"] = params[@"keyword"];
    parameters[@"include"] = params[@"include"];
    parameters[@"page"] = params[@"page"];
    parameters[@"per_page"] = params[@"per_page"];
    
    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}

- (void)requestSearchSearchShowActionGetDataWithParameters:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/search/show",URLHOST];

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"keyword"] = params[@"keyword"];
    parameters[@"include"] = params[@"include"];
    parameters[@"page"] = params[@"page"];
    parameters[@"type"] = params[@"type"];
    
    [AFNetWorkManagerConfig GET:urlString token:nil params:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];
    
}

- (void)requestSettingUserInfoGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user",URLHOST];
    
    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            result(responseObject[@"data"]);

        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if ([responseObject isKindOfClass:[NSDictionary class]]) {
                            
                            result(responseObject[@"data"]);
                            
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}

- (void)requestSettingUploadUserIconGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/upload",URLHOST];

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"token"] = params[@"token"];

    [AFNetWorkManagerConfig uploadWithURL:urlString params:parameters fileData:params[@"fileData"] name:@"file" fileName:@"file.jpg" mimeType:@"image/jpg" progress:^(NSProgress *progress) {
        
        LMLog(@"AFNetWorkManagerConfig========%@",progress);
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (result) {
            
            result(responseObject);
        }
        LMLog(@"requestSettingUploadUserIconGetData=====success");
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"AFNetWorkManagerConfig======error")
    }];
    
    


}


- (void)requestSettingUserOrderGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user/orders",URLHOST];

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    
    parameters[@"page"] = params[@"page"];
    parameters[@"per_page"] = params[@"per_page"];
    parameters[@"status"] = params[@"status"];
    parameters[@"include"] = params[@"include"];
    
    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject) {
            
            result(responseObject);

        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                            
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];


}

- (void)requestCreateOrderGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user/orders",URLHOST];
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"course_id"] = params[@"course_id"];

    [AFNetWorkManagerConfig POST:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject[@"data"]);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject[@"data"]);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];
    
}

- (void)requestGetTheOrderGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user/orders/%@",URLHOST,params[@"id"]];

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"include"] = @"course.image";
    
    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject[@"data"]);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject[@"data"]);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}



- (void)requestSettingUpdateUserInfoGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/users/%@",URLHOST,params[@"userId"]];
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    
    parameters[@"name"] = params[@"name"];
    parameters[@"nickname"] = params[@"nickname"];
    parameters[@"person_signature"] = params[@"person_signature"];
    parameters[@"profession"] = params[@"profession"];
    
    [AFNetWorkManagerConfig POST:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];
    
    
//    [AFNetWorkManagerConfig PATCH:urlString params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        result(responseObject);
//        LMLog(@"%@",responseObject);
//    } fail:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        LMLog(@"%@",error);
//    }];
    

}

- (void)requestAliPayGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/pay/%@",URLHOST,params[@"orderId"]];

    [AFNetWorkManagerConfig GET:urlString token:nil params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}

- (void)requestUserCollectionsListGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user/collects",URLHOST];
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"page"] = params[@"page"];
    parameters[@"include"] = @"course.image";
    parameters[@"per_page"] = @"10";
    
    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];
    

}

- (void)requestUserMyCourseListGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user/courses",URLHOST];

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"per_page"] = params[@"per_page"];
    parameters[@"include"] = params[@"include"];
    parameters[@"page"] = params[@"page"];
    
    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }

    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];

}

- (void)requestUserMessageListGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user/messages",URLHOST];
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"per_page"] = @"10";
    parameters[@"status"] = params[@"status"];
    parameters[@"page"] = params[@"page"];
    
    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig GET:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];


}


- (void)requestUserTheMessageDetailGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

}


- (void)requestUserDeleteTheOrderGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user/orders/%@",URLHOST,params[@"id"]];
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"include"] = @"course.image";

    [AFNetWorkManagerConfig DELE:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig DELE:urlString token:[UserDefaultTools userToken] params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];



}

- (void)requestUserDeleteTheMessageGetData:(NSDictionary *)params result:(void (^)(id responseObject))result{

    NSString *urlString = [NSString stringWithFormat:@"%@/user/messages/%@",URLHOST,params[@"id"]];

    [AFNetWorkManagerConfig DELE:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            
            result(responseObject);
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        
        if (response.statusCode == 401) {
            
            [AFNetWorkManagerConfig PUT:[NSString stringWithFormat:@"%@/user/updateToken",URLHOST] token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                
                if (responseObject && responseObject[@"token"]) {
                    
                    [UserDefaultTools setToken:responseObject[@"token"]];
                    [AFNetWorkManagerConfig DELE:urlString token:[UserDefaultTools userToken] params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                        
                        if (responseObject) {
                            
                            result(responseObject);
                        }
                    } fail:^(NSURLSessionDataTask *task, NSError *error) {
                        
                        LMLog(@"%@",error);
                    }];
                    
                }else{
                    
                    LMLog(@"%@",responseObject);
                }
                
            } fail:^(NSURLSessionDataTask *task, NSError *error) {
                
                LMLog(@"%@",error);
            }];
            
            return ;
        }
        
        [self dealWithError:error Task:task];
        LMLog(@"%@",error);
    }];


}



@end
