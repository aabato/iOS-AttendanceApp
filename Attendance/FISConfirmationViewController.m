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
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    
    self.firstNameConfirmationLabel.text = [NSString stringWithFormat:@"Thanks,\n %@!", self.firstNameOfSignedInStudent];
    self.timeLabel.text = [NSString stringWithFormat:@"You signed in at %@", formattedDateString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
