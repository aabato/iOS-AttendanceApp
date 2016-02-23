//
//  FISConfirmationViewController.m
//  Attendance
//
//  Created by Ariel Scott-Dicker on 2/18/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import "FISConfirmationViewController.h"

@interface FISConfirmationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstNameConfirmationLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation FISConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.firstNameConfirmationLabel removeConstraints:self.firstNameConfirmationLabel.constraints];
    [self.timeLabel removeConstraints:self.timeLabel.constraints];
    [self.view removeConstraints:self.view.constraints];
    
    [self.firstNameConfirmationLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.firstNameConfirmationLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    [self.timeLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.timeLabel.topAnchor constraintEqualToAnchor:self.firstNameConfirmationLabel.bottomAnchor constant:20].active = YES;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    
    self.firstNameConfirmationLabel.text = [NSString stringWithFormat:@"Thanks,\n %@!", self.firstNameOfSignedInStudent];
    self.timeLabel.text = [NSString stringWithFormat:@"You signed in at %@", formattedDateString];
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
