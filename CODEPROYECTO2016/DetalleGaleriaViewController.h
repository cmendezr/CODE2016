//
//  DetalleGaleriaViewController.h
//  tableless
//
//  Created by Raúl Flores on 25/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleGaleriaViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property  NSInteger tag;
-(void)initialSetup;


@end
