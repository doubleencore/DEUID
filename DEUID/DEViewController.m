//
//  DEViewController.m
//  DEUID
//
//  Created by Jay Graves on 3/30/13.
//  Copyright (c) 2013 Double Encore, Inc. All rights reserved.
//


#import "DEViewController.h"
#import <AdSupport/AdSupport.h>
#include "OpenUDID.h"


@implementation DEViewController


- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(returnFromBackground) name:UIApplicationWillEnterForegroundNotification object:nil];
    
    [self refreshIDs:nil];
}


- (IBAction)refreshIDs:(id)sender
{
    self.UDIDLabel.text = [[UIDevice currentDevice] uniqueIdentifier];
    NSLog(@"UDID: %@", self.UDIDLabel.text);
    
    self.AdvertiserID.text = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSLog(@"AdvertiserID: %@", self.AdvertiserID.text);
    
    self.AdvertiserTrackingEnabledSwitch.on = [[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
    
    self.IdentifierForVendorLabel.text = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"IDFV: %@", self.IdentifierForVendorLabel.text);
    
    self.OpenUDIDLabel.text = [OpenUDID value];
    NSLog(@"OpenUDID: %@", self.OpenUDIDLabel.text);
    
    CFUUIDRef cfuuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *cfuuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, cfuuid));
    self.CFUUIDLabel.text = cfuuidString;
    NSLog(@"CFUUID: %@", self.CFUUIDLabel.text);
    
    self.BundleIDLabel.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSLog(@"BundleID: %@", self.BundleIDLabel.text);
}


- (IBAction)labelTapped:(UITapGestureRecognizer*)gestureRecognizer
{
    UILabel *tappedLabel = (UILabel*)gestureRecognizer.view;
    
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    [menuController setTargetRect:tappedLabel.bounds inView:tappedLabel];
    
    [tappedLabel becomeFirstResponder];
    if ([tappedLabel canBecomeFirstResponder]) {
        [menuController setMenuVisible:YES animated:YES];
    }
}


#pragma mark - Notifications


- (void)returnFromBackground
{
    [self refreshIDs:nil];
}


@end
