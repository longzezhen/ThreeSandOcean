//
//  TSOMoreListView.h
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/17.
//  Copyright © 2019 tools. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TSOMoreListView : UIView
@property (nonatomic,strong) UIImageView * leftImageView;
@property (nonatomic,strong) UILabel * middleLabel;
@property (nonatomic,strong) UILabel * rightLabel;
@property (nonatomic,strong) UIImageView * arrowImageView;
@property (nonatomic,strong) UIView * bottomLineView;
@property (nonatomic,copy) void(^clickViewBlock)(void);
@end

