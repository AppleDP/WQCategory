//
//  NSData+WQCategory.h
//  WQCategory
//
//  Created by iOS on 2018/4/10.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSData (WQExtension)
/**
 * CRC32 校验
 */
- (NSData *)crc32;

/**
 * CRC16 校验
 */
- (ushort)crc16;
@end
NS_ASSUME_NONNULL_END
