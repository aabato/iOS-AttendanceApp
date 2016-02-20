//
//  FISStudentsTableViewController.h
//  Attendance
//
//  Created by Ariel Scott-Dicker on 2/18/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISStudent.h"
#import "FISConfirmationViewController.h"
#import "FISLoginViewController.h"

@interface FISStudentsTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *students;
@property (strong, nonatomic) NSMutableArray *signedInStudents;
@property NSUInteger viewDidLoadCount;

@end
