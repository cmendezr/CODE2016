//
//  TipsViewController.m
//  CODEPROYECTO2016
//
//  Created by utng on 11/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import "TipsViewController.h"
@implementation TipsViewController {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Creamos los datos
    
    NSString *sectionTitle1 = @"Alimentacion";
    NSArray *sectionSubtitles1 = @[@"1. Coma alimentos variados",@"2. Come muchas frutas y verduras",@"3. Tomar muchos liquidos",@"4. Coma raciones moderadas"];
    
    NSString *sectionTitle2 = @"Deporte";
    NSArray *sectionSubtitles2 = @[@"1. Mantenga un peso corporal saludable",@"2. Muevase",@"3. salga a caminar almenos 15 min. al dia"];
    
    NSString *sectionTitle3 = @"Otros";
    NSArray *sectionSubtitles3 = @[@"1. Realice cambios gradualmente",@"2. informacion importante"];
    
    NSDictionary *section1 = [NSDictionary dictionaryWithObjectsAndKeys:
                              sectionTitle1,@"title",
                              sectionSubtitles1,@"cities",
                              @"1",@"visible",nil];
    
    NSDictionary *section2 = [NSDictionary dictionaryWithObjectsAndKeys:
                              sectionTitle2,@"title",
                              sectionSubtitles2,@"cities",
                              @"1",@"",nil];
    
    NSDictionary *section3 = [NSDictionary dictionaryWithObjectsAndKeys:
                              sectionTitle3,@"title",
                              sectionSubtitles3,@"cities",
                              @"1",@"",nil];
    
    //Los cargamos en el array principal
    
    tableData = @[section1,section2,section3];
    
    //Recargamos la tabla
    tabla.dataSource = self;
    tabla.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Devolvemos el número de secciones
    return tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Cargamos los datos de la sección
    NSDictionary *dataSection = [tableData objectAtIndex:section];
    NSArray *sectionSubtitles = [dataSection objectForKey:@"cities"];
    BOOL visible = [[dataSection objectForKey:@"visible"] boolValue];
    
    //Comprobamos si el flag "visible" está activo o no. Si lo está mostramos las ciudades si no,
    //se mostrará una sección vacía (oculta)
    if (visible) {
        return sectionSubtitles.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Accedemos a la celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //Cargamos los datos de la sección
    NSDictionary *dataSection = [tableData objectAtIndex:indexPath.section];
    NSArray *sectionSubtitles = [dataSection objectForKey:@"cities"];
    
    
    UIImage *image1 = [UIImage imageNamed:@"tips-re.png"];
    cell.imageView.image = image1;
    //Modificamos la celda con el texto correspondiente dentro de la sección
    [cell.textLabel setText:[sectionSubtitles objectAtIndex:indexPath.row]];
    
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //Cargamos el título de la sección
    NSDictionary *dataSection = [tableData objectAtIndex:section];
    NSString *sectionTitle = [dataSection objectForKey:@"title"];
    
    //Creamos un botón que contiene el título y que al pulsarlo modificará la visibilidad de la sección
    UIButton *headerView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 60)];
    [headerView setTitle:sectionTitle forState:UIControlStateNormal];
    [headerView setBackgroundColor:[UIColor orangeColor]];
    [headerView addTarget:self action:@selector(updateSectionVisibility:) forControlEvents:UIControlEventTouchUpInside];
    [headerView setTag:section];
    
    //Devolvemos el botón
    return headerView;
}

- (void)updateSectionVisibility:(UIButton*)sender
{
    //Cargamos una copia mutable de la sección cuya visibilidad se va a modificar
    NSMutableDictionary *sectionToModify = [[tableData objectAtIndex:sender.tag] mutableCopy];
    
    //Se carga el valor del flag "visible" pero invertido
    BOOL sectionVisibility = ![[sectionToModify objectForKey:@"visible"] boolValue];
    
    //Se actualiza el valor del flag en la copia mutable
    [sectionToModify setObject:[NSNumber numberWithBool:sectionVisibility] forKey:@"visible"];
    
    //Cargamos una copia mutable de los datos
    NSMutableArray *tableDataCopy = [tableData mutableCopy];
    
    //Reemplazamos la sección correspondiente por su copia modificada
    [tableDataCopy replaceObjectAtIndex:sender.tag withObject:sectionToModify];
    
    //Volvemos a cargar los datos y recargamos la tabla
    tableData = tableDataCopy;
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self.tableData objectAtIndex:indexPath.row]
    //Necesitamos más de 40 nutrientes diferentes y ningún alimento por sí solo puede proporcionarlos todos.
    
    if([indexPath.description isEqualToString:@"<NSIndexPath: 0xc000000000000016> {length = 2, path = 0 - 0}"]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Coma alimentos variados" message:@"Necesitamos más de 40 nutrientes diferentes y ningún alimento por sí solo puede proporcionarlos todos." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show]; //Muestra el alert
    } else if([indexPath.description isEqualToString:@"<NSIndexPath: 0xc000000000200016> {length = 2, path = 0 - 1}"]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Come frutas y verduras" message:@"La mayor parte de la gente no toma la suficiente cantidad de estos alimentos que proporcionan importantes nutrientes protectores. Intente comer al menos cinco raciones al día. Pruebe nuevas recetas o vea qué platos preparados están disponibles en el supermercado." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show]; //Muestra el alert
    } else if([indexPath.description isEqualToString:@"<NSIndexPath: 0xc000000000400016> {length = 2, path = 0 - 2}"]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Tomar muchos liquidos" message:@"¡Los adultos necesitamos beber por lo menos 1,5 litros de líquidos al día! Y necesitamos más cantidad si hace calor o si realizamos mucho deporte. El agua es obviamente una buena fuente de líquidos pero la variedad puede ser tanto agradable como saludable. Otras opciones son los zumos, los refrescos, el té, el café, la leche, etc." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show]; //Muestra el alert
    } else if([indexPath.description isEqualToString:@"<NSIndexPath: 0xc000000000600016> {length = 2, path = 0 - 3}"]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Raciones moderadas" message:@"Es importante comer a una hora en especifico para que el organismo trabaje de manera correcta." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show]; //Muestra el alert
    } else if([indexPath.description isEqualToString:@"<NSIndexPath: 0xc000000000000116> {length = 2, path = 1 - 0}"]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Peso Corporal saludable" message:@"El peso adecuado depende de muchos factores tales como el sexo, la altura, la edad y la genética. El sobrepeso aumenta el riesgo de padecer varias enfermedades tales como los problemas cardiacos y el cáncer. El exceso de grasa aparece al ingerir más calorías de las que se necesitan. Estas calorías suplementarias pueden provenir de cualquier nutriente que contenga calorías (las proteínas, las grasas, los hidratos de carbono o el alcohol) pero la grasa es la fuente más concentrada de calorías. La actividad física es un buen método para quemar calorías y puede hacerle sentirse bien." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show]; //Muestra el alert
    } else if([indexPath.description isEqualToString:@"<NSIndexPath: 0xc000000000200116> {length = 2, path = 1 - 1}"]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Muevase" message:@"Como hemos visto, la ingesta de demasiadas calorías y no hacer suficiente ejercicio pueden dar lugar a un aumento de peso. La actividad física moderada ayuda a quemar las calorías que nos sobran. También es bueno para el corazón y para el sistema circulatorio, y para la salud en general y el bienestar. Así que haga de la actividad física una rutina diaria. ¡Use la escalera en vez del ascensor (tanto como para subir como para bajar)!. Dé un paseo en su descanso para comer. ¡No hace falta ser un atleta para moverse!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show]; //Muestra el alert
    } else if([indexPath.description isEqualToString:@"<NSIndexPath: 0xc000000000400116> {length = 2, path = 1 - 2}"]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Caminar almenos 15 min. al dia." message:@"Es importante almenos caminar 15 minutos por dia para ejercitar un poco nuestro cuerpo." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show]; //Muestra el alert
    } else if([indexPath.description isEqualToString:@"<NSIndexPath: 0xc000000000000216> {length = 2, path = 2 - 0}"]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"realice cambios gradualmente." message:@"Realizar los cambios de su estilo de vida gradualmente es mucho más fácil que hacerlos de repente. Durante tres días, anote los alimentos y bebidas que consume entre las comidas y en las comidas. ¿Toma muy pocas raciones de fruta y verdura? Para comenzar, trate de comer solamente una ración más de fruta y verdura al día." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show]; //Muestra el alert
    } else if([indexPath.description isEqualToString:@"<NSIndexPath: 0xc000000000200216> {length = 2, path = 2 - 1}"]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Informacion importante." message:@"No hay alimentos “buenos” o “malos”, sólo dietas buenas o malas. No se sienta culpable de los alimentos que le gustan, simplemente tómelos con moderación y escoja otros alimentos que le proporcionen el equilibrio y la variedad que necesita para conseguir una buena salud." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show]; //Muestra el alert
    }
    
}

@end

