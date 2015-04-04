//
//  DataService.h
//  AffinityLiveExcercise
//  protocol of Data service
//  the application should use this protocol to get data, instead of communicating with a particular data service class. By doing this, we can easily adapt data source from network, file, db, core data etc.
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id data);

typedef void(^FailureBlock)(NSError *error);

@protocol DataService <NSObject>

/**
 *  a protocol method to get news feed
 *
 *  @param success block to execute when success
 *  @param failure block to execute when failure
 */
- (void)getDataWithSuccessBlock:(SuccessBlock)success andFailureBlock:(FailureBlock)failure;


@end
