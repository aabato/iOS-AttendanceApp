//
//  FISLoginViewController.m
//  Attendance
//
//  Created by Ariel Scott-Dicker on 2/19/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import "FISLoginViewController.h"

@interface FISLoginViewController ()

@end

@implementation FISLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pleaseTryAgainLabel.hidden = YES;
    self.password = @"password";
}

- (IBAction)signInWasTapped:(id)sender {
    if ([self.passwordTextField.text isEqualToString:@"password"]) {
        [self performSegueWithIdentifier:@"loginToDataSegue"
                                  sender:nil];
    }
    else {
        self.pleaseTryAgainLabel.hidden = NO;
    }
}

- (IBAction)goBackButtonWasTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    FISDataTableViewController *destinationViewController = segue.destinationViewController;
    destinationViewController.signedInStudents = self.signedInStudents;
    destinationViewController.students = self.students;
}

@end
