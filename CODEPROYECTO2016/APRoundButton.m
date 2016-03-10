//
//  APRoundButton.m
//  CODE2016
//
//  Created by utng on 04/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import "APRoundButton.h"
#import <QuartzCore/QuartzCore.h>

@interface APRoundButton ()
{
    UIRectCorner _corners;
}
@end

@implementation APRoundButton

- (void) setTopLeft:(BOOL)topLeft{
    _topLeft = topLeft;
    _corners |=UIRectCornerTopLeft;
}

- (void) setTopRigth:(BOOL)topRight{
    _topRight = topRight;
    _corners |=UIRectCornerTopRight;
}

- (void) setBottomLeft:(BOOL)bottomLeft{
    _bottomLeft = bottomLeft;
    _corners |=UIRectCornerBottomLeft;
}

- (void) setBottomRigth:(BOOL)bottomRight{
    _bottomRight = bottomRight;
    _corners |= UIRectCornerBottomRight;
}

- (void) setFillColor:(UIColor *)fillColor{
    _fillColor = fillColor;
    self.backgroundColor=fillColor;
}

- (void)setCornerRaduis:(int)cornerRaduis{
    _cornerRaduis = cornerRaduis;
}

- (void) drawRect:(CGRect)rect{
    [super drawRect: rect];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:_corners cornerRadii:CGSizeMake(_cornerRaduis, _cornerRaduis+10)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}

@end
