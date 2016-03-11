//
//  TipsViewController.h
//  CODEPROYECTO2016
//
//  Created by utng on 11/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TipsViewController : UITableViewController {
    
    UILabel *lblCelda;
    
    //datos para la tabla
    //NSArray *contenido;
    NSArray *tableData;
    IBOutlet UITableView *tabla;
}


@end