// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import <UIKit/UIKit.h>
#ifndef SLDSFont_h
#define SLDSFont_h

typedef NS_ENUM(NSInteger, SLDSFontSizeType) {
	
	SLDSFontSize1,
	SLDSFontSize2,
	SLDSFontSize3,
	SLDSVarFontSize10,
	SLDSFontSize4,
	SLDSVarFontSize11,
	SLDSFontSize5,
	SLDSFontSize6,
	SLDSFontSize7,
	SLDSFontSize8,
	SLDSVarFontSize1,
	SLDSFontSize9,
	SLDSVarFontSize2,
	SLDSVarFontSize3,
	SLDSFontSize10,
	SLDSVarFontSize4,
	SLDSFontSize11,
	SLDSVarFontSize5,
	SLDSVarFontSize6,
	SLDSVarFontSize7,
	SLDSVarFontSize8,
	SLDSVarFontSize9,
	SLDSFontSizeHeadingMedium,
	SLDSFontSizeMedium,
	SLDSFontSizeTextSmall,
	SLDSFontSizeMediumA,
	SLDSFontSizeXLarge,
	SLDSFontSizeXLargeA,
	SLDSFontSizeHeadingXLarge,
	SLDSFontSizeXxLarge,
	SLDSFontSizeTextXxSmall,
	SLDSFontSizeLarge,
	SLDSFontSizeHeadingLarge,
	SLDSFontSizeTextXLarge,
	SLDSFontSizeXSmall,
	SLDSFontSizeHeadingXxSmall,
	SLDSFontSizeHeadingXSmall,
	SLDSFontSizeTextLarge,
	SLDSFontSizeSmall,
	SLDSFontSizeTextMedium,
	SLDSFontSizeTextXSmall,
	SLDSFontSizeHeadingSmall,
	SLDSColorPickerInputCustomHexFontSize,
	SLDSInputStaticFontSize,
	SLDSPageHeaderTitleFontSize,
	SLDSWelcomeMatFontSizeInfoTitle
};

//-------------------------------------------------------------------

typedef NS_ENUM(NSInteger, SLDSFontType) {
    SLDSFontTypeRegular,
    SLDSFontTypeItalic,
    SLDSFontTypeBold,
    SLDSFontTypeBoldItalic,
    SLDSFontTypeLight,
    SLDSFontTypeLightItalic,
    SLDSFontTypeThin,
    SLDSFontTypeThinItalic
};

//-------------------------------------------------------------------

#define sldsFontFileNames(enum) [@[\
    @"SalesforceSans-Regular.ttf",\
    @"SalesforceSans-Italic.ttf",\
    @"SalesforceSans-Bold.ttf",\
    @"SalesforceSans-BoldItalic.ttf",\
    @"SalesforceSans-Light.ttf",\
    @"SalesforceSans-LightItalic.ttf",\
    @"SalesforceSans-Thin.ttf",\
    @"SalesforceSans-ThinItalic.ttf"\
] objectAtIndex:enum]

//-------------------------------------------------------------------

#define sldsFontSizes(enum) [[@[\
    @10,\
    @12,\
    @13,\
    @32,\
    @14,\
    @42,\
    @16,\
    @18,\
    @20,\
    @24,\
    @10,\
    @28,\
    @12,\
    @13,\
    @32,\
    @14,\
    @42,\
    @16,\
    @18,\
    @20,\
    @24,\
    @28,\
    @18,\
    @16,\
    @13,\
    @18,\
    @24,\
    @25.12,\
    @32,\
    @32,\
    @10,\
    @20,\
    @24,\
    @20,\
    @10,\
    @10,\
    @12,\
    @18,\
    @14,\
    @16,\
    @12,\
    @14,\
    @12,\
    @13,\
    @18,\
    @42,\
] objectAtIndex:enum] integerValue]

//-------------------------------------------------------------------

@interface SLDSFont : NSObject

+(NSBundle*)frameworkBundle;

@end

#endif /* SLDSFont_h */