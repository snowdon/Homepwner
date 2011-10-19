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

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        for (int i = 0; i < 10; i++) {
            [[PossessionStore defaultStore] createPossession];
        }
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
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:@"UITableViewCell"] autorelease];
    Possession *p = [[[PossessionStore defaultStore] allPossessions] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[p description]];
    return cell;
}
@end
