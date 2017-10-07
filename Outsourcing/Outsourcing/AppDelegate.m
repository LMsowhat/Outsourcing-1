//
//  AppDelegate.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/13.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "LoginViewController.h"
#import "NavigationViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"


#import "WaterTicketViewController.h"
#import "ShoppingCartController.h"


@interface AppDelegate ()<UITabBarControllerDelegate,WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainTabBarController *root = [MainTabBarController new];
    root.delegate = self;
    
    //register Weixin app
    [WXApi registerApp:@"wx32196df1f871cc29"];
    
    self.window.rootViewController = root;
    
    [self.window makeKeyAndVisible];

//    [self checkLogin];

    return YES;
}




#pragma mark --UITabBarControllerDelegate

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    if (tabBarController.selectedIndex == 2) {
        
        NavigationViewController *navi = (NavigationViewController *)viewController;
        
        WaterTicketViewController *ticket = navi.viewControllers.firstObject;
        
        [ticket sendRequestHttp];
    }
    if (tabBarController.selectedIndex == 1) {
        
        if ([UserTools getUserId]) {
            
            NavigationViewController *navi = (NavigationViewController *)viewController;
            
            ShoppingCartController *chart = navi.viewControllers.firstObject;
            
            [chart sendHttpRequest];
        }
        
    }
    
}
//禁止tab多次点击
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    UIViewController *tbselect=tabBarController.selectedViewController;
    if([tbselect isEqual:viewController]){
        return NO;
    }
    return YES;
}


-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{

    return [WXApi handleOpenURL:url delegate:self];

}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{

    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
            
            [[NSNotificationCenter defaultCenter] postNotificationName:aliPaySuccess object:nil userInfo:resultDic];

        }];
    }
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回authCode
        
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);

            [[NSNotificationCenter defaultCenter] postNotificationName:aliPaySuccess object:nil userInfo:resultDic];

        }];
    }
    
    //
    return [WXApi handleOpenURL:url delegate:self];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - WXApiDelegate
//WXApiDelegate
/*! @brief 收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
 *
 * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
 * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。
 * @param req 具体请求内容，是自动释放的
 */
-(void) onReq:(BaseReq*)req
{
    
    NSLog(@"Can't bind by weixin!");
}



/*! @brief 发送一个sendReq后，收到微信的回应
 *
 * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
 * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等。
 */
-(void) onResp:(BaseResp*)resp
{
    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {//微信分享回调
        
        [[NSNotificationCenter defaultCenter] postNotificationName:wechatShare object:nil userInfo:@{@"resCode":[NSString stringWithFormat:@"%d",resp.errCode]}];

    }else if ([resp isKindOfClass:[SendAuthResp class]]){//微信登录回调
    
    
    }else if ([resp isKindOfClass:[PayResp class]]){//微信支付回调
    
        [[NSNotificationCenter defaultCenter] postNotificationName:wechatPaySuccess object:nil userInfo:@{@"resCode":[NSString stringWithFormat:@"%d",resp.errCode]}];

    }
    
    
    
    
    //微信总是给app delegate发送消息
    
}



@end
