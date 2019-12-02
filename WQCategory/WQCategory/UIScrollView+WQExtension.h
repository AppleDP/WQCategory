//
//  UIScrollView+WQExtension.h
//  WQCategory
//
//  Created by iOS on 2019/12/2.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIScrollView (WQExtension)
/**
 * ScrollView 生成 PDF
 */
- (NSData *)wq_createPdf;
@end
NS_ASSUME_NONNULL_END
