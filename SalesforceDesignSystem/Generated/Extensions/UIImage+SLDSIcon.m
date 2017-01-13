#import "UIImage+SLDSIcon.h"

@implementation UIImage (SLDSIcon)


+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsIcon:iconType withColor:nil andBGColor:nil andSize:size];
}
+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsIcon:iconType withColor:nil andBGColor:nil andSize:size];
}

+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
}
+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIcon:iconType withColor:iconColor andBGColor:bgColor andSize:size];
}

+(NSString*)sldsIconName:(NSInteger)iconType {
	return sldsIconTypeNames(iconType);
}

+(UIColor*)colorForIndex:(NSInteger)index {
    static NSMutableArray *colorCache = nil;
    if (colorCache == nil) {
        colorCache = [[NSMutableArray alloc] initWithCapacity:custom99];
        for (NSInteger i = 0; i < custom99; ++i)
            [colorCache addObject:[NSNull null]];
    }

    UIColor *color = [colorCache objectAtIndex:index];
    if( color && [color isEqual:[NSNull null]] ) {
        color = [UIColor colorWithRed:sldsIconBackgroundColors[index][0]
                                green:sldsIconBackgroundColors[index][1]
                                 blue:sldsIconBackgroundColors[index][2]
                                alpha:1];
        [colorCache setObject:color atIndexedSubscript:index];
    }

    return color;
}

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

	CGFloat iconScale = 1.0;
	//CGFloat iconScale = 0.65;

    CGSize iconSize = CGSizeMake(size,size);
    CGRect textRect = CGRectMake(0,(size-size*iconScale)/2,size,size*iconScale);
    UIGraphicsBeginImageContextWithOptions(iconSize, NO, 0.0f);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, bgColor.CGColor);

    UIBezierPath *bg = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size, size) byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(size/10, size/10)];

    [bg fill];

    NSString *textContent = iconUniCode(iconType);//[SLDSIcon sldsIconUniCode:iconType];

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
        [textContent drawInRect:textRect withAttributes:@{NSFontAttributeName : font,
                                                          NSForegroundColorAttributeName : iconColor,
                                                          NSParagraphStyleAttributeName:paragraphStyle
                                                          }];
    }

    UIImage * icon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return icon;
}

@end