//
//  AppDelegate.m
//  MyTabBar
//
//  Created by 尚钢 on 2018/8/2.
//  Copyright © 2018年 尚钢. All rights reserved.
//

#import "AppDelegate.h"
#import "SGTabBarController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    SGTabBar *myTabBar = (SGTabBar*)[tabBarController valueForKey:@"tabBar"];
    myTabBar.addButton.selected = NO;
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    SGTabBarController *TabBarController = [[SGTabBarController alloc] init];
    
    
    //a.初始化一个tabBar控制器
   SGTabBarController *tb=[[SGTabBarController alloc]init];
    tb.delegate = self;
    //创建自定义TabBar

    //设置控制器为Window的根控制器
     self.window.rootViewController=tb;
     //b.创建子控制器
     UIViewController *c1=[[UIViewController alloc]init];
     c1.view.backgroundColor=[UIColor grayColor];

     c1.tabBarItem.title=@"首页";
     c1.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    
    UIViewController *c2=[[UIViewController alloc]init];
    c2.view.backgroundColor=[UIColor greenColor];
    c2.tabBarItem.title=@"店铺";
    c2.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    
    UIViewController *c3=[[UIViewController alloc]init];
    c3.view.backgroundColor=[UIColor yellowColor];
    c3.tabBarItem.title=@"统计";
    c3.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    
    UIViewController *c4=[[UIViewController alloc]init];
    c4.view.backgroundColor=[UIColor redColor];
    c4.tabBarItem.title=@"消息";
    c4.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    
    UIViewController *c5=[[UIViewController alloc]init];
    c5.view.backgroundColor=[UIColor orangeColor];
    c5.tabBarItem.title=@"我的";
    c5.tabBarItem.image=[UIImage imageNamed:@"footbar_data_nor"];
    
    tb.viewControllers=@[c1,c2,c3,c4,c5];
    
    self.window.rootViewController = tb;
    
    
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


@end
