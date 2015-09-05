//
//  TestModel.m
//  MantleAndAFNetworking
//
//  Created by TyroneZhang on 8/25/15.
//  Copyright (c) 2015 Tyrone. All rights reserved.
//

#import "TestModel.h"
#import "MTLValueTransformer.h"
#import "SysModel.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@implementation TestModel

/*
 * The dictionary returned by this method specifies how your model object's 
 * properties map to the keys in the JSON representation
 */
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"date": @"dt",
             @"locationName": @"name",
             @"humidity": @"main.humidity",
             @"temperature": @"main.temp", // temperature map to {"main": {"temp": value}}
             @"tempHigh": @"main.temp_max",
             @"tempLow": @"main.temp_min",
             @"sunrise": @"sys.sunrise",
             @"sunset": @"sys.sunset",
             @"conditionDescription": @"weather.description",
             @"condition": @"weather.main",
//             @"icon": @"weather.icon",
             @"windBearing": @"wind.deg",
             @"windSpeed": @"wind.speed",
             @"sysModel": @"sys",
             };
}

//- (NSDictionary *)dictionaryValue {
//    NSMutableDictionary *modifiedDictionaryValue = [[super dictionaryValue] mutableCopy];
//    
//    for (NSString *originalKey in [super dictionaryValue]) {
//        if ([self valueForKey:originalKey] == nil) {
//            [modifiedDictionaryValue removeObjectForKey:originalKey];
//        }
//    }
//    
//    return [modifiedDictionaryValue copy];
//}


/*
 * handle date formmater
 */
+ (NSValueTransformer *)transformDateFormmater
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        NSTimeInterval secs = [number doubleValue];
        return [NSDate dateWithTimeIntervalSince1970:secs];
        
    } reverseBlock:^id(NSDate *date) {
        return @([date timeIntervalSince1970]);
    }];
}

+ (NSValueTransformer *)dateJSONTransformer
{
    return [self transformDateFormmater];
}

+ (NSValueTransformer *)sunriseJSONTransformer
{
    return [self transformDateFormmater];
}

+ (NSValueTransformer *)sunsetJSONTransformer
{
    return [self transformDateFormmater];
}

/*
 * handle NSArray to NSString.
 */

+ (NSValueTransformer *)transformerBetweenNSArrayAndNSString
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *array) {
        return [array firstObject];
        
    } reverseBlock:^id(NSString *string) {
        return @[string];
    }];
}

+ (NSValueTransformer *)conditionJSONTransformer
{
    return [self transformerBetweenNSArrayAndNSString];
}

+ (NSValueTransformer *)conditionDescriptionJSONTransformer
{
    return [self transformerBetweenNSArrayAndNSString];
}

/*
 * personal object maping
 */
+ (NSValueTransformer *)sysModelJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[SysModel class]];
}


@end
