#import "UIImage+SLDIcon.h"

@implementation UIImage (SLDIcon)




+(instancetype)sldsActionIcon:(SLDSActionType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsIconAction:iconType withColor:nil andBGColor:nil andSize:size];
}
+(instancetype)sldsStandardIcon:(SLDSStandardType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsIconAction:iconType withColor:nil andBGColor:nil andSize:size];
}
+(instancetype)sldsCustomIcon:(SLDSCustomType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsIconAction:iconType withColor:nil andBGColor:nil andSize:size];
}
+(instancetype)sldsUtilityIcon:(SLDSUtilityType)iconType withSize:(short)size {
    // TODO: Add logic to adjust scale for type
    return [self sldsIconAction:iconType withColor:nil andBGColor:nil andSize:size];
}

+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*) withSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIconAction:iconType withColor:iconColor andBGColor:andBGColor andSize:size];
}
+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*) withSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIconAction:iconType withColor:iconColor andBGColor:andBGColor andSize:size];
}
+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*) withSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIconAction:iconType withColor:iconColor andBGColor:andBGColor andSize:size];
}
+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*) withSize:(short)size {
	// TODO: Add logic to adjust scale for type
	return [self sldsIconAction:iconType withColor:iconColor andBGColor:andBGColor andSize:size];
}

+(NSString*)sldsIconName:(NSInteger)iconType {
	return sldsIconTypeNames(iconType);
}

+(UIColor*)colorForIndex:(NSInteger)index {
    static NSMutableArray *colorCache = nil;
    if (colorCache == nil) {
        colorCache = [[NSMutableArray alloc] initWithCapacity:empty];
        for (NSInteger i = 0; i < empty; ++i)
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
    
    UIFont *font = [UIFont fontWithName:[self iconFontNameAction] size:textRect.size.height];
    
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