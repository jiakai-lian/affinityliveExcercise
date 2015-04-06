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
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (void)postTask:(NSString *)taskMessage andMessage:(NSString *)message withAuthToken:(NSString*) authToken
{
    YMHTTPClient* client = [[YMHTTPClient alloc]initWithBaseURL:YAMMER_BASE_URL.copy authToken:authToken];
    

    
    NSDictionary *params =
    @{@"body" : taskMessage};
    
    MessageResponse * response= [SampleMessageResponse GetSampleJSONResponse];
    
    //assume the messages array only has one item. for exercise purpose
    Message* msg = [response.messages firstObject];
    [self replyFeed:message byRepliedToId:msg.id withAuthToken:authToken];
    
//    [client postPath:@"/api/v1/messages.json"
//          parameters:params
//             success:^(id responseObject) {
//                
//             }
//             failure:^(NSInteger statusCode, NSError *error) {
//                 
//             }
//     ];

}


- (void)postNewFeed:(NSString *)message withAuthToken:(NSString*) authToken
{
    YMHTTPClient* client = [[YMHTTPClient alloc]initWithBaseURL:YAMMER_BASE_URL.copy authToken:authToken];
    
    NSDictionary *params =
    @{@"body" : message};
    
    [client postPath:@"/api/v1/messages.json"
          parameters:params
             success:^(id responseObject) {
                 
             }
             failure:^(NSInteger statusCode, NSError *error) {
                 
             }
     ];
}

- (void)replyFeed:(NSString *)message byRepliedToId:(NSString *)repliedToId withAuthToken:(NSString*) authToken
{
    YMHTTPClient* client = [[YMHTTPClient alloc]initWithBaseURL:YAMMER_BASE_URL.copy authToken:authToken];
    
    NSDictionary *params =
    @{@"body" : message,
      @"replied_to_id": repliedToId};
    
    __weak typeof (self) weakSelf = self;
    
    [client postPath:@"/api/v1/messages.json"
          parameters:params
             success:^(id responseObject) {
                 
             }
             failure:^(NSInteger statusCode, NSError *error) {
                 
             }
     ];
}





@end
