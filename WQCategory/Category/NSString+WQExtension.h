//
//  NSString+WQCategory.h
//  WQCategory
//
//  Created by iOS on 2018/3/19.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSString (WQExtension)
/**
 * 中文转拼音
 */
- (NSString *)transformToPinyin;

/**
 * 32 位 MD5 加密
 */
- (NSString *)md5_32;

/**
 * 16 位 MD5 加密
 */
- (NSString *)md5_16;

/**
 * base64 编码
 */
- (NSString *)base64Encode;

/**
 * base64 解码
 */
- (NSString *)base64Decode;

/**
 * 抽取字符串中文字符
 */
- (NSString *)chinese;

/**
 * 抽取字符串中非中文字符
 */
- (NSString *)unchinese;
@end
NS_ASSUME_NONNULL_END
