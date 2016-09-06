/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "IconViewController.h"
#import <SalesforceDesignSystem/SalesforceDesignSystemExtended.h>
#import "SWRevealViewController.h"

@interface IconViewController ()

@end

@implementation IconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    SWRevealViewController *revealController = self.revealViewController;
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"=" forState:UIControlStateNormal];
    button.frame = CGRectMake(20.0, 20.0, 20.0, 20.0);
    
    [self.view addSubview:button];
    
    
    CGSize size = CGSizeMake((self.view.frame.size.width-80),(self.view.frame.size.width-80));
    UIImage *image = [self getIcon:size];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.frame = CGRectMake(40, 100, size.width, size.height);
    [self.view addSubview:imageView];
    
    UITextView *codeView = [[UITextView alloc] initWithFrame:CGRectMake(40, 100+size.height+40, size.width, size.height)];
    codeView.text = [self getText];
    [codeView setFont:[UIFont systemFontOfSize:16]];
    [self.view addSubview:codeView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}


- (UIImage *) getIcon:(CGSize) size {
    
    switch (self.iconCategoryID) {
        case SLDS_ICON_CATEGORY_ACTIONS:
            return [UIImage sldsIconAction:self.iconID withSize:size.height];
        case SLDS_ICON_CATEGORY_CUSTOM:
            return [UIImage sldsIconCustom:self.iconID withSize:size.height];
        case SLDS_ICON_CATEGORY_STANDARD:
            return [UIImage sldsIconStandard:self.iconID withSize:size.height];
        case SLDS_ICON_CATEGORY_UTILITY:
            return [UIImage sldsIconUtility:self.iconID withSize:size.height];
        default:
            return nil;
    }
}

- (NSString *) getLabel {
    
    switch (self.iconCategoryID) {
        case SLDS_ICON_CATEGORY_ACTIONS:
            return [NSString sldsIconAction:self.iconID];
        case SLDS_ICON_CATEGORY_CUSTOM:
            return @"Label";
        case SLDS_ICON_CATEGORY_STANDARD:
            return @"Label";
        case SLDS_ICON_CATEGORY_UTILITY:
            return @"Label";
        default:
            return nil;
    }
}

- (NSString *) getImportLine{
    return @"#import <DesignSystem/DesignSystem.h>";
}

- (NSString *) getMethodName{
    switch (self.iconCategoryID) {
        case 0:
            return @"sldsIconActions";
        case 1:
            return @"sldsIconCustomName";
        case 2:
            return @"sldsIconStandardName";
        case 3:
            return @"sldsIconUtilityName";
        default:
            return @"";
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) getText {
    NSString *iconName = [self getLabel];
    NSString *importLine = [self getImportLine];
    NSString *methodName = [self getMethodName];
    return [NSString stringWithFormat:@"%@\n....\n\n[UIImage\n%@:\n%@\ntargetSize:\nCGSizeMake(300,300)]",importLine,methodName,iconName];
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
