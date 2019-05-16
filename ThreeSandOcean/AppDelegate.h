//
//  AppDelegate.h
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/11.
//  Copyright © 2019 tools. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationCtrl;

+ (AppDelegate *)shareAppDelegate;
//跳转登录页面
+ (void)startLoginViewController;
//跳转主页面
+ (void)startMainViewController;
@end

