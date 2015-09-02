/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import <CoreText/CoreText.h>
#import "UIColor+SLDSBackground.h"

#import "UIImage+SLDSIconAction.h"

#import "SLDSFont.h"

@implementation UIImage (SLDSIconAction)

static NSString *const iconFontName = @"SalesforceDesignSystemIconsAction";

static float const iconScale = 0.65f;



+ (NSString *) iconFontNameAction {
    static dispatch_once_t predicate = 0;
    
    dispatch_once(&predicate, ^{
        [SLDSFont loadFontWithName:iconFontName];
    });
    return iconFontName;
}

+(UIImage*)sldsIconAction:(SLDSIconActionType)iconId withColor:(UIColor*)iconColor andBGColor:(UIColor*)bgColor andSize:(short)size{
    
    if (!iconColor) {
        iconColor = [UIColor whiteColor];
    }

    if (!bgColor) {
        bgColor = [SLDSIconAction bgColor:iconId];
    }
    if(!bgColor){
        bgColor = [UIColor sldsBackgroundColor:SLDSColorBackgroundActionbarIconUtility];
    }
    
    CGSize iconSize = CGSizeMake(size,size);
    CGRect textRect = CGRectMake(0,(size-size*iconScale)/2,size,size*iconScale);
    UIGraphicsBeginImageContextWithOptions(iconSize, NO, 0.0f);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, bgColor.CGColor);
    
    UIBezierPath *bg = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size, size) byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(size/10, size/10)];
    
    [bg fill];
    
    NSString *textContent = [SLDSIconAction sldsIconUniCode:iconId];
    
    
    UIFont *font = [UIFont fontWithName:[self iconFontNameAction] size:textRect.size.height];
    
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

+(UIImage*)sldsIconAction:(SLDSIconActionType)iconId withSize:(short)size{
    return [self sldsIconAction:iconId withColor:nil andBGColor:nil andSize:size];
}



@end
