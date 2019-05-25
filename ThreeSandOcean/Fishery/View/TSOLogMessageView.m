//
//  TSOLogMessageView.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/24.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOLogMessageView.h"
@interface TSOLogMessageView()
@property (nonatomic,strong) UIImageView * backgroundImageView;
@property (nonatomic,strong) UILabel * numberLabel;
@property (nonatomic,strong) UILabel * kindLabel;
@property (nonatomic,strong) UIButton * cattyButton;
@property (nonatomic,strong) UIButton * centimeterButton;
@property (nonatomic,strong) UIButton * tiaoButton;
@property (nonatomic,strong) UILabel * amountLabel;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * whichFodderLabel;
@property (nonatomic,strong) UILabel * fodderMegLabel;
@property (nonatomic,strong) UILabel * lastTimeLabel;
@property (nonatomic,strong) UILabel * lastAmountLabel;
@property (nonatomic,strong) UILabel * remarkLabel;
@property (nonatomic,strong) UIButton * sureButton;
@end
@implementation TSOLogMessageView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundImageView.hidden = NO;
        self.numberLabel.hidden = NO;
        self.kindLabel.hidden = NO;
        self.cattyButton.hidden = NO;
        self.centimeterButton.hidden = NO;
        self.tiaoButton.hidden = NO;
        self.amountLabel.hidden = NO;
        self.titleLabel.hidden = NO;
        self.whichFodderLabel.hidden = NO;
        self.fodderMegLabel.hidden = NO;
        self.lastTimeLabel.hidden = NO;
        self.lastAmountLabel.hidden = NO;
        self.remarkLabel.hidden = NO;
        self.sureButton.hidden = NO;
    }
    return self;
}

#pragma mark - action
-(void)clickGuigeButton:(UIButton*)sender
{
    if (sender.selected) {
        return;
    }
    switch (sender.tag) {
        case 1:
            self.cattyButton.selected = YES;
            self.centimeterButton.selected = NO;
            self.tiaoButton.selected = NO;
            break;
        case 2:
            self.cattyButton.selected = NO;
            self.centimeterButton.selected = YES;
            self.tiaoButton.selected = NO;
            break;
        case 3:
            self.cattyButton.selected = NO;
            self.centimeterButton.selected = NO;
            self.tiaoButton.selected = YES;
            break;
            
        default:
            break;
    }
}

-(void)clickSureButton
{
    self.sureButtonBlock();
}

#pragma mark - get
-(UIImageView *)backgroundImageView
{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.image = ImageNamed(@"log_message_back");
        [self addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        UILabel * label = [UILabel new];
        label.text = @"日志信息";
        label.textColor = ColorFromRGB(0xFFFFFF);
        label.font = KFont(18);
        [_backgroundImageView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(Auto_Width(48));
        }];
        
        UIView * lineView1 = [UIView new];
        lineView1.backgroundColor = ColorFromRGB(0xA5C3FF);
        [_backgroundImageView addSubview:lineView1];
        [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.right.mas_equalTo(label.mas_left).mas_equalTo(Auto_Width(-14));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(25), Auto_Width(2)));
        }];
        
        UIView * lineView2 = [UIView new];
        lineView2.backgroundColor = ColorFromRGB(0xA5C3FF);
        [_backgroundImageView addSubview:lineView2];
        [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(14));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(25), Auto_Width(2)));
        }];
    }
    return _backgroundImageView;
}

-(UILabel *)numberLabel
{
    if (!_numberLabel) {
        UILabel * label = [UILabel new];
        label.text = @"编号:";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(128));
            make.left.mas_equalTo(Auto_Width(26));
        }];
        
        _numberLabel = [UILabel new];
        _numberLabel.text = @"1号网箱";
        _numberLabel.textColor = ColorFromRGB(0x6881FD);
        _numberLabel.font = KFont(15);
        [self addSubview:_numberLabel];
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(17));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_numberLabel);
            make.top.mas_equalTo(self->_numberLabel.mas_bottom).mas_equalTo(Auto_Width(5));
            make.right.mas_equalTo(Auto_Width(-27));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    
    return _numberLabel;
}

-(UILabel *)kindLabel
{
    if (!_kindLabel) {
        UILabel * label = [UILabel new];
        label.text = @"品种:";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.numberLabel.mas_bottom).mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(26));
        }];
        
        _kindLabel = [UILabel new];
        _kindLabel.text = @"草鱼";
        _kindLabel.textColor = ColorFromRGB(0x6881FD);
        _kindLabel.font = KFont(15);
        [self addSubview:_kindLabel];
        [_kindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(17));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_kindLabel);
            make.top.mas_equalTo(self->_kindLabel.mas_bottom).mas_equalTo(Auto_Width(5));
            make.right.mas_equalTo(Auto_Width(-27));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _kindLabel;
}

-(UIButton *)cattyButton
{
    if (!_cattyButton) {
        UILabel * label = [UILabel new];
        label.text = @"规格:";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.kindLabel.mas_bottom).mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(26));
        }];
        
        _cattyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cattyButton setImage:ImageNamed(@"button_unselected") forState:UIControlStateNormal];
        [_cattyButton setImage:ImageNamed(@"button_selected") forState:UIControlStateSelected];
        [_cattyButton setTitle:@"斤" forState:UIControlStateNormal];
        [_cattyButton setTitleColor:ColorFromRGB(0x999999) forState:UIControlStateNormal];
        _cattyButton.titleLabel.font = KFont(15);
        _cattyButton.tag = 1;
        _cattyButton.selected = YES;
        [_cattyButton addTarget:self action:@selector(clickGuigeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cattyButton];
        [_cattyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(17));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(30), Auto_Width(15)));
        }];
    }
    return _cattyButton;
}

-(UIButton*)centimeterButton
{
    if (!_centimeterButton) {
        _centimeterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_centimeterButton setImage:ImageNamed(@"button_unselected") forState:UIControlStateNormal];
        [_centimeterButton setImage:ImageNamed(@"button_selected") forState:UIControlStateSelected];
        [_centimeterButton setTitle:@"厘米" forState:UIControlStateNormal];
        [_centimeterButton setTitleColor:ColorFromRGB(0x999999) forState:UIControlStateNormal];
        _centimeterButton.titleLabel.font = KFont(15);
        _centimeterButton.tag = 2;
        [_centimeterButton addTarget:self action:@selector(clickGuigeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_centimeterButton];
        [_centimeterButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.cattyButton);
            make.left.mas_equalTo(self.cattyButton.mas_right).mas_equalTo(Auto_Width(16));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(45), Auto_Width(15)));
        }];
    }
    return _centimeterButton;
}

-(UIButton*)tiaoButton
{
    if (!_tiaoButton) {
        _tiaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tiaoButton setImage:ImageNamed(@"button_unselected") forState:UIControlStateNormal];
        [_tiaoButton setImage:ImageNamed(@"button_selected") forState:UIControlStateSelected];
        [_tiaoButton setTitle:@"条" forState:UIControlStateNormal];
        [_tiaoButton setTitleColor:ColorFromRGB(0x999999) forState:UIControlStateNormal];
        _tiaoButton.titleLabel.font = KFont(15);
        _tiaoButton.tag = 3;
        [_tiaoButton addTarget:self action:@selector(clickGuigeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_tiaoButton];
        [_tiaoButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.centimeterButton);
            make.left.mas_equalTo(self.centimeterButton.mas_right).mas_equalTo(Auto_Width(16));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(30), Auto_Width(15)));
        }];
    }
    return _tiaoButton;
}

-(UILabel *)amountLabel
{
    if (!_amountLabel) {
        UILabel * label = [UILabel new];
        label.text = @"数量:";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cattyButton.mas_bottom).mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(26));
        }];
        
        _amountLabel = [UILabel new];
        _amountLabel.text = @"66";
        _amountLabel.textColor = ColorFromRGB(0x6881FD);
        _amountLabel.font = KFont(15);
        [self addSubview:_amountLabel];
        [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(17));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_amountLabel);
            make.top.mas_equalTo(self->_amountLabel.mas_bottom).mas_equalTo(Auto_Width(5));
            make.right.mas_equalTo(Auto_Width(-27));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _amountLabel;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        UILabel * label = [UILabel new];
        label.text = @"品牌:";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.amountLabel.mas_bottom).mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(26));
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.text = @"草鱼";
        _titleLabel.textColor = ColorFromRGB(0x6881FD);
        _titleLabel.font = KFont(15);
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(17));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_titleLabel);
            make.top.mas_equalTo(self->_titleLabel.mas_bottom).mas_equalTo(Auto_Width(5));
            make.right.mas_equalTo(Auto_Width(-27));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _titleLabel;
}

-(UILabel *)whichFodderLabel
{
    if (!_whichFodderLabel) {
        UILabel * label = [UILabel new];
        label.text = @"几号料:";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(26));
        }];
        
        _whichFodderLabel = [UILabel new];
        _whichFodderLabel.text = @"1号网箱";
        _whichFodderLabel.textColor = ColorFromRGB(0x6881FD);
        _whichFodderLabel.font = KFont(15);
        [self addSubview:_whichFodderLabel];
        [_whichFodderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(17));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_whichFodderLabel);
            make.top.mas_equalTo(self->_whichFodderLabel.mas_bottom).mas_equalTo(Auto_Width(5));
            make.right.mas_equalTo(Auto_Width(-27));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _whichFodderLabel;
}

-(UILabel *)fodderMegLabel
{
    if (!_fodderMegLabel) {
        UILabel * label = [UILabel new];
        label.text = @"饲料信息:";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.whichFodderLabel.mas_bottom).mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(26));
        }];
        
        _fodderMegLabel = [UILabel new];
        _fodderMegLabel.text = @"1号网箱";
        _fodderMegLabel.textColor = ColorFromRGB(0x6881FD);
        _fodderMegLabel.font = KFont(15);
        [self addSubview:_fodderMegLabel];
        [_fodderMegLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(17));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_fodderMegLabel);
            make.top.mas_equalTo(self->_fodderMegLabel.mas_bottom).mas_equalTo(Auto_Width(5));
            make.right.mas_equalTo(Auto_Width(-27));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _fodderMegLabel;
}

-(UILabel *)lastTimeLabel
{
    if (!_lastTimeLabel) {
        UILabel * label = [UILabel new];
        label.text = @"饲料信息:";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.fodderMegLabel.mas_bottom).mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(26));
        }];
        
        _lastTimeLabel = [UILabel new];
        _lastTimeLabel.text = @"1号网箱";
        _lastTimeLabel.textColor = ColorFromRGB(0x6881FD);
        _lastTimeLabel.font = KFont(15);
        [self addSubview:_lastTimeLabel];
        [_lastTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(17));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_lastTimeLabel);
            make.top.mas_equalTo(self->_lastTimeLabel.mas_bottom).mas_equalTo(Auto_Width(5));
            make.right.mas_equalTo(Auto_Width(-27));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _lastTimeLabel;
}

-(UILabel *)lastAmountLabel
{
    if (!_lastAmountLabel) {
        UILabel * label = [UILabel new];
        label.text = @"饲料信息:";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.lastTimeLabel.mas_bottom).mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(26));
        }];
        
        _lastAmountLabel = [UILabel new];
        _lastAmountLabel.text = @"1号网箱";
        _lastAmountLabel.textColor = ColorFromRGB(0x6881FD);
        _lastAmountLabel.font = KFont(15);
        [self addSubview:_lastAmountLabel];
        [_lastAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(Auto_Width(17));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_lastAmountLabel);
            make.top.mas_equalTo(self->_lastAmountLabel.mas_bottom).mas_equalTo(Auto_Width(5));
            make.right.mas_equalTo(Auto_Width(-27));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _lastAmountLabel;
}

-(UILabel *)remarkLabel
{
    if (!_remarkLabel) {
        
        _remarkLabel = [UILabel new];
        _remarkLabel.text = @"备注 (日志)";
        _remarkLabel.textColor = ColorFromRGB(0x666666);
        _remarkLabel.font = KFont(15);
        [self addSubview:_remarkLabel];
        [_remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.lastAmountLabel.mas_bottom).mas_equalTo(Auto_Width(15));
            make.left.mas_equalTo(Auto_Width(26));
        }];
    }
    return _remarkLabel;
}

-(UIButton *)sureButton
{
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:ColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _sureButton.titleLabel.font = KFont(16);
        _sureButton.backgroundColor = ColorFromRGB(0x6881FD);
        [_sureButton addTarget:self action:@selector(clickSureButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureButton];
        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(Auto_Width(44));
        }];
    }
    return _sureButton;
}
@end
