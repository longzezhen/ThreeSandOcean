//
//  BaseViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/15.
//  Copyright © 2019 tools. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
#pragma mark - lifeStyle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ColorFromRGB(0xFFFFFF);
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = ColorFromRGB(0xFFFFFF);
    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    /* 添加空白图片，去掉NavigationBar下划线 **/
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];  
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark - public
- (void)goBackBarButton{//返回按钮
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 70, 44);
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    [leftButton setImage:ImageNamed(@"left_back") forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(clickGoBackBarButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self.view endEditing:YES];
}

- (void)clickGoBackBarButton{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
