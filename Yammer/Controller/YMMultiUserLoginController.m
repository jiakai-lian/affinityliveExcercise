//
//  YMMultiUserLoginController.m
//  AffinityLiveExercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "YMMultiUserLoginController.h"
#import "YMConstants.h"
#import "YMHTTPClient.h"
#import "NSURL+YMQueryParameters.h"
#import "AccessTokenResponse.h"
#import "Common.h"
#import "NSArray+JSONModelExtensions.h"
#import "JSONModel+ArrayOfModelsFromString.h"
#import <PDKeychainBindingsController.h>
#import <JSONModel.h>

@implementation YMMultiUserLoginController

+ (instancetype)sharedInstance
{
    static YMMultiUserLoginController *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (void)startLogin
{
    [super startLogin];
}

- (BOOL)handleLoginRedirectFromUrl:(NSURL *)url sourceApplication:(NSString *)sourceApplication
{
    return [super handleLoginRedirectFromUrl:url sourceApplication:sourceApplication];
}


/**
 *  rewrite this method to support multiple users
 *
 *  @param code access code
 */
- (void)obtainAuthTokenForCode:(NSString *)code
{
    LOG(@"");
    // The YMHTTPClient uses a "baseUrl" with paths appended.  The baseUrl looks like "https://www.mydomain.com"
    NSURL *baseURL = [NSURL URLWithString:YAMMER_BASE_URL];

    // Query params
    NSDictionary *params =
            @{@"client_id" : YAMMER_APP_CLIENT_ID,
                    @"client_secret" : YAMMER_APP_CLIENT_SECRET,
                    @"code" : code};

    // Yammer SDK: Note that once we have the authToken, we use a different constructor to create the client:
    //- (id)initWithBaseURL:(NSURL *)baseURL authToken:(NSString *)authToken.
    // But we don't have the authToken yet, so we use this:
    YMHTTPClient *client = [[YMHTTPClient alloc] initWithBaseURL:baseURL];

    __weak typeof (self) weakSelf = self;

    [client postPath:@"/oauth2/access_token.json"
          parameters:params
             success:^(id responseObject)
             {

                 NSError *error = nil;

                 NSDictionary *jsonDict = (NSDictionary *) responseObject;
                 AccessTokenResponse *response = [[AccessTokenResponse alloc] initWithDictionary:jsonDict error:&error];
//                 NSString *authToken = response.access_token.token;

                 // For debugging purposes only
                 NSLog(@"Yammer Login JSON: %@", responseObject);
                 NSLog(@"response object: %@", response);

                 // Save the authToken in the KeyChain
                 [weakSelf storeMultiUserInKeychain:response];

//                 [weakSelf.delegate loginController:weakSelf didCompleteWithAuthToken:authToken];
                 [[NSNotificationCenter defaultCenter] postNotificationName:YMYammerSDKLoginDidCompleteNotification object:weakSelf userInfo:nil];
             }
             failure:^(NSInteger statusCode, NSError *error)
             {
                 NSMutableDictionary *userInfo = [@{NSLocalizedDescriptionKey : @"Unable to retrieve authentication token from code"} mutableCopy];
                 if (error)
                 {
                     userInfo[NSUnderlyingErrorKey] = error;
                     userInfo[NSLocalizedFailureReasonErrorKey] = [error localizedDescription];
                 }

                 NSError *newError = [NSError errorWithDomain:YMYammerSDKErrorDomain code:YMYammerSDKLoginObtainAuthTokenError userInfo:userInfo];

//                 [weakSelf.delegate loginController:weakSelf didFailWithError:newError];
                 [[NSNotificationCenter defaultCenter] postNotificationName:YMYammerSDKLoginDidFailNotification object:weakSelf userInfo:@{YMYammerSDKErrorUserInfoKey : newError}];
             }
    ];
}

- (void)storeMultiUserInKeychain:(AccessTokenResponse *)response
{
    LOG(@"");
    NSMutableArray <AccessTokenResponse> *responseArray = nil;
    NSMutableArray <AccessTokenResponse> *savedResponseArray = [self storedMultiUserAuthToken];
    if (savedResponseArray)
    {
        responseArray = savedResponseArray;
    }
    else
    {
        responseArray = (NSMutableArray <AccessTokenResponse> *) [NSMutableArray array];
    }

    [self replaceOrAppendResponse:responseArray withResponse:response];

    PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
    [bindings setObject:[responseArray toJSONString] forKey:YAMMER_KEYCHAIN_MULTI_USER_AUTH_TOKEN_KEY];
}

- (NSMutableArray <AccessTokenResponse> *)storedMultiUserAuthToken
{
    LOG(@"");
    NSString *jsonArrayString = [[PDKeychainBindings sharedKeychainBindings] objectForKey:YAMMER_KEYCHAIN_MULTI_USER_AUTH_TOKEN_KEY];
    if (jsonArrayString)
    {
        return (NSMutableArray <AccessTokenResponse> *) [AccessTokenResponse arrayOfModelsFromString:jsonArrayString];
    }

    return nil;
}

- (void)clearMultiUserAuthToken
{
    LOG(@"");
    [[PDKeychainBindings sharedKeychainBindings] removeObjectForKey:YAMMER_KEYCHAIN_MULTI_USER_AUTH_TOKEN_KEY];
}

/**
 *  replace duplicate response object in the response array
 *
 *  @param array    an array of AccessTokenResponse objects
 *  @param response the new response got from Internet
 */
- (void)replaceOrAppendResponse:(NSMutableArray <AccessTokenResponse> *)array withResponse:(AccessTokenResponse *)response
{
    AccessTokenResponse *resp;
    for (NSUInteger i = 0; i < array.count; i++)
    {
        resp = [array objectAtIndex:i];
        //compare user to check whether two response have duplicated user or not.
        if ([response.user isEqual:resp.user])
        {
            [array replaceObjectAtIndex:i withObject:response];
            return;
        }
    }

    [array addObject:response];
}


@end
