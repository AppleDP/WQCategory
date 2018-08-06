//
//  UIView+WQCategory.m
//  WQCategory
//
//  Created by iOS on 2018/3/19.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "UIView+WQExtension.h"

@implementation UIView (WQExtension)
#pragma mark -- View Frame 
- (void)setX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setMaxX:(CGFloat)maxX {
    CGRect rect = self.frame;
    rect.origin.x = maxX - self.frame.size.width;
    self.frame = rect;
}
- (CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMaxY:(CGFloat)maxY {
    CGRect rect = self.frame;
    rect.origin.y = maxY - self.frame.size.height;
    self.frame = rect;
}
- (CGFloat)maxY {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
-(CGFloat)y {
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY {
    return self.center.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}
- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size.width = size.width;
    rect.size.height = size.height;
    self.frame = rect;
}
- (CGSize)size {
    return self.frame.size;
}
@end
