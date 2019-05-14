//
//  UIImage+category.h
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/13.
//  Copyright © 2019 tools. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIImage (category)
//压缩图片质量
+(UIImage *)compressImageQuality:(UIImage *)image toByte:(NSInteger)maxLength;
//压缩图片尺寸
+(UIImage *)compressImageSize:(UIImage *)image toSize:(CGSize)size;
@end

