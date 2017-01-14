#import "UIImage+SLDSIcon.h"

#define UnicodeForIndex(index) ([NSString stringWithFormat:@"\\u%lX", (unsigned long) index + 59905])

@implementation UIImage (SLDSIcon)



+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsActionIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
}
+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsStandardIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
}
+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsCustomIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
}
+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsUtilityIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
}

//-------------------------------------------------------------------

+(NSString*)sldsIconName:(NSInteger)iconType {
	return sldsIconTypeNames(iconType);
}

//-------------------------------------------------------------------

+(UIColor*)colorForIndex:(NSInteger)index {
    static NSMutableDictionary *colorCache = nil;
    if (colorCache == nil) {
        colorCache = [[NSMutableDictionary alloc] init];
    }

    UIColor *color = [colorCache objectForKey:[NSNumber numberWithInteger:index]];

    if( color && [color isEqual:[NSNull null]] ) {
        color = [UIColor colorWithRed:sldsIconBackgroundColors[index][0]
                                green:sldsIconBackgroundColors[index][1]
                                 blue:sldsIconBackgroundColors[index][2]
                                alpha:1];

        [colorCache setObject:color forKey:[NSNumber numberWithInteger:index]];
    }

    return color;
}

//-------------------------------------------------------------------

+(UIImage*)sldsIcon:(NSInteger)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size{

    if (!iconColor) {
        iconColor = [UIColor whiteColor];
    }

    if (!bgColor) {
        bgColor = [self colorForIndex:iconType]; //[SLDSIconAction bgColor:iconType];
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
    NSString *iconKey = [NSString stringWithFormat:@"%ld%f%f%f%f%f%f%f%f%d", (long)iconType,
        fgComps[0], fgComps[1], fgComps[2], fgComps[3],
        bgComps[0], bgComps[1], bgComps[2], bgComps[3], size];
    UIImage * icon = [iconCache objectForKey:iconKey];

    if ( icon != NULL ) {
        return icon;
    }

	CGFloat iconScale = 1.0;
	//CGFloat iconScale = 0.65;

    CGSize iconSize = CGSizeMake(size,size);
    CGRect textRect = CGRectMake(0,(size-size*iconScale)/2,size,size*iconScale);
    UIGraphicsBeginImageContextWithOptions(iconSize, NO, 0.0f);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, bgColor.CGColor);

    UIBezierPath *bg = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size, size) byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(size/10, size/10)];

    [bg fill];

    //NSString *textContent = iconUniCode(iconType);//[SLDSIcon sldsIconUniCode:iconType];
    UIFont *font = [UIFont fontWithName:@"SalesforceDesignSystemIcons.ttf"  size:textRect.size.height];

    [iconColor setFill];

    static NSParagraphStyle * paragraphStyle = nil;

    static dispatch_once_t predicate_static = 0;
    dispatch_once(&predicate_static, ^{
        NSMutableParagraphStyle * pStyle =
        [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [pStyle setAlignment:NSTextAlignmentCenter];
        paragraphStyle = [pStyle copy];
    });

    if(font){
        [UnicodeForIndex(iconType) drawInRect:textRect withAttributes:@{NSFontAttributeName : font,
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