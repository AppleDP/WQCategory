//
//  ViewController.m
//  WQCategory
//
//  Created by iOS on 2018/3/19.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "ViewController.h"
#import "WQExtension.h"
#import "WQObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = [[NSString alloc] init];
    NSString *str0 = [[NSString alloc] init];
    NSLog(@"str: %@ -- str0: %@ -- str: %@", str, str0, str.class);
    if ([str isEqualToString:str0]) {
        NSLog(@"相等");
    }else {
        NSLog(@"不等");
    }
    WQObject *object = [[WQObject alloc] init];
    int i = 0;
    NSNumber *j = @(1);
    [object wq_performSelector:@selector(func0:j:) arguments:&i, &j, nil];

//    func(10, 20);
}
@end
