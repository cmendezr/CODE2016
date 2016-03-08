//
//  ViewControllerLogin.h
//  PruebaRito
//
//  Created by utng on 02/03/16.
//  Copyright © 2016 utng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {

    IBOutlet UINavigationBar * InSesiontxt;
    IBOutlet UITextField * Correo;
    IBOutlet UITextField * Contraseña;
    IBOutlet UIButton * Registrar;
    IBOutlet UITextField * Nacimiento;
    IBOutlet UITextField * EstadoTF;
    IBOutlet UITextField * MunicipiosTF;
    IBOutlet UIPickerView * NuevoPicker;
}


- (IBAction)Entrar:(id)sender;

@end
