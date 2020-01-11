//
//  ViewController.m
//  WQCategory
//
//  Created by iOS on 2018/3/19.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "ViewController.h"
#import "WQExtension.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *lab = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [lab setTitle:@"100" forState:UIControlStateNormal];
    lab.frame = CGRectMake(100, 100, 100, 100);
    lab.backgroundColor = [UIColor redColor];
    [lab.layer wq_sketchLayerShadow:[UIColor blackColor] alpha:20 offsetX:0 offsetY:0 blur:100 spread:100];
    [lab addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lab];
}

- (void)click:(UIButton *)sender {
    CAShapeLayer *shape = [CAShapeLayer new];
    shape.frame = sender.bounds;
    [shape wq_cornerRadius:50 type:UIRectCornerAllCorners];
    [shape wq_sketchLayerShadow:[UIColor blackColor] alpha:20 offsetX:0 offsetY:0 blur:100 spread:100];
    sender.layer.mask = shape;
}
@end
