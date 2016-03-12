//
//  VideoViewController.m
//  CODEPROYECTO2016
//
//  Created by utng on 11/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import "VideoViewController.h"
#import "ViewController.h"
#import "AlarmaViewController.h"

@interface VideoViewController ()
@end

@implementation VideoViewController
@synthesize Reproductor;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //INSTANCIAMOS EL VIDEO
    NSString *video= [[NSBundle mainBundle]pathForResource:@"video" ofType:@"mp4"];
    //RUTA DEL VIDEO
    NSURL *direccion= [[NSURL alloc]initFileURLWithPath:video];
    //INICIALIZAMOS
    Reproductor.controlStyle = MPMovieControlStyleFullscreen;
   Reproductor=[[MPMoviePlayerController alloc] initWithContentURL:direccion];
    //CONFIGURAMOS LA PROPIEDAD VIEW DEL REPRODUCTOR PARA ASIGNARLE UN TAMAÑO
    Reproductor.view.frame=self.view.bounds;
    //Y AHORA SU VISTA LA AÑADIMOS A LA VISTA PRINCIPAL
    [self.view addSubview:Reproductor.view];
    [Reproductor play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished) name:MPMoviePlayerPlaybackDidFinishNotification object:Reproductor];
}

-(void) playbackFinished {
    //AlarmaViewController *viewController = [[AlarmaViewController alloc] init];
    ViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"Alarma"];
    [self.navigationController pushViewController:newView animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end

