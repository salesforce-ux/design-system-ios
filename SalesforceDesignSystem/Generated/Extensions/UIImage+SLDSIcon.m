#import "UIColor+SLDIcon.h"

@implementation UIImage (SLDIcon)


+(instancetype)sldsname:(SLDSnameType)iconType{
    return [SLDSIcon sldsname:iconType];
}
+(instancetype)sldsbackgroundColor:(SLDSbackgroundColorType)iconType{
    return [SLDSIcon sldsbackgroundColor:iconType];
}

+(NSString*)sldsIconName:(NSInteger)iconType {
    return [SLDSIcon sldsIconName:iconType];
}
@end