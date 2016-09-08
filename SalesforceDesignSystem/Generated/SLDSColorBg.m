/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSColorBg.h"

#define colorName(enum) [@[\
@"SLDSColorBackground",\
@"SLDSColorBackgroundAlt",\
@"SLDSColorBackgroundAlt2",\
@"SLDSColorBackgroundAltInverse",\
@"SLDSColorBackgroundRowHover",\
@"SLDSColorBackgroundRowActive",\
@"SLDSColorBackgroundRowSelected",\
@"SLDSColorBackgroundRowNew",\
@"SLDSColorBackgroundInverse",\
@"SLDSColorBackgroundAnchor",\
@"SLDSColorBackgroundBrowser",\
@"SLDSColorBackgroundChromeMobile",\
@"SLDSColorBackgroundChromeDesktop",\
@"SLDSColorBackgroundCustomer",\
@"SLDSColorBackgroundHighlight",\
@"SLDSColorBackgroundHighlightSearch",\
@"SLDSColorBackgroundSelection",\
@"SLDSColorBackgroundActionbarIconUtility",\
@"SLDSColorBackgroundIndicatorDot",\
@"SLDSColorBackgroundModal",\
@"SLDSColorBackgroundModalBrand",\
@"SLDSColorBackgroundNotificationBadge",\
@"SLDSColorBackgroundNotificationBadgeHover",\
@"SLDSColorBackgroundNotificationBadgeFocus",\
@"SLDSColorBackgroundNotificationBadgeActive",\
@"SLDSColorBackgroundNotification",\
@"SLDSColorBackgroundNotificationNew",\
@"SLDSColorBackgroundOrgSwitcherArrow",\
@"SLDSColorBackgroundPayload",\
@"SLDSColorBackgroundPost",\
@"SLDSColorBackgroundUtilityBarHover",\
@"SLDSColorBackgroundUtilityBarActive",\
@"SLDSColorBackgroundShade",\
@"SLDSColorBackgroundShadeDark",\
@"SLDSColorBackgroundStencil",\
@"SLDSColorBackgroundStencilAlt",\
@"SLDSColorBackgroundTempModal",\
@"SLDSColorBackgroundTempModalTint",\
@"SLDSColorBackgroundTempModalTintAlt",\
@"SLDSColorBackgroundBackdrop",\
@"SLDSColorBackgroundBackdropTint",\
@"SLDSColorBackgroundScrollbar",\
@"SLDSColorBackgroundScrollbarTrack",\
@"SLDSColorBrand",\
@"SLDSColorBrandDark",\
@"SLDSColorBrandDarker",\
@"SLDSColorBackgroundToggle",\
@"SLDSColorBackgroundToggleDisabled",\
@"SLDSColorBackgroundToggleHover",\
@"SLDSColorBackgroundToggleActive",\
@"SLDSColorBackgroundToggleActiveHover",\
@"SLDSColorBackgroundContextBar",\
@"SLDSColorBackgroundContextBarBrandAccent",\
@"SLDSColorBackgroundContextBarItemHover",\
@"SLDSColorBackgroundContextBarItemActive",\
@"SLDSColorBackgroundContextTabBarItem",\
@"SLDSColorBackgroundContextBarInverseItemHover",\
@"SLDSColorBackgroundContextBarInverseItemActive",\
@"SLDSColorBackgroundContextBarShadow",\
@"SLDSColorBackgroundContextBarActionHighlight",\
@"SLDSColorBackgroundPageHeader",\
@"SLDSColorBackgroundButtonBrand",\
@"SLDSColorBackgroundButtonBrandActive",\
@"SLDSColorBackgroundButtonBrandHover",\
@"SLDSColorBackgroundButtonBrandDisabled",\
@"SLDSColorBackgroundButtonDefault",\
@"SLDSColorBackgroundButtonDefaultHover",\
@"SLDSColorBackgroundButtonDefaultFocus",\
@"SLDSColorBackgroundButtonDefaultActive",\
@"SLDSColorBackgroundButtonDefaultDisabled",\
@"SLDSColorBackgroundButtonIcon",\
@"SLDSColorBackgroundButtonIconHover",\
@"SLDSColorBackgroundButtonIconFocus",\
@"SLDSColorBackgroundButtonIconActive",\
@"SLDSColorBackgroundButtonIconDisabled",\
@"SLDSColorBackgroundButtonInverse",\
@"SLDSColorBackgroundButtonInverseActive",\
@"SLDSColorBackgroundButtonInverseDisabled",\
@"SLDSColorBackgroundModalButton",\
@"SLDSColorBackgroundModalButtonActive",\
@"SLDSColorBackgroundInput",\
@"SLDSColorBackgroundInputActive",\
@"SLDSColorBackgroundInputCheckbox",\
@"SLDSColorBackgroundInputCheckboxDisabled",\
@"SLDSColorBackgroundInputCheckboxSelected",\
@"SLDSColorBackgroundInputDisabled",\
@"SLDSColorBackgroundInputError",\
@"SLDSColorBackgroundInputSearch",\
@"SLDSColorBackgroundPill",\
@"SLDSColorBackgroundImageOverlay",\
@"SLDSColorBackgroundDestructive",\
@"SLDSColorBackgroundDestructiveHover",\
@"SLDSColorBackgroundDestructiveActive",\
@"SLDSColorBackgroundInfo",\
@"SLDSColorBackgroundError",\
@"SLDSColorBackgroundErrorDark",\
@"SLDSColorBackgroundErrorAlt",\
@"SLDSColorBackgroundOffline",\
@"SLDSColorBackgroundSuccess",\
@"SLDSColorBackgroundSuccessDark",\
@"SLDSColorBackgroundToast",\
@"SLDSColorBackgroundToastSuccess",\
@"SLDSColorBackgroundToastError",\
@"SLDSColorBackgroundWarning",\
@"SLDSColorBackgroundIconWaffle" \
] objectAtIndex:enum]


@implementation SLDSColorBg

static int const colorAls[] = {
    SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE_LILAC,
SFDS_ALIAS_BISCAY,
SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_WHITE_LILAC,
SFDS_ALIAS_FOAM,
SFDS_ALIAS_SNOWY_MINT,
SFDS_ALIAS_DEEP_COVE,
SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_TANGERINE,
SFDS_ALIAS_LEMON_CHIFFON,
SFDS_ALIAS_GORSE,
SFDS_ALIAS_PATTEN_BLUE,
SFDS_ALIAS_KASHMIR_BLUE,
SFDS_ALIAS_BISCAY,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_FLUSH_MAHOGANY,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_MIDNIGHT_BLUE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_FOAM,
SFDS_ALIAS_DEEP_COVE,
SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_CATSKILL_WHITE,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_AZURE,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_GEYSER,
SFDS_ALIAS_WHITE_LILAC,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_REGENT_GREY_TRANSPARENT_80,
SFDS_ALIAS_REGENT_GREY_TRANSPARENT_80,
SFDS_ALIAS_WHITE_TRANSPARENT_75,
SFDS_ALIAS_WHITE_TRANSPARENT_75,
SFDS_ALIAS_FOAM_TRANSPARENT_75,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_CADET_BLUE,
SFDS_ALIAS_AZURE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_CASPER,
SFDS_ALIAS_CASPER,
SFDS_ALIAS_REGENT_GREY,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_CERULEAN,
SFDS_ALIAS_CATSKILL_WHITE,
SFDS_ALIAS_CATSKILL_WHITE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE_TRANSPARENT_20,
SFDS_ALIAS_WHITE_TRANSPARENT_40,
SFDS_ALIAS_GRADIENT_SHADOW_BOTTOM,
SFDS_ALIAS_WHITE_TRANSPARENT_20,
SFDS_ALIAS_CATSKILL_WHITE,
SFDS_ALIAS_SCIENCE_BLUE,
SFDS_ALIAS_MIDNIGHT_BLUE,
SFDS_ALIAS_ENDEAVOUR,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_WHITE_LILAC,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_TRANSPARENT,
SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_LINK_WATER,
SFDS_ALIAS_WHITE_LILAC,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_TRANSPARENT,
SFDS_ALIAS_BLACK_TRANSPARENT_24,
SFDS_ALIAS_TRANSPARENT,
SFDS_ALIAS_BLACK_TRANSPARENT_07,
SFDS_ALIAS_BLACK_TRANSPARENT_16,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_GEYSER,
SFDS_ALIAS_AZURE,
SFDS_ALIAS_STEAM,
SFDS_ALIAS_PIPPIN,
SFDS_ALIAS_BLACK_TRANSPARENT_16,
SFDS_ALIAS_WHITE,
SFDS_ALIAS_BLACK_TRANSPARENT_40,
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
SFDS_ALIAS_KOROMIKO,
SFDS_ALIAS_KASHMIR_BLUE
};

+ (UIColor *)sldsColor:(SLDSColorBgType)lmColor{
    return [SLDSColorAlias sldsColor:colorAls[lmColor]];
}

+ (NSString *)sldsColorEnumName:(SLDSColorBgType)color{
    return colorName(color);
}

@end
