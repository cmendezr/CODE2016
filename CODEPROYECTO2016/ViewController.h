//
//  ViewControllerLogin.h
//  PruebaRito
//
//  Created by utng on 02/03/16.
//  Copyright © 2016 utng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource,UIScrollViewDelegate>{

    
    IBOutlet UINavigationBar * InSesiontxt;
    IBOutlet UITextField * Correo;
    IBOutlet UITextField * Contraseña;
    IBOutlet UIButton * Registrar;
    IBOutlet UITextField * Nacimiento;
    IBOutlet UITextField * EstadoTF;
    IBOutlet UITextField * MunicipiosTF;
    IBOutlet UIPickerView * NuevoPicker;
    IBOutlet UIImageView * ImagenRedes;
    
    //Arreglo 1
    NSArray *datos;
    IBOutlet UIPickerView *picker;
    
    
    
    //Arreglo 2
    NSArray *datos2;
    IBOutlet UIPickerView *picker2;
    
    //Obtener la hora del datePicker
    IBOutlet UIDatePicker *dtHora;
    IBOutlet UILabel *lblHora;
    
}
@property (copy,nonatomic) NSArray * datosTablaTiempos;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

-(IBAction)obtenHora:(id)sender;

-(IBAction)clickGuardar:(id)sender;


- (IBAction)Entrar:(id)sender;

@end

