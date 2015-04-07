//
//  UIViewController+AlertMessage.h
//  powertoolz
//
//  Created by jiakai lian on 25/03/2015.
//  Copyright (c) 2015 jeylabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AlertMessage)

- (void)showAlertMessageWithTitle:(NSString *)title andMessage:(NSString *)message;

- (void)showAlertMessageWithTitle:(NSString *)title andError:(NSError *)error;

@end
