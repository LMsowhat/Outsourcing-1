//
//  MainTabBarController.m
//  Outsourcing
//
//  Created by 李文华 on 2017/6/13.
//  Copyright © 2017年 李文华. All rights reserved.
//

#import "MainTabBarController.h"

#import "NavigationViewController.h"

#import "HomeViewController.h"
#import "OrdersViewController.h"
#import "WaterTicketViewController.h"
#import "MyViewController.h"



@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *home = [HomeViewController new];
    NavigationViewController *navi1 = [[NavigationViewController alloc] initWithRootViewController:home];
    home.tabBarItem = [[UITabBarItem  alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [home.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGBA(0x44b336, 1.0),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

    
    OrdersViewController *order = [OrdersViewController new];
    NavigationViewController *navi2 = [[NavigationViewController alloc] initWithRootViewController:order];
    order.tabBarItem = [[UITabBarItem  alloc] initWithTitle:@"订单" image:[[UIImage imageNamed:@"course"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"course_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [order.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGBA(0x44b336, 1.0),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

    
    WaterTicketViewController *water = [WaterTicketViewController new];
    NavigationViewController *navi3 = [[NavigationViewController alloc] initWithRootViewController:water];
    water.tabBarItem = [[UITabBarItem  alloc] initWithTitle:@"水票" image:[[UIImage imageNamed:@"community"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"community_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [water.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGBA(0x44b336, 1.0),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

    MyViewController *set = [MyViewController new];
    NavigationViewController *navi4 = [[NavigationViewController alloc] initWithRootViewController:set];
    set.tabBarItem = [[UITabBarItem  alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"setting"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"setting_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [set.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGBA(0x44b336, 1.0),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

    self.viewControllers = @[navi1,navi2,navi3,navi4];
    
    self.tabBarController.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
