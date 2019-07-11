//
//  TSOFeedCollectionReusableView.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/7/10.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFeedCollectionReusableView.h"

@implementation TSOFeedCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.headImageView.hidden = NO;
        self.carView.hidden = NO;
        self.heightView.hidden = NO;
        self.fishKindView.hidden = NO;
        self.phoneView.hidden = NO;
        self.standardView.hidden = NO;
    }
    return self;
}

#pragma mark - get
-(UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithImage:ImageNamed(@"catch_head_back")];
        _headImageView.userInteractionEnabled = YES;
        [self addSubview:_headImageView];
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _headImageView;
}

-(TSOLabelTextFieldView *)carView
{
    if (!_carView) {
        _carView = [[TSOLabelTextFieldView alloc] init];
        _carView.leftLabel.text = @"车       辆:";
        [self.headImageView addSubview:_carView];
        [_carView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(23));
            make.top.mas_equalTo(Auto_Width(18));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(150), Auto_Width(20)));
        }];
    }
    return _carView;
}

-(TSOLabelTextFieldView *)heightView
{
    if (!_heightView) {
        _heightView = [[TSOLabelTextFieldView alloc] init];
        _heightView.leftLabel.text = @"框  重  量:";
        [self.headImageView addSubview:_heightView];
        [_heightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(23));
            make.top.mas_equalTo(self.carView.mas_bottom).mas_equalTo(Auto_Width(10));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(150), Auto_Width(20)));
        }];
    }
    return _heightView;
}

-(TSOLabelTextFieldView *)fishKindView
{
    if (!_fishKindView) {
        _fishKindView = [[TSOLabelTextFieldView alloc] init];
        _fishKindView.leftLabel.text = @"鱼种:";
        [self.headImageView addSubview:_fishKindView];
        [_fishKindView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headImageView.mas_centerX).mas_equalTo(10);
            make.top.mas_equalTo(self.carView.mas_bottom).mas_equalTo(Auto_Width(10));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(150), Auto_Width(20)));
        }];
    }
    return _fishKindView;
}

-(TSOLabelTextFieldView *)phoneView
{
    if (!_phoneView) {
        _phoneView = [[TSOLabelTextFieldView alloc] init];
        _phoneView.leftLabel.text = @"司机电话:";
        [self.headImageView addSubview:_phoneView];
        [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(23));
            make.top.mas_equalTo(self.fishKindView.mas_bottom).mas_equalTo(Auto_Width(10));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(150), Auto_Width(20)));
        }];
    }
    return _phoneView;
}

-(TSOLabelTextFieldView *)standardView
{
    if (!_standardView) {
        _standardView = [[TSOLabelTextFieldView alloc] init];
        _standardView.leftLabel.text = @"规格:";
        [self.headImageView addSubview:_standardView];
        [_standardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headImageView.mas_centerX).mas_equalTo(10);
            make.top.mas_equalTo(self.heightView.mas_bottom).mas_equalTo(Auto_Width(10));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(150), Auto_Width(20)));
        }];
    }
    return _standardView;
}
@end
