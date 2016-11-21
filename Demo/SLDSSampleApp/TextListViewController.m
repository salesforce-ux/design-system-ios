/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "TextViewController.h"
#import "TextListViewController.h"
#import <SalesforceDesignSystem/SalesforceDesignSystem.h>
#import "SWRevealViewController.h"


@implementation TextListViewController
{
    NSMutableArray *fontSizes;
    NSMutableArray *fontTypes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationItem].title = @"SLDS Fonts";
    
    int i = 0;
    NSString *fontName;
    Boolean loopFlag = true;
    fontSizes = [[NSMutableArray alloc] init];
    fontTypes = [[NSMutableArray alloc] init];
    
    // Setting up fontSizes
    do {
        @try {
            [fontSizes addObject:[NSNumber numberWithInteger:[SLDSFont sldsFontSize:(SLDSFontSizeType)i]]];
            i++;
        }
        @catch (NSException * e) {
            loopFlag = false;
        }
    }
    while(loopFlag);
    
    i = 0;
    loopFlag = true;
    
    // Setting up fontNames
    do {
        @try {
            fontName = [SLDSFont sldsFontTypeName:(SLDSFontType)i];
            fontName = [fontName stringByReplacingOccurrencesOfString:@"SLDSFontType" withString:@""];
            [fontTypes addObject:fontName];
            i++;
        }
        @catch (NSException * e) {
            loopFlag = false;
        }
    }
    while(loopFlag);
    
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSArray*)sourceForSection:(NSInteger)section {
    return fontSizes;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return fontTypes.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return fontSizes.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [fontTypes objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"LMColorCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    UIFont *font = [UIFont sldsFont:(SLDSFontType)indexPath.section withSize:(SLDSFontSizeType)indexPath.row];
    [cell.textLabel setFont:font];
    cell.textLabel.text = [SLDSFont sldsFontSizeName:(SLDSFontSizeType)indexPath.row];
    cell.textLabel.text = [cell.textLabel.text stringByReplacingOccurrencesOfString:@"SLDSFontSize" withString:@""];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    SWRevealViewController *revealController = self.revealViewController;
    
    TextViewController *dc = [[TextViewController alloc] init];
    
    dc.fontSize = [[fontSizes objectAtIndex:indexPath.item] integerValue];
    [revealController setFrontViewController:dc animated:YES];
    [revealController setFrontViewPosition:FrontViewPositionLeftSideMost animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor sldsColorBackground:SLDSColorBackgroundShade];
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setFont:[UIFont sldsFont:SLDSFontTypeRegular withSize:SLDSFontSizeLarge]];
}

@end
