//
//  YammerFeedViewController.h
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 6/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskHandlerProtocol.h"
#import "AuthTokenHandlerProtocol.h"
@interface YammerFeedViewController : UIViewController <TaskHandlerProtocol, AuthTokenHandlerProtocol>

@end
