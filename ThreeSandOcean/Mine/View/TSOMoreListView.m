//
//  TSOMoreListView.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/17.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOMoreListView.h"

@implementation TSOMoreListView
-(instancetype)init
{
    if (self = [super init]) {
        self.leftImageView.hidden = NO;
        self.middleLabel.hidden = NO;
        self.rightLabel.hidden = YES;
        self.arrowImageView.hidden = NO;
        self.bottomLineView.hidden = NO;
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(clickView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        self.backgroundColor = ColorFromRGB(0xFFFFFF);
    }
    return self;
}

#pragma mark - action
-(void)clickView
{
    self.clickViewBlock();
}

#pragma mark - get
-(UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
        [self addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
    }
    return _leftImageView;
}

-(UILabel *)middleLabel
{
    if (!_middleLabel) {
        _middleLabel = [UILabel new];
        _middleLabel.textColor = ColorFromRGB(0x6881FD);
        _middleLabel.font = KFont(12);
        [self addSubview:_middleLabel];
        [_middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.leftImageView.mas_right).mas_equalTo(15);
        }];
    }
    return _middleLabel;
}

-(UILabel *)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = [UILabel new];
        _rightLabel.textColor = ColorFromRGB(0xFC666C);
        _rightLabel.font = KFont(12);
        [self addSubview:_rightLabel];
        [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-33);
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
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-15);
            make.size.mas_equalTo(CGSizeMake(9, 17));
        }];
    }
    return _arrowImageView;
}

-(UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [UIView new];
        _bottomLineView.backgroundColor = ColorFromRGB(0xFFF0F0F0);
        [self addSubview:_bottomLineView];
        [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(34);
            make.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
    }
    return _bottomLineView;
}

@end
