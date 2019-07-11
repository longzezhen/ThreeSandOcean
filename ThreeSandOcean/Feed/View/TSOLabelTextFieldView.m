//
//  TSOLabelTextFieldView.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/7/10.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOLabelTextFieldView.h"

@interface TSOLabelTextFieldView()<UITextFieldDelegate>

@end
@implementation TSOLabelTextFieldView
-(instancetype)init
{
    if (self = [super init]) {
        self.leftLabel.hidden = NO;
        self.rightTextField.hidden = NO;
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    END_EDITING;
    return YES;
}

#pragma mark - get
-(UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [UILabel new];
        _leftLabel.text = @"车    辆:";
        _leftLabel.textColor = ColorFromRGB(0xFFFFFF);
        _leftLabel.font = KFont(14);
        [self addSubview:_leftLabel];
        [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _leftLabel;
}

-(UITextField *)rightTextField
{
    if (!_rightTextField) {
        _rightTextField = [UITextField new];
        _rightTextField.delegate = self;
        [self addSubview:_rightTextField];
        [_rightTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.leftLabel);
            make.left.mas_equalTo(self.leftLabel.mas_right).mas_equalTo(Auto_Width(5));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(85), Auto_Width(15)));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0x879CFF);
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_rightTextField);
            make.top.mas_equalTo(_rightTextField.mas_bottom);
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _rightTextField;
}
@end
