//
//  DietasTableViewController.h
//  CODEPROYECTO2016
//
//  Created by Rito Angel Hernández Torres on 12/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DietasTableViewController :  UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (copy,nonatomic) NSArray *tableData;
@property (copy,nonatomic) NSArray *thumbnails;
@property (copy,nonatomic) NSArray *prepTime;

@end
