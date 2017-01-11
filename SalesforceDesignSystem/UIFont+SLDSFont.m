/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
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
    NSInteger fontSizeValue = sldsFontSizes(fontSize);//  [SLDSFont sldsFontSize:fontSize];
    NSString *fontFileName = sldsFontFileNames(fontType);// [SLDSFont sldsFontFileName:fontType];
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
            fontFileName = sldsFontFileNames(fontType);//[SLDSFont sldsFontFileName:(SLDSFontType)fontType];
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
    NSString *fontFileName = sldsFontFileNames(fontType);//[SLDSFont sldsFontFileName:(SLDSFontType)fontType];
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
