//
//  UIColor+WQExtension.m
//  WQCategory
//
//  Created by iOS on 2019/1/10.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "UIColor+WQExtension.h"

@implementation UIColor (WQExtension)
- (void)wq_analysisColorWithRed:(int *)r
                          green:(int *)g
                           blue:(int *)b
                          alpha:(CGFloat *)a {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    *r = components[0]*255;
    *g = components[1]*255;
    *b = components[2]*255;
    *a = components[3];
}
@end
