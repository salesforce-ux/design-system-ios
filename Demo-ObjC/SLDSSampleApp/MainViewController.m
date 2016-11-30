//
//  MainTableViewController.m
//  SLDSSampleApp
//
//  Created by Joe Andolina on 11/29/16.
//  Copyright © 2016 Salesforce UX. All rights reserved.
//

#import "MainViewController.h"
#import "ColorListViewController.h"
#import "IconListViewController.h"
#import "TextListViewController.h"


@implementation MainViewController
{
    NSDictionary *tableData;
}

// ----------------------------------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SLDS Reference";
    
    tableData = @{@"Colors":[ColorListViewController class],
                  @"Icons":[IconListViewController class],
                  @"Fonts":[TextListViewController class]};
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

// ----------------------------------------------------------------------------------------------

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// ----------------------------------------------------------------------------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// ----------------------------------------------------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableData.count;
}

// ----------------------------------------------------------------------------------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tableCell"];
    NSString *cellLabel = tableData.allKeys[indexPath.row];
    [cell.textLabel setText:cellLabel];
    return cell;
}

// ----------------------------------------------------------------------------------------------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *key = tableData.allKeys[indexPath.row];
    Class controlerClass = [tableData valueForKey:key];
    UIViewController *controller = [[controlerClass alloc] init];
    [self.navigationController pushViewController:controller animated:true];
}

@end
