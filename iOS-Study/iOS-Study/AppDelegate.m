//
//  AppDelegate.m
//  iOS-Study
//
//  Created by Daysun on 2020/2/11.
//  Copyright © 2020 Daysun. All rights reserved.
//

#import "AppDelegate.h"
#import "DaysunTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[DaysunTabBarController alloc]init];
    [self.window makeKeyAndVisible];
    
    return YES;
}
#pragma mark - 生命周期
- (void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"状态** 将要进入前台");
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"状态** 已经活跃");
}
- (void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"状态** 将要进入后台");
}
- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"状态** 已经进入后台");
}
- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"状态** 将要退出程序");
}
@end
