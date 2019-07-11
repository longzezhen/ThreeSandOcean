//
//  TSOSelectDateView.h
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/7/11.
//  Copyright © 2019 tools. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TSOSelectDateViewDelegate <NSObject>
-(void)didSelectDate:(NSDate*)date;
@end
@interface TSOSelectDateView : UIView
@property(nonatomic,weak) id<TSOSelectDateViewDelegate>delegate;
@end


