//
//  MessageResponseTest.m
//  AffinityLiveExercise
//
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SampleMessageResponse.h"

@interface MessageResponseTest : XCTestCase

@end

@implementation MessageResponseTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMessageResponse
{

    MessageResponse *response = [SampleMessageResponse GetSampleJSONResponse];

    XCTAssertNotNil(response);

    XCTAssertNotNil(response.messages);
    XCTAssertEqual(response.messages.count, 1);
    XCTAssertNotNil([response.messages firstObject]);

    Message *message = [response.messages firstObject];
    XCTAssertNotNil(message.id);
    XCTAssertNotNil(message.sender_id);
    XCTAssertNotNil(message.sender_type);
    XCTAssertNotNil(message.created_at);
    XCTAssertNotNil(message.message_type);
    XCTAssertNotNil(message.web_url);
    XCTAssertNotNil(message.url);
    XCTAssertNotNil(message.body);
    XCTAssertNotNil(message.body.plain);
    XCTAssertNotNil(message.body.parsed);
    XCTAssertNotNil(message.body.rich);


}


@end
