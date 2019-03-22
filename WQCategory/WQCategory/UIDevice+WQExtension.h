//
//  UIDevice+WQExtension.h
//  WQCategory
//
//  Created by iOS on 2019/1/11.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIDevice (WQExtension)
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
