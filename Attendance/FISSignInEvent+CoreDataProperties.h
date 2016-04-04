//
//  FISSignInEvent+CoreDataProperties.h
//  Attendance
//
//  Created by Angelica Bato on 4/2/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FISSignInEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface FISSignInEvent (CoreDataProperties)

@property (nonatomic) NSTimeInterval timeStamp;
@property (nonatomic) BOOL isLate;
@property (nullable, nonatomic, retain) FISStudentDM *signInByUser;

@end

NS_ASSUME_NONNULL_END
