/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ColorViewController.h"
#import "SWRevealViewController.h"
#import <SalesforceDesignSystem/SalesforceDesignSystemExtended.h>


@interface ColorViewController ()

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    SWRevealViewController *revealController = self.revealViewController;
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"=" forState:UIControlStateNormal];
    button.frame = CGRectMake(20.0, 20.0, 20.0, 20.0);
    
    [self.view addSubview:button];
    
    
    
    CGSize size = CGSizeMake((self.view.frame.size.width-80),(self.view.frame.size.width-80));
    UIColor *color = [self getColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40, 100, size.width, size.height)];
    
    view.backgroundColor = color;
    view.layer.borderColor = [UIColor grayColor].CGColor;
    view.layer.borderWidth = 1.0f;
    
    [self.view addSubview:view];



    UITextView *codeView = [[UITextView alloc] initWithFrame:CGRectMake(40, 100+size.height+40, size.width, size.height)];
    codeView.text = [self getText];
    [self.view addSubview:codeView];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) getLabel{
    switch (self.colorCategoryID) {
        case 0:
            return [NSString sldsColorTextName:self.colorID];
        case 1:
            return [NSString sldsColorBackgroundName:self.colorID];
        case 2:
            return [NSString sldsColorBorderName:self.colorID];
        default:
            return @"NOT FOUND!";
    }
}

- (UIColor *) getColor{
    switch (self.colorCategoryID) {
        case 0:
            return [UIColor sldsColorText:self.colorID];
        case 1:
            return [UIColor sldsColorBackground:self.colorID];
        case 2:
            return [UIColor sldsColorBorder:self.colorID];
        default:
            return [UIColor clearColor];
    }
}

- (NSString *) getImport{
    return @"#import <DesignSystem/DesignSystem.h>";
}

- (NSString *) getMethodName{
    switch (self.colorCategoryID) {
        case 0:
            return @"sldsColorText";
        case 1:
            return @"sldsColorBackground";
        case 2:
            return @"sldsColorBorder";
        default:
            return @"";
    }
}

- (NSString *) getText {
    NSString *colorName = [self getLabel];
    NSString *importLine = [self getImport];
    NSString *methodName = [self getMethodName];
    return [NSString stringWithFormat:@"%@\n....\n\n[UIColor\n %@:\n%@];",importLine,methodName,colorName];
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
