//
//  SysModel.m
//  MantleAndAFNetworking
//
//  Created by TyroneZhang on 8/25/15.
//  Copyright (c) 2015 Tyrone. All rights reserved.
//

#import "SysModel.h"

@implementation SysModel

/*
 * 1. return nil means that property name is equal to json's key.
 * 2. you can just add special key in dictionary,others that outside of the dictionary,just means 1.
 */

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"idNum": @"id"};
}

@end
