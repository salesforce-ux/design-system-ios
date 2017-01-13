#import <UIKit/UIKit.h>
#import "SLDSIcon.h"

@interface UIImage (SLDSIcon)

+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withSize:(short)size;
+(instancetype)sldsUtilityIcon:(SLDSUtilityIconType)iconType withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size;

+(NSString*)sldsIconName:(NSInteger)iconType;
//+(UIColor*)sldsIconBackgroundColor:(NSInteger)iconType;
@end