// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import <Foundation/Foundation.h>
#import "SLDSName.h"

@interface NSString (SLDSName)

+(NSString*)sldsColorName:(NSInteger)colorType;
+(NSString*)sldsFontName:(NSInteger)fontType;
+(NSString*)sldsFontSizeName:(NSInteger)sizeType;
+(NSString*)sldsIconName:(NSInteger)iconType;

@end
