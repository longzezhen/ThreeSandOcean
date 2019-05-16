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
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:ImageNamed(@"left_back") style:UIBarButtonItemStylePlain target:self action:@selector(clickGoBackBarButton)];
    self.navigationItem.leftBarButtonItem.width = 44;
    [self.view endEditing:YES];
}

- (void)clickGoBackBarButton{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
