//
//  TSOFeedHistoryTableViewCell.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/23.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFeedHistoryTableViewCell.h"
@interface TSOFeedHistoryTableViewCell()
@property (nonatomic,strong)UIView * backView;
@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic,strong)UILabel * timeLabel;
@property (nonatomic,strong)UIView * lineView;
@property (nonatomic,strong)UILabel * settingTimeLabel;
@property (nonatomic,strong)UILabel * settingNumLabel;
@end

@implementation TSOFeedHistoryTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backView.hidden = NO;
    }
    self.backgroundColor = ColorFromRGB(0xF8F8F8);
    return self;
}

#pragma mark - get
-(UIView *)backView
{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = ColorFromRGB(0xFFFFFF);
        LayerMakeCorner(_backView, 8);
        [self.contentView addSubview:_backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(0);
        }];
        self.titleLabel.hidden = NO;
        self.timeLabel.hidden = NO;
        self.lineView.hidden = NO;
        self.settingTimeLabel.hidden = NO;
        self.settingNumLabel.hidden = NO;
    }
    return _backView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"1号饲料机";
        _titleLabel.textColor = ColorFromRGB(0x6881FD);
        _titleLabel.font = KFont(15);
        [self.backView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(13);
            make.left.mas_equalTo(11);
        }];
    }
    return _titleLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.text = @"2019-05-23";
        _timeLabel.textColor = ColorFromRGB(0xBBBBBB);
        _timeLabel.font = KFont(14);
        [self.backView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.titleLabel);
            make.right.mas_equalTo(-13);
        }];
        
    }
    return _timeLabel;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self.backView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(13);
            make.left.mas_equalTo(11);
            make.right.mas_equalTo(-13);
            make.height.mas_equalTo(1);
        }];
    }
    return _lineView;
}

-(UILabel *)settingTimeLabel
{
    if (!_settingTimeLabel) {
        UILabel * label = [UILabel new];
        label.text = @"设定时间: ";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(14);
        [self.backView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(9);
            make.top.mas_equalTo(self.lineView.mas_bottom).mas_equalTo(10);
        }];
        
        _settingTimeLabel = [UILabel new];
        _settingTimeLabel.text = @"8:00";
        _settingTimeLabel.textColor = ColorFromRGB(0x666666);
        _settingTimeLabel.font = KFont(14);
        [self.backView addSubview:_settingTimeLabel];
        [_settingTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right);
        }];
    }
    return _settingTimeLabel;
}

-(UILabel *)settingNumLabel
{
    if (!_settingNumLabel) {
        UILabel * label = [UILabel new];
        label.text = @"设定时间: ";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(14);
        [self.backView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(9);
            make.top.mas_equalTo(self.settingTimeLabel.mas_bottom).mas_equalTo(10);
        }];
        
        _settingNumLabel = [UILabel new];
        _settingNumLabel.text = @"8:00";
        _settingNumLabel.textColor = ColorFromRGB(0x666666);
        _settingNumLabel.font = KFont(14);
        [self.backView addSubview:_settingNumLabel];
        [_settingNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right);
        }];
    }
    return _settingNumLabel;
}
@end
