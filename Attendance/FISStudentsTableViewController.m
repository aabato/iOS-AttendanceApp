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
    self.students = [NSMutableArray new];
    
    FISStudent *angelica = [[FISStudent alloc] initWithFirstName:@"Angelica"
                                                        lastName:@"Bato"];
    
    FISStudent *ariel = [[FISStudent alloc] initWithFirstName:@"Ariel"
                                                     lastName:@"Scott-Dicker"];
    
    FISStudent *rodrigo = [[FISStudent alloc] initWithFirstName:@"Rodrigo"
                                                       lastName:@"Santos"];
    
    FISStudent *felix = [[FISStudent alloc] initWithFirstName:@"Felix"
                                                     lastName:@"Changoo"];
    
    [self.students addObject:angelica];
    [self.students addObject:ariel];
    [self.students addObject:rodrigo];
    [self.students addObject:felix];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(UITableViewCell *)sender {
    
    FISConfirmationViewController *destinationViewController = segue.destinationViewController;
    
    NSIndexPath *indexPathOfPressedRow = self.tableView.indexPathForSelectedRow;
    FISStudent *studentAtPressedRow = self.students[indexPathOfPressedRow.row];
    
    destinationViewController.firstNameOfSignedInStudent = studentAtPressedRow.firstName;
    
    [self.students removeObject:studentAtPressedRow];
    [self.tableView deleteRowsAtIndexPaths:@[indexPathOfPressedRow] withRowAnimation:UITableViewRowAnimationRight];
}

@end
