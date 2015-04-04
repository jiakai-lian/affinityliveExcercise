//
//  YammerAccessTokenResponseTest.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AccessTokenResponse.h"
#import "SampleAccessTokenResponse.h"

@interface YammerAccessTokenResponseTest : XCTestCase

@end

@implementation YammerAccessTokenResponseTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSError *error = nil;
    NSDictionary * jsonDic = [SampleAccessTokenResponse GetSampleJSONResponse];
    AccessTokenResponse * response = [[AccessTokenResponse alloc] initWithDictionary:jsonDic error:&error ];
    
    XCTAssertNil(error);
    XCTAssertNotNil(response);
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

@end
