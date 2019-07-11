//
//  TSOEnvironmentManagerViewController.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/23.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOEnvironmentManagerViewController.h"

@interface TSOEnvironmentManagerViewController ()
@property (nonatomic,strong) PYEchartsView * barEchartView;
@property (nonatomic,strong) PYOption * barOption;
@property (nonatomic,strong) UIButton * kindButton;
@property (nonatomic,strong) UILabel * kindLabel;
@property (nonatomic,strong) PYEchartsView * lineEchartView;
@property (nonatomic,strong) PYOption * lineOption;

@end

@implementation TSOEnvironmentManagerViewController

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
    self.title = @"环境管理";
    [self goBackBarButton];
    [self.barEchartView loadEcharts];
    self.kindButton.hidden = NO;
    self.kindLabel.hidden = NO;
    [self.lineEchartView loadEcharts];
}

#pragma mark - action
-(void)clickKindButton
{
    
}

#pragma mark - get
-(PYEchartsView *)barEchartView
{
    if (!_barEchartView) {
        _barEchartView = [[PYEchartsView alloc] init];
        [_barEchartView setOption:self.barOption];
        [self.view addSubview:_barEchartView];
        [_barEchartView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Auto_Width(30));
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(KScreenWidth);
            make.height.mas_equalTo(Auto_Width(300));
        }];
    }
    return _barEchartView;
}

-(PYOption *)barOption
{
    if (!_barOption) {
        _barOption = [PYOption initPYOptionWithBlock:^(PYOption *option) {
            option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
                title.textEqual(@"每日监测图");
            }])
            .gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
                grid.xEqual(@40).x2Equal(@50);
            }])
            .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
                tooltip.triggerEqual(PYTooltipTriggerAxis);
            }])
            .legendEqual([PYLegend initPYLegendWithBlock:^(PYLegend *legend) {
                legend.dataEqual(@[@"溶氧",@"盐度",@"温度"]);
            }])
//            .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
//                toolbox.showEqual(YES)
//                .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
//                    feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
//                        mark.showEqual(YES);
//                    }])
//                    .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
//                        dataView.showEqual(YES).readOnlyEqual(NO);
//                    }])
//                    .magicTypeEqual([PYToolboxFeatureMagicType initPYToolboxFeatureMagicTypeWithBlock:^(PYToolboxFeatureMagicType *magicType) {
//                        magicType.showEqual(YES).typeEqual(@[PYSeriesTypeLine, PYSeriesTypeBar]);
//                    }])
//                    .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
//                        restore.showEqual(YES);
//                    }]);
//                }]);
//            }])
            .calculableEqual(YES)
            .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
                axis.typeEqual(PYAxisTypeCategory)
                .addDataArr(@[@"08:00",@"10:00",@"12:00",@"14:00",@"17:00"]);
            }])
            .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
                axis.typeEqual(PYAxisTypeValue);
            }])
            .addSeries([PYCartesianSeries initPYSeriesWithBlock:^(PYSeries *series) {
                series.nameEqual(@"溶氧")
                .typeEqual(PYSeriesTypeBar)
                .addDataArr(@[@20, @49, @37, @23, @25]);
//                .markPointEqual([PYMarkPoint initPYMarkPointWithBlock:^(PYMarkPoint *point) {
//                    point.addData(@{@"type":@"max", @"name":@"最大值"})
//                    .addData(@{@"type":@"min", @"name":@"最小值"});
//                }])
//                .markLineEqual([PYMarkLine initPYMarkLineWithBlock:^(PYMarkLine *markLine) {
//                    markLine.addData(@{@"type":@"average", @"name":@"平均值"});
//                }]);
            }])
            .addSeries([PYCartesianSeries initPYSeriesWithBlock:^(PYSeries *series) {
                series.nameEqual(@"盐度")
                .typeEqual(PYSeriesTypeBar)
                .addDataArr(@[@20, @49, @37, @23, @25]);
//                .markPointEqual([PYMarkPoint initPYMarkPointWithBlock:^(PYMarkPoint *point) {
//                    point.addData(@{@"name":@"年最高", @"value":@182.2, @"xAxis":@7, @"yAxis":@183, @"symbolSize":@18})
//                    .addData(@{@"name":@"年最低", @"value":@2.3, @"xAxis":@11, @"yAxis":@3});
//                }])
//                .markLineEqual([PYMarkLine initPYMarkLineWithBlock:^(PYMarkLine *markLine) {
//                    markLine.addData(@{@"type":@"average", @"name":@"平均值"});
//                }]);
            }])
            .addSeries([PYCartesianSeries initPYSeriesWithBlock:^(PYSeries *series) {
                series.nameEqual(@"温度")
                .typeEqual(PYSeriesTypeBar)
                .addDataArr(@[@20, @49, @37, @23, @25])
                .markPointEqual([PYMarkPoint initPYMarkPointWithBlock:^(PYMarkPoint *point) {
                    point.addData(@{@"name":@"日最高", @"value":@49, @"xAxis":@1, @"yAxis":@49, @"symbolSize":@10})
                    .addData(@{@"name":@"日最低", @"value":@20, @"xAxis":@0, @"yAxis":@20, @"symbolSize":@10});
                }])
                .markLineEqual([PYMarkLine initPYMarkLineWithBlock:^(PYMarkLine *markLine) {
                    markLine.addData(@{@"type":@"average", @"name":@"平均值"});
                }]);
            }]);
        }];
    }
    return _barOption;
}

-(UIButton *)kindButton
{
    if (!_kindButton) {
        _kindButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_kindButton setTitle:@"溶氧" forState:UIControlStateNormal];
        [_kindButton setTitleColor:ColorFromRGB(0x000000) forState:UIControlStateNormal];
        _kindButton.titleLabel.font = KFont(20);
        [_kindButton setImage:ImageNamed(@"password_look") forState:UIControlStateNormal];
        [_kindButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:Auto_Width(30)];
        [_kindButton addTarget:self action:@selector(clickKindButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_kindButton];
        [_kindButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.barEchartView.mas_bottom).mas_equalTo(Auto_Width(30));
            make.left.mas_equalTo(Auto_Width(5));
            make.size.mas_equalTo(CGSizeMake(Auto_Width(100), Auto_Width(30)));
        }];
        
        UILabel * label = [UILabel new];
        label.text = @"本月";
        label.textColor = [UIColor blueColor];
        label.font = KFont(17);
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_kindButton);
            make.left.mas_equalTo(_kindButton.mas_right).mas_equalTo(Auto_Width(10));
        }];
    }
    return _kindButton;
}

-(UILabel *)kindLabel
{
    if (!_kindLabel) {
        _kindLabel = [UILabel new];
        _kindLabel.text = @"溶氧:PH/5";
        _kindLabel.textColor = [UIColor blueColor];
        _kindLabel.font = KFont(17);
        [self.view addSubview:_kindLabel];
        [_kindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_kindButton);
            make.right.mas_equalTo(Auto_Width(-30));
        }];
    }
    return _kindLabel;
}

-(PYEchartsView *)lineEchartView
{
    if (!_lineEchartView) {
        _lineEchartView = [[PYEchartsView alloc] init];
        [_lineEchartView setOption:self.lineOption];
        [self.view addSubview:_lineEchartView];
        [_lineEchartView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.kindButton.mas_bottom).mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(KScreenWidth);
            make.height.mas_equalTo(Auto_Width(200));
        }];
    }
    return _lineEchartView;
}

-(PYOption *)lineOption
{
    if (!_lineOption) {
        _lineOption = [PYOption initPYOptionWithBlock:^(PYOption *option) {
            option.gridEqual([PYGrid initPYGridWithBlock:^(PYGrid *grid) {
                grid.xEqual(@40).x2Equal(@50);
            }])
            .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
                tooltip.triggerEqual(PYTooltipTriggerAxis);
            }])
            .calculableEqual(YES)
            .addXAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
                axis.typeEqual(PYAxisTypeCategory)
                .addDataArr(@[@"2",@"7",@"12",@"17",@"22",@"27"]);
            }])
            .addYAxis([PYAxis initPYAxisWithBlock:^(PYAxis *axis) {
                axis.typeEqual(PYAxisTypeValue);
            }])
            .addSeries([PYCartesianSeries initPYSeriesWithBlock:^(PYSeries *series) {
                series.nameEqual(@"溶氧")
                .typeEqual(PYSeriesTypeLine)
                .addDataArr(@[@20, @49, @37, @23, @25,@22]);
            }]);
        }];
    }
    return _lineOption;
}
@end
