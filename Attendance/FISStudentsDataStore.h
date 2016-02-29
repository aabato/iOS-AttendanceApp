//
//  FISStudentsDataStore.h
//  Attendance
//
//  Created by Angelica Bato on 2/29/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISStudent.h"

@interface FISStudentsDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *students;
@property (strong, nonatomic) NSMutableArray *signedInStudents;

+(instancetype)commonDataStore;

@end
