//
//  TSOAboutUsViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/21.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOAboutUsViewController.h"

@interface TSOAboutUsViewController ()
@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,strong)UILabel * versionInfoLabel;
@property (nonatomic,strong)UILabel * bottomLabel;
@end

@implementation TSOAboutUsViewController

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
    self.title = @"关于我们";
    [self goBackBarButton];
    self.imageView.hidden = NO;
    self.versionInfoLabel.hidden = NO;
    self.bottomLabel.hidden = NO;
}

#pragma mark - get
-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.image = ImageNamed(@"login_logo");
        LayerMakeCorner(_imageView, 42);
        [self.view addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(81);
            make.size.mas_equalTo(CGSizeMake(84, 84));
        }];
    }
    return _imageView;
}

-(UILabel *)versionInfoLabel
{
    if (!_versionInfoLabel) {
        _versionInfoLabel = [UILabel new];
        _versionInfoLabel.text = @"版本V1.0.0";
        _versionInfoLabel.textColor = ColorFromRGB(0x333333);
        _versionInfoLabel.font = KFont(14);
        [self.view addSubview:_versionInfoLabel];
        [_versionInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_equalTo(46);
        }];
    }
    return _versionInfoLabel;
}

-(UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [UILabel new];
        _bottomLabel.text = @"© 2012-2019  三沙蓝海洋工程有限公司所有";
        _bottomLabel.textColor = ColorFromRGB(0x333333);
        _bottomLabel.font = KFont(14);
        [self.view addSubview:_bottomLabel];
        [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.versionInfoLabel.mas_bottom).mas_equalTo(20);
        }];
    }
    return _bottomLabel;
}
@end
