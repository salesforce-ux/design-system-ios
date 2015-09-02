/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ColorButtonListViewController.h"

#import "ColorButtonViewController.h"
#import <SalesforceDesignSystem/SalesforceDesignSystemExtended.h>
#import "SWRevealViewController.h"


@interface ColorButtonListViewController ()

@end

@implementation ColorButtonListViewController {
    NSArray *textBtnColors;
    NSArray *backgroundBtnColors;
    NSArray *borderBtnColors;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationItem].title = @"Landmark Icons";
    
    
    NSMutableArray *tColors = [[NSMutableArray alloc] init];
    for(int i=SLDSColorBtnTextButtonBrand; i<=SLDSColorBtnTextIconInverseHover; i++) {
        [tColors addObject:[NSNumber numberWithInt:i]];
    }
    textBtnColors = [tColors copy];
    
    NSMutableArray *bColors = [[NSMutableArray alloc] init];
    for(int i=SLDSColorBtnBackgroundButtonBrand; i<=SLDSColorBtnBackgroundModalButtonActive; i++) {
        [bColors addObject:[NSNumber numberWithInt:i]];
    }
    backgroundBtnColors = [bColors copy];
    
    
    NSMutableArray *brdrColors = [[NSMutableArray alloc] init];
    for(int i=SLDSColorBtnBorderButtonBrand; i<=SLDSColorBtnBorderButtonInverseDisabled; i++) {
        [brdrColors addObject:[NSNumber numberWithInt:i]];
    }
    borderBtnColors = [brdrColors copy];
    
    
    SWRevealViewController *revealController = self.revealViewController;
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSArray *) sourceForSection:(NSInteger)section {
    if(section == 0){
        return textBtnColors;
    }
    else if(section == 1){
        return backgroundBtnColors;
    }
    else if(section == 2){
        return borderBtnColors;
    }
    return @[];
}

- (NSString *) getLabel:(NSIndexPath *)indexPath{
    return [NSString sldsButtonColorName:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue]];
}

- (UIColor *) getColor:(NSIndexPath *)indexPath{
    return [UIColor sldsButtonColor:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self sourceForSection:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return @"BUTTON TEXT COLORS";
    }
    if(section == 1){
        return @"BUTTON BACKGROUND COLORS";
    }
    if(section == 2){
        return @"BUTTON BORDER COLORS";
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"LMColorCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    [cell.textLabel setFont:[UIFont sldsFontRegularWithSize:SLDSFontSizeSmall]];
    
    cell.textLabel.text = [self getLabel:indexPath];
    
    cell.backgroundColor = [self getColor:indexPath];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)t heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SWRevealViewController *revealController = self.revealViewController;

    ColorButtonViewController *dc = [[ColorButtonViewController alloc] init];
    
    dc.colorID = [[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] integerValue];

    
    [revealController setFrontViewController:dc animated:YES];
    [revealController setFrontViewPosition:FrontViewPositionLeftSideMost animated:YES];

 }

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor whiteColor];
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setFont:[UIFont sldsFontLightWithSize:SLDSFontSizeLarge]];
}


@end
