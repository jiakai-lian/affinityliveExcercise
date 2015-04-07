//
//  Assignee.h
//  AffinityLiveExercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"

@interface Assignee : JSONModel

@property(nonatomic, copy) NSString *email;
@property(nonatomic, copy) NSString <Optional> *firstname;
@property(nonatomic, copy) NSString <Index> *id;
@property(nonatomic, copy) NSString <Optional> *surname;

- (NSString *)fullName;

@end
