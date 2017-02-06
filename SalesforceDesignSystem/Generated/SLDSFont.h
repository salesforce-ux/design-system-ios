#import <UIKit/UIKit.h>

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
	SLDSFontSizeHeadingXLarge
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
] objectAtIndex:enum] integerValue]

//-------------------------------------------------------------------
