//
//  DEViewController.h
//  DEUID
//
//  Created by Jay Graves on 3/30/13.
//  Copyright (c) 2013 Double Encore, Inc. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DECopyLabel.h"


@interface DEViewController : UIViewController


@property (strong, nonatomic) IBOutlet DECopyLabel *UDIDLabel;
@property (strong, nonatomic) IBOutlet DECopyLabel *AdvertiserID;
@property (strong, nonatomic) IBOutlet UISwitch *AdvertiserTrackingEnabledSwitch;
@property (strong, nonatomic) IBOutlet DECopyLabel *OpenUDIDLabel;
@property (strong, nonatomic) IBOutlet DECopyLabel *IdentifierForVendorLabel;
@property (strong, nonatomic) IBOutlet DECopyLabel *CFUUIDLabel;
@property (strong, nonatomic) IBOutlet DECopyLabel *BundleIDLabel;


- (IBAction)refreshIDs:(id)sender;
- (IBAction)labelTapped:(id)sender;


@end
