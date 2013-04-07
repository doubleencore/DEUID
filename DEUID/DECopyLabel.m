//
//  DECopyLabel.m
//  DEUID
//
//  Created by Jay Graves on 3/31/13.
//  Copyright (c) 2013 Double Encore, Inc. All rights reserved.
//


#import "DECopyLabel.h"


@implementation DECopyLabel


- (BOOL)canBecomeFirstResponder
{
    return YES;
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copy:)) {
        return YES;
    }
    else {
        return NO;
    }
}


- (void)copy:(id)sender
{
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    [pasteBoard setString:self.text];
}


- (void)setText:(NSString *)text
{
    if ([self.text isEqualToString:text]) {
        self.backgroundColor = [UIColor clearColor];
    }
    else {
        self.backgroundColor = [UIColor redColor];
    }
    
    [super setText:text];
}

@end
