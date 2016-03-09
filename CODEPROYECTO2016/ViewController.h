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
    //Retos
    IBOutlet UIButton * btnImages;
    IBOutlet UIImageView *btnCompletado;
    IBOutlet UIImageView *btnEstrella;
    
    IBOutlet UIButton * btnImages1;
    IBOutlet UIImageView *btnCompletado1;
    
    IBOutlet UIButton * btnImages2;
    IBOutlet UIImageView *btnCompletado2;
    
    IBOutlet UIButton * btnImages3;
    IBOutlet UIImageView *btnCompletado3;
    
    IBOutlet UIButton * btnImages4;
    IBOutlet UIImageView *btnCompletado4;
    
    IBOutlet NSInteger *contador;
    IBOutlet UILabel *lblPuntos;
    
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

//Retos
- (IBAction)CambiarImagen:(id)sender;
- (IBAction)CambiarImagen1:(id)sender;
- (IBAction)CambiarImagen2:(id)sender;
- (IBAction)CambiarImagen3:(id)sender;
- (IBAction)CambiarImagen4:(id)sender;

@end

