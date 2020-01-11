//
//  CAShapeLayer+WQExtension.m
//  WQCategory
//
//  Created by iOS on 2019/12/4.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "CAShapeLayer+WQExtension.h"

@implementation CAShapeLayer (WQExtension)
- (void)wq_cornerRadius:(float)radius
                   type:(UIRectCorner)type {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:type cornerRadii:self.bounds.size];
    self.path = bezierPath.CGPath;
}

- (void)wq_equilateralTriangle:(WQTriangleVertex)vertex {
    switch (vertex) {
        case kVertexLeft: {
            // 顶点在左边
            [self wq_polygonWithPoint:@[@(CGPointMake(0, CGRectGetHeight(self.bounds)*0.5)), @(CGPointMake(CGRectGetWidth(self.bounds), 0)), @(CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)))]];
        }break;
        case kVertexTop: {
            // 顶点在上边
            [self wq_polygonWithPoint:@[@(CGPointMake(CGRectGetWidth(self.bounds)*0.5, 0)), @(CGPointMake(0, CGRectGetHeight(self.bounds))), @(CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)))]];
        }break;
        case kVertexRight: {
            // 顶点在右边
            [self wq_polygonWithPoint:@[@(CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)*0.5)), @(CGPointMake(0, 0)), @(CGPointMake(CGRectGetHeight(self.bounds), 0))]];
        }break;
            
        default: {
            // 顶点在下边
            [self wq_polygonWithPoint:@[@(CGPointMake(CGRectGetWidth(self.bounds)*0.5, CGRectGetHeight(self.bounds))), @(CGPointMake(0, 0)), @(CGPointMake(CGRectGetWidth(self.bounds), 0))]];
        }break;
    }
}

- (void)wq_polygonWithPoint:(NSArray<NSValue *> *)points {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    for (int idx = 0; idx < points.count; idx++) {
        NSValue *value = points[idx];
        CGPoint point = [value CGPointValue];
        if (idx == 0) {
            [bezierPath moveToPoint:point];
        } else {
            [bezierPath addLineToPoint:point];
        }
    }
    [bezierPath closePath];
    self.path = bezierPath.CGPath;
}
@end
