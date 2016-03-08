//
//  AlarmaViewController.h
//  Alarma
//
//  Created by utng on 04/03/16.
//  Copyright © 2016 utng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmaViewController : UITableViewController {
    
    UILabel *lblCelda;
    
    //datos para la tabla
    //NSArray *contenido;
    NSArray *contenido;
    IBOutlet UITableView *tabla;
    
}


@end
