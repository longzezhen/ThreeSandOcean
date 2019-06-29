//
//  TSOCompleteInfoViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/6/26.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOCompleteInfoViewController.h"

@interface TSOCompleteInfoViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UIImageView * iconImageView;
@property (nonatomic,strong)UILabel * tipLabel;
@property (nonatomic,strong)UITextField * accountTextField;
@property (nonatomic,strong)UITextField * signatureTextField;
@property (nonatomic,strong)UILabel * limitLabel;
@property (nonatomic,strong)UIButton * sureButton;
@property (nonatomic,strong)UIButton * ignoreButton;
@end

@implementation TSOCompleteInfoViewController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

#pragma mark - private
-(void)initView
{
    self.title = @"完善个人信息";
    [self goBackBarButton];
    
    self.iconImageView.hidden = NO;
    self.tipLabel.hidden = NO;
    self.accountTextField.hidden = NO;
    self.signatureTextField.hidden = NO;
    self.sureButton.hidden = NO;
    self.ignoreButton.hidden = NO;
}

#pragma mark - action
-(void)textFieldChange:(UITextField*)textField
{
    if (textField == self.signatureTextField) {
        if (textField.text.length>16) {
            self.signatureTextField.text = [textField.text substringToIndex:16];
        }
        self.limitLabel.text = [NSString stringWithFormat:@"%ld/16",textField.text.length];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    END_EDITING;
}

-(void)clickSureButton
{
    [AppDelegate startLoginViewController];
}

-(void)clickIgnoreButton
{
    [AppDelegate startLoginViewController];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

#pragma mark - get
-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.image = ImageNamed(@"login_logo");
        LayerMakeCorner(_iconImageView, Auto_Width(43));
        [self.view addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(34));
            make.centerX.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(Auto_Width(86), Auto_Width(86)));
        }];
    }
    return _iconImageView;
}

-(UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = [UILabel new];
        _tipLabel.text = @"点击头像可重新上传";
        _tipLabel.textColor = ColorFromRGB(0xDDDDDD);
        _tipLabel.font = KFont(12);
        [self.view addSubview:_tipLabel];
        [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.iconImageView.mas_bottom).mas_equalTo(Auto_Width(10));
        }];
    }
    return _tipLabel;
}

-(UITextField *)accountTextField
{
    if (!_accountTextField) {
        _accountTextField = [[UITextField alloc] init];
        _accountTextField.textColor = ColorFromRGB(0x000000);
        _accountTextField.font = KFont(14);
        _accountTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入用户名" attributes:@{NSForegroundColorAttributeName:ColorFromRGB(0xC7C7CD),NSFontAttributeName:KFont(14)}];
        _accountTextField.returnKeyType = UIReturnKeyDone;
        _accountTextField.tintColor = ColorFromRGB(0x5979FC);
        _accountTextField.delegate = self;
        [self.view addSubview:_accountTextField];
        [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.tipLabel.mas_bottom).mas_equalTo(Auto_Width(43));
            make.left.mas_equalTo(Auto_Width(37));
            make.centerX.mas_equalTo(0);
            make.height.mas_equalTo(Auto_Width(25));
        }];
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xF5F5F5);
        [self.view addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(37));
            make.right.mas_equalTo(Auto_Width(-37));
            make.top.mas_equalTo(_accountTextField.mas_bottom).mas_equalTo(Auto_Width(10));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _accountTextField;
}

-(UITextField *)signatureTextField
{
    if (!_signatureTextField) {
        _signatureTextField = [[UITextField alloc] init];
        _signatureTextField.textColor = ColorFromRGB(0x000000);
        _signatureTextField.font = KFont(14);
        _signatureTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入个性签名" attributes:@{NSForegroundColorAttributeName:ColorFromRGB(0xC7C7CD),NSFontAttributeName:KFont(14)}];
        _signatureTextField.returnKeyType = UIReturnKeyDone;
        _signatureTextField.tintColor = ColorFromRGB(0x5979FC);
        _signatureTextField.delegate = self;
        [_signatureTextField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
        [self.view addSubview:_signatureTextField];
        [_signatureTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.accountTextField.mas_bottom).mas_equalTo(Auto_Width(20));
            make.left.mas_equalTo(Auto_Width(37));
            make.centerX.mas_equalTo(0);
            make.height.mas_equalTo(Auto_Width(25));
        }];
        
        self.limitLabel = [UILabel new];
        self.limitLabel.frame = CGRectMake(0, 0, 35, 20);
        self.limitLabel.text = @"0/16";
        self.limitLabel.textColor = ColorFromRGB(0x5979FC);
        self.limitLabel.font = KFont(12);
        _signatureTextField.rightView = self.limitLabel;
        _signatureTextField.rightViewMode = UITextFieldViewModeAlways;
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xF5F5F5);
        [self.view addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(37));
            make.right.mas_equalTo(Auto_Width(-37));
            make.top.mas_equalTo(_signatureTextField.mas_bottom).mas_equalTo(Auto_Width(10));
            make.height.mas_equalTo(Auto_Width(1));
        }];
    }
    return _signatureTextField;
}

-(UIButton *)sureButton
{
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:ColorFromRGB(0xFEFEFE) forState:UIControlStateNormal];
        _sureButton.titleLabel.font = KFont(18);
        _sureButton.backgroundColor = ColorFromRGB(0x5979FC);
        LayerMakeCorner(_sureButton, 8);
        [_sureButton addTarget:self action:@selector(clickSureButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_sureButton];
        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.left.mas_equalTo(Auto_Width(32));
            make.top.mas_equalTo(self.signatureTextField.mas_bottom).mas_equalTo(Auto_Width(80));
            make.height.mas_equalTo(Auto_Width(45));
        }];
    }
    return _sureButton;
}

-(UIButton *)ignoreButton
{
    if (!_ignoreButton) {
        _ignoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_ignoreButton setTitle:@"跳过" forState:UIControlStateNormal];
        [_ignoreButton setTitleColor:ColorFromRGB(0x5979FC) forState:UIControlStateNormal];
        _ignoreButton.titleLabel.font = KFont(18);
        LayerMakeBorder(_ignoreButton, Auto_Width(1), ColorFromRGB(0x5979FC).CGColor);
        LayerMakeCorner(_ignoreButton, 8);
        [_ignoreButton addTarget:self action:@selector(clickIgnoreButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_ignoreButton];
        [_ignoreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.left.mas_equalTo(Auto_Width(32));
            make.top.mas_equalTo(self.sureButton.mas_bottom).mas_equalTo(Auto_Width(20));
            make.height.mas_equalTo(Auto_Width(45));
        }];
    }
    return _ignoreButton;
}


@end
