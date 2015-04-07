//
//  User.h
//  AffinityLiveExercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"

@protocol User
@end

@interface User : JSONModel

@property(nonatomic, copy) NSString <Optional> *email;
@property(nonatomic, copy) NSString *full_name;
@property(nonatomic, copy) NSString <Index> *id;
@end
