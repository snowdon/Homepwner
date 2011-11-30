//
//  ItemsViewController.h
//  Homepwner
//
//  Created by  Chuns on 11-10-18.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemDetailViewController.h"

@interface ItemsViewController : UITableViewController 
    <ItemDetailViewControllerDelegate>
{
    IBOutlet UIView *headerView;
}

- (UIView *)headerView;
- (IBAction)addNewPossession:(id)sender;
- (IBAction)toggleEditingMode:(id)sender;

@end
