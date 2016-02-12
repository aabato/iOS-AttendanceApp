//
//  ViewController.m
//  Attendance
//
//  Created by Angelica Bato on 2/12/16.
//  Copyright © 2016 Angelica Bato. All rights reserved.
//

#import "ViewController.h"
#import "AVFoundation/AVFoundation.h"

@interface ViewController ()

@property(strong, nonatomic)id<UIPickerViewDataSource> dataSource;
@property(strong, nonatomic)NSArray *pickerData;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.picker numberOfRowsInComponent:5];
    
    
    _pickerData = @[@"Angelica Bato",
                    @"Ariel Scott-Dicker",
                    @"Felix Changoo",
                    @"Rodrigo Santos"];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
