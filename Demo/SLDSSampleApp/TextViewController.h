//
//  ColorViewController.h
//  LMIconImage
//
//  Created by Ivan Bogdanov on 5/27/15.
//  Copyright (c) 2015 Ivan Bogdanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SalesforceDesignSystem/SalesforceDesignSystem.h>
#import "TextListViewController.h"

typedef NS_ENUM(NSInteger, SLDS_FONT_FAMILY) {
    SLDS_FONT_FAMILY_BODY,
    SLDS_FONT_FAMILY_ITALIC,
    SLDS_FONT_FAMILY_LIGHT,
    SLDS_FONT_FAMILY_STRONG,
    SLDS_FONT_FAMILY_THIN
};

@interface TextViewController : UIViewController
@property SLDS_FONT_FAMILY fontWeight;
@property SLDSFontSizeType fontSize;
@end
