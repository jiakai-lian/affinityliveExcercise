//
//  SampleAccessTokenResponse.m
//  AffinityLiveExercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "SampleAccessTokenResponse.h"

@implementation SampleAccessTokenResponse

+ (AccessTokenResponse *)GetSampleJSONResponse
{
    NSError *error;

    NSString *file = [[NSBundle mainBundle] pathForResource:@"SampleAccessTokenResponse"
                                                     ofType:@"json"];

    NSData *data = [NSData dataWithContentsOfFile:file options:NSDataReadingMappedIfSafe error:&error];

    // you can skip this step by just using the NSData that you get from the http request instead of converting it to a string.

    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];

//    NSLog(@"%@", jsonObject);

    AccessTokenResponse *response = [[AccessTokenResponse alloc] initWithDictionary:jsonObject error:&error];


    return response;
}

@end
