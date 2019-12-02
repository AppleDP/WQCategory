//
//  UIScrollView+WQExtension.m
//  WQCategory
//
//  Created by iOS on 2019/12/2.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "UIScrollView+WQExtension.h"

@implementation UIScrollView (WQExtension)
- (NSData *)wq_createPdf {
    NSMutableData*pdfData=[NSMutableData data];
    UIGraphicsBeginPDFContextToData(pdfData,(CGRect){0,0,self.contentSize},nil);
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0,0,self.contentSize.width,self.contentSize.height),nil);
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    CGRect origSize = self.frame;
    CGRect newSize = origSize;
    newSize.size = self.contentSize;
    [self setFrame:newSize];
    [self.layer renderInContext:pdfContext];
    [self setFrame:origSize];
    UIGraphicsEndPDFContext();
    return [pdfData copy];
}
@end
