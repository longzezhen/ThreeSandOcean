//
//  TSOWXListTableViewCell.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/6/24.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOWXListTableViewCell.h"
@interface TSOWXListTableViewCell()
@property (nonatomic,strong)UIImageView * leftImageView;
@property (nonatomic,strong)UILabel* middleLabel;
@property (nonatomic,strong)UIImageView * arrowImageView;
@property (nonatomic,strong)UIView * lineView;
@end
@implementation TSOWXListTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.leftImageView.hidden = NO;
        self.middleLabel.hidden = NO;
        self.arrowImageView.hidden = NO;
        self.lineView.hidden = NO;
    }
    
    return self;
}

#pragma mark - get
-(UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
        _leftImageView.image = ImageNamed(@"monitoringListIcon");
        LayerMakeCorner(_leftImageView, Auto_Width(25/2));
        [self.contentView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(22));
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(Auto_Width(25), Auto_Width(25)));
        }];
    }
    return _leftImageView;
}

-(UILabel *)middleLabel
{
    if (!_middleLabel) {
        _middleLabel = [UILabel new];
        _middleLabel.text = @"1号设备监控";
        _middleLabel.textColor = ColorFromRGB(0x666666);
        _middleLabel.font = KFont(15);
        [self.contentView addSubview:_middleLabel];
        [_middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.leftImageView.mas_right).mas_equalTo(Auto_Width(13));
        }];
    }
    return _middleLabel;
}

-(UIImageView *)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [UIImageView new];
        _arrowImageView.image = ImageNamed(@"arrow_right");
        [self.contentView addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(Auto_Width(-25));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(9), Auto_Width(17)));
        }];
    }
    return _arrowImageView;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(60));
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(Auto_Width(-23));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _lineView;
}

@end
