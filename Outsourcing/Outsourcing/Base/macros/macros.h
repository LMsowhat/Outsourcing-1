

#ifndef macros_h
#define macros_h

#endif

#pragma mark - 打印日志

#ifdef DEBUG
    #define LMLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define LMLog(...)
#endif

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#pragma mark - 系统UI尺寸

#define kWidth [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kNavigationBarHeight 44
#define kStatusBarHeight 20
#define kTopBarHeight 64
#define kToolBarHeight 44
#define kTabBarHeight 49
#define kiPhone4_W 320
#define kiPhone4_H 480
#define kiPhone5_W 320
#define kiPhone5_H 568
#define kiPhone6_W 375
#define kiPhone6_H 667
#define kiPhone6P_W 414
#define kiPhone6P_H 736

#pragma mark - 颜色
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0x0000FF))/255.0 alpha:alphaValue]
#define kWhiteColor [UIColor whiteColor]
#define kBlackColor [UIColor blackColor]
#define kDarkGrayColor [UIColor darkGrayColor]
#define kLightGrayColor [UIColor lightGrayColor]
#define kGrayColor [UIColor grayColor]
#define kRedColor [UIColor redColor]
#define kGreenColor [UIColor greenColor]
#define kBlueColor [UIColor blueColor]
#define kCyanColor [UIColor cyanColor]
#define kYellowColor [UIColor yellowColor]
#define kMagentaColor [UIColor magentaColor]
#define kOrangeColor [UIColor orangeColor]
#define kPurpleColor [UIColor purpleColor]
#define kBrownColor [UIColor brownColor]
#define kClearColor [UIColor clearColor]

/***  普通字体 */
#define kFont(size) [UIFont systemFontOfSize:size]
/***  粗体 */
#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]


/****网络API****/

#define URLHOST @"http://zaixian.zhijin.com/api"
//#define URLHOST @"http://dapeng.dev.zhijin.com/api"


/***常用****/
#define eLiveToLogin @"eLiveToLoginViewController"
#define aliPaySuccess @"aliPaySuccessCallBack"
#define DownloadSuccess @"downloadsuccess"
#define WIFIDOWNLOAD @"wifi_download"
#define WIFIWATCH @"wifi_see"



#define  kCurrentController                             @"viewController"
#define  EliveApp                                       [EliveApplication shareStance]
//下载列表文件
#define DWDownloadingItemPlistFilename @"downloadingItems.plist"
#define DWDownloadFinishItemPlistFilename @"downloadFinishItems.plist"
//
#import "AppDelegate.h"
#define CCDownloadItems                                [CCDownloadItem sharedInstance]
#define kCachePath NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject

//  检查更新
#define kAPPCheckVersion                                9999
//  登出
#define kUserLogoutNetWork                              1000
//  登录
#define kUserLoginNetWork                               1001
//  注册
#define kUserRegisterNetWork                            1002
//  发送验证码
#define kUserSendCodeNetWork                            1003


//  获取用户信息
#define kUserGetInfoNetWork                             2000
//  修改用户信息
#define kUserUploadNetWork                              2001
//  上传用户图像
#define kUserUploadIconNetWork                          2002


//  获取轮播图信息
#define kHomePageCirclesNetWork                         3000
//  获取首页直播课信息
#define kHomePageEliveFourthNetWork                     3001
//  获取首页热门课信息
#define kHomePageHotNetWork                             3002
//  获取课程分类信息
#define kHomeCoursesCategoriesNetWork                   3003
//  获取课程列表信息
#define kHomeCourseListNetWork                          3004
//  获取课程详情信息
#define kHomeCourseDetailNetWork                        3005
//  用户搜索
#define kUserSearchNetWork                              3006
//  点击搜索按钮
#define kHomeSearchShowNetWork                          3007


//  订单
#define kSettingUserOrderListNetWork                    3008
//  设置个人信息
#define kSettingUpdateUserInfoNetWork                   3009
//  创建订单
#define kCourseCreateOrderNetWork                       3012
//  获取一个订单
#define kGetTheOrderDetailNetWork                       3013
//  支付宝支付
#define kAliPayNetWork                                  3014
//  微信支付
#define kWechatPayNetWork                               3015
//  获取课程详情信息
#define kCourseAddCollectionNetWork                     3016
//  获取用户所有收藏信息
#define kUserCollectionsListNetWork                     3017
//  判断是否收藏
#define kCourseHasCollectNetWork                        3018

//  我的课程
#define kMyCourseListNetWork                            3019
//  判断是否购买
#define kCourseHasPayForNetWork                         3020
//  用户消息
#define kUserMessageNetWork                             3021
//  一条详细信息
#define kUserTheMessageDetailNetWork                    3022
//  删除一条订单
#define kDeleteTheOrderDetailNetWork                    3023
//  删除一条信息
#define kDeleteTheMessageNetWork                        3024





