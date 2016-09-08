/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSColorBrdr.h"

#define colorName(enum) [@[\
@"SLDSColorBorder",\
@"SLDSColorBorderBrand",\
@"SLDSColorBorderBrandDark",\
@"SLDSColorBorderCustomer",\
@"SLDSColorBorderDestructive",\
@"SLDSColorBorderDestructiveHover",\
@"SLDSColorBorderDestructiveActive",\
@"SLDSColorBorderInfo",\
@"SLDSColorBorderError",\
@"SLDSColorBorderErrorAlt",\
@"SLDSColorBorderErrorDark",\
@"SLDSColorBorderOffline",\
@"SLDSColorBorderSuccess",\
@"SLDSColorBorderSuccessDark",\
@"SLDSColorBorderWarning",\
@"SLDSColorBorderInverse",\
@"SLDSColorBorderTabSelected",\
@"SLDSColorBorderSeparator",\
@"SLDSColorBorderSeparatorAlt",\
@"SLDSColorBorderSeparatorAlt2",\
@"SLDSColorBorderSeparatorInverse",\
@"SLDSColorBorderRowSelected",\
@"SLDSColorBorderRowSelectedHover",\
@"SLDSColorBorderHint",\
@"SLDSColorBorderSelection",\
@"SLDSColorBorderSelectionHover",\
@"SLDSColorBorderSelectionActive",\
@"SLDSColorBorderCanvasElementSelection",\
@"SLDSColorBorderCanvasElementSelectionHover",\
@"SLDSColorBorderContextBarDivider",\
@"SLDSColorBorderContextBarItem",\
@"SLDSColorBorderContextBarInverseItem",\
@"SLDSColorBorderContextBarThemeDefault",\
@"SLDSColorBorderContextBarThemeDefaultAlt",\
@"SLDSColorBorderContextBarThemeDefaultHover",\
@"SLDSColorBorderContextBarThemeDefaultActive",\
@"SLDSColorBorderIconInverseHint",\
@"SLDSColorBorderIconInverseHintHover",\
@"SLDSColorBorderButtonBrand",\
@"SLDSColorBorderButtonBrandDisabled",\
@"SLDSColorBorderButtonDefault",\
@"SLDSColorBorderButtonInverseDisabled",\
@"SLDSColorBorderInput",\
@"SLDSColorBorderInputActive",\
@"SLDSColorBorderInputDisabled",\
@"SLDSColorBorderInputCheckboxSelectedCheckmark" \
] objectAtIndex:enum]


@implementation SLDSColorBrdr

static int const colorAls[] = {
    SFDS_ALIAS_GEYSER,
SFDS_ALIAS_AZURE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_TANGERINE,
SFDS_ALIAS_FLUSH_MAHOGANY,
SFDS_ALIAS_TABASCO,
SFDS_ALIAS_MAROON,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_FLUSH_MAHOGANY,
SFDS_ALIAS_DEEP_BLUSH,
SFDS_ALIAS_DEEP_BLUSH,
SFDS_ALIAS_TUNDORA,
SFDS_ALIAS_EMERALD,
SFDS_ALIAS_SALEM,
SFDS_ALIAS_KOROMIKO,
SFDS_ALIAS_DEEP_COVE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_GEYSER,
SFDS_ALIAS_CADET_BLUE,
SFDS_ALIAS_SAN_JUAN,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_AZURE,
SFDS_ALIAS_SAN_JUAN,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_AZURE,
SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_MALIBU,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_WHITE_TRANSPARENT_20,
SFDS_ALIAS_BLACK_TRANSPARENT_20,
SFDS_ALIAS_WHITE_TRANSPARENT_20,
SFDS_ALIAS_CERULEAN,
SFDS_ALIAS_MYSTIC,
SFDS_ALIAS_TOREA_BAY,
SFDS_ALIAS_MYSTIC,
SFDS_ALIAS_WHITE_TRANSPARENT_50,
SFDS_ALIAS_WHITE_TRANSPARENT_75,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_TRANSPARENT,
SFDS_ALIAS_GEYSER,
SFDS_ALIAS_WHITE_TRANSPARENT_15,
SFDS_ALIAS_GEYSER,
SFDS_ALIAS_AZURE,
SFDS_ALIAS_CADET_BLUE,
SFDS_ALIAS_WHITE
};

+ (UIColor *)sldsColor:(SLDSColorBorderType)lmColor{
    return [SLDSColorAlias sldsColor:colorAls[lmColor]];
}

+ (NSString *)sldsColorEnumName:(SLDSColorBorderType)color{
    return colorName(color);
}

@end