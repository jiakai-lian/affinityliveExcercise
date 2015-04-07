//
//  TaskHandlerProtocol.h
//  AffinityLiveExercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@protocol TaskHandlerProtocol <NSObject>

@property(nonatomic, copy) Task *task;

@end
