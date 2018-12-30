//
//  AppDelegate.m
//  Palindrome
//
//  Copyright © 2018 Henry. All rights reserved.
//

#import "AppDelegate.h"
#import "ScoreKeeper.h"
#import "PalindromeGame.h"
#import "PalindromeGameViewController.h"
#import "SettingsViewController.h"
#import "StringIDs.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UITabBarController* tabBarController = (UITabBarController*) self.window.rootViewController;
    NSAssert(([tabBarController isKindOfClass:[UITabBarController class]]
              && tabBarController.customizableViewControllers.count>1),
             @"At startup, root view is not a tabBarController or too few tabs.");
    PalindromeGameViewController* gameVC = (PalindromeGameViewController*) tabBarController.customizableViewControllers[0];
    NSAssert([gameVC isKindOfClass:[PalindromeGameViewController class]], @"At startup, first tab view is not a PalindromeGameViewController.");

    gameVC.tabBarItem.title = STR_HOME_TAB;
    ScoreKeeper* scores = [[ScoreKeeper alloc] initWithUserDefaults:[NSUserDefaults standardUserDefaults]];
    PalindromeGame* palindromeGame = [[PalindromeGame alloc] initWithScores:scores];
    gameVC.scores = scores;
    gameVC.game = palindromeGame;

    SettingsViewController* settingsVC = (SettingsViewController*) tabBarController.customizableViewControllers[1];
    NSAssert([settingsVC isKindOfClass:[SettingsViewController class]], @"At startup, first tab view is not a SettingsViewController.");
    settingsVC.tabBarItem.title = STR_SETTINGS_TAB;

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
