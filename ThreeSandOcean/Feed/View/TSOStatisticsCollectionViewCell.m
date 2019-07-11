//
//  TSOStatisticsCollectionViewCell.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/7/11.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOStatisticsCollectionViewCell.h"
@interface TSOStatisticsCollectionViewCell()
@property (nonatomic,strong)UILabel * totalValueLabel;
@property (nonatomic,strong)UILabel * suttleValueLabel;
@property (nonatomic,strong)UILabel * tareValueLabel;
@end
@implementation TSOStatisticsCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.totalValueLabel.hidden = NO;
        self.suttleValueLabel.hidden = NO;
        self.tareValueLabel.hidden = NO;
    }
    self.backgroundColor = ColorFromRGB(0xFFFFFF);
    return self;
}

#pragma mark - get
-(UILabel *)totalValueLabel
{
    if (!_totalValueLabel) {
        _totalValueLabel = [UILabel new];
        _totalValueLabel.text = @"77斤";
        _totalValueLabel.textColor = ColorFromRGB(0x6881FD);
        _totalValueLabel.font = KFont(15);
        [self.contentView addSubview:_totalValueLabel];
        [_totalValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(48));
        }];
        
        UILabel * label = [UILabel new];
        label.text = @"总计";
        label.textColor = ColorFromRGB(0x999999);
        label.font = KFont(14);
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_totalValueLabel);
            make.bottom.mas_equalTo(Auto_Width(-11));
        }];
    }
    return _totalValueLabel;
}

-(UILabel *)suttleValueLabel
{
    if (!_suttleValueLabel) {
        _suttleValueLabel = [UILabel new];
        _suttleValueLabel.text = @"177斤";
        _suttleValueLabel.textColor = ColorFromRGB(0x6881FD);
        _suttleValueLabel.font = KFont(15);
        [self.contentView addSubview:_suttleValueLabel];
        [_suttleValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(15));
            make.centerX.mas_equalTo(0);
        }];
        
        UILabel * label = [UILabel new];
        label.text = @"净重";
        label.textColor = ColorFromRGB(0x999999);
        label.font = KFont(14);
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_suttleValueLabel);
            make.bottom.mas_equalTo(Auto_Width(-11));
        }];
    }
    return _suttleValueLabel;
}

-(UILabel *)tareValueLabel
{
    if (!_tareValueLabel) {
        _tareValueLabel = [UILabel new];
        _tareValueLabel.text = @"146斤";
        _tareValueLabel.textColor = ColorFromRGB(0x6881FD);
        _tareValueLabel.font = KFont(15);
        [self.contentView addSubview:_tareValueLabel];
        [_tareValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(15));
            make.right.mas_equalTo(Auto_Width(-48));
        }];
        
        UILabel * label = [UILabel new];
        label.text = @"皮重";
        label.textColor = ColorFromRGB(0x999999);
        label.font = KFont(14);
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_tareValueLabel);
            make.bottom.mas_equalTo(Auto_Width(-11));
        }];
    }
    return _tareValueLabel;
}
@end
