//
//  NSDictionary+URLEncoding.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "NSDictionary+URLEncoding.h"

static NSString *toString(id object)
{
    return [NSString stringWithFormat:@"%@", object];
}

// helper function: get the url encoded string form of any object
static NSString *urlEncode(id object)
{
    NSString *string = toString(object);
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


@implementation NSDictionary (URLEncoding)

- (NSString *)urlEncodedString
{
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self)
    {
        id value = [self objectForKey:key];
        NSString *part = [NSString stringWithFormat:@"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject:part];
    }
    return [parts componentsJoinedByString:@"&"];
}


@end
