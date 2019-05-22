//
//  TSOMoreViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/17.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOMoreViewController.h"
#import "TSOMoreListView.h"
#import "TSOAboutUsViewController.h"
#import "TSOFeedbackViewController.h"
@interface TSOMoreViewController ()
@property (nonatomic,strong) TSOMoreListView * ideaFeedback;
@property (nonatomic,strong) TSOMoreListView * versionInfo;
@property (nonatomic,strong) TSOMoreListView * versionUpdate;
@end

@implementation TSOMoreViewController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

#pragma mark - private
-(void)initView
{
    self.title = @"更多";
    [self goBackBarButton];
    self.view.backgroundColor = ColorFromRGB(0xF8F8F8);
    self.ideaFeedback.hidden = NO;
    self.versionInfo.hidden = NO;
    self.versionUpdate.hidden = NO;
    
}

#pragma mark - get
-(TSOMoreListView *)ideaFeedback
{
    if (!_ideaFeedback) {
        _ideaFeedback = [[TSOMoreListView alloc] init];
        _ideaFeedback.leftImageView.image = ImageNamed(@"mine_ideaFeedback");
        _ideaFeedback.middleLabel.text = @"意见反馈";
        __weak typeof(self) weakself = self;
        _ideaFeedback.clickViewBlock = ^{
            NSLog(@"意见反馈");
            TSOFeedbackViewController * fbVC = [TSOFeedbackViewController new];
            [weakself.navigationController pushViewController:fbVC animated:YES];
        };
        
        [self.view addSubview:_ideaFeedback];
        [_ideaFeedback mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];
    }
    return _ideaFeedback;
}

-(TSOMoreListView *)versionInfo
{
    if (!_versionInfo) {
        _versionInfo = [[TSOMoreListView alloc] init];
        _versionInfo.leftImageView.image = ImageNamed(@"mine_versionInfo");
        _versionInfo.middleLabel.text = @"版本信息";
        _versionInfo.bottomLineView.hidden = YES;
        __weak typeof(self) weakself = self;
        _versionInfo.clickViewBlock = ^{
            NSLog(@"版本信息");
            TSOAboutUsViewController * aboutUsVC = [[TSOAboutUsViewController alloc] init];
            [weakself.navigationController pushViewController:aboutUsVC animated:YES];
        };
        
        [self.view addSubview:_versionInfo];
        [_versionInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.ideaFeedback.mas_bottom);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];
    }
    return _versionInfo;
}

-(TSOMoreListView *)versionUpdate
{
    if (!_versionUpdate) {
        _versionUpdate = [[TSOMoreListView alloc] init];
        _versionUpdate.leftImageView.image = ImageNamed(@"mine_update");
        _versionUpdate.middleLabel.text = @"版本更新";
        _versionUpdate.bottomLineView.hidden = YES;
        _versionUpdate.rightLabel.hidden = NO;
        _versionUpdate.rightLabel.text = @"V0.01";
        _versionUpdate.clickViewBlock = ^{
            NSLog(@"版本更新");
        };
        
        [self.view addSubview:_versionUpdate];
        [_versionUpdate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.versionInfo.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];
    }
    return _versionUpdate;
}
@end
