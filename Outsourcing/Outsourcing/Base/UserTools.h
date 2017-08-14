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

//network
+(void)setNetwork:(NSString *)Type;
+(NSString *)appNetWork;

//token
+(void)setToken:(NSString *)token;
+(NSString *)userToken;

//userId
+ (void)setUserId:(NSString *)userId;
+(NSString *)userId;

//userCoins
+ (void)setUserCoins:(NSString *)coins;
+(NSString *)userCoins;


+ (void)logOut;

@end
