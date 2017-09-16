//
//  UserTools.m
//  Outsourcing
//
//  Created by 李文华 on 2017/7/13.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "UserTools.h"

@implementation UserTools


+(NSString *)firstTag{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    return [userDefault objectForKey:@"isFirst"];
}

+(void)setFirstTag:(NSString *)tag{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:tag forKey:@"isFirst"];
    [userDefault synchronize];
    
}

+ (void)setToken:(NSString *)token{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:token forKey:@"e_token"];
    [userDefault synchronize];
    
}


+ (NSString *)userToken{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *token = [userDefault objectForKey:@"e_token"];
    return token;
}


+ (void)setUserId:(NSString *)userId{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:userId forKey:@"userId"];
    [userDefault synchronize];
    
}


+(NSString *)userId{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *userId = [userDefault objectForKey:@"userId"];
    return userId;
}

+ (void)setUserCoins:(NSString *)coins{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:coins forKey:@"userCoins"];
    [userDefault synchronize];
}
+(NSString *)userCoins{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *userCoins = [userDefault objectForKey:@"userCoins"];
    return userCoins;
}

+ (void)setUserEmployees:(NSString *)employeeId{

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:employeeId forKey:@"employeeId"];
    
    [userDefault synchronize];
}

+(NSString *)userEmployeesId{

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *employeeId = [userDefault objectForKey:@"employeeId"];
    return employeeId;
}




+ (void)logOut{
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"e_token"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userId"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userCoins"];
    
}


+ (void)setNetRules:(NSString *)rules ForKey:(NSString *)key{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:rules forKey:key];
    [userDefault synchronize];
    
}


+(BOOL)netRules:(NSString *)key{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *rule = [userDefault objectForKey:key];
    
    return [rule boolValue];
    
}

@end
