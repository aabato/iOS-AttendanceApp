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
    
    if (self.viewDidLoadCount != 1) {
    [super viewDidLoad];
    self.students = [NSMutableArray new];
    self.signedInStudents = [NSMutableArray new];
    
    FISStudent *angelica = [[FISStudent alloc] initWithFirstName:@"Angelica"
                                                        lastName:@"Bato"];
    
    FISStudent *ariel = [[FISStudent alloc] initWithFirstName:@"Ariel"
                                                     lastName:@"Scott-Dicker"];
    
    FISStudent *rodrigo = [[FISStudent alloc] initWithFirstName:@"Rodrigo"
                                                       lastName:@"Santos"];
    
    FISStudent *felix = [[FISStudent alloc] initWithFirstName:@"Felix"
                                                     lastName:@"Changoo"];
    
    FISStudent *jeremy = [[FISStudent alloc] initWithFirstName:@"Jeremy"
                                                      lastName:@"Feld"];
        
    FISStudent *brian = [[FISStudent alloc] initWithFirstName:@"Brian"
                                                     lastName:@"Clouser"];
        
    FISStudent *daniel = [[FISStudent alloc] initWithFirstName:@"Daniel"
                                                    lastName:@"Adeyanju"];
        
    FISStudent *lisa = [[FISStudent alloc] initWithFirstName:@"Lisa"
                                                    lastName:@"Lee"];
        
    FISStudent *rosie = [[FISStudent alloc] initWithFirstName:@"Rosie"
                                                     lastName:@"Tarabocchia"];
        
        FISStudent *adrian = [[FISStudent alloc] initWithFirstName:@"Adrian"
                                                          lastName:@"Brown"];
        
        FISStudent *federico = [[FISStudent alloc] initWithFirstName:@"Federico"
                                                            lastName:@"Paliotta"];
        
        FISStudent *andreas = [[FISStudent alloc] initWithFirstName:@"Andreas"
                                                           lastName:@"Vestergaard"];
    
    [self.students addObject:angelica];
    [self.students addObject:ariel];
    [self.students addObject:rodrigo];
    [self.students addObject:felix];
    [self.students addObject:jeremy];
    [self.students addObject:brian];
    [self.students addObject:daniel];
    [self.students addObject:lisa];
    [self.students addObject:rosie];
    [self.students addObject:adrian];
    [self.students addObject:federico];
    [self.students addObject:andreas];
    
        
    [self sortStudentsByFirstName:self.students];
    }
    
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
    return self.students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    FISStudent *studentAtRowOfIndexPath = self.students[indexPath.row];
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
    FISStudent *studentAtPressedRow = self.students[indexPathOfPressedRow.row];
    studentAtPressedRow.isSignedIn = YES;
    
    destinationViewController.firstNameOfSignedInStudent = studentAtPressedRow.firstName;
    
    [self.signedInStudents addObject:studentAtPressedRow];
    [self.students removeObject:studentAtPressedRow];
    [self.tableView deleteRowsAtIndexPaths:@[indexPathOfPressedRow] withRowAnimation:UITableViewRowAnimationRight];
    }
    else {
        FISLoginViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.signedInStudents = self.signedInStudents;
        destinationViewController.students = self.students;
    }
}

#pragma mark - Helper Methods

- (void)sortStudentsByFirstName:(NSMutableArray *)students {
    NSSortDescriptor *sortByFirstNameAscending = [NSSortDescriptor sortDescriptorWithKey:@"firstName"
                                                                               ascending:YES];
    [students sortUsingDescriptors:@[sortByFirstNameAscending]];
}

@end
