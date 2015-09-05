//
//  ViewController.m
//  MantleAndAFNetworking
//
//  Created by TyroneZhang on 8/25/15.
//  Copyright (c) 2015 Tyrone. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "TestModel.h"
#import <objc/runtime.h>

NSString *const kJSONURL = @"http://api.openweathermap.org/data/2.5/weather?lat=37.785834&lon=-122.406417&units=imperial";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
    
    __block TestModel *testObj = nil;
    
   [operationManager GET:kJSONURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
       NSLog(@"responseObject = %@",responseObject);
       
       if ([responseObject isKindOfClass:[NSDictionary class]]) {
           testObj = [MTLJSONAdapter modelOfClass:[TestModel class] fromJSONDictionary:responseObject error:nil];
       }
       
       NSLog(@"testObj = %@",testObj);
       NSLog(@"sysmodel = %@",testObj.sysModel);
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:\n%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
