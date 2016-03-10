//
//  APRoundButton.h
//  CODE2016
//
//  Created by utng on 04/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface APRoundButton : UIButton
@property (nonatomic) IBInspectable BOOL topLeft;
@property (nonatomic) IBInspectable BOOL topRight;
@property (nonatomic) IBInspectable BOOL bottomLeft;
@property (nonatomic) IBInspectable BOOL bottomRight;
@property (nonatomic) IBInspectable int cornerRaduis;
@property (nonatomic) IBInspectable UIColor *fillColor;



@end
