#import <UIKit/UIKit.h>
#import "SLDSIcon.h"

@interface UIImage (SLDSIcon)

+(instancetype)sldsname:(SLDSnameType)iconType;
+(instancetype)sldsbackgroundColor:(SLDSbackgroundColorType)iconType;
+(NSString*)sldsIconName:(NSInteger)iconType;

@end