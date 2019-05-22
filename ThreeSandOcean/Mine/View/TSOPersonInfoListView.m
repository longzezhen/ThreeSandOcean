//
//  TSOPersonInfoListView.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/20.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOPersonInfoListView.h"

@implementation TSOPersonInfoListView
-(instancetype)init
{
    if (self = [super init]) {
        self.leftLabel.hidden = NO;
        self.rightLabel.hidden = NO;
        self.arrowImageView.hidden = NO;
        self.bottomLineView.hidden = NO;
    }
    return self;
}

-(UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [UILabel new];
        _leftLabel.textColor = ColorFromRGB(0x666666);
        _leftLabel.font = KFont(15);
        [self addSubview:_leftLabel];
        [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(16);
        }];
    }
    return _leftLabel;
}

-(UILabel*)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = [UILabel new];
        _rightLabel.textColor = ColorFromRGB(0x999999);
        _rightLabel.font = KFont(14);
        [self addSubview:_rightLabel];
        [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-41);
        }];
    }
    return _rightLabel;
}

-(UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] initWithImage:ImageNamed(@"arrow_right")];
        [self addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-16);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(8, 12));
        }];
    }
    return _arrowImageView;
}

-(UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [UIView new];
        _bottomLineView.backgroundColor = ColorFromRGBA(0x7D7D7D, 0.25);
        [self addSubview:_bottomLineView];
        [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
    }
    return _bottomLineView;
}
@end
