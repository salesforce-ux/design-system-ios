/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "IconListViewController.h"

#import "IconViewController.h"
#import <SalesforceDesignSystem/SalesforceDesignSystemExtended.h>
#import "SWRevealViewController.h"


@interface IconListViewController ()

@end

@implementation IconListViewController {
    NSArray *textBtnColors;
    NSArray *backgroundBtnColors;
    NSArray *borderBtnColors;
    
    NSArray *actionIcons;
    NSArray *customIcons;
    NSArray *standardIcons;
    NSArray *utilityIcons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationItem].title = @"Landmark Icons";
    

    

    NSMutableArray *aIcons = [[NSMutableArray alloc] init];
    for(int i=SLDSIconActionAnnouncement; i<=SLDSIconActionWebLink; i++) {
        [aIcons addObject:[NSNumber numberWithInt:i]];
    }
    actionIcons = [aIcons copy];
    
    
    NSMutableArray *cIcons = [[NSMutableArray alloc] init];
    for(int i=SLDSIconCustom1; i<=SLDSIconCustom98; i++) {
        [cIcons addObject:[NSNumber numberWithInt:i]];
    }
    customIcons = [cIcons copy];
    
    
    NSMutableArray *sIcons = [[NSMutableArray alloc] init];
    for(int i=SLDSIconStandardAccount; i<=SLDSIconStandardUser; i++) {
        [sIcons addObject:[NSNumber numberWithInt:i]];
    }
    standardIcons = [sIcons copy];
    
    
    NSMutableArray *uIcons = [[NSMutableArray alloc] init];
    for(int i=SLDSIconUtilityAdd; i<=SLDSIconUtilityZoomout; i++) {
        [uIcons addObject:[NSNumber numberWithInt:i]];
    }
    utilityIcons = [uIcons copy];

    
    
    
    
    
    
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


- (NSArray *) sourceForSection:(NSInteger)section {
    if(section == 0){
        return actionIcons;
    }
    else if(section == 1){
        return customIcons;
    }
    else if(section == 2){
        return standardIcons;
    }
    else if(section == 3){
        return utilityIcons;
    }
    return @[];
}

- (UIImage *) getIcon:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(40,40);
    
    switch (indexPath.section) {
        case 0:
            return [UIImage sldsIconAction:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue] withSize:size.height];
        case 1:
            return [UIImage sldsIconCustom:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue] withSize:size.height];
        case 2:
            return [UIImage sldsIconStandard:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue] withSize:size.height];
        case 3:
            return [UIImage sldsIconUtility:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue] withSize:size.height];
        default:
            return nil;
    }
}

- (NSString *) getLabel:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case SLDS_ICON_CATEGORY_ACTIONS:
            return [NSString sldsIconAction:indexPath.row];
        case SLDS_ICON_CATEGORY_CUSTOM:
            return [NSString sldsIconCustom:indexPath.row];
        case SLDS_ICON_CATEGORY_STANDARD:
            return [NSString sldsIconStandard:indexPath.row];
        case SLDS_ICON_CATEGORY_UTILITY:
            return [NSString sldsIconUtility:indexPath.row];
        default:
            return nil;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self sourceForSection:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return @"ACTION ICONS";
    }
    if(section == 1){
        return @"CUSTOM ICONS";
    }
    if(section == 2){
        return @"STANDARD ICONS";
    }
    if(section == 3){
        return @"UTILITY ICONS";
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
    
    cell.imageView.image = [self getIcon:indexPath];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)t heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SWRevealViewController *revealController = self.revealViewController;
    
    IconViewController *dc = [[IconViewController alloc] init];
    
    dc.iconID = [[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] integerValue];
    dc.iconCategoryID = indexPath.section;
    
    
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
