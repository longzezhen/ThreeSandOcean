//
//  TSOSelectDateView.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/7/11.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOSelectDateView.h"
@interface TSOSelectDateView()
@property (nonatomic,strong) UIView * sureCancelView;
@property (nonatomic,strong) UIDatePicker * picker;
@property (nonatomic,strong) NSDate * date;
@end
@implementation TSOSelectDateView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.sureCancelView.hidden = NO;
        self.picker.hidden = NO;
    }
    return self;
}

#pragma mark - action
-(void)dateChange:(id)sender
{
    UIDatePicker * picker = (UIDatePicker *)sender;
    self.date = picker.date;
}

- (void)clickCancelButton{
    
    [self.delegate didSelectDate:nil];
}

- (void)clickSureButton{
    if (!self.date) {//打开选时间视图直接确定
        [self.delegate didSelectDate:[NSDate date]];
    }else{
        [self.delegate didSelectDate:self.date];
    }
}

#pragma mark - get
- (UIDatePicker*)picker{
    if (!_picker) {
        _picker = [[UIDatePicker alloc] init];
        [self addSubview:_picker];
        _picker.backgroundColor = [UIColor whiteColor];
        [_picker setValue:ColorFromRGB(0x557479) forKey:@"textColor"];
        _picker.datePickerMode  = UIDatePickerModeDate;
        _picker.minimumDate     = [NSDate date];
        _picker.locale          = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];//设置为英文;
        [_picker addTarget:self action:@selector(dateChange:)forControlEvents:UIControlEventValueChanged];
        [_picker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(KScreenWidth, Auto_Width(225)));
            make.centerX.mas_equalTo(0);
        }];
    }
    return _picker;
}

-(UIView *)sureCancelView
{
    if (!_sureCancelView) {
        _sureCancelView = [[UIView alloc] init];
        _sureCancelView.backgroundColor = ColorFromRGB(0xEEEEEE);
        [self addSubview:_sureCancelView];
        [_sureCancelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(Auto_Width(-225));
            make.size.mas_equalTo(CGSizeMake(KScreenWidth, Auto_Width(40)));
            make.centerX.mas_equalTo(0);
        }];
        
        UIButton *btn_cancle = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_cancle setTitle:@"取消" forState:UIControlStateNormal];
        [btn_cancle setTitleColor:ColorFromRGB(0x6881FD) forState:UIControlStateNormal];
        btn_cancle.titleLabel.font = KFont(17);
        [btn_cancle addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
        [_sureCancelView addSubview:btn_cancle];
        [btn_cancle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(10));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(50), Auto_Width(20)));
            make.centerY.mas_equalTo(0);
        }];
        
        UIButton *btn_sure = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn_sure setTitle:@"确定" forState:UIControlStateNormal];
        [btn_sure setTitleColor:ColorFromRGB(0x6881FD) forState:UIControlStateNormal];
        btn_sure.titleLabel.font = KFont(17);
        [btn_sure addTarget:self action:@selector(clickSureButton) forControlEvents:UIControlEventTouchUpInside];
        [_sureCancelView addSubview:btn_sure];
        [btn_sure mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(KScreenWidth - Auto_Width(60));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(50), Auto_Width(20)));
            make.centerY.mas_equalTo(0);
        }];
    }
    return _sureCancelView;
}
@end
