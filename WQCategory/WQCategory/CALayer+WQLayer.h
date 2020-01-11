//
//  CALayer+WQLayer.h
//  WQCategory
//
//  Created by iOS on 2019/11/28.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface CALayer (WQLayer)
/**
 * Sketch 的阴影设置
 *
 * @param color 颜色
 * @param alpha 透明度 [0, 100]
 * @param offX x轴偏移位置
 * @param offY y轴偏移位置
 * @param blur 模糊度 [0, 100]
 * @param spread 扩展
 */
- (void)wq_sketchLayerShadow:(UIColor *)color
                       alpha:(int)alpha
                     offsetX:(CGFloat)offX
                     offsetY:(CGFloat)offY
                        blur:(int)blur
                      spread:(CGFloat)spread;
@end
NS_ASSUME_NONNULL_END
