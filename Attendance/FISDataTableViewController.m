//
//  FISDataTableViewController.m
//  Attendance
//
//  Created by Ariel Scott-Dicker on 2/19/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import "FISDataTableViewController.h"

@interface FISDataTableViewController ()

@end

@implementation FISDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewDidLoadCount = 1;
    FISStudentsDataStore *dataStore = [FISStudentsDataStore commonDataStore];
    self.signedInStudents = dataStore.signedInStudents;
    self.students = dataStore.students;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.signedInStudents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dataCell"
                                                            forIndexPath:indexPath];
    FISStudent *signedInStudent = self.signedInStudents[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", signedInStudent.firstName, signedInStudent.lastName];
    
    if (signedInStudent.isSignedIn) {
        cell.detailTextLabel.text = @"Signed In";
    }
    
    return cell;
}

#pragma mark - Navigation
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    FISStudentsTableViewController *destinationViewController = segue.destinationViewController;
    destinationViewController.students = self.students;
    destinationViewController.viewDidLoadCount = self.viewDidLoadCount;
}
*/
@end
