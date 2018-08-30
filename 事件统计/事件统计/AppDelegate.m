//
//  AppDelegate.m
//  事件统计
//
//  Created by luomh on 2018/8/30.
//  Copyright © 2018年 luomh. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "EventStatisticsTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nagC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nagC;
    [self.window makeKeyAndVisible];
    
    [EventStatisticsTool Event_configurationToolWithApplication:application launchOptions:launchOptions];
    [EventStatisticsTool Event_logAppLaunch];
    
    return YES;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    return [EventStatisticsTool Event_application:application openURL:url options:options];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [EventStatisticsTool Event_applicationBecomeActive];
}


@end
