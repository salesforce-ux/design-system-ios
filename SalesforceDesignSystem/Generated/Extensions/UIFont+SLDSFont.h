// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "SLDSFont.h"

@interface UIFont (SLDSFont)

+(instancetype)sldsFont:(SLDSFontType)fontType withSize:(SLDSFontSizeType)fontSize;
+(void)sldsUseDefaultFonts;
+(void)sldsUseDefaultFontFor:(SLDSFontType)fontType;
+(void)sldsUseFont:(NSString *)fontFileName fromBundle:(NSString*)bundleName forType:(SLDSFontType)fontType;
+(void)loadFont:(NSString *)fontFileName fromBundle:(NSString *)bundleName;

// NOTE : Deprecated --------------------------------------------------------------
+(instancetype)sldsFontRegularWithSize:(SLDSFontSizeType)fontSize __deprecated_msg("use method 'sldsFont:(SLDSFontStyle) withSize:(SLDSFontSize)' instead");
+(instancetype)sldsFontItalicWithSize:(SLDSFontSizeType)fontSize __deprecated_msg("use method 'sldsFont:(SLDSFontStyle) withSize:(SLDSFontSize)' instead");
+(instancetype)sldsFontLightWithSize:(SLDSFontSizeType)fontSize __deprecated_msg("use method 'sldsFont:(SLDSFontStyle) withSize:(SLDSFontSize)' instead");
+(instancetype)sldsFontStrongWithSize:(SLDSFontSizeType)fontSize __deprecated_msg("use method 'sldsFont:(SLDSFontStyle) withSize:(SLDSFontSize)' instead");
+(instancetype)sldsFontThinWithSize:(SLDSFontSizeType)fontSize __deprecated_msg("use method 'sldsFont:(SLDSFontStyle) withSize:(SLDSFontSize)' instead");

@end