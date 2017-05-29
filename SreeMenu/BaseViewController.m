//
//  BaseViewController.m
//  SreeMenu
//
//  Created by SreenivasulaReddy on 19/04/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "BaseViewController.h"
#import "SWRevealViewController.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.navigationItem.rightBarButtonItem != nil)
    {
        // I exists
        //        NSLog(@"Btn Exists");
    } else {
        // I don't exists
        //        NSLog(@"doesn't Btn Exists");
        
    }
    
    [self showBackButton];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    
    if (IS_IPAD)
    {
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:18.f]];
    }
    else
    {
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:14.f]];
        
    }
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = self.titleLabel;
    self.titleLabel.text = @"SreeMenu";
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIButton *homeButn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [homeButn setImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal ];
    [homeButn addTarget:self action:@selector(homeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *homeButton  = [[UIBarButtonItem alloc] initWithCustomView:homeButn];
    self.navigationItem.rightBarButtonItems  =  @[homeButton] ;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)showLeftMenu
{
    SWRevealViewController *revealController = [self revealViewController];
    
    UIButton *leftButn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    [leftButn setImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal ];
    [leftButn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButn];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    //#warning uncomment this
    if (self.revealViewController)
    {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    }
}

-(void)showBackButton
{
    UIButton *backButn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45, 35)];
    [backButn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal ];
    [backButn addTarget:self action:@selector(backBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButn];
    
    self.navigationItem.leftBarButtonItem = backButtonItem;
}

-(void)backBtnTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)homeButtonTapped:(id)sender
{
    [self pushToHomePage];
}
-(void)pushToHomePage
{
    [self.navigationController popToRootViewControllerAnimated:NO];
}

-(void)showAlertView:(NSString *)message
{
    UIAlertController *ctrl = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionCancel = nil;
    actionCancel = [UIAlertAction
                    actionWithTitle:@"OK"
                    style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
                    {
                        [ctrl dismissViewControllerAnimated:YES completion:nil];
                    }];
    [ctrl addAction:actionCancel];
    [self presentViewController:ctrl animated:YES completion:nil];
}

-(void)revealToggleNotification
{
    //Notification registered
}
@end
