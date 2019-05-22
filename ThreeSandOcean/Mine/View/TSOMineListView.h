//
//  TSOMineListView.h
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/16.
//  Copyright © 2019 tools. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TSOMineListView : UIView
@property (nonatomic,strong)UIImageView * leftImageView;
@property (nonatomic,strong)UILabel * middleLabel;
@property (nonatomic,strong)UIImageView * rightImageView;
@property (nonatomic,strong)UIView * bottomLineView;
@property (nonatomic,copy) void(^clickViewBlock)(void);
@end


