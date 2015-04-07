//
//  YMPostFeedController.m
//  AffinityLiveExercise
//
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "YMPostFeedController.h"
#import "YMHTTPClient.h"
#import "YMConstants.h"
#import "SampleMessageResponse.h"

@implementation YMPostFeedController

+ (instancetype)sharedInstance
{
    static YMPostFeedController *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (void)postTask:(NSString *)taskMessage andMessage:(NSString *)message withAuthToken:(NSString *)authToken
{
    YMHTTPClient *client = [[YMHTTPClient alloc] initWithBaseURL:[[NSURL alloc] initWithString:YAMMER_BASE_URL] authToken:authToken];

    NSDictionary *params =
            @{@"body" : taskMessage};

    __weak typeof (self) weakSelf = self;

//     __strong typeof (self) strongSelf = weakSelf;
//    MessageResponse * response= [SampleMessageResponse GetSampleJSONResponse];
//    //assume the messages array only has one item. for exercise purpose
//    Message* msg = [response.messages firstObject];
//    [strongSelf replyFeed:message byRepliedToId:msg.id withAuthToken:authToken];

    [client postPath:@"/api/v1/messages.json"
          parameters:params
             success:^(id responseObject)
             {
                 NSError *error = nil;
                 __strong typeof (self) strongSelf = weakSelf;
                 MessageResponse *response = [[MessageResponse alloc] initWithDictionary:responseObject error:&error];
                 if (error)
                 {
                     [[NSNotificationCenter defaultCenter] postNotificationName:YMYammerSDKPostFeedDidFailNotification object:strongSelf userInfo:@{YMYammerSDKErrorUserInfoKey : error}];
                     return;
                 }
                 
                 if(message.length)//if have message, post a reply feed
                 {
                     //assume the messages array only has one item. for exercise purpose
                     Message *msg = [response.messages firstObject];
                     [strongSelf replyFeed:message byRepliedToId:msg.id withAuthToken:authToken];
                 }
                 else//complete directly
                 {
                     [[NSNotificationCenter defaultCenter] postNotificationName:YMYammerSDKPostFeedDidCompleteNotification object:strongSelf userInfo:nil];
                 }


             }
             failure:^(NSInteger statusCode, NSError *error)
             {
                 __strong typeof (self) strongSelf = weakSelf;
                 [[NSNotificationCenter defaultCenter] postNotificationName:YMYammerSDKPostFeedDidFailNotification object:strongSelf userInfo:@{YMYammerSDKErrorUserInfoKey : error}];
             }
    ];

}

- (void)replyFeed:(NSString *)message byRepliedToId:(NSString *)repliedToId withAuthToken:(NSString *)authToken
{
    YMHTTPClient *client = [[YMHTTPClient alloc] initWithBaseURL:[[NSURL alloc] initWithString:YAMMER_BASE_URL] authToken:authToken];

    NSDictionary *params =
            @{@"body" : message,
                    @"replied_to_id" : repliedToId};

    __weak typeof (self) weakSelf = self;

    [client postPath:@"/api/v1/messages.json"
          parameters:params
             success:^(id responseObject)
             {
                 NSError *error = nil;
                 __strong typeof (self) strongSelf = weakSelf;
                 MessageResponse *response = [[MessageResponse alloc] initWithDictionary:responseObject error:&error];
                 if (error)
                 {
                     [[NSNotificationCenter defaultCenter] postNotificationName:YMYammerSDKPostFeedDidFailNotification object:strongSelf userInfo:@{YMYammerSDKErrorUserInfoKey : error}];
                     return;
                 }

                 [[NSNotificationCenter defaultCenter] postNotificationName:YMYammerSDKPostFeedDidCompleteNotification object:strongSelf userInfo:nil];
             }
             failure:^(NSInteger statusCode, NSError *error)
             {
                 __strong typeof (self) strongSelf = weakSelf;
                 [[NSNotificationCenter defaultCenter] postNotificationName:YMYammerSDKPostFeedDidFailNotification object:strongSelf userInfo:@{YMYammerSDKErrorUserInfoKey : error}];
             }
    ];
}


@end
