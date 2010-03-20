//
//  MoreTabViewController.h
//  NavTab
//
//  Created by Robert Conn on 05/04/2009.
//  Copyright 2009 WiredBob Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MoreTabViewController : UITableViewController {
	NSArray *moreOptions;
}

@property (nonatomic, retain) NSArray *moreOptions;

@end
