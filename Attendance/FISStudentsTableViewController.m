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
    
    NSLog(@"FIS Students View Did Load");
    NSLog(@"Students View Did Load Count: %lu", self.viewDidLoadCount);

    
    
    
//    if (self.viewDidLoadCount != 1) {
    self.sharedDataStore = [FISStudentsDataStore commonDataStore];
    [self.sharedDataStore fetchData];
    [self.sharedDataStore generateTestData];
    [self.sharedDataStore saveContext];
    
    self.nonSignedInStudents = self.sharedDataStore.nonSignedInStudents;
    
    
    


//        self.students = [[myStore.day.nonSignedInStudents allObjects] mutableCopy];
//        self.signedInStudents = [[myStore.day.signedInStudents allObjects] mutableCopy];
        
//        NSLog(@"mystore.students: %@, self.students :%@", [myStore.day.nonSignedInStudents allObjects], self.students);
    
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
    return self.sharedDataStore.day.nonSignedInStudents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"
                                                            forIndexPath:indexPath];
    
    FISStudentDM *studentAtRowOfIndexPath = self.nonSignedInStudents[indexPath.row];
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
    
        FISConfirmationViewController *destinationViewController = segue.destinationViewController;
        
        NSIndexPath *indexPathOfPressedRow = self.tableView.indexPathForSelectedRow;
        FISStudentDM *studentAtPressedRow = self.nonSignedInStudents[indexPathOfPressedRow.row];
//        studentAtPressedRow.isSignedIn = YES;
        
        destinationViewController.firstNameOfSignedInStudent = studentAtPressedRow.firstName;
        
        FISStudentsDataStore *dataStore = [FISStudentsDataStore commonDataStore];
        
        [dataStore.day addSignedInStudentsObject:studentAtPressedRow];
        [dataStore.day removeNonSignedInStudentsObject:studentAtPressedRow];
        
//        [dataStore.signedInStudents addObject:studentAtPressedRow];
//        [dataStore.students removeObject:studentAtPressedRow];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPathOfPressedRow] withRowAnimation:UITableViewRowAnimationRight];
        
        [dataStore saveContext];
    }
    else if ([segue.identifier isEqualToString:@"loginSegue"]){
        FISLoginViewController *destinationViewController = segue.destinationViewController;
//        destinationViewController.signedInStudents = self.signedInStudents;
//        destinationViewController.students = self.students;
    }
}

#pragma mark - Helper Methods

- (void)sortStudentsByFirstName:(NSMutableArray *)students {
    NSSortDescriptor *sortByFirstNameAscending = [NSSortDescriptor sortDescriptorWithKey:@"firstName"
                                                                               ascending:YES];
    [students sortUsingDescriptors:@[sortByFirstNameAscending]];
}

@end
