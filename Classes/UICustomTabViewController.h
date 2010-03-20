//
//  UICustomTabViewController.h
//  NavTab
//
//  Created by Robert Conn on 31/03/2009.
//  Copyright 2009 WiredBob Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICustomTabViewController : UIViewController <UITabBarDelegate> {
	NSArray *viewControllers;
	IBOutlet UITabBar *tabBar;
	IBOutlet UITabBarItem *favouritesTabBarItem;
	IBOutlet UITabBarItem *moreTabBarItem;
	UIViewController *selectedViewController;
}

@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, retain) IBOutlet UITabBar *tabBar;
@property (nonatomic, retain) IBOutlet UITabBarItem *favouritesTabBarItem;
@property (nonatomic, retain) IBOutlet UITabBarItem *moreTabBarItem;
@property (nonatomic, retain) UIViewController *selectedViewController;

@end
