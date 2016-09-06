/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSColorTxt.h"

#define colorName(enum) [@[\
@"SLDSColorTextActionLabel",\
@"SLDSColorTextActionLabelActive",\
@"SLDSColorTextBrand",\
@"SLDSColorTextBrowser",\
@"SLDSColorTextBrowserActive",\
@"SLDSColorTextCustomer",\
@"SLDSColorTextDefault",\
@"SLDSColorTextError",\
@"SLDSColorTextInputDisabled",\
@"SLDSColorTextInputFocusInverse",\
@"SLDSColorTextInputIcon",\
@"SLDSColorTextInverse",\
@"SLDSColorTextInverseWeak",\
@"SLDSColorTextInverseActive",\
@"SLDSColorTextInverseHover",\
@"SLDSColorTextLink",\
@"SLDSColorTextLinkActive",\
@"SLDSColorTextLinkDisabled",\
@"SLDSColorTextLinkFocus",\
@"SLDSColorTextLinkHover",\
@"SLDSColorTextLinkInverse",\
@"SLDSColorTextLinkInverseHover",\
@"SLDSColorTextLinkInverseActive",\
@"SLDSColorTextLinkInverseDisabled",\
@"SLDSColorTextModal",\
@"SLDSColorTextModalButton",\
@"SLDSColorTextStageLeft",\
@"SLDSColorTextTabLabel",\
@"SLDSColorTextTabLabelSelected",\
@"SLDSColorTextTabLabelHover",\
@"SLDSColorTextTabLabelFocus",\
@"SLDSColorTextTabLabelActive",\
@"SLDSColorTextTabLabelDisabled",\
@"SLDSColorTextToast",\
@"SLDSColorTextWarning",\
@"SLDSColorTextWarningAlt",\
@"SLDSColorTextWeak",\
@"SLDSColorTextIconBrand",\
@"SLDSColorTextIconUtility",\
@"SLDSColorTextToggleDisabled",\
@"SLDSColorTextContextBar",\
@"SLDSColorTextContextBarInverse",\
@"SLDSColorTextContextBarActionTrigger",\
@"SLDSColorTextButtonBrand",\
@"SLDSColorTextButtonBrandHover",\
@"SLDSColorTextButtonBrandActive",\
@"SLDSColorTextButtonBrandDisabled",\
@"SLDSColorTextButtonDefault",\
@"SLDSColorTextButtonDefaultHover",\
@"SLDSColorTextButtonDefaultActive",\
@"SLDSColorTextButtonDefaultDisabled",\
@"SLDSColorTextButtonDefaultHint",\
@"SLDSColorTextButtonInverse",\
@"SLDSColorTextButtonInverseDisabled",\
@"SLDSColorTextIconDefault",\
@"SLDSColorTextIconDefaultHint",\
@"SLDSColorTextIconInverseHint",\
@"SLDSColorTextIconDefaultHintBorderless",\
@"SLDSColorTextIconDefaultHover",\
@"SLDSColorTextIconDefaultActive",\
@"SLDSColorTextIconDefaultDisabled",\
@"SLDSColorTextIconInverse",\
@"SLDSColorTextIconInverseHover",\
@"SLDSColorTextIconInverseActive",\
@"SLDSColorTextIconInverseDisabled",\
@"SLDSColorTextIconInverseHintHover",\
@"SLDSColorTextLabel",\
@"SLDSColorTextPlaceholder",\
@"SLDSColorTextPlaceholderInverse",\
@"SLDSColorTextRequired",\
@"SLDSColorTextPill",\
@"SLDSColorTextSuccess" \
] objectAtIndex:enum]


@implementation SLDSColorTxt

static int const colorAls[] = {
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_BISCAY,
SFDS_ALIAS_AZURE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_BLACK_TRANSPARENT_40,
SFDS_ALIAS_TANGERINE,
SFDS_ALIAS_BISCAY,
SFDS_ALIAS_FLUSH_MAHOGANY,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_BISCAY,
SFDS_ALIAS_CASPER,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_CASPER,
SFDS_ALIAS_MALIBU,
SFDS_ALIAS_CASPER,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_MIDNIGHT_BLUE,
SFDS_ALIAS_BISCAY,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE_TRANSPARENT_75,
SFDS_ALIAS_WHITE_TRANSPARENT_50,
SFDS_ALIAS_WHITE_TRANSPARENT_15,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_BISCAY,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_MIDNIGHT_BLUE,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_KOROMIKO,
SFDS_ALIAS_CINNAMON,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_HIT_GREY,
SFDS_ALIAS_GEYSER,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE_TRANSPARENT_40,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_GEYSER,
SFDS_ALIAS_CASPER,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_WHITE_TRANSPARENT_15,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_CASPER,
SFDS_ALIAS_WHITE_TRANSPARENT_50,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_MIDNIGHT_BLUE,
SFDS_ALIAS_GEYSER,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE_TRANSPARENT_15,
SFDS_ALIAS_WHITE_TRANSPARENT_75,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_FLUSH_MAHOGANY,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_FUN_GREEN
};

+ (UIColor *)sldsColor:(SLDSColorTextType)lmColor{
    return [SLDSColorAlias sldsColor:colorAls[lmColor]];
}

+ (NSString *)sldsColorEnumName:(SLDSColorTextType)color{
    return colorName(color);
}

@end
