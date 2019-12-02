//
//  CALayer+WQLayer.m
//  WQCategory
//
//  Created by iOS on 2019/11/28.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "CALayer+WQLayer.h"

@implementation CALayer (WQLayer)
- (void)wq_sktLayerShadow:(UIColor *)color
                    alpha:(CGFloat)alpha
                  offsetX:(CGFloat)offX
                  offsetY:(CGFloat)offY
                     blur:(CGFloat)blur
                   spread:(CGFloat)spread {
    
    self.shadowOffset = CGSizeMake(offX, offY);
    self.shadowRadius = blur * 0.5;
    self.shadowColor = color.CGColor;
    self.shadowOpacity = alpha;
    CGRect rect = CGRectInset(self.bounds, -spread, -spread);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.cornerRadius];
    self.shadowPath = path.CGPath;
}
@end
