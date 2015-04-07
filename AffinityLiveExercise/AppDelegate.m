//
//  AppDelegate.m
//  AffinityLiveExcercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#import "AppDelegate.h"
#import "YMMultiUserLoginController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Yammer SDK:
// This is the method (launch point) that will be called when the user clicks the "Allow" button in mobile Safari after logging in to Yammer.
// The mobile-safari to app-launch functionality is enabled by adding a custom scheme and URL to your Info.plist file.  See the README.MD file
// that comes with this sample app or the Yammer iOS SDK Instructions on how to do this.  The custom scheme and URI/URL you add to the plist
// file must match the redirect URI you set on the Yammer client applications web site.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{

    // If we arrive here it means the login was successful, so now let's get the authToken to be used on all subsequent requests
    if ([[YMMultiUserLoginController sharedInstance] handleLoginRedirectFromUrl:url sourceApplication:sourceApplication])
    {
        return YES;
    }

    // URL was not a match, or came from an application other than Safari
    return NO;
}

@end
