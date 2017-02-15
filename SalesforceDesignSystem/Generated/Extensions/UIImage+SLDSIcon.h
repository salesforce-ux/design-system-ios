// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

#import <UIKit/UIKit.h>
#import "SLDSIcon.h"

@interface UIImage (SLDSIcon)

+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withSize:(CGFloat)size;
+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andSize:(CGFloat)size;
+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size;

+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withSize:(CGFloat)size;
+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andSize:(CGFloat)size;
+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size;

+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withSize:(CGFloat)size;
+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withColor:(UIColor*)iconColor andSize:(CGFloat)size;
+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size;

+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withSize:(CGFloat)size;
+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withColor:(UIColor*)iconColor andSize:(CGFloat)size;
+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size;

@end