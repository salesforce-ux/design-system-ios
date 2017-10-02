// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import "UIColor+SLDSColor.h"

@implementation UIColor (SLDSColor)

static NSMutableDictionary *colorCache = nil;



+(instancetype)sldsFill:(SLDSFillType)colorType{
    if(colorType < SLDSFillTypeFirst || colorType > SLDSFillTypeLast) {
        // NOTE: Index out of bounds
        return nil;
    }

    @synchronized(colorCache) {
        return [self colorForIndex:colorType];
    }
}

//-------------------------------------------------------------------

+(instancetype)sldsBorderColor:(SLDSBorderColorType)colorType{
    if(colorType < SLDSBorderColorTypeFirst || colorType > SLDSBorderColorTypeLast) {
        // NOTE: Index out of bounds
        return nil;
    }

    @synchronized(colorCache) {
        return [self colorForIndex:colorType];
    }
}

//-------------------------------------------------------------------

+(instancetype)sldsBackgroundColor:(SLDSBackgroundColorType)colorType{
    if(colorType < SLDSBackgroundColorTypeFirst || colorType > SLDSBackgroundColorTypeLast) {
        // NOTE: Index out of bounds
        return nil;
    }

    @synchronized(colorCache) {
        return [self colorForIndex:colorType];
    }
}

//-------------------------------------------------------------------

+(instancetype)sldsTextColor:(SLDSTextColorType)colorType{
    if(colorType < SLDSTextColorTypeFirst || colorType > SLDSTextColorTypeLast) {
        // NOTE: Index out of bounds
        return nil;
    }

    @synchronized(colorCache) {
        return [self colorForIndex:colorType];
    }
}

//-------------------------------------------------------------------

+(instancetype)sldsColor:(SLDSColorType)colorType{
    if(colorType < SLDSColorTypeFirst || colorType > SLDSColorTypeLast) {
        // NOTE: Index out of bounds
        return nil;
    }

    @synchronized(colorCache) {
        return [self colorForIndex:colorType];
    }
}

//-------------------------------------------------------------------



+(void)sldsOverrideFill:(SLDSFillType)colorType with:(UIColor*)color{
    
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }
    
    @synchronized(colorCache) {
        [self overrideIndexWithColor:colorType with:color];
    }
}

//-------------------------------------------------------------------

+(void)sldsOverrideBorderColor:(SLDSBorderColorType)colorType with:(UIColor*)color{
    
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }
    
    @synchronized(colorCache) {
        [self overrideIndexWithColor:colorType with:color];
    }
}

//-------------------------------------------------------------------

+(void)sldsOverrideBackgroundColor:(SLDSBackgroundColorType)colorType with:(UIColor*)color{
    
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }
    
    @synchronized(colorCache) {
        [self overrideIndexWithColor:colorType with:color];
    }
}

//-------------------------------------------------------------------

+(void)sldsOverrideTextColor:(SLDSTextColorType)colorType with:(UIColor*)color{
    
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }
    
    @synchronized(colorCache) {
        [self overrideIndexWithColor:colorType with:color];
    }
}

//-------------------------------------------------------------------

+(void)sldsOverrideColor:(SLDSColorType)colorType with:(UIColor*)color{
    
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }
    
    @synchronized(colorCache) {
        [self overrideIndexWithColor:colorType with:color];
    }
}

//-------------------------------------------------------------------


+(void)overrideIndexWithColor:(NSInteger)index with:(UIColor*)color {
    
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }
    
    [colorCache setObject:color forKey:[NSNumber numberWithInteger:index]];
}

//-------------------------------------------------------------------

+(UIColor*)colorForIndex:(NSInteger)index {

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

@end