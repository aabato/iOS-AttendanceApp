//
//  FISStudentsTableViewController.m
//  Attendance
//
//  Created by Ariel Scott-Dicker on 2/18/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import "FISStudentsTableViewController.h"

@interface FISStudentsTableViewController ()


@end

@implementation FISStudentsTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.sharedDataStore = [FISStudentsDataStore commonDataStore];
    
    
    
    
//    self.nonSignedInStudents = self.sharedDataStore.nonSignedInStudents;
    
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
    NSLog(@"------NUMBER OF ROWS CALLED-------");
    NSLog(@"%ld number of rows", self.sharedDataStore.day.nonSignedInStudents.count);
    return self.sharedDataStore.day.nonSignedInStudents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"
                                                            forIndexPath:indexPath];
    
    FISStudentDM *studentAtRowOfIndexPath = self.sharedDataStore.nonSignedInStudents[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", studentAtRowOfIndexPath.firstName, studentAtRowOfIndexPath.lastName];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"confirmationSegue"]) {
        
//        FISStudentsDataStore *sharedDataStore = [FISStudentsDataStore commonDataStore];
    
        FISConfirmationViewController *destinationViewController = segue.destinationViewController;
        
        NSIndexPath *indexPathOfPressedRow = self.tableView.indexPathForSelectedRow;
        FISStudentDM *studentAtPressedRow = self.sharedDataStore.nonSignedInStudents[indexPathOfPressedRow.row];
//        studentAtPressedRow.isSignedIn = YES;
        
        destinationViewController.firstNameOfSignedInStudent = studentAtPressedRow.firstName;
        
        [self.sharedDataStore addStudent:studentAtPressedRow];
    
       // [self.tableView reloadData];
        
        NSLog(@"indexPath: %@", indexPathOfPressedRow);
        NSLog(@"Non Signed In Students Count: %lu", self.sharedDataStore.nonSignedInStudents.count);
        
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPathOfPressedRow]
                              withRowAnimation:UITableViewRowAnimationNone];
    }
    
//    else if ([segue.identifier isEqualToString:@"loginSegue"]){
//        FISLoginViewController *destinationViewController = segue.destinationViewController;
//        destinationViewController.signedInStudents = self.signedInStudents;
//        destinationViewController.students = self.students;
}

#pragma mark - Helper Methods

- (void)sortStudentsByFirstName:(NSMutableArray *)students {
    NSSortDescriptor *sortByFirstNameAscending = [NSSortDescriptor sortDescriptorWithKey:@"firstName"
                                                                               ascending:YES];
    [students sortUsingDescriptors:@[sortByFirstNameAscending]];
}

@end
