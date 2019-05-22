//
//  UIImage+category.m
//  ThreeSandOcean
//
//  Created by 龙泽桢 on 2019/5/13.
//  Copyright © 2019 tools. All rights reserved.
//

#import "UIImage+category.h"

@implementation UIImage (category)
//压缩图片质量
+(UIImage *)compressImageQuality:(UIImage *)image toByte:(NSInteger)maxLength
{
    //1/(2^6) = 0.015625 < 0.02，也能达到每次循环 compression 减小 0.02 的效果。这样的压缩次数比循环减小 compression 少，耗时短
    CGFloat compression = 1;
    NSData * data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) {
        return image;
    }
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i<6; i++) {
        compression = (max + min)/2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength*0.9) {
            min = compression;
        }else if (data.length > maxLength){
            max = compression;
        }else{
            break;
        }
    }
    UIImage * resultImage = [UIImage imageWithData:data];
    return resultImage;
}

//压缩图片尺寸
+(UIImage *)compressImageSize:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

//view 颜色转image
+ (UIImage *)drawImageWithSize:(CGSize)size color:(UIColor *)color{
    
    UIImage *renderImage;
    UIView *renderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    renderView.backgroundColor = color;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [renderView.layer renderInContext:context];
    renderImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return renderImage;
    
}
@end
