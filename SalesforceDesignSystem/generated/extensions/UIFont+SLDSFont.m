#import "UIFont+SLDSFont.h"

#define kSLDSFontBundleName @"SalesforceDesignSystem"
#define contains(str1, str2) ([str1 rangeOfString: str2 ].location != NSNotFound)

@implementation UIFont (SLDSFont)

+(NSMutableArray*) sldsFontOverrides
{
    static NSMutableArray* fontOverrides = nil;
    if (fontOverrides == nil)
    {
        fontOverrides = [[NSMutableArray alloc] init];
        [self sldsUseDefaultFonts];
    }
    return fontOverrides;
}

+(instancetype)sldsFont:(SLDSFontType)fontType withSize:(SLDSFontSizeType)fontSize
{
    NSInteger fontSizeValue = [SLDSFont sldsFontSize:fontSize];
    NSString *fontFileName = [SLDSFont sldsFontFileName:fontType];
    NSString *bundleName = kSLDSFontBundleName;
    NSArray *override = [[self sldsFontOverrides] objectAtIndex:(NSUInteger)fontType];

    if(override)
    {
        fontFileName = override[0];
        bundleName = override[1];
    }

    [UIFont loadFont:fontFileName fromBundle:bundleName];

    // NOTE : Fonts (even custom) are automatically cached.
    NSArray *fontParts = [fontFileName componentsSeparatedByString:@"."];
    return [UIFont fontWithName:fontParts[0] size:fontSizeValue];
}

+(void)sldsUseDefaultFonts {
    bool loopFlag = true;
    NSString *fontFileName;
    NSUInteger fontType = 0;
    NSMutableArray* overrides = [self sldsFontOverrides];
    [overrides removeAllObjects];

    do {
        @try {
            fontFileName = [SLDSFont sldsFontFileName:(SLDSFontType)fontType];
            [overrides insertObject:@[fontFileName,kSLDSFontBundleName] atIndex:(NSUInteger)fontType];
            fontType++;
        }
        @catch (NSException * e) {
            loopFlag = false;
        }
    }
    while(loopFlag);
}

+(void)sldsUseDefaultFontFor:(SLDSFontType)fontType {
    NSString *fontFileName = [SLDSFont sldsFontFileName:(SLDSFontType)fontType];
    [self sldsUseFont:fontFileName fromBundle:kSLDSFontBundleName forType:fontType];
}

+(void)sldsUseFont:(NSString *)fontFileName fromBundle:(NSString*)bundleName forType:(SLDSFontType)fontType {
    [[self sldsFontOverrides] replaceObjectAtIndex:(NSUInteger)fontType withObject:@[fontFileName,bundleName]];
}

+(void) loadFont:(NSString *)fontFileName fromBundle:(NSString *)bundleName {

    // NOTE : Defaulting to .ttf in case no extension is provided.
    // NOTE : Used for backward compatibility of icons.
    if(!contains(fontFileName, @".")) {
        fontFileName = [fontFileName stringByAppendingString:@".ttf"];
    }

    NSArray *fontParts = [fontFileName componentsSeparatedByString:@"."];

    if ([UIFont fontWithName:fontParts[0] size:10]) {
        return;
    }

    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    if(!bundleURL){
        return;
    }

    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    NSURL *fontURL = [bundle URLForResource:fontParts[0] withExtension:fontParts[1]];
    NSData *fontData = [NSData dataWithContentsOfURL:fontURL];

    CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)fontData);
    CGFontRef font = CGFontCreateWithDataProvider(provider);

    if (font) {
        CFErrorRef error = NULL;
        if (CTFontManagerRegisterGraphicsFont(font, &error) == NO) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:(__bridge NSString *)errorDescription userInfo:@{ NSUnderlyingErrorKey: (__bridge NSError *)error }];
        }

        CFRelease(font);
    }

    CFRelease(provider);
}

// NOTE : Deprecated --------------------------------------------------------------
+(instancetype) sldsFontRegularWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeRegular withSize:fontSize];
}

+(instancetype) sldsFontItalicWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeItalic withSize:fontSize];
}

+(instancetype) sldsFontLightWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeLight withSize:fontSize];
}

+(instancetype) sldsFontStrongWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeBold withSize:fontSize];
}

+(instancetype) sldsFontThinWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeThin withSize:fontSize];
}

@end