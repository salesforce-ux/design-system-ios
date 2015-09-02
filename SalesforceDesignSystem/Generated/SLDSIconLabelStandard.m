/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SLDSIconLabelStandard.h"

#define iconName(enum) [@[\
@"SLDSIconStandardAccount",\
@"SLDSIconStandardAnnouncement",\
@"SLDSIconStandardAnswerBest",\
@"SLDSIconStandardAnswerPrivate",\
@"SLDSIconStandardAnswerPublic",\
@"SLDSIconStandardApproval",\
@"SLDSIconStandardApps",\
@"SLDSIconStandardAppsAdmin",\
@"SLDSIconStandardArticle",\
@"SLDSIconStandardAvatar",\
@"SLDSIconStandardAvatarLoading",\
@"SLDSIconStandardCalibration",\
@"SLDSIconStandardCall",\
@"SLDSIconStandardCallHistory",\
@"SLDSIconStandardCampaign",\
@"SLDSIconStandardCampaignMembers",\
@"SLDSIconStandardCanvas",\
@"SLDSIconStandardCase",\
@"SLDSIconStandardCaseChangeStatus",\
@"SLDSIconStandardCaseComment",\
@"SLDSIconStandardCaseEmail",\
@"SLDSIconStandardCaseLogACall",\
@"SLDSIconStandardCaseTranscript",\
@"SLDSIconStandardCoaching",\
@"SLDSIconStandardConcur",\
@"SLDSIconStandardConnectedApps",\
@"SLDSIconStandardContact",\
@"SLDSIconStandardContract",\
@"SLDSIconStandardCustom",\
@"SLDSIconStandardDashboard",\
@"SLDSIconStandardDbcompany",\
@"SLDSIconStandardDefault",\
@"SLDSIconStandardDocument",\
@"SLDSIconStandardDrafts",\
@"SLDSIconStandardDropbox",\
@"SLDSIconStandardEmail",\
@"SLDSIconStandardEmailChatter",\
@"SLDSIconStandardEmpty",\
@"SLDSIconStandardEndorsement",\
@"SLDSIconStandardEvent",\
@"SLDSIconStandardEvernote",\
@"SLDSIconStandardFeed",\
@"SLDSIconStandardFeedback",\
@"SLDSIconStandardFile",\
@"SLDSIconStandardGenericLoading",\
@"SLDSIconStandardGoals",\
@"SLDSIconStandardGroupLoading",\
@"SLDSIconStandardGroups",\
@"SLDSIconStandardInsights",\
@"SLDSIconStandardLead",\
@"SLDSIconStandardLink",\
@"SLDSIconStandardLogACall",\
@"SLDSIconStandardMarketingActions",\
@"SLDSIconStandardMarketingResources",\
@"SLDSIconStandardMetrics",\
@"SLDSIconStandardNews",\
@"SLDSIconStandardNote",\
@"SLDSIconStandardOpportunity",\
@"SLDSIconStandardOrders",\
@"SLDSIconStandardPeople",\
@"SLDSIconStandardPerformance",\
@"SLDSIconStandardPhoto",\
@"SLDSIconStandardPoll",\
@"SLDSIconStandardPortal",\
@"SLDSIconStandardPost",\
@"SLDSIconStandardPricebook",\
@"SLDSIconStandardProcess",\
@"SLDSIconStandardProduct",\
@"SLDSIconStandardQuestionBest",\
@"SLDSIconStandardQuestionFeed",\
@"SLDSIconStandardQuotes",\
@"SLDSIconStandardRecent",\
@"SLDSIconStandardRecord",\
@"SLDSIconStandardRelatedList",\
@"SLDSIconStandardReport",\
@"SLDSIconStandardReward",\
@"SLDSIconStandardScanCard",\
@"SLDSIconStandardSkillEntity",\
@"SLDSIconStandardSocial",\
@"SLDSIconStandardSolution",\
@"SLDSIconStandardSossession",\
@"SLDSIconStandardTask",\
@"SLDSIconStandardTask2",\
@"SLDSIconStandardTeamMember",\
@"SLDSIconStandardThanks",\
@"SLDSIconStandardThanksLoading",\
@"SLDSIconStandardToday",\
@"SLDSIconStandardTopic",\
@"SLDSIconStandardUnmatched",\
@"SLDSIconStandardUser" \
] objectAtIndex:enum]

@implementation SLDSIconLabelStandard

+ (NSString *)sldsIconName:(SLDSIconStandardType)icon{
    return iconName(icon);
}

@end
