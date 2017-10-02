// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import <UIKit/UIKit.h>
#ifndef SLDSFont_h
#define SLDSFont_h

typedef NS_ENUM(NSInteger, SLDSFontSizeType) {
	
	SLDSFontSizeXSmall,
	SLDSFontSizeSmall,
	SLDSFontSizeMedium,
	SLDSFontSizeMediumA,
	SLDSFontSizeLarge,
	SLDSFontSizeXLarge,
	SLDSFontSizeXLargeA,
	SLDSFontSizeXxLarge,
	SLDSFontSizeTextXxSmall,
	SLDSFontSizeTextXSmall,
	SLDSFontSizeTextSmall,
	SLDSFontSizeTextMedium,
	SLDSFontSizeTextLarge,
	SLDSFontSizeTextXLarge,
	SLDSFontSizeHeadingXxSmall,
	SLDSFontSizeHeadingXSmall,
	SLDSFontSizeHeadingSmall,
	SLDSFontSizeHeadingMedium,
	SLDSFontSizeHeadingLarge,
	SLDSFontSizeHeadingXLarge,
	SLDSColorPickerInputCustomHexFontSize,
	SLDSInputStaticFontSize,
	SLDSPageHeaderTitleFontSize
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
    @14,\
    @16,\
    @18,\
    @20,\
    @24,\
    @25.12,\
    @32,\
    @10,\
    @12,\
    @13,\
    @16,\
    @18,\
    @20,\
    @10,\
    @12,\
    @14,\
    @18,\
    @24,\
    @32,\
    @12,\
    @13,\
    @18,\
] objectAtIndex:enum] integerValue]

//-------------------------------------------------------------------

@interface SLDSFont : NSObject

+(NSBundle*)frameworkBundle;

@end

#endif /* SLDSFont_h */