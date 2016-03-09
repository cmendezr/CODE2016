//
//  ViewController.m
//  PruebaRito
//
//  Created by utng on 02/03/16.
//  Copyright © 2016 utng. All rights reserved.
//

#import "ViewController.h"
#import "CronoTableViewController.h"

@interface ViewController ()

@end

NSArray * _estadosArray;
NSArray * _municipiosArray;


@implementation ViewController


-(IBAction)Entrar:(id)sender {

       if ([Correo.text isEqualToString:@"rito@correo.com"]&&[Contraseña.text isEqualToString:@"pass"]) {
        
           UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Hola, Rito!"
                                                                          message:@"Bienvenido"
                                                                   preferredStyle:UIAlertControllerStyleAlert];
           
           UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Continuar" style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * action) {}];
           
           [alert addAction:defaultAction];
           [self presentViewController:alert animated:YES completion:nil];
           
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"¿Olvidaste tu contraseña?"
                                                                       message:@"No te preocupes,te ayudaremos."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Recuperar contraseña" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];

   };

}

- (void)viewDidLoad {
    [super viewDidLoad];

    //Redondear Imagenes
    ImagenRedes.layer.cornerRadius = ImagenRedes.frame.size.width /2;
    ImagenRedes.clipsToBounds = YES;
    //

    
    //Picker Fecha Nacimiento
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [Nacimiento setInputView:datePicker];
    
    //Picker Fecha Nacimiento Termina
    
    
    //Picker Estados
    _estadosArray = @[@" ",@"Guanajuato", @"Otro"];
    
    UIPickerView * SelecEstadoPkr = [[UIPickerView alloc]init];
    SelecEstadoPkr.tag=1;
    SelecEstadoPkr.dataSource = self;
    SelecEstadoPkr.delegate = self;
    [EstadoTF addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [EstadoTF setInputView:SelecEstadoPkr];
    
    //Picker Estados Termina
    
    //Picker Mun
    _municipiosArray = @[@" ",@"Otro", @"Otro"];
    
    UIPickerView * SelecMunicipioPkr = [[UIPickerView alloc]init];
    SelecMunicipioPkr.tag=2;
    SelecMunicipioPkr.dataSource = self;
    SelecMunicipioPkr.delegate = self;
    [MunicipiosTF addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [MunicipiosTF
     setInputView:SelecMunicipioPkr];
    
    //Picker Estados Termina
    
    // Do any additional setup after loading the view, typically from a nib.
    // AGRUEGAR DATOS A LA TABLA PARA LA VISTA DEL CRONOMETRO
    
    
}

//Metodos para picker fecha de nacimiento.

-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)Nacimiento.inputView;
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    Nacimiento.text = [NSString stringWithFormat:@"%@",dateString];
}
//Metodos para picker fecha de nacimiento.

// Metodos para Picker estados
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString * EstadoSeleccionado = [_estadosArray objectAtIndex:row];
    EstadoTF.text= EstadoSeleccionado;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView.tag==1){
    return _estadosArray.count;
    }else {
        return _municipiosArray.count;
    }
    
    }

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView.tag==1){
       return  _estadosArray [row];
    }else {
        return  _municipiosArray [row];
        
    }

    
}

// Teminan los metodos para picker estados



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ALARMA
-(IBAction)obtenHora:(id)sender {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *event = dtHora.date;
    [dateFormat setDateFormat:@"hh:mm aa"];
    
    NSString *dateString = [dateFormat stringFromDate:event];
    lblHora.text = [NSString stringWithFormat:@"%@", dateString];
}

-(IBAction)clickGuardar:(id)sender {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *event = dtHora.date;
    [dateFormat setDateFormat:@"hh:mm"];
    
    NSString *dateString = [dateFormat stringFromDate:event];
    
}


//RETOS
-(IBAction)CambiarImagen:(id)sender {
    [btnImages setImage:[UIImage imageNamed:@"platolleno.png"] forState:UIControlStateNormal];
    
    UIImage *imagen =  [UIImage imageNamed:@"completado"];
    [btnCompletado setImage:imagen];
    
    contador = [lblPuntos.text intValue] + 5;
    lblPuntos.text = [NSString stringWithFormat:@"%d",contador];
    btnImages.enabled = NO;
    
}

-(IBAction)CambiarImagen1:(id)sender {
    [btnImages1 setImage:[UIImage imageNamed:@"platolleno.png"] forState:UIControlStateNormal];
    
    UIImage *imagen =  [UIImage imageNamed:@"completado"];
    [btnCompletado1 setImage:imagen];
    
    contador = [lblPuntos.text intValue] + 5;
    lblPuntos.text = [NSString stringWithFormat:@"%d",contador];
    btnImages1.enabled = NO;
    
    if(lblPuntos.text.intValue == 25) {
        UIImage *imagenE =  [UIImage imageNamed:@"Estrella.png"];
        [btnEstrella setImage:imagenE];
    }
}

-(IBAction)CambiarImagen2:(id)sender {
    [btnImages2 setImage:[UIImage imageNamed:@"platolleno.png"] forState:UIControlStateNormal];
    
    UIImage *imagen =  [UIImage imageNamed:@"completado"];
    [btnCompletado2 setImage:imagen];
    
    contador = [lblPuntos.text intValue] + 5;
    lblPuntos.text = [NSString stringWithFormat:@"%d",contador];
    btnImages2.enabled = NO;
    
    if(lblPuntos.text.intValue == 25) {
        UIImage *imagenE =  [UIImage imageNamed:@"Estrella.png"];
        [btnEstrella setImage:imagenE];
    }
}

-(IBAction)CambiarImagen3:(id)sender {
    [btnImages3 setImage:[UIImage imageNamed:@"platolleno.png"] forState:UIControlStateNormal];
    
    UIImage *imagen =  [UIImage imageNamed:@"completado"];
    [btnCompletado3 setImage:imagen];
    
    contador = [lblPuntos.text intValue] + 5;
    lblPuntos.text = [NSString stringWithFormat:@"%d",contador];
    btnImages3.enabled = NO;
    
    if(lblPuntos.text.intValue == 25) {
        UIImage *imagenE =  [UIImage imageNamed:@"Estrella.png"];
        [btnEstrella setImage:imagenE];
    }
}

-(IBAction)CambiarImagen4:(id)sender {
    [btnImages4 setImage:[UIImage imageNamed:@"platolleno.png"] forState:UIControlStateNormal];
    
    UIImage *imagen =  [UIImage imageNamed:@"completado"];
    [btnCompletado4 setImage:imagen];
    
    contador = [lblPuntos.text intValue] + 5;
    lblPuntos.text = [NSString stringWithFormat:@"%d",contador];
    btnImages4.enabled = NO;
    
    if(lblPuntos.text.intValue == 25) {
        UIImage *imagenE =  [UIImage imageNamed:@"Estrella.png"];
        [btnEstrella setImage:imagenE];
    }
}


@end
