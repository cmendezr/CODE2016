//
//  ConfigurationViewController.h
//  CODEPROYECTO2016
//
//  Created by utng on 09/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigurationViewController : UITableViewController {
    
    IBOutlet NSInteger *rowNo;
    IBOutlet UILabel *lblOpcion;
    IBOutlet UILabel *lblOpcion2;
    IBOutlet UILabel *lblOpcion3;
    
    IBOutlet UITableViewCell *celda1;
    IBOutlet UITableViewCell *celda2;
    IBOutlet UITableViewCell *celda3;
}

-(IBAction)OnClickAgendar:(id)sender;

@end