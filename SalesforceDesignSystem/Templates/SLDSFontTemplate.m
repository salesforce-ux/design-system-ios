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

+(NSInteger)sldsFontSize:(SLDSFontSizeType)sizeType {
    NSArray *arr = @[
/*SLDS_FONT_SIZE_VALUES*/
                     ];
    return [[arr objectAtIndex:sizeType] integerValue];
}

+(NSString*)sldsFontSizeName:(SLDSFontSizeType)sizeType {
    NSArray *arr = @[
/*SLDS_FONT_SIZE_CASES*/
                     ];
    return (NSString *)[arr objectAtIndex:sizeType];
}

+(NSString*)sldsFontFileName:(SLDSFontType) fontType {
    NSArray *arr = @[
                     @"SalesforceSans-Regular",
                     @"SalesforceSans-Italic",
                     @"SalesforceSans-Bold",
                     @"SalesforceSans-BoldItalic",
                     @"SalesforceSans-Light",
                     @"SalesforceSans-LightItalic",
                     @"SalesforceSans-Thin",
                     @"SalesforceSans-ThinItalic",
                     ];
    return (NSString *)[arr objectAtIndex:fontType];
}

+(NSString*)sldsFontTypeName:(SLDSFontType) fontType {
    NSArray *arr = @[
                     @"SLDSFontTypeRegular",
                     @"SLDSFontTypeItalic",
                     @"SLDSFontTypeBold",
                     @"SLDSFontTypeBoldItalic",
                     @"SLDSFontTypeLight",
                     @"SLDSFontTypeLightItalic",
                     @"SLDSFontTypeThin",
                     @"SLDSFontTypeThinItalic",
                     ];
    return (NSString *)[arr objectAtIndex:fontType];
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

+(UIFont*)sldsFont:(SLDSFontType)fontType withSize:(SLDSFontSizeType)fontSize
{
    NSInteger fontSizeValue = [SLDSFont sldsFontSize:fontSize];
    NSString *fontFileName = [self sldsFontFileName:fontType];
    
    // NOTE : Returns early if the font is already loaded
    [self loadFontWithName:fontFileName];
    
    // NOTE : Fonts (even custom) are automatically cached.
    return [UIFont fontWithName:fontFileName size:fontSizeValue];
}

// NOTE : Deprecated --------------------------------------------------------------

+(UIFont *) sldsFontRegularWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeRegular withSize:fontSize];
}

+(UIFont *) sldsFontItalicWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeItalic withSize:fontSize];
}

+(UIFont *) sldsFontLightWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeLight withSize:fontSize];
}

+(UIFont *) sldsFontStrongWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeBold withSize:fontSize];
}

+(UIFont *) sldsFontThinWithSize:(SLDSFontSizeType)fontSize{
    return [self sldsFont:SLDSFontTypeThin withSize:fontSize];
}

@end