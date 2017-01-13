#import <UIKit/UIKit.h>
#import "SLDSIcon.h"

@interface UIImage (SLDSIcon)

+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withSize:(short)size;
+(instancetype)sldsActionIcon:(SLDSActionIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size;

+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withSize:(short)size;
+(instancetype)sldsStandardIcon:(SLDSStandardIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size;

+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withSize:(short)size;
+(instancetype)sldsCustomIcon:(SLDSCustomIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size;

+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withSize:(short)size;
+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size;

+(NSString*)sldsIconName:(NSInteger)iconType;
@end