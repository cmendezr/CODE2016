//
//  ConfigurationViewController.m
//  CODEPROYECTO2016
//
//  Created by utng on 09/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import "ConfiguracionViewController.h"

@implementation ConfiguracionViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    rowNo = indexPath.row;
    
    if(rowNo == 0)
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Configuracion"
                                                          message:@"Rutinas para ganar o perder peso."
                                                         delegate:nil
                                                cancelButtonTitle:@"Ganar peso"
                                                otherButtonTitles:@"Perder peso", nil];
        [message show];
    } else if(rowNo == 1) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Configuracion"
                                                          message:@"eliminar los videos."
                                                         delegate:nil
                                                cancelButtonTitle:@"Nunca"
                                                otherButtonTitles:@"Cada semana", @"Cada mes", nil];
        [message show];
    } else if(rowNo == 2) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Configuracion"
                                                          message:@"Numero de notificaciones al dia."
                                                         delegate:nil
                                                cancelButtonTitle:@"Tres"
                                                otherButtonTitles:@"Una", @"Dos", nil];
        [message show];
    }
    
}

@end
