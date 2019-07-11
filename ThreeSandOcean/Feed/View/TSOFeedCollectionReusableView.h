//
//  TSOFeedCollectionReusableView.h
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/7/10.
//  Copyright © 2019 tools. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSOLabelTextFieldView.h"
NS_ASSUME_NONNULL_BEGIN

@interface TSOFeedCollectionReusableView : UICollectionReusableView
@property (nonatomic,strong)UIImageView * headImageView;
@property (nonatomic,strong)TSOLabelTextFieldView * carView;
@property (nonatomic,strong)TSOLabelTextFieldView * heightView;
@property (nonatomic,strong)TSOLabelTextFieldView * fishKindView;
@property (nonatomic,strong)TSOLabelTextFieldView * phoneView;
@property (nonatomic,strong)TSOLabelTextFieldView * standardView;
@end

NS_ASSUME_NONNULL_END
