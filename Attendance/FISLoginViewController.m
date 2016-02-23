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
    
    [self.view removeConstraints:self.view.constraints];
    [self.passwordLabel removeConstraints:self.passwordLabel.constraints];
    [self.passwordTextField removeConstraints:self.passwordTextField.constraints];
    [self.signInButton removeConstraints:self.signInButton.constraints];
    [self.pleaseTryAgainLabel removeConstraints:self.pleaseTryAgainLabel.constraints];
    [self.dismissModalXButton removeConstraints:self.dismissModalXButton.constraints];
    
    [self.passwordTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.passwordTextField.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    [self.passwordLabel.leftAnchor constraintEqualToAnchor:self.passwordTextField.leftAnchor].active = YES;
    [self.passwordLabel.bottomAnchor constraintEqualToAnchor:self.passwordTextField.topAnchor constant:-10].active = YES;
    
    [self.signInButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.signInButton.topAnchor constraintEqualToAnchor:self.passwordTextField.bottomAnchor constant:20].active = YES;
    
    [self.pleaseTryAgainLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.pleaseTryAgainLabel.topAnchor constraintEqualToAnchor:self.signInButton.bottomAnchor constant:10].active = YES;
    
    [self.dismissModalXButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-15].active = YES;
    [self.dismissModalXButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:15].active = YES;
    
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

- (IBAction)dissmissModalXButtonWasTapped:(id)sender {
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
