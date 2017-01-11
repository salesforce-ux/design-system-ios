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

@interface SLDSFont : NSObject

+(NSInteger)sldsFontSize:(SLDSFontSizeType)fontSize;
+(NSString*)sldsFontSizeName:(SLDSFontSizeType)sizeType;
+(NSString*)sldsFontTypeName:(SLDSFontType)fontType;
+(NSString*)sldsFontFileName:(SLDSFontType)fontType;

@end