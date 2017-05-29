//
//  BaseViewController.h
//  SreeMenu
//
//  Created by SreenivasulaReddy on 19/04/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property(nonatomic,strong)UILabel* titleLabel;


-(void)showAlertView:(NSString*)message;

-(void)pushToHomePage;

-(void)showLeftMenu;

-(void)showBackButton;

-(void)revealToggleNotification;

@end
