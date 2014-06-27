//
//  AppDelegate.m
//  FBLogin
//
//  Created by diannas on 6/22/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "FeedViewController.h"
#import "RequestViewController.h"
#import "MessageViewController.h"
#import "NotificationViewController.h"
#import "MoreViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[MainViewController alloc] init];
    

    // View Controllers
    FeedViewController *feedVC = [[FeedViewController alloc] init];
    UINavigationController *feedNC = [[UINavigationController alloc] initWithRootViewController:feedVC];
    feedNC.tabBarItem.title = @"News Feed";
    //firstNavigationController.tabBarItem.image = [UIImage imageNamed:@"House"];
    
    RequestViewController *requestVC = [[RequestViewController alloc] init];
    UINavigationController *requestNC = [[UINavigationController alloc] initWithRootViewController:requestVC];
    requestNC.tabBarItem.title = @"Requests";
   
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    UINavigationController *messageNC = [[UINavigationController alloc] initWithRootViewController:messageVC];
    messageNC.tabBarItem.title = @"Messages";
    
    NotificationViewController *notificationVC = [[NotificationViewController alloc] init];
    UINavigationController *notificationNC = [[UINavigationController alloc] initWithRootViewController:notificationVC];
    notificationNC.tabBarItem.title = @"Ntifications";
    
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    UINavigationController *moreNC = [[UINavigationController alloc] initWithRootViewController:moreVC];
    moreNC.tabBarItem.title = @"More";
    
    // Configure the tab bar controller with the two navigation controllers
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[feedNC, requestNC, messageNC, notificationNC, moreNC];
    
    self.window.rootViewController = tabBarController;

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
