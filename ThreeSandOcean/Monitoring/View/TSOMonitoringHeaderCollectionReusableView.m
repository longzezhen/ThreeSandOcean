//
//  TSOMonitoringHeaderCollectionReusableView.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/21.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOMonitoringHeaderCollectionReusableView.h"

@implementation TSOMonitoringHeaderCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.lineView.hidden = NO;
        self.titleLabel.hidden = NO;
        self.moreButton.hidden = NO;
    }
    return self;
}

-(void)clickMoreButton
{
    self.clickMoreButtonBlock();
}

#pragma mark - get
-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = ColorFromRGB(0x6881FD);
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(26));
            make.bottom.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(Auto_Width(2), Auto_Width(14)));
        }];
    }
    return _lineView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = ColorFromRGB(0x666666);
        _titleLabel.font = KFont(15);
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.lineView.mas_right).mas_equalTo(Auto_Width(7));
            make.centerY.mas_equalTo(self.lineView);
        }];
    }
    return _titleLabel;
}

-(UIButton *)moreButton
{
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
        [_moreButton setTitleColor:ColorFromRGB(0x6881FD) forState:UIControlStateNormal];
        _moreButton.titleLabel.font = KFont(12);
        [_moreButton addTarget:self action:@selector(clickMoreButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_moreButton];
        [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(Auto_Width(-22));
            make.centerY.mas_equalTo(self.lineView);
            make.size.mas_equalTo(CGSizeMake(Auto_Width(23), Auto_Width(12)));
        }];
    }
    return _moreButton;
}
@end
