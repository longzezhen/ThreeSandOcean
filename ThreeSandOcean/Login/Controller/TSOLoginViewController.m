//
//  TSOLoginViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/15.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOLoginViewController.h"

@interface TSOLoginViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UIImageView * logoImageView;
@property (nonatomic,strong)UITextField * phoneTextField;
@property (nonatomic,strong)UITextField * passwordTextField;
@property (nonatomic,strong)UIButton * loginButton;
@property (nonatomic,strong)UIButton * forgotButton;
@end

@implementation TSOLoginViewController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

#pragma mark - private
-(void)initView
{
    self.logoImageView.hidden = NO;
    self.phoneTextField.hidden = NO;
    self.passwordTextField.hidden = NO;
    self.loginButton.hidden = NO;
    self.forgotButton.hidden = NO;
}

#pragma mark - action
-(void)clickEyeButton:(UIButton*)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.passwordTextField.secureTextEntry = NO;
    }else{
        self.passwordTextField.secureTextEntry = YES;
    }
}

-(void)clickLoginButton
{
    [AppDelegate startMainViewController];
}

-(void)clickForgotButton
{
    
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
-(UIImageView*)logoImageView
{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc] init];
        _logoImageView.image = ImageNamed(@"login_logo");
        [self.view addSubview:_logoImageView];
        [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(Auto_Height(139));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(84), Auto_Width(84)));
        }];
    }
    return _logoImageView;
}

-(UITextField *)phoneTextField
{
    if (!_phoneTextField) {
        _phoneTextField = [[UITextField alloc] init];
        //_phoneTextField.textColor = ColorFromRGB(0xC7C7CD);
        _phoneTextField.font = KFont(18);
        _phoneTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号/账号" attributes:@{NSForegroundColorAttributeName:ColorFromRGB(0xC7C7CD),NSFontAttributeName:KFont(14)}];
        _phoneTextField.returnKeyType = UIReturnKeyDone;
        _phoneTextField.keyboardType = UIKeyboardTypeNamePhonePad;
        _phoneTextField.tintColor = ColorFromRGB(0x5979FC);
        _phoneTextField.delegate = self;
        
        UIView * leftView = [UIView new];
        leftView.frame = CGRectMake(0, 0, 35, 0);
        UIImageView * imageView = [[UIImageView alloc] initWithImage:ImageNamed(@"login_phone")];
        [leftView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(15, 20));
        }];
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0xE7E7E7);
        [leftView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(1, 19));
        }];
        _phoneTextField.leftView = leftView;
        _phoneTextField.leftViewMode = UITextFieldViewModeAlways;
        
        [self.view addSubview:_phoneTextField];
        [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.logoImageView.mas_bottom).mas_equalTo(Auto_Height(44));
            make.left.mas_equalTo(Auto_Width(38));
            make.size.mas_equalTo(CGSizeMake(KScreenWidth-Auto_Width(76),25));
        }];
        
        UIView * bottomLineView = [UIView new];
        bottomLineView.backgroundColor = ColorFromRGB(0xF5F5F5);
        [self.view addSubview:bottomLineView];
        [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(57));
            make.right.mas_equalTo(-Auto_Width(38));
            make.top.mas_equalTo(_phoneTextField.mas_bottom).mas_equalTo(18);
            make.height.mas_equalTo(1);
        }];
        
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
//        UIButton *clean = [_phoneTextField valueForKey:@"_clearButton"]; //key是固定的
//        [clean setImage:[UIImage imageNamed:@"textfile_delete"] forState:UIControlStateNormal];
    }
    return _phoneTextField;
}

-(UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        //_phoneTextField.textColor = ColorFromRGB(0xC7C7CD);
        _passwordTextField.font = KFont(18);
        _passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName:ColorFromRGB(0xC7C7CD),NSFontAttributeName:KFont(14)}];
        _passwordTextField.returnKeyType = UIReturnKeyDone;
        _passwordTextField.tintColor = ColorFromRGB(0x5979FC);
        _passwordTextField.delegate = self;
        _passwordTextField.secureTextEntry = YES;
        
        UIView * leftView = [UIView new];
        leftView.frame = CGRectMake(0, 0, 35, 0);
        UIImageView * imageView = [[UIImageView alloc] initWithImage:ImageNamed(@"login_password")];
        [leftView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(15, 20));
        }];
        _passwordTextField.leftView = leftView;
        _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        
        UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, 19, 11);
        [rightButton setImage:ImageNamed(@"password_unlook") forState:UIControlStateNormal];
        [rightButton setImage:ImageNamed(@"password_look") forState:UIControlStateSelected];
        [rightButton addTarget:self action:@selector(clickEyeButton:) forControlEvents:UIControlEventTouchUpInside];
        _passwordTextField.rightView = rightButton;
        _passwordTextField.rightViewMode = UITextFieldViewModeAlways;
        
        [self.view addSubview:_passwordTextField];
        [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.phoneTextField.mas_bottom).mas_equalTo(Auto_Height(35));
            make.left.mas_equalTo(Auto_Width(38));
            make.size.mas_equalTo(CGSizeMake(KScreenWidth-Auto_Width(76),25));
        }];
        
        UIView * bottomLineView = [UIView new];
        bottomLineView.backgroundColor = ColorFromRGB(0xF5F5F5);
        [self.view addSubview:bottomLineView];
        [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(57));
            make.right.mas_equalTo(-Auto_Width(38));
            make.top.mas_equalTo(_passwordTextField.mas_bottom).mas_equalTo(18);
            make.height.mas_equalTo(1);
        }];
        
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //        UIButton *clean = [_phoneTextField valueForKey:@"_clearButton"]; //key是固定的
        //        [clean setImage:[UIImage imageNamed:@"textfile_delete"] forState:UIControlStateNormal];
    }
    return _passwordTextField;
}

-(UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setBackgroundColor:ColorFromRGB(0x5979FC)];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:ColorFromRGB(0xFEFEFE) forState:UIControlStateNormal];
        _loginButton.titleLabel.font = KFont(18);
        LayerMakeCorner(_loginButton, 4);
        [_loginButton addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginButton];
        [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.passwordTextField.mas_bottom).mas_equalTo(Auto_Height(40));
            make.left.mas_equalTo(Auto_Width(32));
            make.size.mas_equalTo(CGSizeMake(KScreenWidth-Auto_Width(64), Auto_Width(45)));
        }];
    }
    return _loginButton;
}

-(UIButton *)forgotButton
{
    if (!_forgotButton) {
        _forgotButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgotButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_forgotButton setTitleColor:ColorFromRGB(0xC7C7CD) forState:UIControlStateNormal];
        _forgotButton.titleLabel.font = KFont(13);
        [_forgotButton addTarget:self action:@selector(clickForgotButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_forgotButton];
        [_forgotButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.loginButton.mas_bottom).mas_equalTo(Auto_Height(12));
            make.right.mas_equalTo(-Auto_Width(30));
            make.size.mas_equalTo(CGSizeMake(65, 13));
        }];
    }
    return _forgotButton;
}
@end
