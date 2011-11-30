//
//  ItemDetailViewController.h
//  Homepwner
//
//  Created by  Chuns on 11-11-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

@class ItemDetailViewController;

@protocol ItemDetailViewControllerDelegate <NSObject>

@optional
- (void)itemDetailViewControllerWillDismiss:(ItemDetailViewController *)vc;

@end

#import <UIKit/UIKit.h>

@class Possession;

@interface ItemDetailViewController : UIViewController 
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, 
 UITextFieldDelegate, UIPopoverControllerDelegate>
{
    
    IBOutlet UITextField *nameField;
    
    IBOutlet UITextField *serialNumberField;
    
    IBOutlet UITextField *ValueField;
   
    IBOutlet UILabel *dateLabel;
    
    IBOutlet UIImageView *imageView;
    
    Possession *possession;
    
    UIPopoverController *imagePickerPopover;
    
}

@property (nonatomic, retain) Possession *possession;
- (IBAction)takePicture:(id)sender;

- (IBAction)backgroundTapped:(id)sender;

- (id)initForNewItem:(BOOL)isNew;

@property (nonatomic, assign) id<ItemDetailViewControllerDelegate> delegate;

@end
