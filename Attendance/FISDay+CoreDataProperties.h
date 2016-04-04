//
//  FISDay+CoreDataProperties.h
//  Attendance
//
//  Created by Angelica Bato on 4/2/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FISDay.h"

NS_ASSUME_NONNULL_BEGIN

@interface FISDay (CoreDataProperties)

@property (nonatomic) NSTimeInterval date;
@property (nullable, nonatomic, retain) NSSet<FISStudentDM *> *signedInStudents;
@property (nullable, nonatomic, retain) NSSet<FISStudentDM *> *nonSignedInStudents;

@end

@interface FISDay (CoreDataGeneratedAccessors)

- (void)addSignedInStudentsObject:(FISStudentDM *)value;
- (void)removeSignedInStudentsObject:(FISStudentDM *)value;
- (void)addSignedInStudents:(NSSet<FISStudentDM *> *)values;
- (void)removeSignedInStudents:(NSSet<FISStudentDM *> *)values;

- (void)addNonSignedInStudentsObject:(FISStudentDM *)value;
- (void)removeNonSignedInStudentsObject:(FISStudentDM *)value;
- (void)addNonSignedInStudents:(NSSet<FISStudentDM *> *)values;
- (void)removeNonSignedInStudents:(NSSet<FISStudentDM *> *)values;

@end

NS_ASSUME_NONNULL_END
