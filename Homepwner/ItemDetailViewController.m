//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by  Chuns on 11-11-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Possession.h"

@implementation ItemDetailViewController 

@synthesize possession;

- (void)dealloc {
    [nameField release];
    [nameField release];
    [serialNumberField release];
    [ValueField release];
    [dateLabel release];
    [possession release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setNameField:nil];
    [nameField release];
    nameField = nil;
    [serialNumberField release];
    serialNumberField = nil;
    [ValueField release];
    ValueField = nil;
    [dateLabel release];
    dateLabel = nil;
    [super viewDidUnload];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [nameField setText:[possession possessionName]];
    [serialNumberField setText:[possession serialNumber]];
    [ValueField setText:[NSString stringWithFormat:@"%d",
                         [possession valueInDollars]]];
    
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init]
                                      autorelease];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    [dateLabel setText:[dateFormatter stringFromDate:[possession dateCreated]]];
    
    [[self navigationController] setTitle:[possession possessionName]];
}


@end
