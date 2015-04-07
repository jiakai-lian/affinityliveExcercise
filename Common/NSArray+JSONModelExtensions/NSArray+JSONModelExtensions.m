//
//  NSArray+JSONModelExtensions.m
//  AffinityLiveExercise
//
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "NSArray+JSONModelExtensions.h"
#import <JSONModel.h>

@implementation NSArray (JSONModelExtensions)

- (NSString *)toJSONString
{
    NSMutableArray *jsonObjects = [NSMutableArray new];
    for (id obj in self)
        [jsonObjects addObject:[obj toJSONString]];
    return [NSString stringWithFormat:@"[%@]", [jsonObjects componentsJoinedByString:@","]];
}

@end
