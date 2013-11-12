//
//  AppDelegate.m
//  BlogReader
//
//  Created by Amit Bijlani on 12/6/12.
//  Copyright (c) 2012 Amit Bijlani. All rights reserved.
//

#import "AppDelegate.h"
#import "ASPinboard.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    void (^loginFailureBlock)(NSError *);
    loginFailureBlock = ^(NSError *error) {
        if (error.code == PinboardErrorInvalidCredentials) {
            // An invalid username or password was provided.
        }
        else if (error.code == PinboardErrorTimeout) {
            // The authentication request will time out if
            // it takes longer than 20 seconds to respond.
        }
    };
    
    void (^successBlock)(NSArray *, NSDictionary *);
    successBlock = ^(NSArray *bookmarks, NSDictionary *parameters) {
        NSLog(@"You have %lu bookmarks", (unsigned long)[bookmarks count]);
        NSLog(@"Here are your bookmarks:");
        int unreadCount = 0;
        for (id bookmark in bookmarks) {
            if ([bookmark[@"toread"] isEqualToString:@"yes"])
            {
                unreadCount++;
            }
            NSLog(@"unread: %@", bookmark[@"toread"]);
            //NSLog(@"url: %@", bookmark[@"href"]);
            NSLog(@"Bookmark fields:");
            NSLog(@"%@", bookmark);
            //NSLog(@"%@", bookmark[@"extended"]);
        }
        NSLog(@"Total unread %d", unreadCount);
    };
    
    void (^failureBlock)(NSError *);
    failureBlock = ^(NSError *error) {
        if (error != nil) {
            NSLog(@"Houston, we have a problem.");
            NSLog(@"%@", error);
        }
    };
    
    
    ASPinboard *pinboard = [ASPinboard sharedInstance];
    [pinboard authenticateWithUsername:@"jmvldz"
              password:@"gyWEArNryex00"
              success:^(NSString *token) {
              NSLog(@"Your Pinboard API token is: %@", token);
                  [pinboard bookmarksWithSuccess:successBlock failure:failureBlock];
              }
              failure:loginFailureBlock];

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

@end
