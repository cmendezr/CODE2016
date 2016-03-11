//
//  ViewControllerLogin.h
//  PruebaRito
//
//  Created by utng on 02/03/16.
//  Copyright © 2016 utng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{

    
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
    
    //RETOS VASOS CON AGUA
    IBOutlet UIButton *btnVasos;
    IBOutlet UIImageView *btnCompletadoV;
    IBOutlet UIImageView *btnEstrellaV;
    IBOutlet UIButton *btnVasos1;
    IBOutlet UIImageView *btnCompletadoV1;
    IBOutlet UIButton *btnVasos2;
    IBOutlet UIImageView *btnCompletadoV2;
    IBOutlet UIButton *btnVasos3;
    IBOutlet UIImageView *btnCompletadoV3;
    IBOutlet UIButton *btnVasos4;
    IBOutlet UIImageView *btnCompletadoV4;
    IBOutlet UIButton *btnVasos5;
    IBOutlet UIImageView *btnCompletadoV5;
    IBOutlet UIButton *btnVasos6;
    IBOutlet UIImageView *btnCompletadoV6;
    IBOutlet UIButton *btnVasos7;
    IBOutlet UIImageView *btnCompletadoV7;
    
    IBOutlet NSInteger *contadorV;
    IBOutlet UILabel *lblPuntosV;
    
    //Arreglo 1
    NSArray *datos;
    IBOutlet UIPickerView *picker;
    
    
    
    //Arreglo 2
    NSArray *datos2;
    IBOutlet UIPickerView *picker2;
    
    //Obtener la hora del datePicker
    IBOutlet UIDatePicker *dtHora;
    IBOutlet UILabel *lblHora;
    IBOutlet UIInterfaceOrientation *willAnimateRotationToInterfaceOrientation;
    
}


@property (copy,nonatomic) NSArray * datosTablaTiempos;

-(IBAction)obtenHora:(id)sender;

-(IBAction)clickGuardar:(id)sender;


- (IBAction)Entrar:(id)sender;

//Retos
- (IBAction)CambiarImagen:(id)sender;
- (IBAction)CambiarImagen1:(id)sender;
- (IBAction)CambiarImagen2:(id)sender;
- (IBAction)CambiarImagen3:(id)sender;
- (IBAction)CambiarImagen4:(id)sender;

//Retos vasos
- (IBAction)CambiarImagenVaso:(id)sender;
- (IBAction)CambiarImagenVaso1:(id)sender;
- (IBAction)CambiarImagenVaso2:(id)sender;
- (IBAction)CambiarImagenVaso3:(id)sender;
- (IBAction)CambiarImagenVaso4:(id)sender;
- (IBAction)CambiarImagenVaso5:(id)sender;
- (IBAction)CambiarImagenVaso6:(id)sender;
- (IBAction)CambiarImagenVaso7:(id)sender;

//Sugerencias o comentarios
-(IBAction)btnSugerencia:(id)sender;
@end

