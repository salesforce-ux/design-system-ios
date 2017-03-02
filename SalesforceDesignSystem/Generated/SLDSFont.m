// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import "SLDSFont.h"

@implementation SLDSFont

+(NSBundle*)frameworkBundle
{
    NSBundle *appBundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [appBundle pathForResource:@"SalesforceDesignSystem" ofType:@"bundle"];
    
    NSBundle *frameworkBundle = [NSBundle bundleWithPath:path];
    return frameworkBundle;
}

@end