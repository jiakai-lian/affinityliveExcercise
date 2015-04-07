//
//  Body.h
//  AffinityLiveExercise
//
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"

@interface Body : JSONModel

@property(nonatomic, copy) NSString *parsed;
@property(nonatomic, copy) NSString *plain;
@property(nonatomic, copy) NSString *rich;

@end
