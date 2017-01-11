#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SLDSFontSizeType) {
	
	fontSizeXSmall,
	fontSizeSmall,
	fontSizeMedium,
	fontSizeMediumA,
	fontSizeLarge,
	fontSizeXLarge,
	fontSizeXLargeA,
	fontSizeXxLarge,
	fontSizeTextXxSmall,
	fontSizeTextXSmall,
	fontSizeTextSmall,
	fontSizeTextMedium,
	fontSizeTextLarge,
	fontSizeTextXLarge,
	fontSizeHeadingXxSmall,
	fontSizeHeadingXSmall,
	fontSizeHeadingSmall,
	fontSizeHeadingMedium,
	fontSizeHeadingLarge,
	fontSizeHeadingXLarge
};

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

#define sldsFontTypeNames(enum) [@[\
    @"SLDSFontTypeRegular",\
    @"SLDSFontTypeItalic",\
    @"SLDSFontTypeBold",\
    @"SLDSFontTypeBoldItalic",\
    @"SLDSFontTypeLight",\
    @"SLDSFontTypeLightItalic",\
    @"SLDSFontTypeThin",\
    @"SLDSFontTypeThinItalic"\
] objectAtIndex:enum]

#define sldsFontSizeNames(enum) [@[\
    @"fontSizeXSmall",\
    @"fontSizeSmall",\
    @"fontSizeMedium",\
    @"fontSizeMediumA",\
    @"fontSizeLarge",\
    @"fontSizeXLarge",\
    @"fontSizeXLargeA",\
    @"fontSizeXxLarge",\
    @"fontSizeTextXxSmall",\
    @"fontSizeTextXSmall",\
    @"fontSizeTextSmall",\
    @"fontSizeTextMedium",\
    @"fontSizeTextLarge",\
    @"fontSizeTextXLarge",\
    @"fontSizeHeadingXxSmall",\
    @"fontSizeHeadingXSmall",\
    @"fontSizeHeadingSmall",\
    @"fontSizeHeadingMedium",\
    @"fontSizeHeadingLarge",\
    @"fontSizeHeadingXLarge",\
] objectAtIndex:enum]

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
