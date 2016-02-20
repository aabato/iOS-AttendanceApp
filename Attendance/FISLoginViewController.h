//
//  FISLoginViewController.h
//  Attendance
//
//  Created by Ariel Scott-Dicker on 2/19/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISLoginViewController.h"
#import "FISDataTableViewController.h"

@interface FISLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *pleaseTryAgainLabel;

@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSMutableArray *signedInStudents;
@property (strong, nonatomic) NSMutableArray *students;

@end
