//
//  MoreTabViewController.m
//  NavTab
//
//  Created by Robert Conn on 05/04/2009.
//  Copyright 2009 WiredBob Consulting. All rights reserved.
//

#import "MoreTabViewController.h"
#import "MoreOptionViewController.h"
#import "NavTabAppDelegate.h"

@implementation MoreTabViewController

@synthesize moreOptions;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {
	
    NSArray *array = [[NSArray alloc] initWithObjects:@"More 1", @"More 2", @"More 3", nil];
	self.moreOptions = array;
	[array release];
	
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [moreOptions count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	NSUInteger row = indexPath.row;
	cell.textLabel.text = [moreOptions objectAtIndex:row];
    return cell;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    [tableView deselectRowAtIndexPath:indexPath animated:FALSE];
    
	MoreOptionViewController *moreOptionViewController = [[MoreOptionViewController alloc] initWithNibName:@"MoreOptionView" bundle:nil];
	NSString *msg = [[NSString alloc] initWithFormat:@"Selected %u", indexPath.row + 1];
	
	// Get the navigation controller from the delegate
	NavTabAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	[delegate.navigationController pushViewController:moreOptionViewController animated:YES];
	[moreOptionViewController.label setText:msg];
	
	[msg release];
	[moreOptionViewController release];
}

- (void)dealloc {
	[moreOptions release];
    [super dealloc];
}


@end

