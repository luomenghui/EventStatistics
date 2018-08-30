//
//  EventStatisticsTool.m
//  事件统计
//
//  Created by luomh on 2018/8/30.
//  Copyright © 2018年 luomh. All rights reserved.
//

#define AppleAppID @"154279495255390"
#define AppsFlyerDevKey @"zivVyNciM64EtFmxRNvYyn"

#import "EventStatisticsTool.h"
#import <Crashlytics/Answers.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <AppsFlyerLib/AppsFlyerTracker.h>
#import <Fabric/Fabric.h>

@implementation EventStatisticsTool

+ (void)Event_configurationToolWithApplication:(UIApplication *)application launchOptions:(NSDictionary *)launchOptions
{
    [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    [[AppsFlyerTracker sharedTracker] setAppleAppID:AppleAppID];
    [[AppsFlyerTracker sharedTracker] setAppsFlyerDevKey:AppsFlyerDevKey];
    [Fabric with:@[[Crashlytics class]]];
}

+ (BOOL)Event_application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey] annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
    return handled;
}

+ (void)Event_applicationBecomeActive
{
    [FBSDKAppEvents activateApp];
    [[AppsFlyerTracker sharedTracker] trackAppLaunch];
}

+ (void)Event_logAppLaunch
{
    NSString *eventName = @"App_Launch";
    [self logEvent:eventName];
}
+ (void)Event_logPurchaseSuccess
{
    NSString *eventName = @"Purchase_Success";
    [self logEvent:eventName];
}


#pragma mark - Private
+ (void)logEvent:(NSString *)eventName
{
    NSString *newEventName = [self addVersion:eventName];
    [[AppsFlyerTracker sharedTracker] trackEvent:newEventName withValues:nil];
    [FBSDKAppEvents logEvent:newEventName];
    [Answers logCustomEventWithName:newEventName customAttributes:nil];
}

+ (void)logEvent:(NSString *)eventName parameters:(NSDictionary *)parameters
{
    NSString *newEventName = [self addVersion:eventName];
    [[AppsFlyerTracker sharedTracker] trackEvent:newEventName withValues:parameters];
    [FBSDKAppEvents logEvent:newEventName parameters:parameters];
    [Answers logCustomEventWithName:newEventName customAttributes:parameters];
}

+ (NSString *)addVersion:(NSString *)eventName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = info[@"CFBundleShortVersionString"];
    NSString *newVersion = [appVersion stringByReplacingOccurrencesOfString:@"." withString:@" "];
    return [NSString stringWithFormat:@"%@_%@", newVersion, eventName];
}

@end
