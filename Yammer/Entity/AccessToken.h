//
//  AccessToken.h
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"

@protocol AccessToken
@end

@interface AccessToken : JSONModel

@property (nonatomic, copy) NSString * token;

@end
