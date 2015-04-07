//
//  MessageResponse.h
//  AffinityLiveExercise
//
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"
#import "Message.h"

@interface MessageResponse : JSONModel

@property(nonatomic, copy) NSArray <Message> *messages;
@end
