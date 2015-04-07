//
//  TasksResponse.h
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"
#import "Task.h"

@interface TasksResponse : JSONModel

@property(nonatomic, copy) NSArray <Task> *response;

@end
