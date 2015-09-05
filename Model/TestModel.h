//
//  TestModel.h
//  MantleAndAFNetworking
//
//  Created by TyroneZhang on 8/25/15.
//  Copyright (c) 2015 Tyrone. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@class SysModel;

@interface TestModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSNumber *humidity;
@property (nonatomic, strong) NSNumber *temperature;
@property (nonatomic, strong) NSNumber *tempHigh;
@property (nonatomic, strong) NSNumber *tempLow;
@property (nonatomic, copy) NSString *locationName;
@property (nonatomic, strong) NSDate *sunrise;
@property (nonatomic, strong) NSDate *sunset;
@property (nonatomic, copy) NSString *conditionDescription;
@property (nonatomic, copy) NSString *condition;
@property (nonatomic, strong) NSNumber *windBearing;
@property (nonatomic, strong) NSNumber *windSpeed;

@property (nonatomic, strong) SysModel *sysModel;

@end
