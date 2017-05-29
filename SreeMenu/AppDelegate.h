//
//  AppDelegate.h
//  SreeMenu
//
//  Created by SreenivasulaReddy on 19/04/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "LoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SWRevealViewController *viewController;

@property (nonatomic, strong) UINavigationController* rootNavigationController;
@property (nonatomic, strong) UINavigationController* menuRootNavigationController;

-(void)pushToHomeScreen;

@end

