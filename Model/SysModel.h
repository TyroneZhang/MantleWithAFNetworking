//
//  SysModel.h
//  MantleAndAFNetworking
//
//  Created by TyroneZhang on 8/25/15.
//  Copyright (c) 2015 Tyrone. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface SysModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSDate *sunrise;
@property (nonatomic, strong) NSDate *sunset;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber *idNum;

@end
