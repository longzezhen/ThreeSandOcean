//
//  TSONetcageDetailViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/21.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSONetcageDetailViewController.h"

@interface TSONetcageDetailViewController ()
@property (nonatomic,strong) UIImageView * iconImageView;
@property (nonatomic,strong) UILabel * firstLabel;
@property (nonatomic,strong) UILabel * secondLabel;
@property (nonatomic,strong) UILabel * thirdLabel;
@property (nonatomic,strong) UILabel * forthLabel;
@property (nonatomic,strong) UITextView * introduceTextView;
@end

@implementation TSONetcageDetailViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - private
-(void)initView
{
    self.title = @"网箱动态";
    [self goBackBarButton];
    self.iconImageView.hidden = NO;
    self.firstLabel.hidden = NO;
    self.secondLabel.hidden = NO;
    self.thirdLabel.hidden = NO;
    self.forthLabel.hidden = NO;
    self.introduceTextView.hidden = NO;
}

#pragma mark - action
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    END_EDITING;
}

#pragma mark - get
-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.image = ImageNamed(@"net_cage");
        LayerMakeCorner(_iconImageView, Auto_Width(8));
        [self.view addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Auto_Width(30));
            make.top.mas_equalTo(Auto_Width(26));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(139), Auto_Width(139)));
        }];
    }
    return _iconImageView;
}

-(UILabel *)firstLabel
{
    if (!_firstLabel) {
        _firstLabel = [UILabel new];
        _firstLabel.text = @"网箱001";
        _firstLabel.textColor = ColorFromRGB(0x6881FD);
        _firstLabel.font = KFont(18);
        [self.view addSubview:_firstLabel];
        [_firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(45));
            make.left.mas_equalTo(Auto_Width(204));
        }];
    }
    return _firstLabel;
}

-(UILabel *)secondLabel
{
    if (!_secondLabel) {
        _secondLabel = [UILabel new];
        _secondLabel.text = @"偏属性";
        _secondLabel.textColor = ColorFromRGB(0x666666);
        _secondLabel.font = KFont(15);
        [self.view addSubview:_secondLabel];
        [_secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(81));
            make.left.mas_equalTo(Auto_Width(204));
        }];
    }
    return _secondLabel;
}

-(UILabel *)thirdLabel
{
    if (!_thirdLabel) {
        _thirdLabel = [UILabel new];
        _thirdLabel.text = @"水温正常10°C";
        _thirdLabel.textColor = ColorFromRGB(0x666666);
        _thirdLabel.font = KFont(15);
        [self.view addSubview:_thirdLabel];
        [_thirdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(105));
            make.left.mas_equalTo(Auto_Width(204));
        }];
    }
    return _thirdLabel;
}

-(UILabel *)forthLabel
{
    if (!_forthLabel) {
        _forthLabel = [UILabel new];
        _forthLabel.textAlignment = NSTextAlignmentCenter;
        _forthLabel.text = @"运转正常";
        _forthLabel.textColor = ColorFromRGB(0xFFFFFF);
        _forthLabel.font = KFont(15);
        _forthLabel.backgroundColor = ColorFromRGB(0x4EDDBF);
        LayerMakeCorner(_forthLabel, Auto_Width(13));
        [self.view addSubview:_forthLabel];
        [_forthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(128));
            make.left.mas_equalTo(Auto_Width(204));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(80), Auto_Width(25)));
        }];
    }
    return _forthLabel;
}

-(UITextView *)introduceTextView
{
    if (!_introduceTextView) {
        _introduceTextView = [UITextView new];
        _introduceTextView.userInteractionEnabled = NO;
        _introduceTextView.textColor = ColorFromRGB(0x999999);
        _introduceTextView.font = KFont(14);
        _introduceTextView.text = @"网箱001整体运作正常，有人说，海洋是人类最后 的狩猎场。茫茫大海，不知洒下过多少渔民的汗水 ，留下过多少渔民张网捕鱼的影子。网箱001整体运作正常，有人说，海洋是人类最后 的狩猎场。茫茫大海，不知洒下过多少渔民的汗水 ，留下过多少渔民张网捕鱼的影子。";
        _introduceTextView.backgroundColor = ColorFromRGB(0xFFFFFF);
        _introduceTextView.contentInset = UIEdgeInsetsMake(Auto_Width(40), Auto_Width(17), Auto_Width(17), Auto_Width(17));
        LayerMakeCorner(_introduceTextView, Auto_Width(8));
        [self.view addSubview:_introduceTextView];
        [_introduceTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconImageView.mas_bottom).mas_equalTo(Auto_Width(28));
            make.left.mas_equalTo(Auto_Width(18));
            make.right.mas_equalTo(Auto_Width(-18));
            make.bottom.mas_equalTo(Auto_Width(-16));
        }];
        
        UIView * lineView = [UIView new];
        lineView.backgroundColor = ColorFromRGB(0x6881FD);
        [self.view addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_introduceTextView).mas_equalTo(Auto_Width(16));
            make.left.mas_equalTo(_introduceTextView).mas_equalTo(Auto_Width(13));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(2), Auto_Width(14)));
        }];
        
        UILabel * label = [UILabel new];
        label.text = @"介绍";
        label.textColor = ColorFromRGB(0x666666);
        label.font = KFont(15);
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(lineView);
            make.left.mas_equalTo(_introduceTextView).mas_equalTo(Auto_Width(20));
        }];
    }
    return _introduceTextView;
}
@end
