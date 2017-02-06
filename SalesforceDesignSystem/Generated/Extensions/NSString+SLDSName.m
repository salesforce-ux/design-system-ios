//
//  UIColor+SLDSColorNames.m
//  SalesforceDesignSystem
//
//  Created by Joe Andolina on 2/6/17.
//  Copyright © 2017 Salesforce UX. All rights reserved.
//

#import "NSString+SLDSName.h"

@implementation NSString (SLDSName)

//-------------------------------------------------------------------

+(NSString*)sldsColorName:(NSInteger)colorType {
    return sldsColorTypeNames(colorType);
}

//-------------------------------------------------------------------

+(NSString*)sldsFontName:(NSInteger)fontType {
    return sldsFontTypeNames(fontType);
}

//-------------------------------------------------------------------

+(NSString*)sldsFontSizeName:(NSInteger)sizeType {
    return sldsFontSizeNames(sizeType);
}

//-------------------------------------------------------------------

+(NSString*)sldsIconName:(NSInteger)iconType {
    return sldsIconTypeNames(iconType);
}

@end
