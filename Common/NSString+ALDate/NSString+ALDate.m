//
//  NSString+ALDate.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "NSString+ALDate.h"

@implementation NSString (ALDate)

static NSString const *DATETIME_FORMAT = @"dd'/'MM'/'yyyy' 'HH':'mm' 'z";

- (NSDate *) unixTimeStamp
{
    return [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
}

- (NSString *) formatedUnixTimeStamp
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      dateFormatter = [[NSDateFormatter alloc] init];
                      [dateFormatter setDateFormat:DATETIME_FORMAT.copy];
                  });
    
    return [dateFormatter stringFromDate:[self unixTimeStamp]];
}

@end
