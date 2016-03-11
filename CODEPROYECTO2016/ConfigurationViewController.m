//
//  ConfigurationViewController.m
//  CODEPROYECTO2016
//
//  Created by utng on 09/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import "ConfigurationViewController.h"

@implementation ConfigurationViewController {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

//------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    rowNo = indexPath.row;
    
    if(rowNo == 0)
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Configuracion"
                                                          message:@"Rutinas para ganar o perder peso."
                                                         delegate:self
                                                cancelButtonTitle:@"Ganar peso"
                                                otherButtonTitles:@"Perder peso", nil];
        [message show];
    } else if(rowNo == 1) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Configuracion"
                                                          message:@"eliminar los videos."
                                                         delegate:self
                                                cancelButtonTitle:@"Nunca"
                                                otherButtonTitles:@"Cada semana", @"Cada mes", nil];
        [message show];
    } else if(rowNo == 2) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Configuracion"
                                                          message:@"Numero de notificaciones al dia."
                                                         delegate:self
                                                cancelButtonTitle:@"Tres"
                                                otherButtonTitles:@"Una", @"Dos", nil];
        [message show];
    }
    
}

- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //Puedo crearme un NSString para recoger el texto del boton pulsado
    NSString *titulo=[alertView buttonTitleAtIndex:buttonIndex];
    
    //Y ahora evaluar el texto que hay en el boton
    if([titulo isEqualToString:@"Ganar peso"]){
        lblOpcion.text = @"Ganar peso";
    }else if([titulo isEqualToString:@"Perder peso"]){
        lblOpcion.text = @"Perder peso";
    } else if([titulo isEqualToString:@"Nunca"]){
        lblOpcion2.text = @"Nunca";
    } else if([titulo isEqualToString:@"Cada semana"]){
        lblOpcion2.text = @"Cada semana";
    } else if([titulo isEqualToString:@"Cada mes"]){
        lblOpcion2.text = @"Cada mes";
    } else if([titulo isEqualToString:@"Tres"]){
        lblOpcion3.text = @"Tres";
    } else if([titulo isEqualToString:@"Una"]){
        lblOpcion3.text = @"Una";
    } else if([titulo isEqualToString:@"Dos"]){
        lblOpcion3.text = @"Dos";
    }
}
@end