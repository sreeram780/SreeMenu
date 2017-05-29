//
//  SideMenuViewController.m
//  SreeMenu
//
//  Created by SreenivasulaReddy on 19/04/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SWRevealViewController.h"

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface SideMenuViewController ()

@property(strong,nonatomic)NSMutableArray *menuArray;

@end

@implementation SideMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _menuArray = [[NSMutableArray alloc]initWithObjects:@"Home", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark UITableView delegate and datasource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       return self.menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [_menuArray objectAtIndex:indexPath.row] ;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.textColor= [UIColor blueColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController *revealController = self.revealViewController;
    AppDelegate *appdelegate =(AppDelegate *)[[UIApplication sharedApplication] delegate];
    //    appdelegate.dashboardNavigationController = (id)revealController.frontViewController;
    
    // <--
    UINavigationController *frontNavigationController = (id)revealController.frontViewController;  // <--
    
    if ( ![frontNavigationController.topViewController isKindOfClass:[LoginViewController class]] )
    {
        UINavigationController *navigationController;
        NSString *cellText = @"";
        cellText = [_menuArray objectAtIndex:indexPath.row];

        HomeViewController *hvc = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
       navigationController = [[UINavigationController alloc] initWithRootViewController:hvc];
        appdelegate.rootNavigationController = navigationController;
        [revealController setFrontViewController:navigationController animated:NO];
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    }
}

@end
