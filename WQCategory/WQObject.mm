//
//  WQObject.m
//  WQCategory
//
//  Created by iOS on 2018/6/15.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "WQObject.h"
#import <objc/message.h>

@interface WQObject<T> ()
@end

@implementation WQObject
- (int)func0:(int)i j:(NSNumber *)j {
    NSLog(@"func0: %d -- j: %@",i,j);
    return (int)i + [j intValue];
}
@end
