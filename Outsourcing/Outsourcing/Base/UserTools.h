//
//  UserTools.h
//  Outsourcing
//
//  Created by 李文华 on 2017/7/13.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserTools : NSObject


//firstLoad
+(NSString *)firstTag;
+(void)setFirstTag:(NSString *)tag;

//token
+(void)setToken:(NSString *)token;
+(NSString *)userToken;

//userId
+ (void)setUserId:(NSString *)userId;
+(NSString *)userId;

//userAddress
+ (void)setUserAddress:(NSDictionary *)userAddress;
+(NSDictionary *)userAddress;

//employeeId
+ (void)setUserEmployees:(NSString *)employeeId;
+(NSString *)userEmployeesId;


+ (void)logOut;

@end
