//
//  DietasTableViewController.m
//  CODEPROYECTO2016
//
//  Created by Rito Angel Hernández Torres on 12/03/16.
//  Copyright © 2016 CADES. All rights reserved.
//

#import "DietasTableViewController.h"


@interface DietasTableViewController ()

@end

@implementation DietasTableViewController
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    // Initialize thumbnails
    self.tableData = [NSArray arrayWithObjects:@"Titulo de la Dieta",@"Titulo de la Dieta",@"Titulo de la Dieta",@"Titulo de la Dieta",@"Titulo de la Dieta",@"Titulo de la Dieta",@"Titulo de la Dieta",@"Titulo de la Dieta",@"Titulo de la Dieta",@"Titulo de la Dieta", nil];
    
    // Initialize thumbnails
    self.thumbnails = [NSArray arrayWithObjects:@"Dieta2.png",@"Dieta3.png",@"Dieta4.png",@"Dieta5.png",@"Dieta6.png",@"Dieta7.png",@"Dieta8.png",@"Dieta9.png",@"Dieta10.png",@"Dieta11.png", nil];
    
    // Initialize Preparation Time
    self.prepTime = [NSArray arrayWithObjects:@"Descripcion de la dieta",@"Descripcion de la dieta",@"Descripcion de la dieta",@"Descripcion de la dieta",@"Descripcion de la dieta",@"Descripcion de la dieta",@"Descripcion de la dieta",@"Descripcion de la dieta",@"Descripcion de la dieta",@"Descripcion de la dieta", nil];
    
   
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableData count];
    
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *SimpleIdentifier = @"SimpleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
    
    
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentifier];
       
        //cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        //cell.textLabel.numberOfLines = 0;
        //cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    }
    cell.textLabel.text = self.tableData[indexPath.row];

    UIImage *image1 = [UIImage imageNamed:[self.thumbnails objectAtIndex:indexPath.row]];
    cell.imageView.image=image1;
    cell.detailTextLabel.text = self.prepTime[indexPath.row];
    
    
    return cell;

}

@end
