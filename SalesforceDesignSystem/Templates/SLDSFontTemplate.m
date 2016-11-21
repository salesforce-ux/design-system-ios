/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSFontTemplate.h"

#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>


@implementation SLDSFontTemplate

+(NSString*)sldsFontStyleName:(SLDSFontStyle)fontStyle
{
    NSMutableString *fontStyleName = [[NSMutableString alloc] initWithString:@"SalesforceSans-"];
    
    switch(fontStyle) {
        case SLDSFontStyleItalic : [fontStyleName appendString:@"Italic"];
            break;
        case SLDSFontStyleBold : [fontStyleName appendString:@"Bold"];
            break;
        case SLDSFontStyleBoldItalic : [fontStyleName appendString:@"BoldItalic"];
            break;
        case SLDSFontStyleLight : [fontStyleName appendString:@"Light"];
            break;
        case SLDSFontStyleLightItalic : [fontStyleName appendString:@"LightItalic"];
            break;
        case SLDSFontStyleThin : [fontStyleName appendString:@"Thin"];
            break;
        case SLDSFontStyleThinItalic : [fontStyleName appendString:@"ThinItalic"];
            break;
        default: [fontStyleName appendString:@"Regular"];
    }
    
    return fontStyleName;
}

+(void) loadFontWithName:(NSString *)fontName {
    if ([UIFont fontWithName:fontName size:10]) {
        return;
    }
    NSURL *bundleURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"SalesforceDesignSystem" withExtension:@"bundle"];
    if(!bundleURL){
        return;
    }
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    NSURL *fontURL = [bundle URLForResource:fontName withExtension:@"ttf"];
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

+(UIFont *) sldsFont:(SLDSFontStyle)fontStyle withSize:(SLDSFontSizeType)fontSize
{
    NSInteger fontSizeValue = [SLDSFontSz sldsFontSize:fontSize];
    NSString *fontStyleName = [self sldsFontStyleName:fontStyle];
    
    // NOTE : Returns early if the font is already loaded
    [self loadFontWithName:fontStyleName];
    
    return [UIFont fontWithName:fontStyleName size:fontSizeValue];
}

+(UIFont *) sldsFontRegularWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontStyleRegular withSize:fontSize];
}

+(UIFont *) sldsFontItalicWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontStyleItalic withSize:fontSize];
}

+(UIFont *) sldsFontLightWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontStyleLight withSize:fontSize];
}

+(UIFont *) sldsFontStrongWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontStyleBold withSize:fontSize];
}

+(UIFont *) sldsFontThinWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontStyleThin withSize:fontSize];
}

@end
