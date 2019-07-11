//
//  TSOBucketCollectionViewCell.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/7/10.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOBucketCollectionViewCell.h"
@interface TSOBucketCollectionViewCell()
@property (nonatomic,strong)UILabel * nameLabel;
@property (nonatomic,strong)UILabel * stateLabel;
@property (nonatomic,strong)UIView * lineView;
@property (nonatomic,strong)UILabel * heightTipLabel;
@property (nonatomic,strong)UILabel * heightLabel;
@property (nonatomic,strong)UILabel * kongLabel;
@end
@implementation TSOBucketCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.nameLabel.hidden = NO;
        self.stateLabel.hidden = NO;
        self.lineView.hidden = NO;
        self.heightTipLabel.hidden = NO;
        self.heightLabel.hidden = NO;
        self.kongLabel.hidden = NO;
    }
    self.backgroundColor = ColorFromRGB(0xFFFFFF);
    return self;
}

#pragma mark - get
-(UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"第一桶";
        _nameLabel.textColor = ColorFromRGB(0x999999);
        _nameLabel.font = KFont(15);
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(Auto_Width(11));
        }];
    }
    return _nameLabel;
}

-(UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        _stateLabel.text = @"需换桶";
        _stateLabel.textColor = ColorFromRGB(0xFFFFFF);
        _stateLabel.font = KFont(8);
        _stateLabel.backgroundColor = ColorFromRGB(0x4EDDBF);
        LayerMakeCorner(_stateLabel, Auto_Width(8));
        [self.contentView addSubview:_stateLabel];
        [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.nameLabel);
            make.right.mas_equalTo(Auto_Width(-11));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(43), Auto_Width(15)));
        }];
    }
    return _stateLabel;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameLabel);
            make.right.mas_equalTo(self.stateLabel);
            make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_equalTo(Auto_Width(8));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _lineView;
}

-(UILabel *)heightTipLabel
{
    if (!_heightTipLabel) {
        _heightTipLabel = [UILabel new];
        _heightTipLabel.text = @"净重";
        _heightTipLabel.textColor = ColorFromRGB(0x999999);
        _heightTipLabel.font = KFont(12);
        [self.contentView addSubview:_heightTipLabel];
        [_heightTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.lineView);
            make.top.mas_equalTo(self.lineView.mas_bottom).mas_equalTo(Auto_Width(16));
        }];
    }
    return _heightTipLabel;
}

-(UILabel *)heightLabel
{
    if (!_heightLabel) {
        _heightLabel = [UILabel new];
        _heightLabel.text = @"295斤";
        _heightLabel.textColor = ColorFromRGB(0x6881FD);
        _heightLabel.font = KFont(12);
        [self.contentView addSubview:_heightLabel];
        [_heightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.heightTipLabel);
            make.left.mas_equalTo(self.heightTipLabel.mas_right).mas_equalTo(18);
        }];
    }
    return _heightLabel;
}

-(UILabel *)kongLabel
{
    if (!_kongLabel) {
        _kongLabel = [UILabel new];
        _kongLabel.text = @"空";
        _kongLabel.textAlignment = NSTextAlignmentCenter;
        _kongLabel.textColor = ColorFromRGB(0xDDDDDD);
        _kongLabel.font = KFont(9);
        LayerMakeCorner(_kongLabel, Auto_Width(3));
        LayerMakeBorder(_kongLabel, Auto_Width(1), ColorFromRGB(0xDDDDDD).CGColor);
        [self.contentView addSubview:_kongLabel];
        [_kongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.heightLabel);
            make.right.mas_equalTo(Auto_Width(-11));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(44), Auto_Width(16)));
        }];
    }
    return _kongLabel;
}
@end
