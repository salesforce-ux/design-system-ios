/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import <CoreText/CoreText.h>
#import "UIImage+SLDSIconUtility.h"
#import "UIColor+SLDSBackground.h"

#import "SLDSFont.h"


@implementation UIImage (SLDSIconUtility)

static NSString *const fontName = @"SalesforceDesignSystemIconsUtility";




+ (NSString *) fontNameUtility {
    static dispatch_once_t predicate = 0;
    
    dispatch_once(&predicate, ^{
        [SLDSFont loadFontWithName:fontName];
    });
    return fontName;
}

+(UIImage*)sldsIconUtility:(SLDSIconUtilType)iconId withColor:(UIColor*)iconColor andSize:(short)size{

    if (!iconColor) {
        iconColor = [UIColor sldsBackgroundColor:SLDSColorBackgroundActionbarIconUtility];
    }
    CGRect textRect = CGRectZero;
    textRect.size = CGSizeMake(size,size);
    UIGraphicsBeginImageContextWithOptions(textRect.size, NO, 0.0f);
    
    NSString *textContent = [SLDSIconUtility sldsIconUniCode:iconId];
    
    
    UIFont *font = [UIFont fontWithName:[self fontNameUtility] size:size];
    
    [iconColor setFill];

    static NSParagraphStyle * paragraphStyle = nil;

    static dispatch_once_t predicate_static = 0;
    dispatch_once(&predicate_static, ^{
        NSMutableParagraphStyle * pStyle =
        [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [pStyle setAlignment:NSTextAlignmentCenter];
        paragraphStyle = [pStyle copy];
    });

    if(font){
        [textContent drawInRect:textRect withAttributes:@{NSFontAttributeName : font,
                                                          NSForegroundColorAttributeName : iconColor,
                                                          NSParagraphStyleAttributeName:paragraphStyle
                                                          }];
    }
    
    UIImage * icon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return icon;
}

+(UIImage*)sldsIconUtility:(SLDSIconUtilType)iconId withSize:(short)size{
    return [self sldsIconUtility:iconId withColor:nil andSize:size];
}


@end