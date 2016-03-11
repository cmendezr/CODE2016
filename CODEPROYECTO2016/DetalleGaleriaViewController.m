//
//  DetalleGaleriaViewController.m



#import "DetalleGaleriaViewController.h"

@implementation DetalleGaleriaViewController
@synthesize scrollView;
@synthesize tag;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initialSetup];
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown );
}


//***********************************************************************************************

-(void)initialSetup
{
    
    NSString *fileName= [NSString stringWithFormat:@"rutina_galeria_00%i.png",self.tag];
   
    UIImage *foto = [UIImage imageNamed:fileName] ;
    
    UIImageView* fotoView = [[UIImageView alloc] initWithImage:foto];
    
       
    [self.scrollView setContentSize: CGSizeMake(fotoView.frame.size.width, fotoView.frame.size.height)];
    
	    
    
    [self.scrollView setScrollEnabled:YES];
    
    [self.scrollView addSubview:fotoView];
    
    
    


}

@end
