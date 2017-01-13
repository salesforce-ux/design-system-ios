#import "UIImage+SLDSIcon.h"

#define UnicodeForIndex(index) ([NSString stringWithFormat:@"\\u%lX", (unsigned long) index + 59905])

@implementation UIImage (SLDSIcon)


+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withSize:(short)size {
    return [self sldsActionIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size {
    return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withSize:(short)size {
    return [self sldsCustomIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

//-------------------------------------------------------------------

+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size {
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
        bgColor = [self colorForIndex:iconType];
    }
    if(!bgColor){
        bgColor = [UIColor clearColor];
    }

    static NSMutableDictionary *iconCache = nil;
    if (iconCache == nil) {
        iconCache = [[NSMutableDictionary alloc] init];
    }

    CGFloat const *components = CGColorGetComponents(iconColor.CGColor);
    NSString * fgColorKey = [NSString stringWithFormat:@"%f%f%f%f", components[0], components[1], components[2], components[3]];

    components = CGColorGetComponents(bgColor.CGColor);
    NSString * bgColorKey = [NSString stringWithFormat:@"%f%f%f%f", components[0], components[1], components[2], components[3]];

    NSString *iconKey = [NSString stringWithFormat:@"%ld %@ %@ %d", (long)iconType, fgColorKey, bgColorKey, size];
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

    UIFont *font = [UIFont fontWithName:@"SalesforceDesignSystemIcons.ttf" size:textRect.size.height];
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


//-------------------------------------------------------------------

@end