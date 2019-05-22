//
//  TSOWelcomeView.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/15.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOWelcomeView.h"

@implementation TSOWelcomeView
-(instancetype)init
{
    if (self = [super init]) {
        self.headImageView.hidden = NO;
        self.middleLabel.hidden = NO;
        self.bottomLabel.hidden = NO;
    }
    return self;
}

#pragma mark - get
-(UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        [self addSubview:_headImageView];
        [_headImageView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(467/375*KScreenWidth);
        }];
    }
    return _headImageView;
}

-(UILabel *)middleLabel
{
    if (!_middleLabel) {
        _middleLabel = [UILabel new];
        _middleLabel.textColor = ColorFromRGB(0x6881FD);
        _middleLabel.font = KFont(30);
        [self addSubview:_middleLabel];
        [_middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.headImageView.mas_bottom).mas_equalTo(Auto_Height(31));
        }];
    }
    return _middleLabel;
}

-(UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [UILabel new];
        _bottomLabel.textColor = ColorFromRGB(0xBBBBBB);
        _bottomLabel.font = KFont(15);
        [self addSubview:_bottomLabel];
        [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.middleLabel.mas_bottom).mas_equalTo(Auto_Height(15));
        }];
    }
    return _bottomLabel;
}
@end
