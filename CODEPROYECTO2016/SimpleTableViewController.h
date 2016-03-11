//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by Simon Ng on 16/4/12.
//  Copyright (c) 2012 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (copy,nonatomic) NSString *tituloRutinas;
@property (copy,nonatomic) NSString *tituloFueza;
@property (copy,nonatomic) NSString *tituloRelajacion;
@property (copy,nonatomic) NSArray *tableData;
@property (copy,nonatomic) NSArray *tableDataDos;
@property (copy,nonatomic) NSArray *tableDataTres;
@property (copy,nonatomic) NSArray *thumbnails;
@property (copy,nonatomic) NSArray *prepTime;



@end
