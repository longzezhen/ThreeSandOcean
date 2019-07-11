//
//  TSOFrameCollectionViewCell.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/7/11.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFrameCollectionViewCell.h"
@interface TSOFrameCollectionViewCell()
@property (nonatomic,strong)UILabel * leftLabel;
@property (nonatomic,strong)UILabel * valueLabel;
@end
@implementation TSOFrameCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.leftLabel.hidden = NO;
        self.valueLabel.hidden = NO;
    }
    self.backgroundColor = ColorFromRGB(0xFFFFFF);
    return self;
}

#pragma mark - get
-(UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [UILabel new];
        _leftLabel.text = @"第一框";
        _leftLabel.textColor = ColorFromRGB(0x999999);
        _leftLabel.font = KFont(15);
        [self.contentView addSubview:_leftLabel];
        [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(Auto_Width(8));
        }];
    }
    return _leftLabel;
}

-(UILabel *)valueLabel
{
    if (!_valueLabel) {
        _valueLabel = [UILabel new];
        _valueLabel.text = @"24斤";
        _valueLabel.textColor = ColorFromRGB(0x6881FD);
        _valueLabel.font = KFont(15);
        [self.contentView addSubview:_valueLabel];
        [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(Auto_Width(-25));
        }];
    }
    return _valueLabel;
}
@end
