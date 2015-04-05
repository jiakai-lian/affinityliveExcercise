//
//  TasksResponseTest.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 5/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SampleTaskResponse.h"

@interface TasksResponseTest : XCTestCase

@end

@implementation TasksResponseTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSampleTasksResponse {

    TasksResponse * response = [SampleTaskResponse GetSampleJSONResponse];
    
    XCTAssertNotNil(response);
    XCTAssertNotNil(response.response);
    XCTAssertEqual(response.response.count, 2);
    
    for(Task * task in response.response)
    {
        XCTAssertNotNil(task.title);
        XCTAssertNotNil(task.id);
        XCTAssertNotNil(task.date_created);
        XCTAssertNotNil(task.date_started);
        XCTAssertNotNil(task.date_due);
        XCTAssertNotNil(task.assignee.email);
        XCTAssertNotNil(task.assignee.id);
        XCTAssertNotNil(task.type.id);
        XCTAssertNotNil(task.type.title);
    }
}


@end
