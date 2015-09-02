/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "TextViewController.h"
#import "SWRevealViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    SWRevealViewController *revealController = self.revealViewController;
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"=" forState:UIControlStateNormal];
    button.frame = CGRectMake(20.0, 20.0, 20.0, 20.0);
    
    [self.view addSubview:button];
    
    
    UITextView *codeView = [[UITextView alloc] initWithFrame:CGRectMake(40, 100+40, self.view.frame.size.width, 250)];
    codeView.text = [self getText];
    [self.view addSubview:codeView];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) getWeightLabel{
    switch(self.fontWeight){
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

- (NSString *) getSizeLabel{
    switch(self.fontSize){
        case SLDSFontSizeXSmall:
            return @"SLDSFontSizeXSmall";
        case SLDSFontSizeSmall:
            return @"SLDSFontSizeSmall";
        case SLDSFontSizeMedium:
            return @"SLDSFontSizeMedium";
        case SLDSFontSizeLarge:
            return @"SLDSFontSizeLarge";
        case SLDSFontSizeXLarge:
            return @"SLDSFontSizeXLarge";
        case SLDSFontSizeXxLarge:
            return @"SLDSFontSizeXxLarge";
        default:
            return @"";
    }
}

- (NSString *) getLabel {
    return [NSString stringWithFormat:@"%@ %@",[self getWeightLabel],[self getSizeLabel] ];
}

- (NSString *) getImport{
    return @"#import <SalesforceDesignSystem/SalesforceDesignSystem.h>";
}

- (NSString *) getMethodName{
    switch(self.fontWeight){
        case SLDS_FONT_FAMILY_BODY:
            return @"sldsFontRegularWithSize";
        case SLDS_FONT_FAMILY_LIGHT:
            return @"sldsFontLightWithSize";
        case SLDS_FONT_FAMILY_STRONG:
            return @"sldsFontStrongWithSize";
    }
    return @"sldsFontRegularWithSize";
}

- (NSString *) getText {
//    NSString *weightLabel = [self getWeightLabel];
    NSString *sizeLabel = [self getSizeLabel];
    NSString *importLine = [self getImport];
    NSString *methodName = [self getMethodName];
    return [NSString stringWithFormat:@"%@\n....\n\n[UIFont %@:\n%@];",importLine,methodName,sizeLabel];
}



@end
