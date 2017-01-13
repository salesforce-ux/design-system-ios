#import "UIColor+SLDSColor.h"

@implementation UIColor (SLDSColor)


+(instancetype)sldsFill:(SLDSFillType)colorType{
    //return [SLDSColor sldsFill:colorType];
    return [self colorForIndex:colorType];
}

//-------------------------------------------------------------------

+(instancetype)sldsBorderColor:(SLDSBorderColorType)colorType{
    //return [SLDSColor sldsBorderColor:colorType];
    return [self colorForIndex:colorType];
}

//-------------------------------------------------------------------

+(instancetype)sldsBackgroundColor:(SLDSBackgroundColorType)colorType{
    //return [SLDSColor sldsBackgroundColor:colorType];
    return [self colorForIndex:colorType];
}

//-------------------------------------------------------------------

+(instancetype)sldsTextColor:(SLDSTextColorType)colorType{
    //return [SLDSColor sldsTextColor:colorType];
    return [self colorForIndex:colorType];
}

//-------------------------------------------------------------------

+(UIColor*)colorForIndex:(NSInteger)index {
    static NSMutableDictionary *colorCache = nil;
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }

    UIColor *color = [colorCache objectForKey:[NSNumber numberWithInteger:index]];
    if( color && [color isEqual:[NSNull null]] ) {
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