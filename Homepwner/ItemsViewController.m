//
//  ItemsViewController.m
//  Homepwner
//
//  Created by  Chuns on 11-10-18.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//


#import "ItemsViewController.h"
#import "Possession.h"
#import "PossessionStore.h"

@implementation ItemsViewController

- (IBAction)addNewPossession:(id)sender
{
    [[PossessionStore defaultStore] createPossession];
    
    [[self tableView] reloadData];
}


- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
           initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                target:self 
                                action:@selector(addNewPossession:)];
        [[self navigationItem] setRightBarButtonItem:bbi];
    
        [bbi release];
    
        [[self navigationItem] setTitle:@"Homepwner"];
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section
{
    return [[[PossessionStore defaultStore] allPossessions] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    // if there is no reusable cell, create a new one
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] 
                                  initWithStyle:UITableViewCellStyleDefault
                                reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    Possession *p = [[[PossessionStore defaultStore] allPossessions] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[p description]];
    return cell;
}


- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
       toIndexPath:(NSIndexPath *)toIndexPath
{
    [[PossessionStore defaultStore] movePossessionAtIndex:[fromIndexPath row]
                                                  toIndex:[toIndexPath row]];
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        PossessionStore *ps = [PossessionStore defaultStore];
        NSArray *possessions = [ps allPossessions];
        Possession *p = [possessions objectAtIndex:[indexPath row]];
        [ps removePossession:p];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:YES];
    }
}


- (UIView *) headerView
{
    if (!headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return headerView;
}

- (IBAction)toggleEditingMode:(id)sender
{
    // if we currently in editing mode...
    if ([self isEditing]){
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
        
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailViewController *detailViewController = [[[ItemDetailViewController alloc] init] autorelease];
    
    NSArray *possession = [[PossessionStore defaultStore] allPossessions];
    
    [detailViewController setPossession:[possession objectAtIndex:[indexPath row]]];
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

@end
