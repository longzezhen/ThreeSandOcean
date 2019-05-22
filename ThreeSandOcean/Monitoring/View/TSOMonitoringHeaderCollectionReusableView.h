//
//  TSOMonitoringHeaderCollectionReusableView.h
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/21.
//  Copyright © 2019 tools. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSOMonitoringHeaderCollectionReusableView : UICollectionReusableView
@property (nonatomic,strong)UIView * lineView;
@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic,strong)UIButton * moreButton;
@property (nonatomic,copy) void (^clickMoreButtonBlock)(void);
@end

