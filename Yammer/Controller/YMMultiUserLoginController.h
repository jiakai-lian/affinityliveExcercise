//
//  YMMultiUserLoginController.h
//  AffinityLiveExercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMLoginController.h"

@protocol AccessTokenResponse;

static NSString *const YAMMER_KEYCHAIN_MULTI_USER_AUTH_TOKEN_KEY = @"YammerKeychainMultiUserAuthTokenKey";

@interface YMMultiUserLoginController : YMLoginController

+ (instancetype)sharedInstance;

- (void)startLogin;

- (BOOL)handleLoginRedirectFromUrl:(NSURL *)url sourceApplication:(NSString *)sourceApplication;

- (NSMutableArray <AccessTokenResponse> *)storedMultiUserAuthToken;

- (void)clearMultiUserAuthToken;

@end
