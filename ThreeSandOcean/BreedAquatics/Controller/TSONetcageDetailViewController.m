//
//  TSONetcageDetailViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/21.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSONetcageDetailViewController.h"

@interface TSONetcageDetailViewController ()

@end

@implementation TSONetcageDetailViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - private
-(void)initView
{
    self.title = @"网箱动态";
    [self goBackBarButton];
}

@end
