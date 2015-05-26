//
//  UIImage+ASCExtension.m
//  ASCNavigationBar
//
//  Created by Abel Sánchez Custodio on 26/5/15.
//  Copyright (c) 2015 acsanchezcu. All rights reserved.
//

#import "UIImage+ASCExtension.h"

@implementation UIImage (ASCExtension)

+ (UIImage *)imageFromMaskImage:(UIImage *)mask withColor:(UIColor *)color
{
    if (!mask) return nil;
    if (!color) return mask;
    
    UIImage *image = mask;
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale);
    CGContextRef c = UIGraphicsGetCurrentContext();
    [image drawInRect:rect];
    CGContextSetFillColorWithColor(c, [color CGColor]);
    CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
    CGContextFillRect(c, rect);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

@end
