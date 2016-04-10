//
//  FISStudentsDataStore.m
//  Attendance
//
//  Created by Angelica Bato on 2/29/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import "FISStudentsDataStore.h"

@implementation FISStudentsDataStore
@synthesize managedObjectContext = _managedObjectContext;

-(void)generateTestData {
    
    NSLog(@"====GENERATE TEST DATA CALLED ======");
    
    self.day = [NSEntityDescription insertNewObjectForEntityForName:@"FISDay"
                                             inManagedObjectContext:self.managedObjectContext];
    
    FISStudentDM *angelica = [NSEntityDescription insertNewObjectForEntityForName:@"FISStudentDM" inManagedObjectContext:self.managedObjectContext];
    FISStudentDM *ariel = [NSEntityDescription insertNewObjectForEntityForName:@"FISStudentDM" inManagedObjectContext:self.managedObjectContext];
    FISStudentDM *rodrigo = [NSEntityDescription insertNewObjectForEntityForName:@"FISStudentDM" inManagedObjectContext:self.managedObjectContext];
    FISStudentDM *felix = [NSEntityDescription insertNewObjectForEntityForName:@"FISStudentDM" inManagedObjectContext:self.managedObjectContext];
    FISStudentDM *jeremy = [NSEntityDescription insertNewObjectForEntityForName:@"FISStudentDM" inManagedObjectContext:self.managedObjectContext];
    
    angelica.firstName = @"Angelica";
    angelica.lastName = @"Bato";
    ariel.firstName = @"Ariel";
    ariel.lastName = @"Scott-Dicker";
    rodrigo.firstName = @"Rodrigo";
    rodrigo.lastName = @"Santos";
    felix.firstName = @"Felix";
    felix.lastName = @"Changoo";
    jeremy.firstName = @"Jeremy";
    jeremy.lastName = @"Feld";
    
    [self.day addNonSignedInStudentsObject:angelica];
    [self.day addNonSignedInStudentsObject:ariel];
    [self.day addNonSignedInStudentsObject:rodrigo];
    [self.day addNonSignedInStudentsObject:felix];
    [self.day addNonSignedInStudentsObject:jeremy];
    
    [self saveContext];
    [self fetchData];
    
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"AttendanceDataModel.sqlite"];
    
    NSError *error = nil;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"AttendanceDataModel" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (void)addStudent:(FISStudentDM *)student {
    [self.day addSignedInStudentsObject:student];
    [self.day removeNonSignedInStudentsObject:student];
    [self saveContext];
    [self fetchData];
}

- (void)fetchData
{
    NSFetchRequest *dayRequest = [NSFetchRequest fetchRequestWithEntityName:@"FISDay"];
//    NSFetchRequest *studentRequest = [NSFetchRequest fetchRequestWithEntityName:@"FISStudentDM"];
    NSFetchRequest *signInEventRequest = [NSFetchRequest fetchRequestWithEntityName:@"FISSignInEvent"];
    
    self.days = [self.managedObjectContext executeFetchRequest:dayRequest
                                                          error:nil];
    
    NSLog(@"days: %ld", self.days.count);
    
    
    // Enter a for loop over self.days
    // Generate a dictionary through this for loop.
    // Key is the Day
    // Value is an array of nonSignedInSTudents
    // datastore has dictionary property, have it equal this built out dictionwary when done.
    
    
    
    if (self.days.count >= 1) {
        FISDay *day = self.days[0];
        self.nonSignedInStudents = [day.nonSignedInStudents allObjects];
        
    } else {
        self.nonSignedInStudents = [NSArray new];
    }
    
    
    NSLog(@"nonSignedInStudents: %ld", self.nonSignedInStudents.count);
    
    self.signInEvents = [self.managedObjectContext executeFetchRequest:signInEventRequest
                                                                 error:nil];
    
    NSLog(@"signInEvents: %ld", self.signInEvents.count);
    
    if (self.days.count == 0) {
        NSLog(@"--------- NONSIGNED IN STUDENTS IS ZERO !!!! ---------\n\n\n");
        [self generateTestData];
    }
}

+(instancetype)commonDataStore {
    
    static FISStudentsDataStore *dataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataStore = [[FISStudentsDataStore alloc] init];
        [dataStore fetchData];
    });
    return dataStore;
}

@end
