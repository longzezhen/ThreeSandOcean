//
//  TSOForgetPasswordViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/6/20.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOForgetPasswordViewController.h"

@interface TSOForgetPasswordViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField * phoneTextField;
@property (nonatomic,strong) UITextField * codeTextField;
@property (nonatomic,strong) UITextField * passwordTextField;
@property (nonatomic,strong) UITextField * surePasswordTextField;
@property (nonatomic,strong) UIButton * sureButton;
@end

@implementation TSOForgetPasswordViewController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

#pragma mark - private
-(void)initView
{
    self.title = @"忘记密码";
    [self goBackBarButton];
    self.phoneTextField.hidden = NO;
    self.codeTextField.hidden = NO;
    self.passwordTextField.hidden = NO;
    self.surePasswordTextField.hidden = NO;
    self.sureButton.hidden = NO;
}

#pragma mark - action
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    END_EDITING;
}

-(void)clickEyeButton:(UIButton*)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.passwordTextField.secureTextEntry = NO;
    }else{
        self.passwordTextField.secureTextEntry = YES;
    }
}

-(void)clickCodeButton:(UIButton*)sender
{
    if (![MYTools checkTelNumber:self.phoneTextField.text]) {
        [self.view showTSOtoast:@"请输入正确手机号"];
        return;
    }
    
    [self startCountDownWithButton:sender];
    [[BaseNetwork shareNetwork] postWithPath:URL_sendSmsCodeForget params:@{@"mobile":self.phoneTextField.text} success:^(NSURLSessionDataTask *task, NSInteger resultCode, id resultObj) {
        if (resultCode == 0) {
            
        }
    } failure:^(NSError *error) {
        
    }];
}

-(void)clickSureButton
{
    if (![MYTools checkTelNumber:self.phoneTextField.text]) {
        [self.view showTSOtoast:@"请输入正确手机号"];
        return;
    }
    if (self.codeTextField.text.length == 0) {
        [self.view showTSOtoast:@"请输入验证码"];
        return;
    }
    if (self.passwordTextField.text.length == 0) {
        [self.view showTSOtoast:@"请输入密码"];
        return;
    }
    if (self.surePasswordTextField.text.length == 0) {
        [self.view showTSOtoast:@"请确认密码"];
        return;
    }
    if (![self.passwordTextField.text isEqualToString:self.surePasswordTextField.text]) {
        [self.view showTSOtoast:@"确认密码与密码不一致"];
        return;
    }
    [[BaseNetwork shareNetwork] postWithPath:URL_ForgetPassword params:@{@"captcha":self.codeTextField.text,@"mobile":self.phoneTextField.text,@"password":self.passwordTextField.text} success:^(NSURLSessionDataTask *task, NSInteger resultCode, id resultObj) {
        if (resultCode == 0) {
            [self.view showTSOtoast:@"密码修改成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }else{
            [self.view showTSOtoast:resultObj[@"message"]];
        }
    } failure:^(NSError *error) {
        [self.view showTSOtoast:@"网络错误"];
    }];
}

#pragma mark - get
-(UITextField *)phoneTextField
{
    if (!_phoneTextField) {
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.textColor = ColorFromRGB(0x000000);
        _phoneTextField.font = KFont(18);
        _phoneTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName:ColorFromRGB(0xC7C7CD),NSFontAttributeName:KFont(14)}];
        _phoneTextField.returnKeyType = UIReturnKeyDone;
        _phoneTextField.keyboardType = UIKeyboardTypePhonePad;
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
            make.top.mas_equalTo(Auto_Width(38));
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

-(UITextField *)codeTextField
{
    if (!_codeTextField) {
        _codeTextField = [[UITextField alloc] init];
        _codeTextField.textColor = ColorFromRGB(0x000000);
        _codeTextField.font = KFont(18);
        _codeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName:ColorFromRGB(0xC7C7CD),NSFontAttributeName:KFont(14)}];
        _codeTextField.returnKeyType = UIReturnKeyDone;
        _codeTextField.keyboardType = UIKeyboardTypePhonePad;
        _codeTextField.tintColor = ColorFromRGB(0x5979FC);
        _codeTextField.delegate = self;
        
        UIView * leftView = [UIView new];
        leftView.frame = CGRectMake(0, 0, 35, 0);
        UIImageView * imageView = [[UIImageView alloc] initWithImage:ImageNamed(@"register_code")];
        [leftView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(15, 20));
        }];
        _codeTextField.leftView = leftView;
        _codeTextField.leftViewMode = UITextFieldViewModeAlways;
        
        UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, 90, 30);
        LayerMakeCorner(rightButton, 5);
        rightButton.backgroundColor = ColorFromRGB(0x5979FC);
        [rightButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [rightButton setTitleColor:ColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        rightButton.titleLabel.font = KFont(12);
        [rightButton addTarget:self action:@selector(clickCodeButton:) forControlEvents:UIControlEventTouchUpInside];
        _codeTextField.rightView = rightButton;
        _codeTextField.rightViewMode = UITextFieldViewModeAlways;
        
        [self.view addSubview:_codeTextField];
        [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.phoneTextField.mas_bottom).mas_equalTo(Auto_Width(35));
            make.left.mas_equalTo(Auto_Width(38));
            make.size.mas_equalTo(CGSizeMake(KScreenWidth-Auto_Width(76),25));
        }];
        
        UIView * bottomLineView = [UIView new];
        bottomLineView.backgroundColor = ColorFromRGB(0xF5F5F5);
        [self.view addSubview:bottomLineView];
        [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(57));
            make.right.mas_equalTo(-Auto_Width(38));
            make.top.mas_equalTo(_codeTextField.mas_bottom).mas_equalTo(18);
            make.height.mas_equalTo(1);
        }];
        
        _codeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //        UIButton *clean = [_phoneTextField valueForKey:@"_clearButton"]; //key是固定的
        //        [clean setImage:[UIImage imageNamed:@"textfile_delete"] forState:UIControlStateNormal];
    }
    return _codeTextField;
}

-(UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.textColor = ColorFromRGB(0x000000);
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
            make.top.mas_equalTo(self.codeTextField.mas_bottom).mas_equalTo(Auto_Width(35));
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

-(UITextField *)surePasswordTextField
{
    if (!_surePasswordTextField) {
        _surePasswordTextField = [[UITextField alloc] init];
        _surePasswordTextField.textColor = ColorFromRGB(0x000000);
        _surePasswordTextField.font = KFont(18);
        _surePasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"确认密码" attributes:@{NSForegroundColorAttributeName:ColorFromRGB(0xC7C7CD),NSFontAttributeName:KFont(14)}];
        _surePasswordTextField.returnKeyType = UIReturnKeyDone;
        _surePasswordTextField.tintColor = ColorFromRGB(0x5979FC);
        _surePasswordTextField.delegate = self;
        _surePasswordTextField.secureTextEntry = YES;
        
        UIView * leftView = [UIView new];
        leftView.frame = CGRectMake(0, 0, 35, 0);
        UIImageView * imageView = [[UIImageView alloc] initWithImage:ImageNamed(@"login_password")];
        [leftView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(15, 20));
        }];
        _surePasswordTextField.leftView = leftView;
        _surePasswordTextField.leftViewMode = UITextFieldViewModeAlways;
        
        UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, 19, 11);
        [rightButton setImage:ImageNamed(@"password_unlook") forState:UIControlStateNormal];
        [rightButton setImage:ImageNamed(@"password_look") forState:UIControlStateSelected];
        [rightButton addTarget:self action:@selector(clickEyeButton:) forControlEvents:UIControlEventTouchUpInside];
        _surePasswordTextField.rightView = rightButton;
        _surePasswordTextField.rightViewMode = UITextFieldViewModeAlways;
        
        [self.view addSubview:_surePasswordTextField];
        [_surePasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.passwordTextField.mas_bottom).mas_equalTo(Auto_Width(35));
            make.left.mas_equalTo(Auto_Width(38));
            make.size.mas_equalTo(CGSizeMake(KScreenWidth-Auto_Width(76),25));
        }];
        
        UIView * bottomLineView = [UIView new];
        bottomLineView.backgroundColor = ColorFromRGB(0xF5F5F5);
        [self.view addSubview:bottomLineView];
        [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(57));
            make.right.mas_equalTo(-Auto_Width(38));
            make.top.mas_equalTo(_surePasswordTextField.mas_bottom).mas_equalTo(18);
            make.height.mas_equalTo(1);
        }];
        
        _surePasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //        UIButton *clean = [_phoneTextField valueForKey:@"_clearButton"]; //key是固定的
        //        [clean setImage:[UIImage imageNamed:@"textfile_delete"] forState:UIControlStateNormal];
    }
    return _surePasswordTextField;
}

-(UIButton *)sureButton
{
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton setBackgroundColor:ColorFromRGB(0x5979FC)];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:ColorFromRGB(0xFEFEFE) forState:UIControlStateNormal];
        _sureButton.titleLabel.font = KFont(18);
        LayerMakeCorner(_sureButton, 8);
        [_sureButton addTarget:self action:@selector(clickSureButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_sureButton];
        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.surePasswordTextField.mas_bottom).mas_equalTo(Auto_Width(40));
            make.left.mas_equalTo(Auto_Width(32));
            make.size.mas_equalTo(CGSizeMake(KScreenWidth-Auto_Width(64), Auto_Width(45)));
        }];
    }
    return _sureButton;
}
@end
