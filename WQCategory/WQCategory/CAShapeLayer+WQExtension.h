//
//  CAShapeLayer+WQExtension.h
//  WQCategory
//
//  Created by iOS on 2019/12/4.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum : NSUInteger {
    kVertexLeft, // 左
    kVertexTop, // 上
    kVertexRight, // 右
    kVertexBottom, // 下
} WQTriangleVertex;

NS_ASSUME_NONNULL_BEGIN
@interface CAShapeLayer (WQExtension)
/**
 * 圆角
 *
 * @param radius 圆角半径
 * @param type 圆角位置
 */
- (void)wq_cornerRadius:(float)radius
                   type:(UIRectCorner)type;

/**
 * 等边三角形
 *
 * @param vertex 三角形顶点
 */
- (void)wq_equilateralTriangle:(WQTriangleVertex)vertex;

/**
 * 多边形
 *
 * @param points 多边形顶点 @[CGPoint]
 */
- (void)wq_polygonWithPoint:(NSArray<NSValue *> *)points;
@end
NS_ASSUME_NONNULL_END
