//
//  TSOPersonInfoViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/20.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOPersonInfoViewController.h"
#import "TSOPersonInfoListView.h"
@interface TSOPersonInfoViewController ()
@property (nonatomic,strong)UIImageView * iconImageView;
@property (nonatomic,strong)UIButton * changeIconButton;
@property (nonatomic,strong)TSOPersonInfoListView * nameView;
@property (nonatomic,strong)TSOPersonInfoListView * phoneNumView;
@property (nonatomic,strong)TSOPersonInfoListView * addressView;
@end

@implementation TSOPersonInfoViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

#pragma mark - action
-(void)clickRightButton
{
    
}

#pragma mark - private
-(void)initView
{
    self.title = @"个人信息";
    [self goBackBarButton];
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [rightButton setTitleColor:ColorFromRGB(0xA7A7A7) forState:UIControlStateNormal];
    rightButton.titleLabel.font = KFont(16);
    [rightButton addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.iconImageView.hidden = NO;
    self.changeIconButton.hidden = NO;
    self.nameView.hidden = NO;
    self.phoneNumView.hidden = NO;
    self.addressView.hidden = NO;
}

#pragma mark - get
-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.image = ImageNamed(@"login_logo");
        LayerMakeCorner(_iconImageView, 50);
        [self.view addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(43);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    }
    return _iconImageView;
}

-(UIButton *)changeIconButton
{
    if (!_changeIconButton) {
        _changeIconButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_changeIconButton setTitle:@"更换头像" forState:UIControlStateNormal];
        [_changeIconButton setTitleColor:ColorFromRGB(0x6881FD) forState:UIControlStateNormal];
        _changeIconButton.titleLabel.font = KFont(16);
        [self.view addSubview:_changeIconButton];
        [_changeIconButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.iconImageView.mas_bottom).mas_equalTo(15);
        }];
    }
    return _changeIconButton;
}

-(TSOPersonInfoListView *)nameView
{
    if (!_nameView) {
        _nameView = [[TSOPersonInfoListView alloc] init];
        _nameView.leftLabel.text = @"名字";
        _nameView.rightLabel.text = @"向日葵";
        [self.view addSubview:_nameView];
        [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.changeIconButton.mas_bottom).mas_equalTo(15);
            make.height.mas_equalTo(62);
        }];
    }
    return _nameView;
}

-(TSOPersonInfoListView *)phoneNumView
{
    if (!_phoneNumView) {
        _phoneNumView = [[TSOPersonInfoListView alloc] init];
        _phoneNumView.leftLabel.text = @"手机号码";
        _phoneNumView.rightLabel.text = @"18823210975";
        _phoneNumView.arrowImageView.hidden = YES;
        [self.view addSubview:_phoneNumView];
        [_phoneNumView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.nameView.mas_bottom);
            make.height.mas_equalTo(62);
        }];
    }
    return _phoneNumView;
}

-(TSOPersonInfoListView *)addressView
{
    if (!_addressView) {
        _addressView = [[TSOPersonInfoListView alloc] init];
        _addressView.leftLabel.text = @"所在地区";
        _addressView.rightLabel.text = @"广东深圳";
        _addressView.arrowImageView.hidden = YES;
        [self.view addSubview:_addressView];
        [_addressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.phoneNumView.mas_bottom);
            make.height.mas_equalTo(62);
        }];
    }
    return _addressView;
}
@end
