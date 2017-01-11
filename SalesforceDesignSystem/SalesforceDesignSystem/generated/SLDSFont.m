#import <UIKit/UIKit.h>
#import "SLDSFont.h"

@implementation SLDSFont : NSObject

#define sldsFontTypeNames(enum) [@[\
@"SLDSFontTypeRegular",
@"SLDSFontTypeItalic",
@"SLDSFontTypeBold",
@"SLDSFontTypeBoldItalic",
@"SLDSFontTypeLight",
@"SLDSFontTypeLightItalic",
@"SLDSFontTypeThin",
@"SLDSFontTypeThinItalic"
] objectAtIndex:enum]

#define sldsFontFileNames(enum) [@[\
@"SalesforceSans-Regular.ttf",
@"SalesforceSans-Italic.ttf",
@"SalesforceSans-Bold.ttf",
@"SalesforceSans-BoldItalic.ttf",
@"SalesforceSans-Light.ttf",
@"SalesforceSans-LightItalic.ttf",
@"SalesforceSans-Thin.ttf",
@"SalesforceSans-ThinItalic.ttf"
] objectAtIndex:enum]

// Note : Needed for dynamic enum iteration
+(NSString*)sldsFontSizeName:(SLDSFontSizeType)sizeType {
    NSArray *arr = @[
                    
                    @"fontSizeXSmall",
                    @"fontSizeSmall",
                    @"fontSizeMedium",
                    @"fontSizeMediumA",
                    @"fontSizeLarge",
                    @"fontSizeXLarge",
                    @"fontSizeXLargeA",
                    @"fontSizeXxLarge",
                    @"fontSizeTextXxSmall",
                    @"fontSizeTextXSmall",
                    @"fontSizeTextSmall",
                    @"fontSizeTextMedium",
                    @"fontSizeTextLarge",
                    @"fontSizeTextXLarge",
                    @"fontSizeHeadingXxSmall",
                    @"fontSizeHeadingXSmall",
                    @"fontSizeHeadingSmall",
                    @"fontSizeHeadingMedium",
                    @"fontSizeHeadingLarge",
                    @"fontSizeHeadingXLarge"
                     ];
    return (NSString *)[arr objectAtIndex:sizeType];
}



+(NSInteger)sldsFontSize:(SLDSFontSizeType)sizeType {
    NSArray *arr = @[
                    
                    @10,
                    @14,
                    @16,
                    @18,
                    @20,
                    @24,
                    @25.12,
                    @32,
                    @10,
                    @12,
                    @13,
                    @16,
                    @18,
                    @20,
                    @10,
                    @12,
                    @14,
                    @18,
                    @24,
                    @32
                     ];
    return [[arr objectAtIndex:sizeType] integerValue];
}



@end