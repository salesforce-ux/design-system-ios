// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import <UIKit/UIKit.h>
#import "SLDSColor.h"

@interface UIColor (SLDSColor)

+(instancetype)sldsFill:(SLDSFillType)colorType;
+(instancetype)sldsBorderColor:(SLDSBorderColorType)colorType;
+(instancetype)sldsBackgroundColor:(SLDSBackgroundColorType)colorType;
+(instancetype)sldsTextColor:(SLDSTextColorType)colorType;
+(instancetype)sldsColor:(SLDSColorType)colorType;


+(void)sldsOverrideFill:(SLDSFillType)colorType with:(UIColor*)color;
+(void)sldsOverrideBorderColor:(SLDSBorderColorType)colorType with:(UIColor*)color;
+(void)sldsOverrideBackgroundColor:(SLDSBackgroundColorType)colorType with:(UIColor*)color;
+(void)sldsOverrideTextColor:(SLDSTextColorType)colorType with:(UIColor*)color;
+(void)sldsOverrideColor:(SLDSColorType)colorType with:(UIColor*)color;
@end