//
//  AccessTokenResponse.h
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"
#include "User.h"
#include "AccessToken.h"

@protocol AccessTokenResponse

@end

@interface AccessTokenResponse : JSONModel

@property(nonatomic, strong) AccessToken *access_token;
@property(nonatomic, strong) User *user;

@end
