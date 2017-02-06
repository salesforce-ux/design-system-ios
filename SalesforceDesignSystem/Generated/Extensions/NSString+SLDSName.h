//
//  UIColor+SLDSColorNames.h
//  SalesforceDesignSystem
//
//  Created by Joe Andolina on 2/6/17.
//  Copyright © 2017 Salesforce UX. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SLDSName.h"

@interface NSString (SLDSName)

+(NSString*)sldsColorName:(NSInteger)colorType;
+(NSString*)sldsFontName:(NSInteger)fontType;
+(NSString*)sldsFontSizeName:(NSInteger)sizeType;
+(NSString*)sldsIconName:(NSInteger)iconType;

@end
