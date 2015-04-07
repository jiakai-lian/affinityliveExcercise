//
//  NetworkDataService.h
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataService.h"

static NSString *const SERVER_URL = @"https://apitest.staging.affinitylive.com/api/tasks?";
static NSString *const CLIENT_ID = @"0a5971f7ce@demo.staging.affinitylive.com";
static NSString *const CLIENT_SECRET = @"eERGXMo2CMsPtuo1jDkzmp2iPhgjcTth";


@interface NetworkDataService : NSObject <DataService>

@end
