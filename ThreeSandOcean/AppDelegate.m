//
//  AppDelegate.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/11.
//  Copyright © 2019 tools. All rights reserved.
//

#import "AppDelegate.h"
#import "TSOWelcomeViewController.h"
#import "TSOLoginViewController.h"
#import "TSOMainTabBarController.h"
#import <AFNetworkActivityLogger/AFNetworkActivityLogger.h>
#import <Bugly/Bugly.h>
@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:self.navigationCtrl];
    self.window.backgroundColor = ColorFromRGB(0xFFFFFF);
    [self.window makeKeyAndVisible];
    //是否进欢迎页面
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"notFirstLaunch"] boolValue]) {
        //第一次运行进入欢迎页面
        [[NSUserDefaults standardUserDefaults] setObject:@(1) forKey:@"notFirstLaunch"];
        TSOWelcomeViewController * welcomeVC = [TSOWelcomeViewController new];
        self.navigationCtrl.viewControllers = @[welcomeVC];
        
    }else{
        [AppDelegate startLoginViewController];
    }
    
    //日志打印
    [[AFNetworkActivityLogger sharedLogger] startLogging];
    [[AFNetworkActivityLogger sharedLogger] setLogLevel:AFLoggerLevelDebug];
    
    //bugly集成
    [Bugly startWithAppId:@"3d10227d36"];
    

    return YES;
}

#pragma mark - public
//跳转登录页面
+ (void)startLoginViewController
{
    TSOLoginViewController * loginVC = [[TSOLoginViewController alloc] init];
    [[self shareAppDelegate].navigationCtrl setNavigationBarHidden:YES];
    [self shareAppDelegate].navigationCtrl.viewControllers = @[loginVC];
}

//跳转主页面
+ (void)startMainViewController
{
    TSOMainTabBarController *tabbarVc = [[TSOMainTabBarController alloc]init];
    [[AppDelegate shareAppDelegate].navigationCtrl setNavigationBarHidden:YES];
    [self shareAppDelegate].navigationCtrl.viewControllers = @[tabbarVc];
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

#pragma mark - get
- (UINavigationController *)navigationCtrl{
    
    if (!_navigationCtrl) {
        _navigationCtrl = [[UINavigationController alloc]init];
        [_navigationCtrl setNavigationBarHidden:YES];
    }
    return _navigationCtrl;
}

+ (AppDelegate *)shareAppDelegate{
    
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
@end
