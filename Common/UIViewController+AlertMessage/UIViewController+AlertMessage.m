//
//  UIViewController+AlertMessage.m
//  powertoolz
//
//  Created by jiakai lian on 25/03/2015.
//  Copyright (c) 2015 jeylabs. All rights reserved.
//

#import "UIViewController+AlertMessage.h"
#import <UIKit/UIKit.h>


@implementation UIViewController (AlertMessage)

- (void)showAlertMessageWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController
            alertControllerWithTitle:title
                             message:message
                      preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *confirmAction = [UIAlertAction
            actionWithTitle:NSLocalizedString(@"Confirm", @"Confirm action")
                      style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction *action)
                    {
                        NSLog(@"Confirm action");
                    }];

    [alertController addAction:confirmAction];

    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)showAlertMessageWithTitle:(NSString *)title andError:(NSError *)error
{
    [self showAlertMessageWithTitle:title andMessage:[error localizedDescription]];
}

@end
