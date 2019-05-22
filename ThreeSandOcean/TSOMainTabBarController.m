//
//  TSOMainTabBarController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/16.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOMainTabBarController.h"
#import "BaseNavViewController.h"
#import "TSOFisheryViewController.h"
#import "TSOBreedAquaticsViewController.h"
#import "TSOFeedViewController.h"
#import "TSOMonitoringViewController.h"
#import "TSOMineViewController.h"
@interface TSOMainTabBarController ()
@property (nonatomic,strong) BaseNavViewController * fisheryNav;
@property (nonatomic,strong) BaseNavViewController * breedAquaticsNav;
@property (nonatomic,strong) BaseNavViewController * feedNav;
@property (nonatomic,strong) BaseNavViewController * monitoringNav;
@property (nonatomic,strong) BaseNavViewController * mineNav;
@end

@implementation TSOMainTabBarController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[self.fisheryNav,self.breedAquaticsNav,self.feedNav,self.monitoringNav,self.mineNav];
}

#pragma mark - private
-(void)setItemWithVC:(UIViewController *)vc title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage idx:(NSUInteger)idx
{
    if (normalImage) {
        UIImage *noImage = [UIImage imageNamed:normalImage];
        noImage = [noImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:noImage tag:idx];
    }
    
    if (selectedImage) {
        UIImage *seImage = [UIImage imageNamed:selectedImage];
        seImage = [seImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setSelectedImage:seImage];
    }
    
    [vc.tabBarItem  setTitleTextAttributes:@{NSForegroundColorAttributeName:ColorFromRGB(0x557479)}
                                  forState:UIControlStateNormal];
    [vc.tabBarItem  setTitleTextAttributes:@{NSForegroundColorAttributeName:ColorFromRGB(0x27e189)}
                                  forState:UIControlStateSelected];
}

#pragma mark - get
-(BaseNavViewController *)fisheryNav
{
    if (!_fisheryNav) {
        TSOFisheryViewController * vc = [[TSOFisheryViewController alloc] init];
        [self setItemWithVC:vc title:@"渔场" normalImage:@"icon_star_normal" selectedImage:@"icon_star_checked" idx:1];
        
        _fisheryNav = [[BaseNavViewController alloc] initWithRootViewController:vc];
    }
    return _fisheryNav;
}

-(BaseNavViewController *)breedAquaticsNav
{
    if (!_breedAquaticsNav) {
        TSOBreedAquaticsViewController * vc = [[TSOBreedAquaticsViewController alloc] init];
        [self setItemWithVC:vc title:@"养殖" normalImage:@"icon_star_normal" selectedImage:@"icon_star_checked" idx:2];
        
        _breedAquaticsNav = [[BaseNavViewController alloc] initWithRootViewController:vc];
    }
    return _breedAquaticsNav;
}

-(BaseNavViewController *)feedNav
{
    if (!_feedNav) {
        TSOFeedViewController * vc = [[TSOFeedViewController alloc] init];
        [self setItemWithVC:vc title:@"喂食" normalImage:@"icon_star_normal" selectedImage:@"icon_star_checked" idx:3];
        
        _feedNav = [[BaseNavViewController alloc] initWithRootViewController:vc];
    }
    return _feedNav;
}

-(BaseNavViewController *)monitoringNav
{
    if (!_monitoringNav) {
        TSOMonitoringViewController * vc = [[TSOMonitoringViewController alloc] init];
        [self setItemWithVC:vc title:@"监控" normalImage:@"icon_star_normal" selectedImage:@"icon_star_checked" idx:4];
        
        _monitoringNav = [[BaseNavViewController alloc] initWithRootViewController:vc];
    }
    return _monitoringNav;
}

-(BaseNavViewController *)mineNav
{
    if (!_mineNav) {
        TSOMineViewController * vc = [[TSOMineViewController alloc] init];
        [self setItemWithVC:vc title:@"我的" normalImage:@"icon_star_normal" selectedImage:@"icon_star_checked" idx:5];
        
        _mineNav = [[BaseNavViewController alloc] initWithRootViewController:vc];
    }
    return _mineNav;
}
@end
