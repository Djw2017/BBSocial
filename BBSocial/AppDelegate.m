//
//  AppDelegate.m
//  BBSocial
//
//  Created by Dongjw on 17/5/23.
//  Copyright © 2017年 Babybus. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "BBSocial.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //设置友盟key
    [BBSocial setUmSocialAppkey:@"55af3412e0f55afc56000f46"];
    
    //设置微信的app的key和appSecret
    [BBSocial setPlaform:BBSocialPlatformType_WechatSession appKey:@"wx35f3ab302b654315" appSecret:@"75a39c76ac1dce31391b0576e7001487" redirectURL:@"https://www.babybus.com"];
    
    //设置QQ的app的key和appSecret
    [BBSocial setPlaform:BBSocialPlatformType_QQ appKey:@"1104751322" appSecret:@"jVHswZcqvPUKS9mX" redirectURL:@"https://www.babybus.com"];
    
    //设置微博的app的key和appSecret
    [BBSocial setPlaform:BBSocialPlatformType_Sina appKey:@"2643382249" appSecret:@"02bcb55c7691d3477db7a8559fdf17a7" redirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    ViewController *vc = [[ViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = vc;
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [BBSocial handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
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
