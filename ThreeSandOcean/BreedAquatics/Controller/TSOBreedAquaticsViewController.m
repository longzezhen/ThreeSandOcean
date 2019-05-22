//
//  TSOBreedAquaticsViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/16.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOBreedAquaticsViewController.h"
#import "TSOBreedAquaticsCollectionViewCell.h"
#import "TSONetcageDetailViewController.h"
@interface TSOBreedAquaticsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView * collectionView;
@end

@implementation TSOBreedAquaticsViewController

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
    self.title = @"养殖";
    self.collectionView.hidden = NO;
}

#pragma mark - UICollectionViewDelegate/UICollectionViewDataSource
//每个cell的大小，因为有indexPath，所以可以判断哪一组，或者哪一个item，可一个给特定的大小，等同于layout的itemSize属性
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(Auto_Width(101),Auto_Width(126));
}

// 设置整个组的缩进量是多少
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(Auto_Width(15), Auto_Width(21), Auto_Width(15), Auto_Width(21));
}

// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

// 指定Section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 指定section中的collectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

// 配置section中的collectionViewCell的显示
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TSOBreedAquaticsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BREEDAQUATICS" forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section:%ld,row:%ld",indexPath.section,indexPath.row);
    TSONetcageDetailViewController * detailVC = [[TSONetcageDetailViewController alloc] init];
    [BaseNavViewController pushViewController:detailVC hiddenBottomWhenPush:YES animation:YES fromNavigation:self.navigationController];
}


#pragma mark - get
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * fl = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-KNavBarHeight-KTabBarHeight-49) collectionViewLayout:fl];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = ColorFromRGB(0xFFFFFF);
        [_collectionView registerClass:[TSOBreedAquaticsCollectionViewCell class] forCellWithReuseIdentifier:@"BREEDAQUATICS"];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
