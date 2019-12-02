//
//  UIDevice+WQExtension.h
//  WQCategory
//
//  Created by iOS on 2019/1/11.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    iPhone4,
    iPhone4s,
    iPhone5,
    iPhone5c,
    iPhone5s,
    iPhone6,
    iPhone6P,
    iPhone6s,
    iPhone6sP,
    iPhoneSE,
    iPhone7,
    iPhone7P,
    iPhone7s,
    iPhone7sP,
    iPhone8,
    iPhone8P,
    iPhoneX,
    iPhoneXS,
    iPhoneXSMax,
    iPhoneXR,
    iPhone11,
    iPhone11Pro,
    iPhone11ProMax,
    iPodTouch,
    iPodTouch2G,
    iPodTouch3G,
    iPodTouch4G,
    iPodTouch5G,
    iPodTouch6G,
    iPad,
    iPad3G,
    iPad2,
    iPad3,
    iPad4,
    iPadAir,
    iPadAir2,
    iPadPro12_9Inch,
    iPadPro9_7Inch,
    iPad5,
    iPadPro12_9Inch2,
    iPadPro10_5Inch,
    iPadMini,
    iPadMini2,
    iPadMini3,
    iPadMini4,
    Simulator,
    Unknown, // 不明类型
} WQPhoneModel; // 机型

NS_ASSUME_NONNULL_BEGIN
@interface UIDevice (WQExtension)
/**
 * iPhone 机型
 */
+ (WQPhoneModel)wq_myPhoneModel;

/**
 * 获取当前网络 ip 地址
 */
+ (nullable NSString *)wq_getIpAddress;

/**
 * 获取当前网络子网掩码
 */
+ (nullable NSString *)wq_getSubnet;
@end
NS_ASSUME_NONNULL_END
