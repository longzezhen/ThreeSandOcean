//
//  TSOWangXiangListViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/6/24.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOWangXiangListViewController.h"
#import "TSOWXListTableViewCell.h"
@interface TSOWangXiangListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation TSOWangXiangListViewController

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
    self.title = @"网箱监控";
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
    TSOWXListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"WXLISTCELL"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return Auto_Width(50);
}

#pragma mark - get
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[TSOWXListTableViewCell class] forCellReuseIdentifier:@"WXLISTCELL"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}
@end
