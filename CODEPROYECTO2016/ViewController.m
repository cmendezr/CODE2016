//
//  ViewController.m
//  PruebaRito
//
//  Created by utng on 02/03/16.
//  Copyright © 2016 utng. All rights reserved.
//

#import "ViewController.h"

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

@end