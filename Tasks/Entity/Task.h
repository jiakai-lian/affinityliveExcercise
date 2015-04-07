//
//  Task.h
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"
#import "Assignee.h"
#import "Type.h"

@protocol Task
@end

@interface Task : JSONModel

@property(nonatomic, copy) NSString *date_created;
@property(nonatomic, copy) Assignee *assignee;
@property(nonatomic, copy) Type *type;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString <Index> *id;
@property(nonatomic, copy) NSString *date_started;
@property(nonatomic, copy) NSString *date_due;

@end
