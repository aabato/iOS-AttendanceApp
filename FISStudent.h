//
//  FISStudent.h
//  Attendance
//
//  Created by Ariel Scott-Dicker on 2/18/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property BOOL isSignedIn;
@property BOOL isLate;

// Designated initializer
- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName;

@end
