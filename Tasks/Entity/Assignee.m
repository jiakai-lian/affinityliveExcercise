//
//  Assignee.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "Assignee.h"

@implementation Assignee

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstname, self.surname];
}

@end
