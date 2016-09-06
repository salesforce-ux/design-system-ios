/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ColorMessagingViewController.h"
#import "SWRevealViewController.h"
#import <SalesforceDesignSystem/SalesforceDesignSystemExtended.h>


@interface ColorMessagingViewController ()

@end

@implementation ColorMessagingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    SWRevealViewController *revealController = self.revealViewController;
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"=" forState:UIControlStateNormal];
    button.frame = CGRectMake(SLDSSpacingXLarge, 20.0, 20.0, 20.0);
    
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
    return [NSString sldsMessagingColorName:self.colorID];
}

- (UIColor *) getColor{
    return [UIColor sldsMessagingColor:self.colorID];
}

- (NSString *) getImport{
    return @"#import <DesignSystem/DesignSystem.h>";
}

- (NSString *) getMethodName{
    return @"sldsMessagingColor";
}

- (NSString *) getText {
    NSString *colorName = [self getLabel];
    NSString *importLine = [self getImport];
    NSString *methodName = [self getMethodName];
    return [NSString stringWithFormat:@"%@\n....\n\n[UIColor\n %@:\n%@];",importLine,methodName,colorName];
}



@end
