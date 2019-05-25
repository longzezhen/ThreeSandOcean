//
//  TSOFeedHistoryViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/23.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOFeedHistoryViewController.h"
#import "TSOFeedHistoryTableViewCell.h"
@interface TSOFeedHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation TSOFeedHistoryViewController

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
    self.title = @"历史设定";
    [self goBackBarButton];
    self.tableView.hidden = NO;
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TSOFeedHistoryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FeedHistory"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 109;
}

#pragma mark - get
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[TSOFeedHistoryTableViewCell class] forCellReuseIdentifier:@"FeedHistory"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}
@end
