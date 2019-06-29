//
//  MYTools.h
//  LZZTools
//
//  Created by 龙泽桢 on 2019/4/4.
//  Copyright © 2019 tools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MYTools : NSObject
//正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *)telNumber;

//正则匹配用户身份证号15或18位
+ (BOOL)validateIdentityCard:(NSString *)identityCard;

//正则匹配邮箱
+ (BOOL)validateEmail:(NSString *)email;

/**
 判断是否是邮政编码
 @param zipCode 传入需要验证的邮政编码字符串
 */
+ (BOOL)validateZipCode:(NSString *)zipCode;

//判断是否是X系列
+ (BOOL)iPhoneXSeries;



//当前应用版本号
+(NSString *)getSystemVersion;
@end

