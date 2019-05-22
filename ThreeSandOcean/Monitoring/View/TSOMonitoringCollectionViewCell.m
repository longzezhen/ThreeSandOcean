//
//  TSOMonitoringCollectionViewCell.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/21.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOMonitoringCollectionViewCell.h"

@implementation TSOMonitoringCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backImageView.hidden = NO;
        self.playImageView.hidden = NO;
    }
    return self;
}

#pragma mark - get
-(UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [UIImageView new];
        _backImageView.image = ImageNamed(@"net_cage");
        [self.contentView addSubview:_backImageView];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _backImageView;
}

-(UIImageView *)playImageView
{
    if (!_playImageView) {
        _playImageView = [UIImageView new];
        _playImageView.image = ImageNamed(@"icon_play");
        [self.contentView addSubview:_playImageView];
        [_playImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(Auto_Width(32), Auto_Width(32)));
        }];
    }
    return _playImageView;
}
@end
