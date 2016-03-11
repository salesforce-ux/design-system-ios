/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSColorMsg.h"

#define colorName(enum) [@[\
@"SLDSColorMsgBackgroundDestructive",\
@"SLDSColorMsgBackgroundDestructiveHover",\
@"SLDSColorMsgBackgroundDestructiveActive",\
@"SLDSColorMsgBackgroundInfo",\
@"SLDSColorMsgBackgroundError",\
@"SLDSColorMsgBackgroundErrorDark",\
@"SLDSColorMsgBackgroundErrorAlt",\
@"SLDSColorMsgBackgroundOffline",\
@"SLDSColorMsgBackgroundSuccess",\
@"SLDSColorMsgBackgroundSuccessDark",\
@"SLDSColorMsgBackgroundToast",\
@"SLDSColorMsgBackgroundToastSuccess",\
@"SLDSColorMsgBackgroundToastError",\
@"SLDSColorMsgBackgroundWarning" \
] objectAtIndex:enum]


@implementation SLDSColorMsg

static int const colorAls[] = {
    SFDS_ALIAS_FLUSH_MAHOGANY,
SFDS_ALIAS_TABASCO,
SFDS_ALIAS_MAROON,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_VALENCIA,
SFDS_ALIAS_FLUSH_MAHOGANY,
SFDS_ALIAS_DEEP_BLUSH,
SFDS_ALIAS_TUNDORA,
SFDS_ALIAS_EMERALD,
SFDS_ALIAS_SALEM,
SFDS_ALIAS_KASHMIR_BLUE_TRANSPARENT_95,
SFDS_ALIAS_SALEM_TRANSPARENT_95,
SFDS_ALIAS_FLUSH_MAHOGANY_TRANSPARENT_95,
SFDS_ALIAS_KOROMIKO
};

+ (UIColor *)sldsColor:(SLDSColorMsgType)lmColor{
    return [SLDSColorAlias sldsColor:colorAls[lmColor]];
}

+ (NSString *)sldsColorEnumName:(SLDSColorMsgType)color{
    return colorName(color);
}

@end