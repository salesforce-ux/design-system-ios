#import "UIColor+SLDSColor.h"

@implementation UIColor (SLDSColor)



+(instancetype)sldsFill:(SLDSFillType)colorType{
    //return [SLDSColor sldsFill:colorType];
    return [self colorForIndex:colorType];
}
+(instancetype)sldsBorderColor:(SLDSBorderColorType)colorType{
    //return [SLDSColor sldsBorderColor:colorType];
    return [self colorForIndex:colorType];
}
+(instancetype)sldsBackgroundColor:(SLDSBackgroundColorType)colorType{
    //return [SLDSColor sldsBackgroundColor:colorType];
    return [self colorForIndex:colorType];
}
+(instancetype)sldsTextColor:(SLDSTextColorType)colorType{
    //return [SLDSColor sldsTextColor:colorType];
    return [self colorForIndex:colorType];
}

+(UIColor*)colorForIndex:(NSInteger)index {
    static NSMutableArray *colorCache = nil;
    if (colorCache == nil) {
        colorCache = [[NSMutableArray alloc] initWithCapacity:colorTextContextBarActionTrigger];
        for (NSInteger i = 0; i < colorTextContextBarActionTrigger; ++i)
            [colorCache addObject:[NSNull null]];
    }

    UIColor *color = [colorCache objectAtIndex:index];
    if( color && [color isEqual:[NSNull null]] ) {
        color = [UIColor colorWithRed:sldsColors[index][0]
                                green:sldsColors[index][1]
                                 blue:sldsColors[index][2]
                                alpha:sldsColors[index][3]];
        [colorCache setObject:color atIndexedSubscript:index];
    }

    return color;
}

+(NSString*)sldsColorName:(NSInteger)colorType {
    return sldsColorTypeNames(colorType);
}

@end