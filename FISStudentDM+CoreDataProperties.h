//
//  FISStudentDM+CoreDataProperties.h
//  Attendance
//
//  Created by Ariel Scott-Dicker on 4/10/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FISStudentDM.h"

NS_ASSUME_NONNULL_BEGIN

@interface FISStudentDM (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSSet<FISSignInEvent *> *studentSignIns;

@end

@interface FISStudentDM (CoreDataGeneratedAccessors)

- (void)addStudentSignInsObject:(FISSignInEvent *)value;
- (void)removeStudentSignInsObject:(FISSignInEvent *)value;
- (void)addStudentSignIns:(NSSet<FISSignInEvent *> *)values;
- (void)removeStudentSignIns:(NSSet<FISSignInEvent *> *)values;

@end

NS_ASSUME_NONNULL_END
