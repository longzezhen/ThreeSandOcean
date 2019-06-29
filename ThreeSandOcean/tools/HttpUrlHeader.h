//
//  HttpUrlHeader.h
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/27.
//  Copyright © 2019 tools. All rights reserved.
//


#define URL_base    @"http://39.106.231.175:8081" //服务器地址+端口
/*** 发送短信验证码(注册) ***/
#define URL_sendSmsCodeRegister                             URL_base@"/api/smsCode/register"
/*** 发送短信验证码(忘记密码) ***/
#define URL_sendSmsCodeForget                             URL_base@"/api/smsCode/userforgotpwd"
/*** 账号注册 ***/
#define URL_UserRegister                             URL_base@"/api/user/register"
/*** 账号密码登录 ***/
#define URL_UserLogin                             URL_base@"/api/user/login"
/*** 忘记密码 ***/
#define URL_ForgetPassword                             URL_base@"/api/user/forgetPassword"
/*** 退出登录 ***/
#define URL_Logout                               URL_base@"/api/user/logout"





//#ifndef HttpUrlHeader_h
//#define HttpUrlHeader_h
//
//
//#endif /* HttpUrlHeader_h */
