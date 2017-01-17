#import <UIKit/UIKit.h>
#import "SLDSIcon.h"

@interface UIImage (SLDSIcon)

+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withSize:(CGFloat)size;
+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size;

+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withSize:(CGFloat)size;
+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size;

+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withSize:(CGFloat)size;
+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size;

+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withSize:(CGFloat)size;
+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(CGFloat)size;

+(NSString*)sldsIconName:(NSInteger)iconType;
@end