//
//  YMPostFeedController.h
//  AffinityLiveExercise
//
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YMPostFeedController : NSObject


+ (instancetype)sharedInstance;
- (void)postTask:(NSString *)taskMessage andMessage:(NSString *)message withAuthToken:(NSString *)authToken;
@end
