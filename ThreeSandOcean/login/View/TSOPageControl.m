//
//  TSOPageControl.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/15.
//  Copyright © 2019 tools. All rights reserved.
//

#import "TSOPageControl.h"

@implementation TSOPageControl
- (void) setCurrentPage:(NSInteger)page {
    
    [super setCurrentPage:page];
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = 10;
        size.width = 10;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,size.width,size.height)];
    }
}

////2.如果只改变当前选中的点的大小，前面加个判断就可以了：
//
//- (void) setCurrentPage:(NSInteger)page {
//
//    [super setCurrentPage:page];
//
//    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
//
//        if (subviewIndex == page)
//
//        {
//
//            UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
//
//            CGSize size;
//
//            size.height = 10;
//
//            size.width = 10;
//
//            [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
//
//                                         size.width,size.height)];
//            
//        }
//
//
//
//    }
//
//}
@end
