//
//  DiagonalView.m
//  FrancesGo
//
//  Created by Jonathan Garcia on 11/9/17.
//  Copyright © 2017 BBVA. All rights reserved.
//

#import "DiagonalView.h"

@implementation DiagonalView

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    if (self.inverted) {
    
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, (self.frame.size.height * [self.lowerSide floatValue]))];
        [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    }else {
    
        [path moveToPoint:CGPointMake(self.frame.size.width, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(0, self.frame.size.height - (self.frame.size.height * [self.lowerSide floatValue]))];
    }
    
    [self.fillColor setFill];
    [path closePath];
    [path fill];
}

@end
