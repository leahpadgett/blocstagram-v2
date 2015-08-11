//
//  SettingsViewController.m
//  blocstagram-v2
//
//  Created by Leah Padgett on 8/2/15.
//  Copyright (c) 2015 Leah Padgett. All rights reserved.
//

#import "SettingsViewController.h"
#import "ImagesTableViewController.h"
 
@interface SettingsViewController ()

@end

@implementation SettingsViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    //Initialize Data
    _pickerData = @[@"5 mins", @"10 mins", @"15 mins", @"20 mins", @"1/2hr", @"1hr", @"2hrs", @"3hrs"];
    
    _PostGoalpickerData = @[@"1", @"2", @"3", @"4", @"5"];
    
    
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    self.PostGoalpicker.dataSource = self;
    self.PostGoalpicker.delegate = self;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
        return 1;
}
- (NSInteger)numberOfComponentsInPostGoalPickerView:(UIPickerView *)PostGoalpickerView{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView.tag == 1) {
        return _pickerData.count;
    }
    else {
        return _PostGoalpickerData.count;
    }
}


// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView.tag == 1) {
        return _pickerData[row];
    }
    else {
         return _PostGoalpickerData[row];
    }
}

// Capture the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}

- (IBAction)doneButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
