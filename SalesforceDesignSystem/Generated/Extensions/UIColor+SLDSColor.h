// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import <UIKit/UIKit.h>
#import "SLDSColor.h"

@interface UIColor (SLDSColor)

+(instancetype)sldsFill:(SLDSFillType)colorType;
+(instancetype)sldsBorderColor:(SLDSBorderColorType)colorType;
+(instancetype)sldsBackgroundColor:(SLDSBackgroundColorType)colorType;
+(instancetype)sldsTextColor:(SLDSTextColorType)colorType;

@end