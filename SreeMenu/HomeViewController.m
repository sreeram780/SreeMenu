//
//  HomeViewController.m
//  SreeMenu
//
//  Created by SreenivasulaReddy on 19/04/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "HomeViewController.h"
#import "FirstViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showLeftMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)firstbtntapped:(UIButton *)sender
{
    FirstViewController *fvc = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
    [self.navigationController pushViewController:fvc animated:YES];
}

@end
