//
//  TSOLogMessageView.h
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/24.
//  Copyright © 2019 tools. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSOLogMessageView : UIView
@property (nonatomic,copy)void(^sureButtonBlock)(void);
@end

NS_ASSUME_NONNULL_END
