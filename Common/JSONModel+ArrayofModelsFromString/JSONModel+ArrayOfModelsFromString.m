//
//  JSONModel+ArrayOfModelsFromString.m
//  AffinityLiveExcercise
//  An category to convert a json array string to an array of models
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel+ArrayOfModelsFromString.h"

@implementation JSONModel (ArrayOfModelsFromString)

+(NSMutableArray*)arrayOfModelsFromString:(NSString*)jsonArrayString
{
    return [self arrayOfModelsFromString:jsonArrayString error:nil];
}

+(NSMutableArray*)arrayOfModelsFromString:(NSString*)jsonArrayString error:(NSError**)err
{
    NSData *data = [jsonArrayString dataUsingEncoding:NSUTF8StringEncoding];
    NSArray* array = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:err];
    
    if(err)
    {
        return nil;
    }
    
    return [self arrayOfModelsFromDictionaries:array error:err];
}


@end
