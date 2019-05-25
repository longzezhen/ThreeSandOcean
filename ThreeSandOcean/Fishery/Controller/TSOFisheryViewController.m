//
//  TSOFisheryViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/16.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFisheryViewController.h"
#import <WebKit/WebKit.h>
#import "UIImage+GIF.h"
#import "TSOFeedManagerViewController.h"
#import "TSOEnvironmentManagerViewController.h"
#import "TSOLogMessageView.h"
@interface TSOFisheryViewController ()
@property (nonatomic,strong)UIImageView * backIamgeView;
@property (nonatomic,strong)UIButton * feedManagerButton;
@property (nonatomic,strong)UIButton * environmentManagerButton;
@property (nonatomic,strong)TSOLogMessageView * logMegView;
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
    self.backIamgeView.hidden = NO;
    self.feedManagerButton.hidden = NO;
    self.environmentManagerButton.hidden = NO;
    self.logMegView.hidden = NO;
}

#pragma mark - action
-(void)clickFeedButton
{
    TSOFeedManagerViewController * vc = [TSOFeedManagerViewController new];
    [BaseNavViewController pushViewController:vc hiddenBottomWhenPush:YES animation:YES fromNavigation:self.navigationController];
}

-(void)clickEnvironmentButton
{
    TSOEnvironmentManagerViewController * vc = [TSOEnvironmentManagerViewController new];
    [BaseNavViewController pushViewController:vc hiddenBottomWhenPush:YES animation:YES fromNavigation:self.navigationController];
}

#pragma mark - get
-(UIImageView*)backIamgeView
{
    if (!_backIamgeView) {
        _backIamgeView = [[UIImageView alloc] init];
        [self.view addSubview:_backIamgeView];
        [_backIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        NSData * gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fish" ofType:@"gif"]];
        _backIamgeView.image = [UIImage sd_animatedGIFWithData:gifData];
    }
    return _backIamgeView;
}

-(UIButton *)feedManagerButton
{
    if (!_feedManagerButton) {
        _feedManagerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _feedManagerButton.backgroundColor = ColorFromRGBA(0x000000, 0.3);
        [_feedManagerButton addTarget:self action:@selector(clickFeedButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_feedManagerButton];
        [_feedManagerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(Auto_Width(318));
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        
        UIImageView * imageView = [[UIImageView alloc]initWithImage:ImageNamed(@"feed_manager_icon")];
        [_feedManagerButton addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(23, 31));
        }];
        UILabel * label = [UILabel new];
        label.text = @"喂料管理";
        label.textColor = ColorFromRGB(0xFFFFFF);
        label.font = KFont(12);
        [_feedManagerButton addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _feedManagerButton;
}

-(UIButton *)environmentManagerButton
{
    if (!_environmentManagerButton) {
        _environmentManagerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _environmentManagerButton.backgroundColor = ColorFromRGBA(0x000000, 0.3);
        [_environmentManagerButton addTarget:self action:@selector(clickEnvironmentButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_environmentManagerButton];
        [_environmentManagerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.feedManagerButton.mas_bottom).mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        
        UIImageView * imageView = [[UIImageView alloc]initWithImage:ImageNamed(@"environment_manager_icon")];
        [_environmentManagerButton addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(23, 31));
        }];
        UILabel * label = [UILabel new];
        label.text = @"环境管理";
        label.textColor = ColorFromRGB(0xFFFFFF);
        label.font = KFont(12);
        [_environmentManagerButton addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _environmentManagerButton;
}

-(TSOLogMessageView *)logMegView
{
    if (!_logMegView) {
        _logMegView = [[TSOLogMessageView alloc] init];
        _logMegView.sureButtonBlock = ^{
            [_logMegView removeFromSuperview];
        };
        LayerMakeCorner(_logMegView, Auto_Width(13));
        [self.view addSubview:_logMegView];
        [_logMegView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(Auto_Width(317), Auto_Width(478)));
        }];
    }
    return _logMegView;
}
@end
