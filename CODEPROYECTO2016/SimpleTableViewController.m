//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by Simon Ng on 16/4/12.
//  Copyright (c) 2012 AppCoda. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "DetalleGaleriaViewController.h"
#import "BackgroundLayer.h"

@interface SimpleTableViewController ()

@end

@implementation SimpleTableViewController
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Initialize table data
    self.tituloRutinas = @"Rutinas para obtener fuerza fisica";
    self.tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", nil];
    self.tituloFueza = @"Rutinas para la relajacion";

     self.tableDataDos = [NSArray arrayWithObjects:@"egg_benedict.jpg", @"mushroom_risotto.jpg", @"full_breakfast.jpg", nil];
      
      self.tituloRelajacion = @"Rutinas para resistencia";

     self.tableDataTres  = [NSArray arrayWithObjects:@"30 min", @"30 min", @"20 min", nil];
    
    NSDictionary *section1 = [NSDictionary dictionaryWithObjectsAndKeys:
                              self.tituloRutinas,@"title",
                              self.tableData,@"cities",
                              @"1",@"",nil];
    
   NSDictionary *section2 = [NSDictionary dictionaryWithObjectsAndKeys:
                              self.tituloFueza,@"title",
                              self.tableData,@"cities",
                              @"1",@"",nil];
    
    NSDictionary *section3 = [NSDictionary dictionaryWithObjectsAndKeys:
                              self.tituloRelajacion,@"title",
                              self.tableData,@"cities",
                              @"1",@"",nil];
    
    // Initialize thumbnails
    self.thumbnails = [NSArray arrayWithObjects:@"egg_benedict.jpg", @"mushroom_risotto.jpg", @"full_breakfast.jpg", @"hamburger.jpg", @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg", @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg", @"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg", @"japanese_noodle_with_pork.jpg", @"green_tea.jpg", @"thai_shrimp_cake.jpg", @"angry_birds_cake.jpg", @"ham_and_cheese_panini.jpg", nil];
    
    // Initialize Preparation Time
    self.prepTime = [NSArray arrayWithObjects:@"30 min", @"30 min", @"20 min", @"30 min", @"10 min", @"1 hour", @"45 min", @"5 min", @"30 min", @"8 min", @"20 min", @"20 min", @"5 min", @"1.5 hour", @"4 hours", @"10 min", nil];

    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];

    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.tableData = [dict objectForKey:@"RecipeName"];
    self.thumbnails = [dict objectForKey:@"Thumbnail"];
    self.prepTime = [dict objectForKey:@"PrepTime"];
    
    //Los cargamos en el array principal
    
    self.tableData = @[section1,section2,section3];
    
    //Recargamos la tabla
    
    [self.tableView reloadData];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Cargamos los datos de la sección
    NSDictionary *dataSection = [self.tableData objectAtIndex:section];
    NSArray *sectionSubtitles = [dataSection objectForKey:@"cities"];
    BOOL visible = [[dataSection objectForKey:@"visible"] boolValue];
    
    //Comprobamos si el flag "visible" está activo o no. Si lo está mostramos las ciudades si no,
    //se mostrará una sección vacía (oculta)
    if (visible) {
        return [sectionSubtitles count];
    } else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //CGFloat  margenY=0;
    static NSString *simpleTableIdentifier = @"SimpleTableCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell == nil)
    {
       
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }

    //Cargamos los datos de la sección
    NSDictionary *dataSection = [self.tableData objectAtIndex:indexPath.section];
    NSArray *sectionSubtitles = [dataSection objectForKey:@"cities"];
    
   

    
    [cell.textLabel setText:[sectionSubtitles objectAtIndex:indexPath.row]];
    
    
    UIImage *image1 = [UIImage imageNamed:[self.tableDataDos objectAtIndex:indexPath.row]];
    cell.imageView.image = image1 ;
  
    
    [cell.detailTextLabel setText:[self.tableDataTres objectAtIndex:indexPath.row]];
    
    UIButton *scanQRCodeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    scanQRCodeButton.frame = CGRectMake((cell.frame.size.width - image1.size.width), 5.0f, 100.0f, 44.0f);
    scanQRCodeButton.tag=indexPath.row;
    [scanQRCodeButton setTitle:@"Ver" forState:UIControlStateNormal];
    [scanQRCodeButton addTarget:self action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:scanQRCodeButton];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"didSelectRowAtIndexPath");
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Row Selected" message:[self.tableDataDos objectAtIndex:indexPath.row] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display the Hello World Message
    [messageAlert show];
    
    // Checked the selected row
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    if (indexPath.row == 0) {
        return nil;
    }
    
    return indexPath;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Devolvemos el número de secciones
    return [self.tableData count];
}

/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Accedemos a la celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //Cargamos los datos de la sección
    NSDictionary *dataSection = [self.tableData objectAtIndex:indexPath.section];
    NSArray *sectionSubtitles = [dataSection objectForKey:@"cities"];
    
    //Modificamos la celda con el texto correspondiente dentro de la sección
    [cell.textLabel setText:[sectionSubtitles objectAtIndex:indexPath.row]];
    return cell;
    
}*/

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //Cargamos el título de la sección
    NSDictionary *dataSection = [self.tableData objectAtIndex:section];
    NSString *sectionTitle = [dataSection objectForKey:@"title"];
    
    //Creamos un botón que contiene el título y que al pulsarlo modificará la visibilidad de la sección
    UIButton *headerView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 60)];
    [headerView setTitle:sectionTitle forState:UIControlStateNormal];
    [headerView setBackgroundColor:[UIColor colorWithRed:(141/255.0) green:(198/255.0) blue:(63/255.0) alpha:1.0]];
    [headerView addTarget:self action:@selector(updateSectionVisibility:) forControlEvents:UIControlEventTouchUpInside];
    [headerView setTag:section];
    
    
    
    
    //Devolvemos el botón
    return headerView;
}

- (void)updateSectionVisibility:(UIButton*)sender
{
    //Cargamos una copia mutable de la sección cuya visibilidad se va a modificar
    NSMutableDictionary *sectionToModify = [[self.tableData objectAtIndex:sender.tag] mutableCopy];
    
    //Se carga el valor del flag "visible" pero invertido
    BOOL sectionVisibility = ![[sectionToModify objectForKey:@"visible"] boolValue];
    
    //Se actualiza el valor del flag en la copia mutable
    [sectionToModify setObject:[NSNumber numberWithBool:sectionVisibility] forKey:@"visible"];
    
    //Cargamos una copia mutable de los datos
    NSMutableArray *tableDataCopy = [self.tableData mutableCopy];
    
    //Reemplazamos la sección correspondiente por su copia modificada
    [tableDataCopy replaceObjectAtIndex:sender.tag withObject:sectionToModify];
    
    //Volvemos a cargar los datos y recargamos la tabla
    self.tableData = tableDataCopy;
    [self.tableView reloadData];
}
-(void) buttonPressed: (id)sender
{
   // NSLog(@"pulsa: %i",[(UIButton*)sender tag]);
    
    DetalleGaleriaViewController *detalleView = [[DetalleGaleriaViewController alloc] initWithNibName:@"DetalleGaleriaViewController" bundle:nil] ;
    detalleView.tag=[(UIButton*)sender tag];
    
    [self.navigationController pushViewController:detalleView animated:YES];
    
    
}



@end

