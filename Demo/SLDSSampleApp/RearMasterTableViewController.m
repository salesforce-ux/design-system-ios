/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "RearMasterTableViewController.h"
#import "SWRevealViewController.h"
#import "FrontViewController.h"
#import "ColorListViewController.h"

#import "IconListViewController.h"

#import "TextListViewController.h"

#import <SalesforceDesignSystem/SalesforceDesignSystem.h>

@implementation RearMasterTableViewController {
    NSInteger _previouslySelectedRow;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.backgroundColor = [UIColor sldsBackgroundColor:SLDSColorBackgroundInverse];
    self.tableView.separatorColor = [UIColor clearColor];

}

-(UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    _previouslySelectedRow = -1;
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *text = nil;
    
    switch(indexPath.row){
        case 0: text = @"Layout Colors"; break;
        case 1: text = @"Fonts and Sizes"; break;
        case 2: text = @"Icons"; break;
        case 3: text = @"About"; break;
    }

    cell.textLabel.text = text;
    cell.textLabel.textColor = [UIColor sldsColorText:SLDSColorTextLinkInverse];

    [cell.textLabel setFont:[UIFont sldsFontLightWithSize:SLDSFontSizeMedium]];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.backgroundColor = self.tableView.backgroundColor;
}

-(NSIndexPath *) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SWRevealViewController *revealController = self.revealViewController;
    
    NSInteger row = indexPath.row;
    
    if ( row == _previouslySelectedRow )
    {
        [revealController revealToggleAnimated:YES];
        return;
    }
    
    _previouslySelectedRow = row;
    
    
    UIViewController *frontController = nil;

    switch(row){
        case 0:
            frontController = [[ColorListViewController alloc] init];
            break;
        case 1:
            frontController = [[TextListViewController alloc] init];
            break;
        case 2:
            frontController = [[IconListViewController alloc] init];
            break;
        case 3:
            frontController = [[FrontViewController alloc] init];
            break;
    }
    [revealController setFrontViewController:frontController animated:YES];
    [revealController setFrontViewPosition:FrontViewPositionLeftSideMost animated:YES];
}
@end
