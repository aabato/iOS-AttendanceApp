//
//  FISDataTableViewController.h
//  Attendance
//
//  Created by Ariel Scott-Dicker on 2/19/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISStudent.h"
#import "FISStudentsTableViewController.h"


@interface FISDataTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *signedInStudents;
@property (strong, nonatomic) NSMutableArray *students;
@property NSUInteger viewDidLoadCount;

@end
