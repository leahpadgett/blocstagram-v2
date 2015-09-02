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
{
    NSDictionary* _frequencyMap;
}


@end

@implementation SettingsViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Initialize Data
    self.pickerData = @[@"5 mins", @"10 mins", @"15 mins", @"20 mins", @"1/2hr", @"1hr", @"2hrs", @"3hrs"];
    self.frequencyData = @[@5, @10, @15, @20, @30, @60, @120, @180];
    
    _frequencyMap = @{@5 : @"5 mins", @10 : @"10 mins", @15 : @"15 mins", @20 : @"20 mins", @30 : @"30 mins", @60 : @"60 mins", @120 : @"120 mins", @180 : @"180 mins"};
    
    self.postGoalpickerData = @[@"1", @"2", @"3", @"4", @"5"];
    
    
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    self.PostGoalpicker.dataSource = self;
    self.PostGoalpicker.delegate = self;

    //load saved data and set pickers to values
    NSUserDefaults *defaultsPicker = [NSUserDefaults standardUserDefaults];
    [self.picker selectRow:[defaultsPicker integerForKey:@"picker"] inComponent:0 animated:TRUE];
    [self.PostGoalpicker selectRow:[defaultsPicker integerForKey:@"pickerTwo"] inComponent:0 animated:TRUE];
    NSLog(@"[defaultsPicker objectForKey:@'picker'] - %ld",(long)[defaultsPicker integerForKey:@"picker"]);
    NSLog(@"[defaultsPicker objectForKey:@'pickerTwo'] - %ld",(long)[defaultsPicker integerForKey:@"pickerTwo"]);
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
    if ([pickerView isEqual:self.picker]) {
        return self.frequencyData.count;
    }
    else {
        return self.postGoalpickerData.count;
    }
}


// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if ([pickerView isEqual:self.picker]) {
        NSNumber* frequency = self.frequencyData[row];
        NSString* displayFrequency = _frequencyMap[frequency];
        
        return displayFrequency;
    }
    else {
         return self.postGoalpickerData[row];
    }
}

// Capture the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView.tag == 1) {
        NSLog(@"row: %ld, _pickerData[row]: %@",(long)row,_pickerData[row]);
        [[NSUserDefaults standardUserDefaults] setInteger:row forKey:@"picker"];
    }
    else {
         NSLog(@"row: %ld, _PostGoalpickerData[row]: %@",(long)row,self.postGoalpickerData[row]);
        [[NSUserDefaults standardUserDefaults] setInteger:row forKey:@"pickerTwo"];
    }
}



- (IBAction)doneButton:(id)sender {
   //[self dismissViewControllerAnimated:YES completion:nil];
    //save data from pickers to choosen store
    
    NSInteger selectedPostGoal = [self.PostGoalpicker selectedRowInComponent:0];
    NSString* postGoalString = self.postGoalpickerData[selectedPostGoal];
    NSNumber* postGoalNumber = [NSNumber numberWithInteger:[postGoalString integerValue]];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:postGoalNumber forKey:@"postGoal"];
    
    NSInteger selectedFrequencyRow = [self.picker selectedRowInComponent:0];
    NSNumber* frequencyValue = self.frequencyData[selectedFrequencyRow];
    [userDefaults setObject:frequencyValue forKey:@"frequency"];
    
    [userDefaults synchronize];

    
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
