// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import "UIImage+SLDSIcon.h"
#import "UIFont+SLDSFont.h"

#define sldsIconBackgroundColorsLength (sizeof sldsIconBackgroundColors) / (sizeof sldsIconBackgroundColors[0])

@implementation UIImage (SLDSIcon)

static NSMutableDictionary *colorCache = nil;
static NSMutableDictionary *iconCache = nil;



+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withSize:(CGFloat)size {
    return [self sldsActionIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andSize:(CGFloat)size {
    return [self sldsActionIcon:iconType withColor:iconColor andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size {
	if(iconType < SLDSActionIconTypeFirst || iconType > SLDSActionIconTypeLast) {
        // NOTE: Index out of bounds
        return nil;
    }

    @synchronized(iconCache) {
        return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
    }
}

//-------------------------------------------------------------------

+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withSize:(CGFloat)size {
    return [self sldsCustomIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andSize:(CGFloat)size {
    return [self sldsCustomIcon:iconType withColor:iconColor andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size {
	if(iconType < SLDSCustomIconTypeFirst || iconType > SLDSCustomIconTypeLast) {
        // NOTE: Index out of bounds
        return nil;
    }

    @synchronized(iconCache) {
        return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
    }
}

//-------------------------------------------------------------------

+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withSize:(CGFloat)size {
    return [self sldsStandardIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withColor:(UIColor*)iconColor andSize:(CGFloat)size {
    return [self sldsStandardIcon:iconType withColor:iconColor andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size {
	if(iconType < SLDSStandardIconTypeFirst || iconType > SLDSStandardIconTypeLast) {
        // NOTE: Index out of bounds
        return nil;
    }

    @synchronized(iconCache) {
        return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
    }
}

//-------------------------------------------------------------------

+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withSize:(CGFloat)size {
    return [self sldsUtilityIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withColor:(UIColor*)iconColor andSize:(CGFloat)size {
    return [self sldsUtilityIcon:iconType withColor:iconColor andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size {
	if(iconType < SLDSUtilityIconTypeFirst || iconType > SLDSUtilityIconTypeLast) {
        // NOTE: Index out of bounds
        return nil;
    }

    @synchronized(iconCache) {
        return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
    }
}

//-------------------------------------------------------------------


+(UIColor*)colorForIndex:(NSInteger)index {
    static NSMutableDictionary *colorCache = nil;
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }

    UIColor *color = nil;

    if (index < sldsIconBackgroundColorsLength ) {
        color = [colorCache objectForKey:[NSNumber numberWithInteger:index]];

        if( color == nil ) {
            color = [UIColor colorWithRed:sldsIconBackgroundColors[index][0]
                                    green:sldsIconBackgroundColors[index][1]
                                     blue:sldsIconBackgroundColors[index][2]
                                    alpha:1];

            [colorCache setObject:color forKey:[NSNumber numberWithInteger:index]];
        }
    }

    return color;
}

//-------------------------------------------------------------------

+(UIImage*)sldsIcon:(NSInteger)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size{

    if (!iconColor) {
        iconColor = [UIColor whiteColor];
    }
    if (!bgColor) {
        @synchronized(colorCache){
            bgColor = [self colorForIndex:iconType];
        }
    }
    if(!bgColor){
        bgColor = [UIColor clearColor];
    }

    static NSMutableDictionary *iconCache = nil;
    if (iconCache == nil) {
        iconCache = [[NSMutableDictionary alloc] init];
    }

    CGFloat const *fgComps = CGColorGetComponents(iconColor.CGColor);
    CGFloat const * bgComps = CGColorGetComponents(bgColor.CGColor);
    NSString *iconKey = [NSString stringWithFormat:@"%ld%f%f%f%f%f%f%f%f%f", (long)iconType,
        fgComps[0], fgComps[1], fgComps[2], fgComps[3],
        bgComps[0], bgComps[1], bgComps[2], bgComps[3], size];
    UIImage * icon = [iconCache objectForKey:iconKey];

    if ( icon != nil ) {
        return icon;
    }

    CGSize iconSize = CGSizeMake(size,size);
    CGRect textRect = CGRectMake(0,(size-size)/2,size,size);
    UIGraphicsBeginImageContextWithOptions(iconSize, NO, 0.0f);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, bgColor.CGColor);

    // NOTE: Rounding ActionIcon Backgrounds
    CGFloat ratio = iconType >= SLDSActionIconTypeFirst && iconType <= SLDSActionIconTypeLast ? 2 : 10;

    UIBezierPath *bg = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size, size) byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(size/ratio, size/ratio)];
    [bg fill];

    UIFont *font = [UIFont fontWithName:@"SalesforceDesignSystemIcons" size:textRect.size.height];

    if (font == nil) {
    	[UIFont loadFont:@"SalesforceDesignSystemIcons" fromBundle:@"SalesforceDesignSystem"];
    	font = [UIFont fontWithName:@"SalesforceDesignSystemIcons" size:textRect.size.height];
    }

    [iconColor setFill];

    static NSParagraphStyle * paragraphStyle = nil;

    static dispatch_once_t predicate_static = 0;
    dispatch_once(&predicate_static, ^{
        NSMutableParagraphStyle * pStyle =
        [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [pStyle setAlignment:NSTextAlignmentCenter];
        paragraphStyle = [pStyle copy];
    });

    if(font != nil){
        NSString *s = [NSString stringWithFormat:@"%C", (unichar)((unsigned short)iconType + 59905)];

        [s drawInRect:textRect withAttributes:@{NSFontAttributeName : font,
                                                          NSForegroundColorAttributeName : iconColor,
                                                          NSParagraphStyleAttributeName:paragraphStyle
                                                          }];
    }

    icon = UIGraphicsGetImageFromCurrentImageContext();
    [iconCache setObject:icon forKey:iconKey];

    UIGraphicsEndImageContext();
    return icon;
}

@end