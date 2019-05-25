//
//  TSOFeedMachineCollectionViewCell.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/23.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFeedMachineCollectionViewCell.h"

@implementation TSOFeedMachineCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.hidden = NO;
        self.bottomLabel.hidden = NO;
    }
    return self;
}

#pragma mark - get
-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = ImageNamed(@"feed_ machine");
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(Auto_Width(62), Auto_Width(95)));
        }];
    }
    return _imageView;
}

-(UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.text = @"1号投饲机";
        _bottomLabel.textColor = ColorFromRGB(0x666666);
        _bottomLabel.font = KFont(14);
        [self.contentView addSubview:_bottomLabel];
        [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_equalTo(Auto_Width(15));
        }];
    }
    return _bottomLabel;
}
@end
