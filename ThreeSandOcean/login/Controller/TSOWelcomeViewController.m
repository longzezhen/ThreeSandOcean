//
//  WelcomeViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/15.
//  Copyright © 2019 tools. All rights reserved.
//

#import "WelcomeViewController.h"
#import "TSOWelcomeView.h"
@interface WelcomeViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) TSOWelcomeView * firstWelcomeView;
@property (nonatomic,strong) TSOWelcomeView * secondWelcomeView;
@property (nonatomic,strong) TSOWelcomeView * thirdWelcomeView;
@property (nonatomic,strong) UIPageControl * pageControl;
@end

@implementation WelcomeViewController
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

#pragma mark - private
-(void)initView
{
    self.scrollView.hidden = NO;
    self.firstWelcomeView.hidden = NO;
    self.secondWelcomeView.hidden = NO;
    self.thirdWelcomeView.hidden = NO;
    self.pageControl.hidden = NO;
}

#pragma mark - action
-(void)valueChanged
{
    self.scrollView.contentOffset = CGPointMake(KScreenWidth*(self.pageControl.currentPage), 0);
}

-(void)clickTgButton
{
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    计算页码
    //    页码 = (contentoffset.x + scrollView一半宽度)/scrollView宽度
    CGFloat scrollviewW =  scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollviewW / 2) /  scrollviewW;
    self.pageControl.currentPage = page;
}

#pragma mark - get
-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _scrollView;
}

-(TSOWelcomeView *)firstWelcomeView
{
    if (!_firstWelcomeView) {
        _firstWelcomeView = [[TSOWelcomeView alloc] init];
        _firstWelcomeView.headImageView.image = ImageNamed(@"welcome_one");
        _firstWelcomeView.middleLabel.text = @"养殖生产记录";
        _firstWelcomeView.bottomLabel.text = @"科学养殖 增产增收";
        [self.scrollView addSubview:_firstWelcomeView];
        [_firstWelcomeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(KScreenWidth, KScreenHeight));
        }];
    }
    return _firstWelcomeView;
}

-(TSOWelcomeView *)secondWelcomeView
{
    if (!_secondWelcomeView) {
        _secondWelcomeView = [[TSOWelcomeView alloc] init];
        _secondWelcomeView.headImageView.image = ImageNamed(@"welcome_two");
        _secondWelcomeView.middleLabel.text = @"质量安全追溯";
        _secondWelcomeView.bottomLabel.text = @"流通千万里 追溯零距离";
        [self.scrollView addSubview:_secondWelcomeView];
        [_secondWelcomeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(self.firstWelcomeView.mas_right).mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(KScreenWidth, KScreenHeight));
        }];
    }
    return _secondWelcomeView;
}

-(TSOWelcomeView *)thirdWelcomeView
{
    if (!_thirdWelcomeView) {
        _thirdWelcomeView = [[TSOWelcomeView alloc] init];
        _thirdWelcomeView.headImageView.image = ImageNamed(@"welcome_three");
        _thirdWelcomeView.middleLabel.text = @"企业分布管理";
        _thirdWelcomeView.bottomLabel.text = @"全地图展现 信息化管理";
        [self.scrollView addSubview:_thirdWelcomeView];
        [_thirdWelcomeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(self.secondWelcomeView.mas_right).mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(KScreenWidth, KScreenHeight));
        }];
        
        UIButton * tgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        LayerMakeCorner(tgButton, Auto_Width(18));
        [tgButton setTitle:@"跳过" forState:UIControlStateNormal];
        [tgButton setTitleColor:ColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        tgButton.titleLabel.font = KFont(13);
        tgButton.backgroundColor = ColorFromRGBA(0x000000, 0.2);
        [tgButton addTarget:self action:@selector(clickTgButton) forControlEvents:UIControlEventTouchUpInside];
        [_thirdWelcomeView addSubview:tgButton];
        [tgButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(25));
            make.right.mas_equalTo(Auto_Width(25));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(36), Auto_Width(36)));
        }];
    }
    return _thirdWelcomeView;
}

-(UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = 3;
        _pageControl.currentPage = 0;
        _pageControl.currentPageIndicatorTintColor = ColorFromRGB(0x6881FD);
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.defersCurrentPageDisplay = YES;
        [_pageControl addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(Auto_Height(20));
            make.bottom.mas_equalTo(Auto_Height(25));
        }];
    }
    return _pageControl;
}
@end
