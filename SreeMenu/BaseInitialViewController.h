//
//  BaseInitialViewController.h
//  SreeMenu
//
//  Created by SreenivasulaReddy on 19/04/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseInitialViewController : UIViewController

@property(nonatomic,strong)UILabel* titleLabel;

-(void)showAlertView:(NSString*)message;

@end
