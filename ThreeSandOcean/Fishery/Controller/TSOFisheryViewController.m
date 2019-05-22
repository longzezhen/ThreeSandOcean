//
//  TSOFisheryViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/16.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFisheryViewController.h"
#import <WebKit/WebKit.h>
@interface TSOFisheryViewController ()

@property (nonatomic,strong)UIButton * feedManagerButton;
@property (nonatomic,strong)UIButton * environmentManagerButton;
@end

@implementation TSOFisheryViewController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - private
-(void)initView
{
   
}

#pragma mark - get

@end
