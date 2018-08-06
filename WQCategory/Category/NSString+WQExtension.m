//
//  NSString+WQCategory.m
//  WQCategory
//
//  Created by iOS on 2018/3/19.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "NSString+WQExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (WQExtension)
- (NSString *)transformToPinyin {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    BOOL isNeedTransform = ![self isAllEngNumAndSpecialSign];
    if (isNeedTransform) {
        CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
        // kCFStringTransformStripCombiningMarks 可以变换来去除变音符和重音
        CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformStripCombiningMarks, false);
    }
    return mutableString;
}

- (BOOL)isAllEngNumAndSpecialSign {
    NSString *regularString = @"^[A-Za-z0-9\\p{Z}\\p{P}]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularString];
    return [predicate evaluateWithObject:self];
}

- (NSString *)md5_32 {
    const char *str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (int)strlen(str), result);
    NSMutableString *md5_32 = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++) {
        [md5_32 appendFormat:@"%02X",result[i]];
    }
    return md5_32;
}

- (NSString *)md5_16 {
    NSString *md5_32Str = [self md5_32];
    NSString *md5_16Str;
    md5_16Str = [md5_32Str substringWithRange:NSMakeRange(8, 16)];
    return md5_16Str;
}

- (NSString *)base64Encode {
    //1.先把字符串转换为二进制数据
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    //2.对二进制数据进行base64编码，返回编码后的字符串
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)base64Decode {
    //1.将base64编码后的字符串『解码』为二进制数据
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    //2.把二进制数据转换为字符串返回
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)chinese {
    NSMutableString *chinese = [NSMutableString string];
    for (int i = 0; i < self.length; i ++){
        unichar c = [self characterAtIndex:i];
        if (c >= 0x4E00 && c <= 0x9FA5) {
            [chinese appendString:[NSString stringWithFormat:@"%c",c]];
        }
    }
    return [chinese copy];
}

- (NSString *)unchinese {
    NSMutableString *unchinese = [NSMutableString stringWithCapacity:self.length];
    for (int i =0; i < self.length; i ++){
        unichar c = [self characterAtIndex:i];
        if (c >= 0x4E00 && c <=0x9FA5) {
        }else {
            [unchinese appendString:[NSString stringWithFormat:@"%c",c]];
        }
    }
    return [unchinese copy];
}
@end
