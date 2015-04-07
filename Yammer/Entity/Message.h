//
//  Message.h
//  AffinityLiveExercise
//
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"
#import "Body.h"

@protocol Message
@end

@interface Message : JSONModel

@property(nonatomic, copy) NSString <Index> *id;
@property(nonatomic, copy) NSString *sender_id;
@property(nonatomic, copy) NSString <Optional> *replied_to_id;
@property(nonatomic, copy) NSString *created_at;
@property(nonatomic, copy) NSString *network_id;
@property(nonatomic, copy) NSString *message_type;
@property(nonatomic, copy) NSString *sender_type;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *web_url;
@property(nonatomic, copy) Body *body;

@end
