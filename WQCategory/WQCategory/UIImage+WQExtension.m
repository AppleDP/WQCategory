//
//  UIImage+WQCategory.m
//  WQCategory
//
//  Created by iOS on 2018/4/10.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "UIImage+WQExtension.h"

@implementation UIImage (WQExtension)
+ (UIImage *)wq_imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)wq_imageWithTintColor:(UIColor *)tintColor {
    return [self wq_imageWithTintColor:tintColor
                             blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *)wq_imageWithGradientTintColor:(UIColor *)tintColor {
    return [self wq_imageWithTintColor:tintColor
                             blendMode:kCGBlendModeOverlay];
}

- (UIImage *)wq_scaleToSize:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (UIImage *)wq_ratioHeightWithWidth:(CGFloat)width {
    CGFloat fixHeight = self.size.height*width/self.size.width;
    return [self wq_scaleToSize:CGSizeMake(width, fixHeight)];
}

- (UIImage *)wq_ratioWidthWithHeitht:(CGFloat)heigth {
    CGFloat fixWidth = self.size.width*heigth/self.size.height;
    return [self wq_scaleToSize:CGSizeMake(fixWidth, heigth)];
}

- (UIImage *)wq_insertImage:(UIImage *)image
                       rect:(CGRect)rect {
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //四个参数为水印图片的位置
    [image drawInRect:rect];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

+ (UIImage *)wq_codeCreateWithType:(WQCodeType)codeType
                            String:(NSString *)str
                              size:(CGSize)size
                             color:(UIColor *)color
                         watermark:(UIImage *)watermark
                          position:(CGRect)rect {
    CGFloat red,green,blue,alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    // 滤镜
    CIFilter *filter;
    switch (codeType) {
        case WQBarCode:{
            if([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
#ifdef DEBUG
                // 条形码生成只在 iOS 8.0 后支持
                NSAssert([[UIDevice currentDevice].systemVersion floatValue] > 8.0, @"条形码生成只在 iOS 8.0 后支持");
#endif
                return nil;
            }
            // 生成条形码
            filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
            [filter setDefaults];
            
            // 生成条形码的上、下、左、右的 margins 值
            [filter setValue:@0.00 forKeyPath:@"inputQuietSpace"];
        }break;
        default:{
            // 生成二维码
            filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
            [filter setDefaults];
            
            // 纠错等级, "L"、"M"、"Q"、"H",越高越易识别
            [filter setValue:@"Q" forKeyPath:@"inputCorrectionLevel"];
        }break;
    }
    // 字符串转 NSData
    NSData *strData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // 将字符串数据放入滤镜
    [filter setValue:strData forKeyPath:@"inputMessage"];
    
    // 获得滤出图象
    CIImage *outputImg = [filter outputImage];
    
    // 得到重画图
    UIImage *resultImg = [self createNonInterPolateUIImageFormCIImage:outputImg size:size red:red*255.0 green:green*255.0 blue:blue*255.0];
    if (watermark != nil) {
        // 为图片添加水印
        resultImg = [resultImg wq_insertImage:watermark rect:rect];
    }
    return resultImg;
}


#pragma mak -- 私有方法 --
- (UIImage *)wq_imageWithTintColor:(UIColor *)tintColor
                         blendMode:(CGBlendMode)blendMode{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}

+ (UIImage *)createNonInterPolateUIImageFormCIImage:(CIImage *)ciImage
                                               size:(CGSize)size
                                                red:(CGFloat)red
                                              green:(CGFloat)green
                                               blue:(CGFloat)blue{
    CGRect extentRect = CGRectIntegral(ciImage.extent);
    CGFloat scaleW = size.width / CGRectGetWidth(extentRect);
    CGFloat scaleH = size.height / CGRectGetHeight(extentRect);
    size_t width = CGRectGetWidth(extentRect) * scaleW;
    size_t height = CGRectGetHeight(extentRect) * scaleH;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:ciImage fromRect:extentRect];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scaleW, scaleH);
    CGContextDrawImage(bitmapRef, extentRect, bitmapImage);
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    UIImage *newImage = [UIImage imageWithCGImage:scaledImage];
    return [self imageBlackToTransparent:newImage withRed:red andGreen:green andBlue:blue];
}

void ProviderReleaseData (void *info, const void *data, size_t size){
    free((void *)data);
}

+ (UIImage *)imageBlackToTransparent:(UIImage *)image
                             withRed:(CGFloat)red
                            andGreen:(CGFloat)green
                             andBlue:(CGFloat)blue{
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t bytesPerRow = imageWidth * 4;
    uint32_t *rgbImageBuf = (uint32_t *)malloc(bytesPerRow * imageHeight);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    int pixelNum = imageWidth * imageHeight;
    uint32_t *pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i ++, pCurPtr ++) {
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900) {
            uint8_t *ptr = (uint8_t *)pCurPtr;
            ptr[3] = red;
            ptr[2] = green;
            ptr[1] = blue;
        }else {
            uint8_t *ptr = (uint8_t *)pCurPtr;
            ptr[0] = 0;
        }
    }
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace, kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider, NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    UIImage *resultUIImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return resultUIImage;
}
@end
