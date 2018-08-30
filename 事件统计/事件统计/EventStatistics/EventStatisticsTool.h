//
//  EventStatisticsTool.h
//  事件统计
//
//  Created by luomh on 2018/8/30.
//  Copyright © 2018年 luomh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EventStatisticsTool : NSObject

/* 一下三个方法需要在AppDelegate中调用 */
+ (void)Event_configurationToolWithApplication:(UIApplication *)application launchOptions:(NSDictionary *)launchOptions;
+ (BOOL)Event_application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;
+ (void)Event_applicationBecomeActive;

+ (void)Event_logAppLaunch;

+ (void)Event_logPurchaseSuccess;

@end
