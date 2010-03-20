//
//  RootViewController.m
//  NavTab
//
//  Created by Robert Conn on 31/03/2009.
//  Copyright WiredBob Consulting 2009. All rights reserved.
//

#import "RootViewController.h"
#import "NavTabAppDelegate.h"
#import "UICustomTabViewController.h"

@implementation RootViewController

@synthesize accounts;
@synthesize tabViewController;

- (void)viewDidLoad {
	
	UICustomTabViewController *tvController = [[UICustomTabViewController alloc] initWithNibName:@"TabViewController" bundle:nil];
	self.tabViewController = tvController;
	[tvController release];
    
	self.title = @"Accounts";
	NSArray *array = [[NSArray alloc] initWithObjects:@"Jack", @"Jill", @"John", nil];
	self.accounts = array;
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
    return [accounts count];
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
	cell.text = [accounts objectAtIndex:row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tabViewController setTitle:[accounts objectAtIndex:indexPath.row]];
	[self.navigationController pushViewController:self.tabViewController animated:YES];

}

- (void)dealloc {
	[tabViewController release];
	[accounts release];
    [super dealloc];
}


@end

