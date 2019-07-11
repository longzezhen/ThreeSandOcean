//
//  TSOFeedViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/16.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFeedViewController.h"
#import "TSOLabelTextFieldView.h"
#import "TSOFeedCollectionReusableView.h"
#import "TSOBucketCollectionViewCell.h"
#import "TSOFrameCollectionViewCell.h"
#import "TSOStatisticsCollectionViewCell.h"
#import "TSOMonitoringHeaderCollectionReusableView.h"
#import "TSOSelectDateView.h"
@interface TSOFeedViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,TSOSelectDateViewDelegate>
@property (nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong)TSOFeedCollectionReusableView * feedReusableView;
@property (nonatomic,strong)TSOSelectDateView * dateView;
@end

@implementation TSOFeedViewController

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
    self.view.backgroundColor = ColorFromRGB(0xF8F8F8);
    self.navigationItem.title = @"抓鱼信息";
    self.collectionView.hidden = NO;
    
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:ImageNamed(@"feed_history") forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - action
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    END_EDITING;
}

-(void)clickRightButton
{
    [[AppDelegate shareAppDelegate].window addSubview:self.dateView];
}

#pragma mark - TSOSelectDateViewDelegate
- (void)didSelectDate:(NSDate *)date{
    [self.dateView removeFromSuperview];
    if (!date) {
        return;
    }
//    self.date = date;
//    self.mttTimestamp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
//    self.mttStartTimeLabel.text = [[NSDateFormatter dateFormatterWithFormat:ddMMyyhhmm] stringFromDate:date];
}

#pragma mark - UICollectionViewDelegate/UICollectionViewDataSource
//每个cell的大小，因为有indexPath，所以可以判断哪一组，或者哪一个item，可一个给特定的大小，等同于layout的itemSize属性
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return CGSizeMake(Auto_Width(153),Auto_Width(74));
    }
    if (indexPath.section == 2) {
        return CGSizeMake(Auto_Width(153),Auto_Width(30));
    }
    return CGSizeMake(KScreenWidth - Auto_Width(20),Auto_Width(66));
}

// 设置整个组的缩进量是多少
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 3) {
        return UIEdgeInsetsMake(Auto_Width(15), Auto_Width(10), Auto_Width(15), Auto_Width(10));
    }
    return UIEdgeInsetsMake(Auto_Width(15), Auto_Width(27), Auto_Width(15), Auto_Width(27));
}

// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 12;
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 12;
}

// 指定Section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

// 指定section中的collectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    if (section == 1) {
        return 8;
    }
    if (section == 2) {
        return 6;
    }
    return 1;
}

// 配置section中的collectionViewCell的显示
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
         TSOBucketCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BucketCollectionViewCell" forIndexPath:indexPath];
        LayerMakeCorner(cell, Auto_Width(5));
        return cell;
    }
    if (indexPath.section == 2) {
        TSOFrameCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FrameCollectionViewCell" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.section == 3) {
        TSOStatisticsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StatisticsCollectionViewCell" forIndexPath:indexPath];
        LayerMakeCorner(cell, Auto_Width(8));
        return cell;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section:%ld,row:%ld",indexPath.section,indexPath.row);
    
}

//头部视图大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(KScreenWidth, Auto_Width(132));
    }
    if (section == 3) {
        return CGSizeMake(0, 0);
    }
    CGSize size = CGSizeMake(KScreenWidth, Auto_Width(20));
    return size;
}

//头部视图内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        self.feedReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FeedHeaderCollection" forIndexPath:indexPath];
        return self.feedReusableView;
    }
    
    TSOMonitoringHeaderCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MonitoringHeaderCollection" forIndexPath:indexPath];
    reusableView.moreButton.hidden = YES;
    if (indexPath.section == 1) {
        reusableView.titleLabel.text = @"桶数量";
        reusableView.clickMoreButtonBlock = ^{

        };
    }else if (indexPath.section == 2){
        reusableView.titleLabel.text = @"框数量";
        reusableView.clickMoreButtonBlock = ^{
            NSLog(@"海箱监控");
        };
    }
    return reusableView;
}

#pragma mark - get
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * fl = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-KNavBarHeight-KTabBarHeight) collectionViewLayout:fl];
        _collectionView.bounces = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = ColorFromRGB(0xF8F8F8);
        [_collectionView registerClass:[TSOBucketCollectionViewCell class] forCellWithReuseIdentifier:@"BucketCollectionViewCell"];
        [_collectionView registerClass:[TSOFrameCollectionViewCell class] forCellWithReuseIdentifier:@"FrameCollectionViewCell"];
        [_collectionView registerClass:[TSOStatisticsCollectionViewCell class] forCellWithReuseIdentifier:@"StatisticsCollectionViewCell"];
        [_collectionView registerClass:[TSOMonitoringHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MonitoringHeaderCollection"];
        [_collectionView registerClass:[TSOFeedCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FeedHeaderCollection"];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (TSOSelectDateView *)dateView{
    if (!_dateView) {
        _dateView = [[TSOSelectDateView alloc] init];
        _dateView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        _dateView.delegate = self;
    }
    return _dateView;
}
@end
