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
    [imageView release];
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
    [imageView release];
    imageView = nil;
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

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[self view] endEditing:YES];
    
    [possession setPossessionName:[nameField text]];
    [possession setSerialNumber:[serialNumberField text]];
    [possession setValueInDollars:[[ValueField text] intValue]];
     
}


- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentModalViewController:imagePicker animated:YES];
    
    [imagePicker release];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [imageView setImage:image];
    
    [self dismissModalViewControllerAnimated:YES];
}

@end
