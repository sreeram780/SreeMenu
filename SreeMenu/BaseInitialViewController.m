//
//  BaseInitialViewController.m
//  SreeMenu
//
//  Created by SreenivasulaReddy on 19/04/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#import "BaseInitialViewController.h"

@interface BaseInitialViewController ()

@end

@implementation BaseInitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnTapped:)];
    
    self.navigationItem.leftBarButtonItem = backButtonItem;
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    if (IS_IPAD)
    {
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:20.f]];
    }
    else
    {
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:14.f]];
    }
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = self.titleLabel;
}

-(void)backBtnTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)showAlertView:(NSString*)message
{
    UIAlertController *ctrl = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionCancel = nil;
    
    // Cancel Button
    actionCancel = [UIAlertAction
                    actionWithTitle:@"OK"
                    style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
                    {
                        [ctrl dismissViewControllerAnimated:YES completion:nil];
                    }];
    // Add Cancel action
    [ctrl addAction:actionCancel];
    [self presentViewController:ctrl animated:YES completion:nil];
}

@end
