//
//  UICustomTabViewController.m
//  NavTab
//
//  Created by Robert Conn on 31/03/2009.
//  Copyright 2009 WiredBob Consulting. All rights reserved.
//

#import "UICustomTabViewController.h"
#import "FavoritesTabViewController.h"
#import "MoreTabViewController.h"

@implementation UICustomTabViewController

@synthesize viewControllers;
@synthesize tabBar;
@synthesize	favouritesTabBarItem;
@synthesize moreTabBarItem;
@synthesize selectedViewController;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

        // Custom initialization
		FavoritesTabViewController *favTabViewController = [[FavoritesTabViewController alloc] initWithNibName:@"FavoritesTabView" bundle:nil];
		MoreTabViewController *moreTabViewController = [[MoreTabViewController alloc] initWithNibName:@"MoreTabView" bundle:nil];
		
		NSArray *array = [[NSArray alloc] initWithObjects:favTabViewController, moreTabViewController, nil];
		self.viewControllers = array;
		
		[self.view addSubview:favTabViewController.view];
		self.selectedViewController = favTabViewController;
		
		[array release];
		[favTabViewController release];
		[moreTabViewController release];
		
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	tabBar.selectedItem = favouritesTabBarItem;	
	[super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[tabBar release];
	[favouritesTabBarItem release];
	[moreTabBarItem release];
	[viewControllers release];
	[selectedViewController release];
    [super dealloc];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	if (item == favouritesTabBarItem) {

		UIViewController *fabViewController = [viewControllers objectAtIndex:0];
		[self.selectedViewController.view removeFromSuperview];
		[self.view addSubview:fabViewController.view];
		self.selectedViewController = fabViewController;

	} else if (item == moreTabBarItem) {
		UIViewController *moreViewController = [viewControllers objectAtIndex:1];
		[self.selectedViewController.view removeFromSuperview];
		[self.view addSubview:moreViewController.view];
		self.selectedViewController = moreViewController;
	}
}

@end
