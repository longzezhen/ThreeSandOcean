//
//  TSOBreedAquaticsCollectionViewCell.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/21.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOBreedAquaticsCollectionViewCell.h"

@implementation TSOBreedAquaticsCollectionViewCell
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
        _imageView.image = ImageNamed(@"net_cage");
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(Auto_Width(101), Auto_Width(101)));
        }];
    }
    return _imageView;
}

-(UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.text = @"1号网箱";
        _bottomLabel.textColor = ColorFromRGB(0x666666);
        _bottomLabel.font = KFont(14);
        [self.contentView addSubview:_bottomLabel];
        [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_equalTo(Auto_Width(8));
        }];
    }
    return _bottomLabel;
}
@end
