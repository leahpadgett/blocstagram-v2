//
//  DismissSegue.m
//  blocstagram-v2
//
//  Created by Leah Padgett on 8/10/15.
//  Copyright (c) 2015 Leah Padgett. All rights reserved.
//

#import "DismissSegue.h"

@implementation DismissSegue : UIStoryboardSegue



- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    [sourceViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}




@end
