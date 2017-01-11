#import "UIColor+SLDSColor.h"

@implementation UIColor (SLDSColor)

+(instancetype)sldsFill:(SLDSFillType)colorType{
    return [SLDSColor sldsFill:colorType];
}
+(instancetype)sldsBorderColor:(SLDSBorderColorType)colorType{
    return [SLDSColor sldsBorderColor:colorType];
}
+(instancetype)sldsBackgroundColor:(SLDSBackgroundColorType)colorType{
    return [SLDSColor sldsBackgroundColor:colorType];
}
+(instancetype)sldsTextColor:(SLDSTextColorType)colorType{
    return [SLDSColor sldsTextColor:colorType];
}

+(NSString*)sldsColorName:(NSInteger)colorType {
    return [SLDSColor sldsColorName:colorType];
}

@end
