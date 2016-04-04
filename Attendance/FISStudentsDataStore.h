//
//  FISStudentsDataStore.h
//  Attendance
//
//  Created by Angelica Bato on 2/29/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "FISStudentDM.h"
#import "FISDay.h"
#import "FISSignInEvent.h"

@interface FISStudentsDataStore : NSObject

@property (strong, nonatomic) FISDay *day;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void)saveContext;
-(void)fetchData;
-(NSURL *)applicationDocumentsDirectory;

+(instancetype)commonDataStore;

@end
