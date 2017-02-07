#import <UIKit/UIKit.h>
#ifndef SLDSIcon_h
#define SLDSIcon_h


typedef NS_ENUM(NSInteger, SLDSActionIconType) {
	
	SLDSActionAddContact = 0,
	SLDSActionAddRelationship,
	SLDSActionAnnouncement,
	SLDSActionApex,
	SLDSActionApproval,
	SLDSActionBack,
	SLDSActionCall,
	SLDSActionCanvas,
	SLDSActionChangeOwner,
	SLDSActionChangeRecordType,
	SLDSActionCheck,
	SLDSActionClone,
	SLDSActionClose,
	SLDSActionDefer,
	SLDSActionDelete,
	SLDSActionDescription,
	SLDSActionDialIn,
	SLDSActionDownload,
	SLDSActionEdit,
	SLDSActionEditGroups,
	SLDSActionEditRelationship,
	SLDSActionEmail,
	SLDSActionFallback,
	SLDSActionFilter,
	SLDSActionFlow,
	SLDSActionFollow,
	SLDSActionFollowing,
	SLDSActionFreezeUser,
	SLDSActionGoal,
	SLDSActionGoogleNews,
	SLDSActionInfo,
	SLDSActionJoinGroup,
	SLDSActionLeadConvert,
	SLDSActionLeaveGroup,
	SLDSActionLogACall,
	SLDSActionLogEvent,
	SLDSActionManagePermSets,
	SLDSActionMap,
	SLDSActionMore,
	SLDSActionNew,
	SLDSActionNewAccount,
	SLDSActionNewCampaign,
	SLDSActionNewCase,
	SLDSActionNewChildCase,
	SLDSActionNewContact,
	SLDSActionNewCustom1,
	SLDSActionNewCustom10,
	SLDSActionNewCustom100,
	SLDSActionNewCustom11,
	SLDSActionNewCustom12,
	SLDSActionNewCustom13,
	SLDSActionNewCustom14,
	SLDSActionNewCustom15,
	SLDSActionNewCustom16,
	SLDSActionNewCustom17,
	SLDSActionNewCustom18,
	SLDSActionNewCustom19,
	SLDSActionNewCustom2,
	SLDSActionNewCustom20,
	SLDSActionNewCustom21,
	SLDSActionNewCustom22,
	SLDSActionNewCustom23,
	SLDSActionNewCustom24,
	SLDSActionNewCustom25,
	SLDSActionNewCustom26,
	SLDSActionNewCustom27,
	SLDSActionNewCustom28,
	SLDSActionNewCustom29,
	SLDSActionNewCustom3,
	SLDSActionNewCustom30,
	SLDSActionNewCustom31,
	SLDSActionNewCustom32,
	SLDSActionNewCustom33,
	SLDSActionNewCustom34,
	SLDSActionNewCustom35,
	SLDSActionNewCustom36,
	SLDSActionNewCustom37,
	SLDSActionNewCustom38,
	SLDSActionNewCustom39,
	SLDSActionNewCustom4,
	SLDSActionNewCustom40,
	SLDSActionNewCustom41,
	SLDSActionNewCustom42,
	SLDSActionNewCustom43,
	SLDSActionNewCustom44,
	SLDSActionNewCustom45,
	SLDSActionNewCustom46,
	SLDSActionNewCustom47,
	SLDSActionNewCustom48,
	SLDSActionNewCustom49,
	SLDSActionNewCustom5,
	SLDSActionNewCustom50,
	SLDSActionNewCustom51,
	SLDSActionNewCustom52,
	SLDSActionNewCustom53,
	SLDSActionNewCustom54,
	SLDSActionNewCustom55,
	SLDSActionNewCustom56,
	SLDSActionNewCustom57,
	SLDSActionNewCustom58,
	SLDSActionNewCustom59,
	SLDSActionNewCustom6,
	SLDSActionNewCustom60,
	SLDSActionNewCustom61,
	SLDSActionNewCustom62,
	SLDSActionNewCustom63,
	SLDSActionNewCustom64,
	SLDSActionNewCustom65,
	SLDSActionNewCustom66,
	SLDSActionNewCustom67,
	SLDSActionNewCustom68,
	SLDSActionNewCustom69,
	SLDSActionNewCustom7,
	SLDSActionNewCustom70,
	SLDSActionNewCustom71,
	SLDSActionNewCustom72,
	SLDSActionNewCustom73,
	SLDSActionNewCustom74,
	SLDSActionNewCustom75,
	SLDSActionNewCustom76,
	SLDSActionNewCustom77,
	SLDSActionNewCustom78,
	SLDSActionNewCustom79,
	SLDSActionNewCustom8,
	SLDSActionNewCustom80,
	SLDSActionNewCustom81,
	SLDSActionNewCustom82,
	SLDSActionNewCustom83,
	SLDSActionNewCustom84,
	SLDSActionNewCustom85,
	SLDSActionNewCustom86,
	SLDSActionNewCustom87,
	SLDSActionNewCustom88,
	SLDSActionNewCustom89,
	SLDSActionNewCustom9,
	SLDSActionNewCustom90,
	SLDSActionNewCustom91,
	SLDSActionNewCustom92,
	SLDSActionNewCustom93,
	SLDSActionNewCustom94,
	SLDSActionNewCustom95,
	SLDSActionNewCustom96,
	SLDSActionNewCustom97,
	SLDSActionNewCustom98,
	SLDSActionNewCustom99,
	SLDSActionNewEvent,
	SLDSActionNewGroup,
	SLDSActionNewLead,
	SLDSActionNewNote,
	SLDSActionNewNotebook,
	SLDSActionNewOpportunity,
	SLDSActionNewPersonAccount,
	SLDSActionNewTask,
	SLDSActionPasswordUnlock,
	SLDSActionPreview,
	SLDSActionPriority,
	SLDSActionQuestionPostAction,
	SLDSActionQuote,
	SLDSActionRecord,
	SLDSActionRefresh,
	SLDSActionReject,
	SLDSActionRemove,
	SLDSActionRemoveRelationship,
	SLDSActionResetPassword,
	SLDSActionShare,
	SLDSActionShareFile,
	SLDSActionShareLink,
	SLDSActionSharePoll,
	SLDSActionSharePost,
	SLDSActionShareThanks,
	SLDSActionSort,
	SLDSActionSubmitForApproval,
	SLDSActionUpdate,
	SLDSActionUpdateStatus,
	SLDSActionUpload,
	SLDSActionUser,
	SLDSActionUserActivation,
	SLDSActionViewRelationship,
	SLDSActionWebLink
};
static const NSInteger SLDSActionIconTypeFirst = SLDSActionAddContact;
static const NSInteger SLDSActionIconTypeLast  = SLDSActionWebLink;

//-------------------------------------------------------------------

typedef NS_ENUM(NSInteger, SLDSCustomIconType) {
	
	SLDSCustom1 = SLDSActionWebLink + 1,
	SLDSCustom10,
	SLDSCustom100,
	SLDSCustom101,
	SLDSCustom102,
	SLDSCustom103,
	SLDSCustom104,
	SLDSCustom105,
	SLDSCustom106,
	SLDSCustom107,
	SLDSCustom108,
	SLDSCustom109,
	SLDSCustom11,
	SLDSCustom110,
	SLDSCustom111,
	SLDSCustom112,
	SLDSCustom113,
	SLDSCustom12,
	SLDSCustom13,
	SLDSCustom14,
	SLDSCustom15,
	SLDSCustom16,
	SLDSCustom17,
	SLDSCustom18,
	SLDSCustom19,
	SLDSCustom2,
	SLDSCustom20,
	SLDSCustom21,
	SLDSCustom22,
	SLDSCustom23,
	SLDSCustom24,
	SLDSCustom25,
	SLDSCustom26,
	SLDSCustom27,
	SLDSCustom28,
	SLDSCustom29,
	SLDSCustom3,
	SLDSCustom30,
	SLDSCustom31,
	SLDSCustom32,
	SLDSCustom33,
	SLDSCustom34,
	SLDSCustom35,
	SLDSCustom36,
	SLDSCustom37,
	SLDSCustom38,
	SLDSCustom39,
	SLDSCustom4,
	SLDSCustom40,
	SLDSCustom41,
	SLDSCustom42,
	SLDSCustom43,
	SLDSCustom44,
	SLDSCustom45,
	SLDSCustom46,
	SLDSCustom47,
	SLDSCustom48,
	SLDSCustom49,
	SLDSCustom5,
	SLDSCustom50,
	SLDSCustom51,
	SLDSCustom52,
	SLDSCustom53,
	SLDSCustom54,
	SLDSCustom55,
	SLDSCustom56,
	SLDSCustom57,
	SLDSCustom58,
	SLDSCustom59,
	SLDSCustom6,
	SLDSCustom60,
	SLDSCustom61,
	SLDSCustom62,
	SLDSCustom63,
	SLDSCustom64,
	SLDSCustom65,
	SLDSCustom66,
	SLDSCustom67,
	SLDSCustom68,
	SLDSCustom69,
	SLDSCustom7,
	SLDSCustom70,
	SLDSCustom71,
	SLDSCustom72,
	SLDSCustom73,
	SLDSCustom74,
	SLDSCustom75,
	SLDSCustom76,
	SLDSCustom77,
	SLDSCustom78,
	SLDSCustom79,
	SLDSCustom8,
	SLDSCustom80,
	SLDSCustom81,
	SLDSCustom82,
	SLDSCustom83,
	SLDSCustom84,
	SLDSCustom85,
	SLDSCustom86,
	SLDSCustom87,
	SLDSCustom88,
	SLDSCustom89,
	SLDSCustom9,
	SLDSCustom90,
	SLDSCustom91,
	SLDSCustom92,
	SLDSCustom93,
	SLDSCustom94,
	SLDSCustom95,
	SLDSCustom96,
	SLDSCustom97,
	SLDSCustom98,
	SLDSCustom99
};
static const NSInteger SLDSCustomIconTypeFirst = SLDSCustom1;
static const NSInteger SLDSCustomIconTypeLast  = SLDSCustom99;

//-------------------------------------------------------------------

typedef NS_ENUM(NSInteger, SLDSStandardIconType) {
	
	SLDSStandardAccount = SLDSCustom99 + 1,
	SLDSStandardAddress,
	SLDSStandardAnnouncement,
	SLDSStandardAnswerBest,
	SLDSStandardAnswerPrivate,
	SLDSStandardAnswerPublic,
	SLDSStandardApproval,
	SLDSStandardApps,
	SLDSStandardAppsAdmin,
	SLDSStandardArticle,
	SLDSStandardAssignedResource,
	SLDSStandardAvatar,
	SLDSStandardAvatarLoading,
	SLDSStandardCalibration,
	SLDSStandardCall,
	SLDSStandardCallHistory,
	SLDSStandardCampaign,
	SLDSStandardCampaignMembers,
	SLDSStandardCanvas,
	SLDSStandardCarousel,
	SLDSStandardCase,
	SLDSStandardCaseChangeStatus,
	SLDSStandardCaseComment,
	SLDSStandardCaseEmail,
	SLDSStandardCaseLogACall,
	SLDSStandardCaseTranscript,
	SLDSStandardClient,
	SLDSStandardCoaching,
	SLDSStandardConnectedApps,
	SLDSStandardContact,
	SLDSStandardContract,
	SLDSStandardCustom,
	SLDSStandardCustomNotification,
	SLDSStandardDashboard,
	SLDSStandardDatadotcom,
	SLDSStandardDefault,
	SLDSStandardDocument,
	SLDSStandardDrafts,
	SLDSStandardEmail,
	SLDSStandardEmailChatter,
	SLDSStandardEmpty,
	SLDSStandardEndorsement,
	SLDSStandardEnvironmentHub,
	SLDSStandardEvent,
	SLDSStandardFeed,
	SLDSStandardFeedback,
	SLDSStandardFile,
	SLDSStandardFlow,
	SLDSStandardFolder,
	SLDSStandardForecasts,
	SLDSStandardGenericLoading,
	SLDSStandardGoals,
	SLDSStandardGroupLoading,
	SLDSStandardGroups,
	SLDSStandardHierarchy,
	SLDSStandardHome,
	SLDSStandardHousehold,
	SLDSStandardInsights,
	SLDSStandardInvestmentAccount,
	SLDSStandardLead,
	SLDSStandardLink,
	SLDSStandardLocation,
	SLDSStandardLogACall,
	SLDSStandardMarketingActions,
	SLDSStandardMerge,
	SLDSStandardMetrics,
	SLDSStandardNews,
	SLDSStandardNote,
	SLDSStandardOperatingHours,
	SLDSStandardOpportunity,
	SLDSStandardOrders,
	SLDSStandardPeople,
	SLDSStandardPerformance,
	SLDSStandardPersonAccount,
	SLDSStandardPhoto,
	SLDSStandardPoll,
	SLDSStandardPortal,
	SLDSStandardPost,
	SLDSStandardPricebook,
	SLDSStandardProcess,
	SLDSStandardProduct,
	SLDSStandardProductConsumed,
	SLDSStandardProductItem,
	SLDSStandardProductItemTransaction,
	SLDSStandardProductRequired,
	SLDSStandardProductTransfer,
	SLDSStandardQuestionBest,
	SLDSStandardQuestionFeed,
	SLDSStandardQuotes,
	SLDSStandardRecent,
	SLDSStandardRecord,
	SLDSStandardRelatedList,
	SLDSStandardRelationship,
	SLDSStandardReport,
	SLDSStandardResourceAbsence,
	SLDSStandardResourceCapacity,
	SLDSStandardResourcePreference,
	SLDSStandardResourceSkill,
	SLDSStandardReward,
	SLDSStandardRtcPresence,
	SLDSStandardSalesPath,
	SLDSStandardScanCard,
	SLDSStandardServiceAppointment,
	SLDSStandardServiceContract,
	SLDSStandardServiceReport,
	SLDSStandardServiceResource,
	SLDSStandardServiceTerritory,
	SLDSStandardServiceTerritoryMember,
	SLDSStandardSkill,
	SLDSStandardSkillEntity,
	SLDSStandardSkillRequirement,
	SLDSStandardSocial,
	SLDSStandardSolution,
	SLDSStandardSossession,
	SLDSStandardTask,
	SLDSStandardTask2,
	SLDSStandardTeamMember,
	SLDSStandardThanks,
	SLDSStandardThanksLoading,
	SLDSStandardTimeslot,
	SLDSStandardToday,
	SLDSStandardTopic,
	SLDSStandardUnmatched,
	SLDSStandardUser,
	SLDSStandardWorkOrder,
	SLDSStandardWorkOrderItem,
	SLDSStandardWorkType
};
static const NSInteger SLDSStandardIconTypeFirst = SLDSStandardAccount;
static const NSInteger SLDSStandardIconTypeLast  = SLDSStandardWorkType;

//-------------------------------------------------------------------

typedef NS_ENUM(NSInteger, SLDSUtilityIconType) {
	
	SLDSUtilityAdd = SLDSStandardWorkType + 1,
	SLDSUtilityAdduser,
	SLDSUtilityAnnouncement,
	SLDSUtilityAnswer,
	SLDSUtilityApex,
	SLDSUtilityApproval,
	SLDSUtilityApps,
	SLDSUtilityArrowdown,
	SLDSUtilityArrowup,
	SLDSUtilityAttach,
	SLDSUtilityBack,
	SLDSUtilityBan,
	SLDSUtilityBold,
	SLDSUtilityBookmark,
	SLDSUtilityBreadcrumbs,
	SLDSUtilityBroadcast,
	SLDSUtilityBrush,
	SLDSUtilityBucket,
	SLDSUtilityBuilder,
	SLDSUtilityCall,
	SLDSUtilityCapslock,
	SLDSUtilityCases,
	SLDSUtilityCenterAlignText,
	SLDSUtilityChangeOwner,
	SLDSUtilityChangeRecordType,
	SLDSUtilityChart,
	SLDSUtilityChat,
	SLDSUtilityCheck,
	SLDSUtilityCheckin,
	SLDSUtilityChevrondown,
	SLDSUtilityChevronleft,
	SLDSUtilityChevronright,
	SLDSUtilityChevronup,
	SLDSUtilityClear,
	SLDSUtilityClock,
	SLDSUtilityClose,
	SLDSUtilityComments,
	SLDSUtilityCompany,
	SLDSUtilityConnectedApps,
	SLDSUtilityContract,
	SLDSUtilityContractAlt,
	SLDSUtilityCopy,
	SLDSUtilityCrossfilter,
	SLDSUtilityCustomApps,
	SLDSUtilityCut,
	SLDSUtilityDash,
	SLDSUtilityDatabase,
	SLDSUtilityDatadotcom,
	SLDSUtilityDayview,
	SLDSUtilityDelete,
	SLDSUtilityDeprecate,
	SLDSUtilityDescription,
	SLDSUtilityDesktop,
	SLDSUtilityDislike,
	SLDSUtilityDockPanel,
	SLDSUtilityDown,
	SLDSUtilityDownload,
	SLDSUtilityEdit,
	SLDSUtilityEditForm,
	SLDSUtilityEmail,
	SLDSUtilityEmoji,
	SLDSUtilityEndCall,
	SLDSUtilityErectWindow,
	SLDSUtilityError,
	SLDSUtilityEvent,
	SLDSUtilityExpand,
	SLDSUtilityExpandAlt,
	SLDSUtilityFallback,
	SLDSUtilityFavorite,
	SLDSUtilityFeed,
	SLDSUtilityFile,
	SLDSUtilityFilter,
	SLDSUtilityFilterList,
	SLDSUtilityFlow,
	SLDSUtilityForward,
	SLDSUtilityFrozen,
	SLDSUtilityFullWidthView,
	SLDSUtilityGroups,
	SLDSUtilityHelp,
	SLDSUtilityHome,
	SLDSUtilityIdentity,
	SLDSUtilityImage,
	SLDSUtilityInbox,
	SLDSUtilityInfo,
	SLDSUtilityInfoAlt,
	SLDSUtilityInsertTagField,
	SLDSUtilityInsertTemplate,
	SLDSUtilityItalic,
	SLDSUtilityJumpToBottom,
	SLDSUtilityJumpToTop,
	SLDSUtilityJustifyText,
	SLDSUtilityKanban,
	SLDSUtilityKeyboardDismiss,
	SLDSUtilityKnowledgeBase,
	SLDSUtilityLayers,
	SLDSUtilityLayout,
	SLDSUtilityLeft,
	SLDSUtilityLeftAlignText,
	SLDSUtilityLevelUp,
	SLDSUtilityLightBulb,
	SLDSUtilityLike,
	SLDSUtilityLink,
	SLDSUtilityList,
	SLDSUtilityLocation,
	SLDSUtilityLock,
	SLDSUtilityLogACall,
	SLDSUtilityLogout,
	SLDSUtilityMagicwand,
	SLDSUtilityMarkAllAsRead,
	SLDSUtilityMatrix,
	SLDSUtilityMerge,
	SLDSUtilityMetrics,
	SLDSUtilityMinimizeWindow,
	SLDSUtilityMoneybag,
	SLDSUtilityMonthlyview,
	SLDSUtilityMove,
	SLDSUtilityMuted,
	SLDSUtilityNew,
	SLDSUtilityNewDirectMessage,
	SLDSUtilityNewWindow,
	SLDSUtilityNews,
	SLDSUtilityNote,
	SLDSUtilityNotebook,
	SLDSUtilityNotification,
	SLDSUtilityOffice365,
	SLDSUtilityOffline,
	SLDSUtilityOfflineCached,
	SLDSUtilityOpen,
	SLDSUtilityOpenFolder,
	SLDSUtilityOpenedFolder,
	SLDSUtilityOverflow,
	SLDSUtilityPackage,
	SLDSUtilityPackageOrg,
	SLDSUtilityPackageOrgBeta,
	SLDSUtilityPage,
	SLDSUtilityPalette,
	SLDSUtilityPaste,
	SLDSUtilityPeople,
	SLDSUtilityPhoneLandscape,
	SLDSUtilityPhonePortrait,
	SLDSUtilityPhoto,
	SLDSUtilityPicklist,
	SLDSUtilityPower,
	SLDSUtilityPreview,
	SLDSUtilityPriority,
	SLDSUtilityProcess,
	SLDSUtilityPush,
	SLDSUtilityPuzzle,
	SLDSUtilityQuestion,
	SLDSUtilityQuestionsAndAnswers,
	SLDSUtilityQuotationMarks,
	SLDSUtilityRecord,
	SLDSUtilityRecordCreate,
	SLDSUtilityRedo,
	SLDSUtilityRefresh,
	SLDSUtilityRelate,
	SLDSUtilityRemoveFormatting,
	SLDSUtilityRemoveLink,
	SLDSUtilityReplace,
	SLDSUtilityReply,
	SLDSUtilityReplyAll,
	SLDSUtilityResetPassword,
	SLDSUtilityResourceAbsence,
	SLDSUtilityResourceCapacity,
	SLDSUtilityResourceTerritory,
	SLDSUtilityRetweet,
	SLDSUtilityRichtextbulletedlist,
	SLDSUtilityRichtextindent,
	SLDSUtilityRichtextnumberedlist,
	SLDSUtilityRichtextoutdent,
	SLDSUtilityRight,
	SLDSUtilityRightAlignText,
	SLDSUtilityRotate,
	SLDSUtilityRows,
	SLDSUtilitySalesforce1,
	SLDSUtilitySearch,
	SLDSUtilitySettings,
	SLDSUtilitySetup,
	SLDSUtilitySetupAssistantGuide,
	SLDSUtilityShare,
	SLDSUtilityShareMobile,
	SLDSUtilitySharePost,
	SLDSUtilityShield,
	SLDSUtilitySideList,
	SLDSUtilitySignpost,
	SLDSUtilitySms,
	SLDSUtilitySnippet,
	SLDSUtilitySocialshare,
	SLDSUtilitySort,
	SLDSUtilitySpinner,
	SLDSUtilityStandardObjects,
	SLDSUtilityStop,
	SLDSUtilityStrikethrough,
	SLDSUtilitySuccess,
	SLDSUtilitySummary,
	SLDSUtilitySummarydetail,
	SLDSUtilitySwitch,
	SLDSUtilitySync,
	SLDSUtilityTable,
	SLDSUtilityTabletLandscape,
	SLDSUtilityTabletPortrait,
	SLDSUtilityTabset,
	SLDSUtilityTask,
	SLDSUtilityTextBackgroundColor,
	SLDSUtilityTextColor,
	SLDSUtilityThreedots,
	SLDSUtilityThreedotsVertical,
	SLDSUtilityThunder,
	SLDSUtilityTileCardList,
	SLDSUtilityTopic,
	SLDSUtilityTouchAction,
	SLDSUtilityTrail,
	SLDSUtilityTrending,
	SLDSUtilityTurnOffNotifications,
	SLDSUtilityTypeTool,
	SLDSUtilityUndelete,
	SLDSUtilityUndeprecate,
	SLDSUtilityUnderline,
	SLDSUtilityUndo,
	SLDSUtilityUnlock,
	SLDSUtilityUnmuted,
	SLDSUtilityUp,
	SLDSUtilityUpload,
	SLDSUtilityUser,
	SLDSUtilityUserRole,
	SLDSUtilityVideo,
	SLDSUtilityVolumeHigh,
	SLDSUtilityVolumeLow,
	SLDSUtilityVolumeOff,
	SLDSUtilityWarning,
	SLDSUtilityWeeklyview,
	SLDSUtilityWifi,
	SLDSUtilityWorkOrderType,
	SLDSUtilityWorld,
	SLDSUtilityYubiKey,
	SLDSUtilityZoomin,
	SLDSUtilityZoomout
};
static const NSInteger SLDSUtilityIconTypeFirst = SLDSUtilityAdd;
static const NSInteger SLDSUtilityIconTypeLast  = SLDSUtilityZoomout;

//-------------------------------------------------------------------

static float const sldsIconBackgroundColors[][3] = { 
	{0.63,0.58,0.93},
	{0.38,0.72,0.93},
	{1,0.56,0.38},
	{0.41,0.43,0.44},
	{0,0.78,0.72},
	{0.05,0.76,0.85},
	{0.12,0.79,0.63},
	{0.51,0.6,0.69},
	{0.33,0.41,0.55},
	{0.33,0.41,0.55},
	{0.33,0.41,0.55},
	{0.42,0.63,0.91},
	{0.94,0.43,0.39},
	{0.94,0.49,0.68},
	{0.9,0.44,0.49},
	{0.49,0.76,0.49},
	{0.55,0.6,0.89},
	{0.33,0.41,0.55},
	{0.11,0.8,0.75},
	{0.2,0.75,0.8},
	{0.11,0.8,0.75},
	{0.58,0.68,0.77},
	{0.6,0.58,0.93},
	{0.99,0.56,0.71},
	{0,0.47,0.74},
	{0.19,0.73,0.97},
	{0.49,0.81,0.39},
	{0.33,0.41,0.55},
	{0.34,0.67,0.87},
	{0.96,0.4,0.36},
	{0.33,0.41,0.55},
	{0.47,0.62,0.95},
	{0.97,0.54,0.38},
	{0.95,0.62,0.35},
	{0.28,0.76,0.8},
	{0.42,0.63,0.91},
	{0.33,0.41,0.55},
	{0.46,0.78,0.93},
	{0.38,0.72,0.93},
	{0.2,0.74,0.91},
	{0.5,0.55,0.88},
	{0.96,0.59,0.34},
	{0.95,0.81,0.36},
	{0.98,0.59,0.36},
	{0.63,0.58,0.93},
	{1,0.48,0.52},
	{0.39,0.53,0.89},
	{0.88,0.36,0.46},
	{0.53,0.52,0.92},
	{0.86,0.44,0.82},
	{0.87,0.38,0.52},
	{0.24,0.76,0.7},
	{0.97,0.49,0.46},
	{0.91,0.69,0.4},
	{0.67,0.83,0.38},
	{0.3,0.79,0.46},
	{0.23,0.75,0.69},
	{0.81,0.82,0.36},
	{0.28,0.78,0.78},
	{0.54,0.48,0.93},
	{0.55,0.52,0.98},
	{0.69,0.44,0.9},
	{0.9,0.4,0.6},
	{0.89,0.44,0.75},
	{0.46,0.6,0.94},
	{0.35,0.69,0.82},
	{0.54,0.75,0.35},
	{0.74,0.82,0.37},
	{0.93,0.71,0.42},
	{0.96,0.62,0.44},
	{0.92,0.41,0.5},
	{0.22,0.76,0.58},
	{0.59,0.81,0.36},
	{0.84,0.54,0.42},
	{0.91,0.39,0.49},
	{0.83,0.45,0.83},
	{0.55,0.54,0.95},
	{0.33,0.71,0.84},
	{0.31,0.75,0.46},
	{0.88,0.85,0.32},
	{0.51,0.78,0.37},
	{0.26,0.71,0.71},
	{0.81,0.82,0.36},
	{0.5,0.58,0.98},
	{0.78,0.79,0.35},
	{0.85,0.35,0.47},
	{0.4,0.65,0.91},
	{0.37,0.8,0.39},
	{0.94,0.41,0.5},
	{0.89,0.36,0.5},
	{0.62,0.86,0.4},
	{0.29,0.74,0.83},
	{0.85,0.78,0.38},
	{0.93,0.56,0.44},
	{0.95,0.43,0.51},
	{0.92,0.44,0.69},
	{0.84,0.43,0.88},
	{0.44,0.55,0.92},
	{0.35,0.61,0.87},
	{0.2,0.71,0.62},
	{0.89,0.82,0.4},
	{0.33,0.77,0.45},
	{0.75,0.35,0.53},
	{0.96,0.45,0.46},
	{0.42,0.57,0.86},
	{0.49,0.81,0.38},
	{0.38,0.56,0.85},
	{0.95,0.47,0.67},
	{0.85,0.75,0.37},
	{0.97,0.49,0.46},
	{0.95,0.41,0.47},
	{0.93,0.39,0.53},
	{0.42,0.54,0.9},
	{0.91,0.41,0.71},
	{0.89,0.43,0.89},
	{0.55,0.61,0.98},
	{0.4,0.62,0.94},
	{0.25,0.78,0.63},
	{0.8,0.62,0.4},
	{0.86,0.43,0.48},
	{0.71,0.36,0.36},
	{0.35,0.58,0.87},
	{0.56,0.83,0.39},
	{0.31,0.81,0.73},
	{0.4,0.6,0.84},
	{0.85,0.38,0.5},
	{0.82,0.36,0.59},
	{0.91,0.5,0.44},
	{0.96,0.44,0.48},
	{0.95,0.41,0.57},
	{0.89,0.38,0.67},
	{0.85,0.46,0.9},
	{0.6,0.44,0.9},
	{0.24,0.6,0.75},
	{0.42,0.62,0.89},
	{0.13,0.64,0.54},
	{0.75,0.48,0.4},
	{0.32,0.49,0.51},
	{0.56,0.3,0.3},
	{0.26,0.61,0.73},
	{0.55,0.81,0.42},
	{0.43,0.62,0.89},
	{0.87,0.38,0.52},
	{0.88,0.75,0.36},
	{0.94,0.52,0.43},
	{0.92,0.44,0.57},
	{0.51,0.71,1},
	{0.97,0.54,0.38},
	{0.9,0.83,0.47},
	{0.9,0.83,0.47},
	{0.99,0.73,0.36},
	{0.5,0.55,0.88},
	{0.29,0.75,0.46},
	{0.33,0.41,0.55},
	{0.5,0.55,0.88},
	{0.98,0.71,0.22},
	{0.2,0.69,0.36},
	{0.53,0.78,0.32},
	{0.49,0.76,0.49},
	{0.33,0.41,0.55},
	{0,0.78,0.72},
	{0.33,0.41,0.55},
	{0.94,0.43,0.39},
	{0.33,0.41,0.55},
	{0.33,0.41,0.55},
	{0.73,0.67,0.58},
	{0.48,0.6,0.9},
	{0.41,0.61,0.88},
	{0.4,0.79,0.89},
	{0.91,0.41,0.43},
	{0.98,0.73,0.65},
	{0.31,0.8,0.48},
	{0.51,0.71,0.84},
	{0.12,0.78,0.75},
	{0.33,0.41,0.55},
	{0.4,0.79,0.89},
	{0.33,0.41,0.55},
	{0.24,0.59,0.87},
	{0.34,0.67,0.87},
	{1,0.48,0.52},
	{0.39,0.53,0.89},
	{0.88,0.36,0.46},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.53,0.52,0.92},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.95,0.55,0},
	{0.86,0.44,0.82},
	{0.87,0.38,0.52},
	{0.24,0.76,0.7},
	{0.97,0.49,0.46},
	{0.91,0.69,0.4},
	{0.67,0.83,0.38},
	{0.3,0.79,0.46},
	{0.23,0.75,0.69},
	{0.81,0.82,0.36},
	{0.28,0.78,0.78},
	{0.54,0.48,0.93},
	{0.55,0.52,0.98},
	{0.69,0.44,0.9},
	{0.9,0.4,0.6},
	{0.89,0.44,0.75},
	{0.46,0.6,0.94},
	{0.35,0.69,0.82},
	{0.54,0.75,0.35},
	{0.74,0.82,0.37},
	{0.93,0.71,0.42},
	{0.96,0.62,0.44},
	{0.92,0.41,0.5},
	{0.22,0.76,0.58},
	{0.59,0.81,0.36},
	{0.84,0.54,0.42},
	{0.91,0.39,0.49},
	{0.83,0.45,0.83},
	{0.55,0.54,0.95},
	{0.33,0.71,0.84},
	{0.31,0.75,0.46},
	{0.88,0.85,0.32},
	{0.51,0.78,0.37},
	{0.26,0.71,0.71},
	{0.81,0.82,0.36},
	{0.5,0.58,0.98},
	{0.78,0.79,0.35},
	{0.85,0.35,0.47},
	{0.4,0.65,0.91},
	{0.37,0.8,0.39},
	{0.94,0.41,0.5},
	{0.89,0.36,0.5},
	{0.62,0.86,0.4},
	{0.29,0.74,0.83},
	{0.85,0.78,0.38},
	{0.93,0.56,0.44},
	{0.95,0.43,0.51},
	{0.92,0.44,0.69},
	{0.84,0.43,0.88},
	{0.44,0.55,0.92},
	{0.35,0.61,0.87},
	{0.2,0.71,0.62},
	{0.89,0.82,0.4},
	{0.33,0.77,0.45},
	{0.75,0.35,0.53},
	{0.96,0.45,0.46},
	{0.42,0.57,0.86},
	{0.49,0.81,0.38},
	{0.38,0.56,0.85},
	{0.95,0.47,0.67},
	{0.85,0.75,0.37},
	{0.97,0.49,0.46},
	{0.95,0.41,0.47},
	{0.93,0.39,0.53},
	{0.42,0.54,0.9},
	{0.91,0.41,0.71},
	{0.89,0.43,0.89},
	{0.55,0.61,0.98},
	{0.4,0.62,0.94},
	{0.25,0.78,0.63},
	{0.8,0.62,0.4},
	{0.86,0.43,0.48},
	{0.71,0.36,0.36},
	{0.35,0.58,0.87},
	{0.56,0.83,0.39},
	{0.31,0.81,0.73},
	{0.4,0.6,0.84},
	{0.85,0.38,0.5},
	{0.82,0.36,0.59},
	{0.91,0.5,0.44},
	{0.96,0.44,0.48},
	{0.95,0.41,0.57},
	{0.89,0.38,0.67},
	{0.85,0.46,0.9},
	{0.6,0.44,0.9},
	{0.24,0.6,0.75},
	{0.42,0.62,0.89},
	{0.13,0.64,0.54},
	{0.75,0.48,0.4},
	{0.32,0.49,0.51},
	{0.56,0.3,0.3},
	{0.26,0.61,0.73},
	{0.55,0.81,0.42},
	{0.43,0.62,0.89},
	{0.87,0.38,0.52},
	{0.88,0.75,0.36},
	{0.94,0.52,0.43},
	{0.5,0.55,0.88},
	{0.29,0.75,0.46},
	{0.38,0.72,0.93},
	{0.95,0.81,0.36},
	{0.95,0.81,0.36},
	{0.95,0.81,0.36},
	{0.31,0.8,0.48},
	{0.24,0.59,0.87},
	{0.6,0.58,0.93},
	{0.95,0.81,0.36},
	{0.27,0.76,0.45},
	{0.38,0.72,0.93},
	{0.72,0.76,0.81},
	{0.28,0.81,0.82},
	{0.95,0.81,0.36},
	{0.95,0.81,0.36},
	{0.96,0.59,0.34},
	{0.96,0.59,0.34},
	{0.51,0.6,0.69},
	{0.42,0.74,0.43},
	{0.95,0.81,0.36},
	{0.95,0.81,0.36},
	{0.95,0.81,0.36},
	{0.95,0.81,0.36},
	{0.95,0.81,0.36},
	{0.95,0.81,0.36},
	{0,0.82,0.75},
	{0.96,0.46,0.58},
	{0.6,0.58,0.93},
	{0.63,0.58,0.93},
	{0.43,0.75,0.43},
	{0.51,0.6,0.69},
	{0.42,0.72,0.89},
	{0.94,0.43,0.39},
	{0.08,0.54,0.93},
	{0.51,0.6,0.69},
	{0.73,0.67,0.58},
	{0.42,0.63,0.91},
	{0.58,0.68,0.77},
	{0.95,0.81,0.36},
	{0.51,0.6,0.69},
	{0.55,0.6,0.89},
	{0.33,0.41,0.55},
	{0.92,0.44,0.57},
	{0.38,0.72,0.93},
	{0.43,0.63,0.92},
	{0.73,0.67,0.58},
	{0.33,0.41,0.55},
	{0.55,0.6,0.89},
	{0.42,0.74,0.43},
	{0.72,0.76,0.81},
	{0.34,0.67,0.87},
	{0.72,0.76,0.81},
	{0.47,0.62,0.95},
	{0.2,0.75,0.8},
	{0.94,0.49,0.68},
	{0,0.69,0.63},
	{0.93,0.58,0.93},
	{0.29,0.75,0.46},
	{0.97,0.54,0.38},
	{0.48,0.6,0.9},
	{0.29,0.75,0.46},
	{0.28,0.76,0.8},
	{0.42,0.74,0.43},
	{0.95,0.81,0.36},
	{0.34,0.67,0.87},
	{0.5,0.55,0.88},
	{0.9,0.83,0.47},
	{0.42,0.62,0.89},
	{0.99,0.73,0.36},
	{0.46,0.62,0.85},
	{0.2,0.75,0.8},
	{0.97,0.69,0.34},
	{0.5,0.55,0.88},
	{0.84,0.82,0.82},
	{0.41,0.61,0.88},
	{0.68,0.78,0.44},
	{0.4,0.79,0.89},
	{0.72,0.51,0.83},
	{0.33,0.41,0.55},
	{0.72,0.51,0.83},
	{0.33,0.74,0.61},
	{0.46,0.62,0.85},
	{0.97,0.54,0.38},
	{0.94,0.43,0.39},
	{0.97,0.54,0.38},
	{0.95,0.81,0.36},
	{0.95,0.81,0.36},
	{0.53,0.78,0.32},
	{0.42,0.63,0.91},
	{0.49,0.76,0.49},
	{0.35,0.74,0.67},
	{0.24,0.59,0.87},
	{0.18,0.8,0.75},
	{0.27,0.76,0.45},
	{0.27,0.76,0.45},
	{0.27,0.76,0.45},
	{0.27,0.76,0.45},
	{0.91,0.41,0.43},
	{0.28,0.81,0.82},
	{0.16,0.45,0.62},
	{0.95,0.62,0.35},
	{0.49,0.55,0.89},
	{0.54,0.46,0.94},
	{0.49,0.55,0.89},
	{0.49,0.55,0.89},
	{0.49,0.55,0.89},
	{0.49,0.55,0.89},
	{0.98,0.59,0.36},
	{0.55,0.6,0.89},
	{0.98,0.59,0.36},
	{0.92,0.45,0.64},
	{0.56,0.79,0.45},
	{0.33,0.41,0.55},
	{0.29,0.75,0.46},
	{0.29,0.75,0.46},
	{0.95,0.81,0.36},
	{0.91,0.41,0.43},
	{0.72,0.76,0.81},
	{0.98,0.7,0.3},
	{0.94,0.49,0.68},
	{0.34,0.67,0.87},
	{0.38,0.72,0.93},
	{0.2,0.75,0.8},
	{0.31,0.89,0.76},
	{0.2,0.66,0.86},
	{0.33,0.41,0.55},
};

#endif /* SLDSIcon_h */