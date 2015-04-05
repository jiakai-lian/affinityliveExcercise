//
//  SampleTaskResponse.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "SampleTaskResponse.h"
#import "TasksResponse.h"

@implementation SampleTaskResponse

+ (TasksResponse *) GetSampleJSONResponse
{
    NSError *error;
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"SampleTasksResponse"
                                                     ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:file options:NSUTF8StringEncoding error:&error];
    
    // you can skip this step by just using the NSData that you get from the http request instead of converting it to a string.
    
    NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];
    
    //    NSLog(@"%@", jsonObject);
    
    TasksResponse * response =[[TasksResponse alloc]initWithDictionary:jsonObject error:&error];

    return response;
}

@end
