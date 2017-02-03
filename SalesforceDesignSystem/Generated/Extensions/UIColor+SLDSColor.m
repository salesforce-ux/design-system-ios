#import "UIColor+SLDSColor.h"

@implementation UIColor (SLDSColor)


+(instancetype)sldsFill:(SLDSFillType)colorType{
    if(colorType < SLDSFillTypeFirst && colorType > SLDSFillTypeLast) {
        // NOTE: Index out of bounds
        return [[UIColor alloc] init];
    }

    return [self colorForIndex:colorType];
}

//-------------------------------------------------------------------

+(instancetype)sldsBorderColor:(SLDSBorderColorType)colorType{
    if(colorType < SLDSBorderColorTypeFirst && colorType > SLDSBorderColorTypeLast) {
        // NOTE: Index out of bounds
        return [[UIColor alloc] init];
    }

    return [self colorForIndex:colorType];
}

//-------------------------------------------------------------------

+(instancetype)sldsBackgroundColor:(SLDSBackgroundColorType)colorType{
    if(colorType < SLDSBackgroundColorTypeFirst && colorType > SLDSBackgroundColorTypeLast) {
        // NOTE: Index out of bounds
        return [[UIColor alloc] init];
    }

    return [self colorForIndex:colorType];
}

//-------------------------------------------------------------------

+(instancetype)sldsTextColor:(SLDSTextColorType)colorType{
    if(colorType < SLDSTextColorTypeFirst && colorType > SLDSTextColorTypeLast) {
        // NOTE: Index out of bounds
        return [[UIColor alloc] init];
    }

    return [self colorForIndex:colorType];
}

//-------------------------------------------------------------------

+(UIColor*)colorForIndex:(NSInteger)index {
    static NSMutableDictionary *colorCache = nil;
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }

    UIColor *color = [colorCache objectForKey:[NSNumber numberWithInteger:index]];

    if( color == nil ) {
        color = [UIColor colorWithRed:sldsColors[index][0]
                                green:sldsColors[index][1]
                                 blue:sldsColors[index][2]
                                alpha:sldsColors[index][3]];

        [colorCache setObject:color forKey:[NSNumber numberWithInteger:index]];
    }

    return color;
}

//-------------------------------------------------------------------

+(NSString*)sldsColorName:(NSInteger)colorType {
    return sldsColorTypeNames(colorType);
}

@end