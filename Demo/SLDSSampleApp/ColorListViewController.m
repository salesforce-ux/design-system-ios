/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ColorListViewController.h"
#import "ColorViewController.h"
#import <SalesforceDesignSystem/SalesforceDesignSystemExtended.h>
#import "SWRevealViewController.h"


@interface ColorListViewController ()

@end

@implementation ColorListViewController {
    NSArray *textColors;
    NSArray *backgroundColors;
    NSArray *borderColors;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationItem].title = @"Landmark Icons";
    

    NSMutableArray *tColors = [[NSMutableArray alloc] init];
    for(int i=SLDSColorTextActionLabel; i<=SLDSColorTextWeak; i++) {
        [tColors addObject:[NSNumber numberWithInt:i]];
    }
    textColors = [tColors copy];

    NSMutableArray *bColors = [[NSMutableArray alloc] init];
    for(int i=SLDSColorBackground; i<=SLDSColorBackgroundTempModalTint; i++) {
        [bColors addObject:[NSNumber numberWithInt:i]];
    }
    backgroundColors = [bColors copy];

    
    NSMutableArray *brdrColors = [[NSMutableArray alloc] init];
    for(int i=SLDSColorBorder; i<=SLDSColorBorderWarning; i++) {
        [brdrColors addObject:[NSNumber numberWithInt:i]];
    }
    borderColors = [brdrColors copy];

    
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
        return textColors;
    }
    else if(section == 1){
        return backgroundColors;
    }
    else if(section == 2){
        return borderColors;
    }
    return @[];
}

- (NSString *) getLabel:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return [NSString sldsColorTextName:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue]];
        case 1:
            return [NSString sldsColorBackgroundName:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue]];
        case 2:
            return [NSString sldsColorBorderName:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue]];
        default:
            return @"NOT FOUND!";
    }
}

- (UIColor *) getColor:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return [UIColor sldsColorText:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue]];
        case 1:
            return [UIColor sldsColorBackground:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue]];
        case 2:
            return [UIColor sldsColorBorder:[[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] intValue]];
        default:
            return [UIColor clearColor];
    }
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
        return @"TEXT COLORS";
    }
    if(section == 1){
        return @"BACKGROUND COLORS";
    }
    if(section == 2){
        return @"BORDER COLORS";
    }
    return @"";
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor whiteColor];
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setFont:[UIFont sldsFontLightWithSize:SLDSFontSizeLarge]];
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

        ColorViewController *dc = [[ColorViewController alloc] init];
        
        dc.colorID = [[[self sourceForSection:indexPath.section] objectAtIndex:indexPath.item] integerValue];
        dc.colorCategoryID = [self categoryId:indexPath];
    
    [revealController setFrontViewController:dc animated:YES];
    [revealController setFrontViewPosition:FrontViewPositionLeftSideMost animated:YES];
 }

-(LM_COLOR_CATEGORY)categoryId:(NSIndexPath *) indexPath{
    switch(indexPath.section){
        case 0: return LM_COLOR_CATEGORY_TEXT;
        case 1: return LM_COLOR_CATEGORY_BACKGROUND;
        case 2: return LM_COLOR_CATEGORY_BORDER;
    }
    return LM_COLOR_CATEGORY_BACKGROUND;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowDetailView"]) {
        ColorViewController *dc = [segue destinationViewController];
        
        dc.colorID = [[(NSArray *)sender objectAtIndex:1] intValue];
        dc.colorCategoryID = [[(NSArray *)sender objectAtIndex:0] intValue];
    }
}


@end
