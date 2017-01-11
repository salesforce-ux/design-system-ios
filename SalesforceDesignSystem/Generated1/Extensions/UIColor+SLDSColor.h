#import <UIKit/UIKit.h>
#import "SLDSColor.h"

@interface UIColor (SLDSColor)

+(instancetype)sldsFill:(SLDSFillType)colorType;
+(instancetype)sldsBorderColor:(SLDSBorderColorType)colorType;
+(instancetype)sldsBackgroundColor:(SLDSBackgroundColorType)colorType;
+(instancetype)sldsTextColor:(SLDSTextColorType)colorType;
+(NSString*)sldsColorName:(NSInteger)colorType;

@end
