//
//  UIImage+WQCategory.h
//  WQCategory
//
//  Created by iOS on 2018/4/10.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (WQExtension)
/**
 * 生成一张 color 色的 image
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 * 修改图片颜色
 */
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

/**
 * 修改图片大小
 */
- (UIImage *)scaleToSize:(CGSize)size;
@end
NS_ASSUME_NONNULL_END
