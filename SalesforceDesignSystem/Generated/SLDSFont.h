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
+(NSString*)sldsFontFileName:(SLDSFontType)fontType;
+(NSString*)sldsFontTypeName:(SLDSFontType)fontType;
+(NSString*)sldsFontSizeName:(SLDSFontSizeType)sizeType;
+(CGFloat)sldsFontSize:(SLDSFontSizeType)sizeType;

@end