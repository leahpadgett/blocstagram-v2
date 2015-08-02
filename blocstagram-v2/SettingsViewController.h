//
//  SettingsViewController.h
//  blocstagram-v2
//
//  Created by Leah Padgett on 8/2/15.
//  Copyright (c) 2015 Leah Padgett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>


@property (weak, nonatomic) IBOutlet UIPickerView *picker;


@end
