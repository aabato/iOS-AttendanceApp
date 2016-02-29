//
//  FISStudentsDataStore.m
//  Attendance
//
//  Created by Angelica Bato on 2/29/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import "FISStudentsDataStore.h"

@implementation FISStudentsDataStore

-(NSMutableArray *)currentStudents {
    
    NSMutableArray *students = [[NSMutableArray alloc] init];
    
    
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
    
    [students addObject:angelica];
    [students addObject:ariel];
    [students addObject:rodrigo];
    [students addObject:felix];
    [students addObject:jeremy];
    [students addObject:brian];
    [students addObject:daniel];
    [students addObject:lisa];
    [students addObject:rosie];
    [students addObject:adrian];
    [students addObject:federico];
    [students addObject:andreas];
    
    
    return students;
}

+(instancetype)commonDataStore {
    static FISStudentsDataStore *dataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataStore = [[FISStudentsDataStore alloc] init];
    });
    return dataStore;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        _students = [self currentStudents];
        _signedInStudents = [@[] mutableCopy];
    }
    
    return self;
}

@end
