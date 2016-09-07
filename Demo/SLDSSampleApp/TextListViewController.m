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


@interface TextListViewController ()

@end

@implementation TextListViewController {
    NSArray *fontSizes;
    NSArray *fontWeights;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationItem].title = @"Landmark Icons";
    
    
    NSMutableArray *sizes = [[NSMutableArray alloc] init];
    for(int i=SLDSFontSizeXSmall; i<=SLDSFontSizeXxLarge; i++) {
        [sizes addObject:[NSNumber numberWithInt:i]];
    }
    fontSizes = [sizes copy];

    NSMutableArray *weights = [[NSMutableArray alloc] init];
    for(int i=SLDS_FONT_FAMILY_BODY; i<=SLDS_FONT_FAMILY_STRONG; i++) {
        [weights addObject:[NSNumber numberWithInt:i]];
    }
    fontWeights = [weights copy];

    
    SWRevealViewController *revealController = self.revealViewController;
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSArray *) sourceForSection:(NSInteger)section {
    return fontSizes;
}

- (NSString *) getWeightLabel:(NSIndexPath *)indexPath{
    NSInteger index = [[fontWeights objectAtIndex:indexPath.section] integerValue];
    switch(index){
        case SLDS_FONT_FAMILY_BODY:
            return @"REGULAR";
        case SLDS_FONT_FAMILY_LIGHT:
            return @"LIGHT";
        case SLDS_FONT_FAMILY_STRONG:
            return @"BOLD";
        default:
            return @"";
    }
}

- (NSString *) getSizeLabel:(NSIndexPath *)indexPath{
    NSInteger index = [[fontSizes objectAtIndex:indexPath.item] integerValue];
    switch(index){
        case SLDSFontSizeXSmall:
            return @"X_SMALL";
        case SLDSFontSizeSmall:
            return @"SMALL";
        case SLDSFontSizeMedium:
            return @"MEDIUM";
        case SLDSFontSizeLarge:
            return @"LARGE";
        case SLDSFontSizeXLarge:
            return @"X_LARGE";
        case SLDSFontSizeXxLarge:
            return @"XX_LARGE";
        default:
            return @"";
    }
}

- (NSString *) getLabel:(NSIndexPath *)indexPath{
    return [NSString stringWithFormat:@"%@ %@",[self getWeightLabel:indexPath],[self getSizeLabel:indexPath] ];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fontSizes count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSInteger index = [[fontWeights objectAtIndex:section] integerValue];
    switch(index){
        case SLDS_FONT_FAMILY_BODY:
            return @"SALESFORCE SANS REGULAR";
        case SLDS_FONT_FAMILY_LIGHT:
            return @"SALESFORCE SANS LIGHT";
        case SLDS_FONT_FAMILY_STRONG:
            return @"SALESFORCE SANS BOLD";
        default:
            return @"";
    }
}

- (UIFont *)getFont:(SLDS_FONT_FAMILY) fontFamily withSize:(NSInteger)size{
    switch(fontFamily){
        case SLDS_FONT_FAMILY_BODY:
            return [UIFont sldsFontRegularWithSize:size];
        case SLDS_FONT_FAMILY_LIGHT:
            return [UIFont sldsFontLightWithSize:size];
        case SLDS_FONT_FAMILY_STRONG:
            return [UIFont sldsFontStrongWithSize:size];
        default:
            return [UIFont systemFontOfSize:size];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"LMColorCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSLog(@"Cell: %li",(long)indexPath.item);
    
    
    [cell.textLabel setFont:[self getFont:[[fontWeights objectAtIndex:indexPath.section] integerValue] withSize:(int)indexPath.item ]];

    cell.textLabel.text = [self getLabel:indexPath];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)t heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    SWRevealViewController *revealController = self.revealViewController;
    
    TextViewController *dc = [[TextViewController alloc] init];
    
    dc.fontSize = [[fontSizes objectAtIndex:indexPath.item] integerValue];

    dc.fontWeight = [[fontWeights objectAtIndex:indexPath.section] integerValue];
    
    
    [revealController setFrontViewController:dc animated:YES];
    [revealController setFrontViewPosition:FrontViewPositionLeftSideMost animated:YES];

}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor sldsBackgroundColor:SLDSColorBackgroundShade];
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setFont:[UIFont sldsFontLightWithSize:SLDSFontSizeLarge]];

}


@end
