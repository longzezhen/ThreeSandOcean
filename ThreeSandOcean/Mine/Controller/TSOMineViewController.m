//
//  TSOMineViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/16.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOMineViewController.h"
#import "TSOMineListView.h"
#import "TSOMoreViewController.h"
#import "TSOPersonInfoViewController.h"
#import "TSOBreedAquaticsViewController.h"
@interface TSOMineViewController ()
@property (nonatomic,strong)UIImageView * topBackImageView;
@property (nonatomic,strong)UILabel * MineLabel;
@property (nonatomic,strong)UIImageView * iconImageView;
@property (nonatomic,strong)UILabel * userNameLabel;
@property (nonatomic,strong)UILabel * userNumLabel;
@property (nonatomic,strong)UIButton * cancelButton;

@property (nonatomic,strong)TSOMineListView * breedingManagementView;
@property (nonatomic,strong)TSOMineListView * growthLogView;
@property (nonatomic,strong)TSOMineListView * catchToolView;
@property (nonatomic,strong)TSOMineListView * equipmentManagementView;
@property (nonatomic,strong)TSOMineListView * moreView;
@end

@implementation TSOMineViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

#pragma mark - action
-(void)clickLogoutButton
{
    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:nil message:@"确认退出登录？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //[alertC dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[BaseNetwork shareNetwork] getWithPath:URL_Logout token:TOKEN params:nil success:^(NSURLSessionDataTask *task, NSInteger resultCode, id resultObj) {
            if (resultCode == 0) {
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
                [AppDelegate startLoginViewController];
            }else{
                [AppDelegate startLoginViewController];
                [self.view showTSOtoast:resultObj[@"message"]];
            }
        } failure:^(NSError *error) {
            [self.view showTSOtoast:@"网络错误"];
        }];

    }];
    
    [alertC addAction:cancelAction];
    [alertC addAction:okAction];
    [self presentViewController:alertC animated:YES completion:nil];
    
}

-(void)clickIconImageView
{
    TSOPersonInfoViewController * personVC = [TSOPersonInfoViewController new];
    [BaseNavViewController pushViewController:personVC hiddenBottomWhenPush:YES animation:NO fromNavigation:self.navigationController];
}

#pragma mark - private
-(void)initView
{
    self.view.backgroundColor = ColorFromRGB(0xF8F8F8);
    self.topBackImageView.hidden = NO;
    self.breedingManagementView.hidden = NO;
    self.growthLogView.hidden = NO;
    self.catchToolView.hidden = NO;
    self.equipmentManagementView.hidden = NO;
    self.moreView.hidden = NO;
}

#pragma mark - get
-(UIImageView *)topBackImageView
{
    if (!_topBackImageView) {
        _topBackImageView = [[UIImageView alloc] init];
        _topBackImageView.image = ImageNamed(@"mine_top_back");
        _topBackImageView.userInteractionEnabled = YES;
        [self.view addSubview:_topBackImageView];
        [_topBackImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(Auto_Width(234));
        }];
        
        self.MineLabel.hidden = NO;
        self.iconImageView.hidden = NO;
        self.userNameLabel.hidden = NO;
        self.userNumLabel.hidden = NO;
        self.cancelButton.hidden = NO;
    }
    return _topBackImageView;
}

-(UILabel *)MineLabel
{
    if (!_MineLabel) {
        _MineLabel = [UILabel new];
        _MineLabel.text = @"我的";
        _MineLabel.font = KFont(18);
        _MineLabel.textColor = ColorFromRGB(0xFFFFFF);
        [self.topBackImageView addSubview:_MineLabel];
        [_MineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(Auto_Width(34));
        }];
    }
    return _MineLabel;
}

-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithImage:ImageNamed(@"login_logo")];
        _iconImageView.userInteractionEnabled = YES;
        LayerMakeCorner(_iconImageView, Auto_Width(30));
        LayerMakeBorder(_iconImageView, 1, ColorFromRGB(0xFFFFFF).CGColor);
        [self.topBackImageView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(27));
            make.top.mas_equalTo(Auto_Width(75));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(60), Auto_Width(60)));
        }];
        
        UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickIconImageView)];
        [_iconImageView addGestureRecognizer:tapGR];
    }
    return _iconImageView;
}

-(UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = [UILabel new];
        _userNameLabel.text = @"向日葵";
        _userNameLabel.textColor = ColorFromRGB(0xFFFFFF);
        _userNameLabel.font = KFont(18);
        [self.topBackImageView addSubview:_userNameLabel];
        [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(85));
            make.left.mas_equalTo(Auto_Width(98));
        }];
    }
    return _userNameLabel;
}

-(UILabel *)userNumLabel
{
    if (!_userNumLabel) {
        _userNumLabel = [UILabel new];
        _userNumLabel.text = @"18689234979";
        _userNumLabel.textColor = ColorFromRGB(0xFFFFFF);
        _userNumLabel.font = KFont(12);
        [self.topBackImageView addSubview:_userNumLabel];
        [_userNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(114));
            make.left.mas_equalTo(Auto_Width(98));
        }];
    }
    return _userNumLabel;
}

-(UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"注销" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:ColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = KFont(12);
        _cancelButton.backgroundColor = ColorFromRGBA(0xFFFFFF, 0.2);
        [_cancelButton addTarget:self action:@selector(clickLogoutButton) forControlEvents:UIControlEventTouchUpInside];
        LayerMakeCorner(_cancelButton, 9);
        [self.topBackImageView addSubview:_cancelButton];
        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(83));
            make.right.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(50, 18));
        }];
    }
    return _cancelButton;
}

-(TSOMineListView *)breedingManagementView
{
    if (!_breedingManagementView) {
        _breedingManagementView = [[TSOMineListView alloc] init];
        _breedingManagementView.leftImageView.image = ImageNamed(@"mine_breedManage");
        _breedingManagementView.middleLabel.text = @"养殖管理";
        _breedingManagementView.clickViewBlock = ^{
            NSLog(@"breedingManagementView");
        };
        [self.view addSubview:_breedingManagementView];
        [_breedingManagementView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topBackImageView.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];
    }
    return _breedingManagementView;
}

-(TSOMineListView *)growthLogView
{
    if (!_growthLogView) {
        _growthLogView = [[TSOMineListView alloc] init];
        _growthLogView.leftImageView.image = ImageNamed(@"mine_growthLog");
        _growthLogView.middleLabel.text = @"成长日志";
        _growthLogView.clickViewBlock = ^{
            NSLog(@"growthLogView");
        };
        [self.view addSubview:_growthLogView];
        [_growthLogView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.breedingManagementView.mas_bottom);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];
    }
    return _growthLogView;
}

-(TSOMineListView *)catchToolView
{
    if (!_catchToolView) {
        _catchToolView = [[TSOMineListView alloc] init];
        _catchToolView.leftImageView.image = ImageNamed(@"mine_catchTool");
        _catchToolView.middleLabel.text = @"抓鱼工具";
        _catchToolView.clickViewBlock = ^{
            NSLog(@"catchToolView");
        };
        [self.view addSubview:_catchToolView];
        [_catchToolView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.growthLogView.mas_bottom);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];
    }
    return _catchToolView;
}

-(TSOMineListView *)equipmentManagementView
{
    if (!_equipmentManagementView) {
        _equipmentManagementView = [[TSOMineListView alloc] init];
        _equipmentManagementView.leftImageView.image = ImageNamed(@"mine_equManage");
        _equipmentManagementView.middleLabel.text = @"设备管理";
        WEAKSELF;
        _equipmentManagementView.clickViewBlock = ^{
            TSOBreedAquaticsViewController * vc = [TSOBreedAquaticsViewController new];
            [BaseNavViewController pushViewController:vc hiddenBottomWhenPush:YES animation:YES fromNavigation:weakSelf.navigationController];
        };
        _equipmentManagementView.bottomLineView.hidden = NO;
        [self.view addSubview:_equipmentManagementView];
        [_equipmentManagementView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.catchToolView.mas_bottom);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];
    }
    return _equipmentManagementView;
}

-(TSOMineListView *)moreView
{
    if (!_moreView) {
        _moreView = [[TSOMineListView alloc] init];
        _moreView.leftImageView.image = ImageNamed(@"mine_more");
        _moreView.middleLabel.text = @"更多";
        WEAKSELF;
        _moreView.clickViewBlock = ^{
            TSOMoreViewController * moreVC = [[TSOMoreViewController alloc] init];
            [BaseNavViewController pushViewController:moreVC hiddenBottomWhenPush:YES animation:YES fromNavigation:weakSelf.navigationController];
        };
        _moreView.bottomLineView.hidden = NO;
        [self.view addSubview:_moreView];
        [_moreView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.equipmentManagementView.mas_bottom).mas_equalTo(15);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];
    }
    return _moreView;
}
@end
