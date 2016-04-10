//
//  FISSignInEvent+CoreDataProperties.h
//  Attendance
//
//  Created by Ariel Scott-Dicker on 4/10/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FISSignInEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface FISSignInEvent (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *isLate;
@property (nullable, nonatomic, retain) NSDate *timeStamp;
@property (nullable, nonatomic, retain) FISStudentDM *signInByUser;

@end

NS_ASSUME_NONNULL_END
