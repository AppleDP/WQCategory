//
//  CALayer+WQLayer.h
//  WQCategory
//
//  Created by iOS on 2019/11/28.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN
@interface CALayer (WQLayer)
/**
 * Sketch 的阴影设置
 */
- (void)wq_sktLayerShadow:(UIColor *)color
                    alpha:(CGFloat)alpha
                  offsetX:(CGFloat)offX
                  offsetY:(CGFloat)offY
                     blur:(CGFloat)blur
                   spread:(CGFloat)spread;
@end
NS_ASSUME_NONNULL_END
