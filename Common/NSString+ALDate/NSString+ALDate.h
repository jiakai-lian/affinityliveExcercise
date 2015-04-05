//
//  NSString+ALDate.h
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ALDate)
- (NSDate *) unixTimeStamp;
- (NSString *) formatedUnixTimeStamp;
@end
