//
//  TSOFeedDetailViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/23.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFeedDetailViewController.h"
#import "TSOFeedHistoryViewController.h"
@interface TSOFeedDetailViewController ()
@property (nonatomic,strong)UIView * backView;
@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic,strong)UIImageView * feedImageView;
@property (nonatomic,strong)UILabel * capacityLabel;
@property (nonatomic,strong)UILabel * useTimeLabel;
@property (nonatomic,strong)UILabel * buyTimeLabel;
@property (nonatomic,strong)UILabel * fodderStatusLabel;
@property (nonatomic,strong)UILabel * fodderFitLabel;
@property (nonatomic,strong)UILabel * environmentLabel;
@property (nonatomic,strong)UIButton * throwButton;
@property (nonatomic,strong)UIButton * settingButton;

@end

@implementation TSOFeedDetailViewController

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
    self.view.backgroundColor = ColorFromRGB(0xF8F8F8);
    self.title = @"喂料详情";
    [self goBackBarButton];
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:ImageNamed(@"mine_growthLog") forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(clickRightItem) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.backView.hidden = NO;
    self.settingButton.hidden = NO;
    
}

#pragma mark - action
-(void)clickRightItem
{
    TSOFeedHistoryViewController * vc = [TSOFeedHistoryViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickThrowButton
{
    
}

-(void)clickSettingButton
{
    
}

#pragma mark - get
-(UIView *)backView
{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = ColorFromRGB(0xFFFFFF);
        LayerMakeCorner(_backView, Auto_Width(8));
        [self.view addSubview:_backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(10));
            make.left.mas_equalTo(Auto_Width(18));
            make.right.mas_equalTo(Auto_Width(-18));
            make.height.mas_equalTo(Auto_Width(455));
        }];
        self.titleLabel.hidden = NO;
        self.feedImageView.hidden = NO;
        self.capacityLabel.hidden = NO;
        self.throwButton.hidden = NO;
        self.useTimeLabel.hidden = NO;
        self.buyTimeLabel.hidden = NO;
        self.fodderStatusLabel.hidden = NO;
        self.fodderFitLabel.hidden = NO;
        self.environmentLabel.hidden = NO;
    }
    return _backView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"1号饲养机";
        _titleLabel.textColor = ColorFromRGB(0x6881FD);
        _titleLabel.font = KFont(16);
        [self.backView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(Auto_Width(25));
        }];
    }
    return _titleLabel;
}

-(UIImageView *)feedImageView
{
    if (!_feedImageView) {
        _feedImageView = [[UIImageView alloc] initWithImage:ImageNamed(@"feed_ machine_big")];
        [self.backView addSubview:_feedImageView];
        [_feedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(Auto_Width(14));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(170), Auto_Width(196)));
        }];
    }
    return _feedImageView;
}

-(UILabel *)capacityLabel
{
    if (!_capacityLabel) {
        UILabel * label = [UILabel new];
        label.text = @"容量: ";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self.backView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(10));
            make.top.mas_equalTo(self.feedImageView.mas_bottom).mas_equalTo(Auto_Width(25));
        }];
        
        _capacityLabel = [UILabel new];
        _capacityLabel.text = @"500斤";
        _capacityLabel.textColor = ColorFromRGB(0x666666);
        _capacityLabel.font = KFont(15);
        [self.backView addSubview:_capacityLabel];
        [_capacityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right);
        }];
    }
    return _capacityLabel;
}

-(UIButton *)throwButton
{
    if (!_throwButton) {
        _throwButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_throwButton setTitle:@"投料" forState:UIControlStateNormal];
        [_throwButton setTitleColor:ColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _throwButton.titleLabel.font = KFont(16);
        _throwButton.backgroundColor = ColorFromRGB(0x4EDDBF);
        [_throwButton addTarget:self action:@selector(clickThrowButton) forControlEvents:UIControlEventTouchUpInside];
        LayerMakeCorner(_throwButton, 15);
        [self.backView addSubview:_throwButton];
        [_throwButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.capacityLabel);
            make.right.mas_equalTo(Auto_Width(-20));
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
    }
    return _throwButton;
}

-(UILabel *)useTimeLabel
{
    if (!_useTimeLabel) {
        UILabel * label = [UILabel new];
        label.text = @"使用时间: ";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self.backView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(10));
            make.top.mas_equalTo(self.capacityLabel.mas_bottom).mas_equalTo(Auto_Width(14));
        }];
        
        _useTimeLabel = [UILabel new];
        _useTimeLabel.text = @"200小时";
        _useTimeLabel.textColor = ColorFromRGB(0x666666);
        _useTimeLabel.font = KFont(15);
        [self.backView addSubview:_useTimeLabel];
        [_useTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right);
        }];
    }
    return _useTimeLabel;
}

-(UILabel *)buyTimeLabel
{
    if (!_buyTimeLabel) {
        UILabel * label = [UILabel new];
        label.text = @"购买时间: ";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self.backView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(10));
            make.top.mas_equalTo(self.useTimeLabel.mas_bottom).mas_equalTo(Auto_Width(14));
        }];
        
        _buyTimeLabel = [UILabel new];
        _buyTimeLabel.text = @"2019-05-23";
        _buyTimeLabel.textColor = ColorFromRGB(0x666666);
        _buyTimeLabel.font = KFont(15);
        [self.backView addSubview:_buyTimeLabel];
        [_buyTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right);
        }];
    }
    return _buyTimeLabel;
}

-(UILabel *)fodderStatusLabel
{
    if (!_fodderStatusLabel) {
        UILabel * label = [UILabel new];
        label.text = @"饲料情况: ";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self.backView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(10));
            make.top.mas_equalTo(self.buyTimeLabel.mas_bottom).mas_equalTo(Auto_Width(14));
        }];
        
        _fodderStatusLabel = [UILabel new];
        _fodderStatusLabel.text = @"每销售40斤";
        _fodderStatusLabel.textColor = ColorFromRGB(0x666666);
        _fodderStatusLabel.font = KFont(15);
        [self.backView addSubview:_fodderStatusLabel];
        [_fodderStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right);
        }];
    }
    return _fodderStatusLabel;
}

-(UILabel *)fodderFitLabel
{
    if (!_fodderFitLabel) {
        UILabel * label = [UILabel new];
        label.text = @"饲料适用: ";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self.backView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(10));
            make.top.mas_equalTo(self.fodderStatusLabel.mas_bottom).mas_equalTo(Auto_Width(14));
        }];
        
        _fodderFitLabel = [UILabel new];
        _fodderFitLabel.text = @"1-3号颗粒饲料";
        _fodderFitLabel.textColor = ColorFromRGB(0x666666);
        _fodderFitLabel.font = KFont(15);
        [self.backView addSubview:_fodderFitLabel];
        [_fodderFitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right);
        }];
    }
    return _fodderFitLabel;
}

-(UILabel *)environmentLabel
{
    if (!_environmentLabel) {
        UILabel * label = [UILabel new];
        label.text = @"环境指数: ";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self.backView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(10));
            make.top.mas_equalTo(self.fodderFitLabel.mas_bottom).mas_equalTo(Auto_Width(14));
        }];
        
        _environmentLabel = [UILabel new];
        _environmentLabel.text = @"PH/5溶氧/18盐度/16温度/28";
        _environmentLabel.textColor = ColorFromRGB(0x666666);
        _environmentLabel.font = KFont(15);
        [self.backView addSubview:_environmentLabel];
        [_environmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right);
        }];
    }
    return _environmentLabel;
}

-(UIButton *)settingButton
{
    if (!_settingButton) {
        _settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_settingButton setTitle:@"设备设置" forState:UIControlStateNormal];
        [_settingButton setTitleColor:ColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _settingButton.titleLabel.font = KFont(15);
        _settingButton.backgroundColor = ColorFromRGB(0x6881FD);
        LayerMakeCorner(_settingButton, Auto_Width(8));
        [_settingButton addTarget:self action:@selector(clickSettingButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_settingButton];
        [_settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(18));
            make.right.mas_equalTo(Auto_Width(-18));
            make.bottom.mas_equalTo(Auto_Width(-34));
            make.height.mas_equalTo(Auto_Width(37));
        }];
    }
    return _settingButton;
}
@end
