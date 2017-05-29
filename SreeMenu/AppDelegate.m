//
//  AppDelegate.m
//  SreeMenu
//
//  Created by SreenivasulaReddy on 19/04/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"
#import "SideMenuViewController.h"

@interface AppDelegate ()<SWRevealViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *isLogin =[[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"];
    
    if (isLogin.boolValue)
    {
        [self pushToHomeScreen];
    }
    else
    {
        LoginViewController *loginVC =[[LoginViewController alloc] init];
        self.rootNavigationController = [[UINavigationController alloc]initWithRootViewController:loginVC];
        self.window.rootViewController = self.rootNavigationController;
    }
    return YES;
}

-(void)pushToHomeScreen
{
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    SideMenuViewController *profileViewController = [[SideMenuViewController alloc] init];
    
    self.rootNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    
    SWRevealViewController *mainRevealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:self.rootNavigationController];
    
    mainRevealController.delegate = self;
    [[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];
    
    self.window.rootViewController = mainRevealController;
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
