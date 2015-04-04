//
//  NetworkDataServiceTest.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "NetworkDataService.h"

@interface NetworkDataServiceTest : XCTestCase

@end

@implementation NetworkDataServiceTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNetworkDataService {
    NetworkDataService *service = [[NetworkDataService alloc] init];
    XCTestExpectation *expectation = [self expectationWithDescription:@"get Data request"];
    
    
    [service getDataWithSuccessBlock:^(id data)
     {
         XCTAssertNotNil(data);
         
         [expectation fulfill];
         
     }                    andFailureBlock:^(NSError *error)
     {
         XCTAssertTrue(NO);
     }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];

}

@end
