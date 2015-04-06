//
//  NSArray+group.m
//  GroupArray
//
//  Created by Ignazio Calò on 20/1/14.
//  Copyright (c) 2014 it.ignazioc. All rights reserved.
//

#import "NSArray+Group.h"
#import <OrderedDictionary.h>

@implementation NSArray (Group)


-(NSDictionary *)groupUsingBlock:(id<NSCopying> (^)(id obj))block {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    for (id obj in self) {
        id<NSCopying> key = block(obj);
        if (! dictionary[key]) {
            NSMutableArray *arr = [NSMutableArray array];
            dictionary[key] = arr;
        }
        [dictionary[key] addObject:obj];
    }
    return [dictionary copy];
}

-(OrderedDictionary *)orderedDictionaryUsingBlock:(id<NSCopying> (^)(id obj))block {
    MutableOrderedDictionary *dictionary = [[MutableOrderedDictionary alloc] init];
    
    for (id obj in self) {
        id<NSCopying> key = block(obj);
        if (! [dictionary objectForKey:key]) {
            NSMutableArray *arr = [NSMutableArray array];
            [dictionary insertObject:arr forKey:key atIndex:dictionary.count];
        }
        [[dictionary objectForKey:key] addObject:obj];
    }
    return [dictionary copy];
}


-(NSDictionary *)groupByKeyPath:(NSString *) keyPath {
    return [self groupUsingBlock:^id<NSCopying>(id obj) {
        return [obj valueForKeyPath:keyPath];
    }];
}
@end
