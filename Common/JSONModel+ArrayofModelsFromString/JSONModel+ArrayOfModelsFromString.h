//
//  JSONModel+ArrayOfModelsFromString.h
//  AffinityLiveExcercise
//  An category to convert a json array string to an array of models
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "JSONModel.h"

@interface JSONModel (ArrayOfModelsFromString)

+(NSMutableArray*)arrayOfModelsFromString:(NSString*)jsonArrayString;
+(NSMutableArray*)arrayOfModelsFromString:(NSString*)jsonArrayString error:(NSError**)err;

@end
