#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "event_scripts.h"
#include "field_player_avatar.h"
#include "help_system.h"
#include "item.h"
#include "link.h"
#include "overworld.h"
#include "pokedex.h"
#include "quest_log.h"
#include "save.h"
#include "save_location.h"
#include "strings.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/songs.h"

#define HELP_NONE  0
#define HELP_END   0xFF

// Help Main Topics
enum HelpSystemTopics
{
    TOPIC_WHAT_TO_DO,
    TOPIC_HOW_TO_DO,
    TOPIC_TERMS,
    TOPIC_ABOUT_GAME,
    TOPIC_TYPE_MATCHUP,
    TOPIC_EXIT,
    TOPIC_COUNT
};

static EWRAM_DATA u16 sHelpSystemContextId = 0;
static EWRAM_DATA u8 sSeenHelpSystemIntro = 0;

struct HelpSystemState
{
    // 0: Top level
    // 1: Submenu
    // 2: Help content
    u8 level;

    // enum HelpSystemTopics
    u8 topic;

    // Where the player's cursor was at top level
    u8 scrollMain;

    // Where the player's cursor was at submenu
    u8 scrollSub;
};

COMMON_DATA struct HelpSystemState gHelpSystemState = {0};
COMMON_DATA u16 gHelpContextIdBackup = 0;

static bool32 IsCurrentMapInArray(const u16 * mapIdxs);
static void BuildMainTopicsListAndMoveToH00(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
static void SetHelpSystemSubmenuItems(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
static bool8 HelpSystem_ShouldShowBasicTerms(void);
static bool8 IsHelpSystemSubmenuEnabled(u8);
static bool8 HasGottenAtLeastOneHM(void);

static void PrintWelcomeMessageOnPanel1(void);
static void PrintTextOnPanel2Row52RightAlign(const u8 *);
static void ResetHelpSystemCursor(struct HelpSystemListMenu * a0);
static void PrintHelpSystemTopicMouseoverDescription(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);

static const u8 *const sHelpSystemTopicPtrs[TOPIC_COUNT] = {
    [TOPIC_WHAT_TO_DO]   = Help_Text_WhatShouldIDo,
    [TOPIC_HOW_TO_DO]    = Help_Text_HowDoIDoThis,
    [TOPIC_TERMS]        = Help_Text_WhatDoesThisTermMean,
    [TOPIC_ABOUT_GAME]   = Help_Text_AboutThisGame,
    [TOPIC_TYPE_MATCHUP] = Help_Text_TypeMatchupList,
    [TOPIC_EXIT]         = Help_Text_Exit
};

static const u8 *const sHelpSystemTopicMouseoverDescriptionPtrs[TOPIC_COUNT] = {
    [TOPIC_WHAT_TO_DO]   = Help_Text_DescWhatShouldIDo,
    [TOPIC_HOW_TO_DO]    = Help_Text_DescHowDoIDoThis,
    [TOPIC_TERMS]        = Help_Text_DescWhatDoesThisTermMean,
    [TOPIC_ABOUT_GAME]   = Help_Text_DescAboutThisGame,
    [TOPIC_TYPE_MATCHUP] = Help_Text_DescTypeMatchupList,
    [TOPIC_EXIT]         = Help_Text_DescExit
};

// Submenu IDs for TOPIC_WHAT_TO_DO
enum
{
    HELP_PLAYING_FOR_FIRST_TIME = 1,
    HELP_WHAT_SHOULD_I_BE_DOING,
    HELP_CANT_GET_OUT_OF_ROOM,
    HELP_CANT_FIND_PERSON_I_WANT,
    HELP_TALKED_TO_EVERYONE_NOW_WHAT,
    HELP_SOMEONE_BLOCKING_MY_WAY,
    HELP_I_CANT_GO_ON,
    HELP_OUT_OF_THINGS_TO_DO,
    HELP_WHAT_HAPPENED_TO_ITEM_I_GOT,
    HELP_WHAT_ARE_MY_ADVENTURE_BASICS,
    HELP_HOW_ARE_ROADS_FORESTS_DIFFERENT,
    HELP_HOW_ARE_CAVES_DIFFERENT,
    HELP_HOW_DO_I_PROGRESS,
    HELP_WHEN_CAN_I_USE_ITEM,
    HELP_WHATS_A_BATTLE,
    HELP_HOW_DO_I_PREPARE_FOR_BATTLE,
    HELP_WHAT_IS_A_MONS_VITALITY,
    HELP_MY_MONS_ARE_HURT,
    HELP_WHAT_IS_STATUS_PROBLEM,
    HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT,
    HELP_CANT_CATCH_MONS,
    HELP_RAN_OUT_OF_POTIONS,
    HELP_CAN_I_BUY_POKEBALLS,
    HELP_WHATS_A_TRAINER,
    HELP_HOW_DO_I_WIN_AGAINST_TRAINER,
    HELP_WHERE_DO_MONS_APPEAR,
    HELP_WHAT_ARE_MOVES,
    HELP_WHAT_ARE_HIDDEN_MOVES,
    HELP_WHAT_MOVES_SHOULD_I_USE,
    HELP_WANT_TO_ADD_MORE_MOVES,
    HELP_WANT_TO_MAKE_MON_STRONGER,
    HELP_FOE_MONS_TOO_STRONG,
    HELP_WHAT_DO_I_DO_IN_CAVE,
    HELP_NOTHING_I_WANT_TO_KNOW,
    HELP_WHATS_POKEMON_CENTER,
    HELP_WHATS_POKEMON_MART,
    HELP_WANT_TO_END_GAME,
    HELP_WHATS_A_MON,
    HELP_WHAT_IS_THAT_PERSON_LIKE,
    HELP_WHAT_DOES_HIDDEN_MOVE_DO,
    HELP_WHAT_DO_I_DO_IN_SAFARI,
    HELP_WHAT_ARE_SAFARI_RULES,
    HELP_WANT_TO_END_SAFARI,
    HELP_WHAT_IS_A_GYM,
};

static const u8 *const sHelpSystemSpecializedQuestionTextPtrs[] = {
    [HELP_NONE]                              = NULL,
    [HELP_PLAYING_FOR_FIRST_TIME]            = Help_Text_PlayingForFirstTime,
    [HELP_WHAT_SHOULD_I_BE_DOING]            = Help_Text_WhatShouldIBeDoing,
    [HELP_CANT_GET_OUT_OF_ROOM]              = Help_Text_CantGetOutOfRoom,
    [HELP_CANT_FIND_PERSON_I_WANT]           = Help_Text_CantFindPersonIWant,
    [HELP_TALKED_TO_EVERYONE_NOW_WHAT]       = Help_Text_TalkedToEveryoneNowWhat,
    [HELP_SOMEONE_BLOCKING_MY_WAY]           = Help_Text_SomeoneBlockingMyWay,
    [HELP_I_CANT_GO_ON]                      = Help_Text_ICantGoOn,
    [HELP_OUT_OF_THINGS_TO_DO]               = Help_Text_OutOfThingsToDo,
    [HELP_WHAT_HAPPENED_TO_ITEM_I_GOT]       = Help_Text_WhatHappenedToItemIGot,
    [HELP_WHAT_ARE_MY_ADVENTURE_BASICS]      = Help_Text_WhatAreMyAdventureBasics,
    [HELP_HOW_ARE_ROADS_FORESTS_DIFFERENT]   = Help_Text_HowAreRoadsForestsDifferent,
    [HELP_HOW_ARE_CAVES_DIFFERENT]           = Help_Text_HowAreCavesDifferent,
    [HELP_HOW_DO_I_PROGRESS]                 = Help_Text_HowDoIProgress,
    [HELP_WHEN_CAN_I_USE_ITEM]               = Help_Text_WhenCanIUseItem,
    [HELP_WHATS_A_BATTLE]                    = Help_Text_WhatsABattle,
    [HELP_HOW_DO_I_PREPARE_FOR_BATTLE]       = Help_Text_HowDoIPrepareForBattle,
    [HELP_WHAT_IS_A_MONS_VITALITY]           = Help_Text_WhatIsAMonsVitality,
    [HELP_MY_MONS_ARE_HURT]                  = Help_Text_MyMonsAreHurt,
    [HELP_WHAT_IS_STATUS_PROBLEM]            = Help_Text_WhatIsStatusProblem,
    [HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT] = Help_Text_WhatHappensIfAllMyMonsFaint,
    [HELP_CANT_CATCH_MONS]                   = Help_Text_CantCatchMons,
    [HELP_RAN_OUT_OF_POTIONS]                = Help_Text_RanOutOfPotions,
    [HELP_CAN_I_BUY_POKEBALLS]               = Help_Text_CanIBuyPokeBalls,
    [HELP_WHATS_A_TRAINER]                   = Help_Text_WhatsATrainer,
    [HELP_HOW_DO_I_WIN_AGAINST_TRAINER]      = Help_Text_HowDoIWinAgainstTrainer,
    [HELP_WHERE_DO_MONS_APPEAR]              = Help_Text_WhereDoMonsAppear,
    [HELP_WHAT_ARE_MOVES]                    = Help_Text_WhatAreMoves,
    [HELP_WHAT_ARE_HIDDEN_MOVES]             = Help_Text_WhatAreHiddenMoves,
    [HELP_WHAT_MOVES_SHOULD_I_USE]           = Help_Text_WhatMovesShouldIUse,
    [HELP_WANT_TO_ADD_MORE_MOVES]            = Help_Text_WantToAddMoreMoves,
    [HELP_WANT_TO_MAKE_MON_STRONGER]         = Help_Text_WantToMakeMonStronger,
    [HELP_FOE_MONS_TOO_STRONG]               = Help_Text_FoeMonsTooStrong,
    [HELP_WHAT_DO_I_DO_IN_CAVE]              = Help_Text_WhatDoIDoInCave,
    [HELP_NOTHING_I_WANT_TO_KNOW]            = Help_Text_NothingIWantToKnow,
    [HELP_WHATS_POKEMON_CENTER]              = Help_Text_WhatsPokemonCenter,
    [HELP_WHATS_POKEMON_MART]                = Help_Text_WhatsPokemonMart,
    [HELP_WANT_TO_END_GAME]                  = Help_Text_WantToEndGame,
    [HELP_WHATS_A_MON]                       = Help_Text_WhatsAMon,
    [HELP_WHAT_IS_THAT_PERSON_LIKE]          = Help_Text_WhatIsThatPersonLike,
    [HELP_WHAT_DOES_HIDDEN_MOVE_DO]          = Help_Text_WhatDoesHiddenMoveDo,
    [HELP_WHAT_DO_I_DO_IN_SAFARI]            = Help_Text_WhatDoIDoInSafari,
    [HELP_WHAT_ARE_SAFARI_RULES]             = Help_Text_WhatAreSafariRules,
    [HELP_WANT_TO_END_SAFARI]                = Help_Text_WantToEndSafari,
    [HELP_WHAT_IS_A_GYM]                     = Help_Text_WhatIsAGym
};

static const u8 *const sHelpSystemSpecializedAnswerTextPtrs[] = {
    [HELP_NONE]                              = NULL,
    [HELP_PLAYING_FOR_FIRST_TIME]            = Help_Text_AnswerPlayingForFirstTime,
    [HELP_WHAT_SHOULD_I_BE_DOING]            = Help_Text_AnswerWhatShouldIBeDoing,
    [HELP_CANT_GET_OUT_OF_ROOM]              = Help_Text_AnswerCantGetOutOfRoom,
    [HELP_CANT_FIND_PERSON_I_WANT]           = Help_Text_AnswerCantFindPersonIWant,
    [HELP_TALKED_TO_EVERYONE_NOW_WHAT]       = Help_Text_AnswerTalkedToEveryoneNowWhat,
    [HELP_SOMEONE_BLOCKING_MY_WAY]           = Help_Text_AnswerSomeoneBlockingMyWay,
    [HELP_I_CANT_GO_ON]                      = Help_Text_AnswerICantGoOn,
    [HELP_OUT_OF_THINGS_TO_DO]               = Help_Text_AnswerOutOfThingsToDo,
    [HELP_WHAT_HAPPENED_TO_ITEM_I_GOT]       = Help_Text_AnswerWhatHappenedToItemIGot,
    [HELP_WHAT_ARE_MY_ADVENTURE_BASICS]      = Help_Text_AnswerWhatAreMyAdventureBasics,
    [HELP_HOW_ARE_ROADS_FORESTS_DIFFERENT]   = Help_Text_AnswerHowAreRoadsForestsDifferent,
    [HELP_HOW_ARE_CAVES_DIFFERENT]           = Help_Text_AnswerHowAreCavesDifferent,
    [HELP_HOW_DO_I_PROGRESS]                 = Help_Text_AnswerHowDoIProgress,
    [HELP_WHEN_CAN_I_USE_ITEM]               = Help_Text_AnswerWhenCanIUseItem,
    [HELP_WHATS_A_BATTLE]                    = Help_Text_AnswerWhatsABattle,
    [HELP_HOW_DO_I_PREPARE_FOR_BATTLE]       = Help_Text_AnswerHowDoIPrepareForBattle,
    [HELP_WHAT_IS_A_MONS_VITALITY]           = Help_Text_AnswerWhatIsAMonsVitality,
    [HELP_MY_MONS_ARE_HURT]                  = Help_Text_AnswerMyMonsAreHurt,
    [HELP_WHAT_IS_STATUS_PROBLEM]            = Help_Text_AnswerWhatIsStatusProblem,
    [HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT] = Help_Text_AnswerWhatHappensIfAllMyMonsFaint,
    [HELP_CANT_CATCH_MONS]                   = Help_Text_AnswerCantCatchMons,
    [HELP_RAN_OUT_OF_POTIONS]                = Help_Text_AnswerRanOutOfPotions,
    [HELP_CAN_I_BUY_POKEBALLS]               = Help_Text_AnswerCanIBuyPokeBalls,
    [HELP_WHATS_A_TRAINER]                   = Help_Text_AnswerWhatsATrainer,
    [HELP_HOW_DO_I_WIN_AGAINST_TRAINER]      = Help_Text_AnswerHowDoIWinAgainstTrainer,
    [HELP_WHERE_DO_MONS_APPEAR]              = Help_Text_AnswerWhereDoMonsAppear,
    [HELP_WHAT_ARE_MOVES]                    = Help_Text_AnswerWhatAreMoves,
    [HELP_WHAT_ARE_HIDDEN_MOVES]             = Help_Text_AnswerWhatAreHiddenMoves,
    [HELP_WHAT_MOVES_SHOULD_I_USE]           = Help_Text_AnswerWhatMovesShouldIUse,
    [HELP_WANT_TO_ADD_MORE_MOVES]            = Help_Text_AnswerWantToAddMoreMoves,
    [HELP_WANT_TO_MAKE_MON_STRONGER]         = Help_Text_AnswerWantToMakeMonStronger,
    [HELP_FOE_MONS_TOO_STRONG]               = Help_Text_AnswerFoeMonsTooStrong,
    [HELP_WHAT_DO_I_DO_IN_CAVE]              = Help_Text_AnswerWhatDoIDoInCave,
    [HELP_NOTHING_I_WANT_TO_KNOW]            = Help_Text_AnswerNothingIWantToKnow,
    [HELP_WHATS_POKEMON_CENTER]              = Help_Text_AnswerWhatsPokemonCenter,
    [HELP_WHATS_POKEMON_MART]                = Help_Text_AnswerWhatsPokemonMart,
    [HELP_WANT_TO_END_GAME]                  = Help_Text_AnswerWantToEndGame,
    [HELP_WHATS_A_MON]                       = Help_Text_AnswerWhatsAMon,
    [HELP_WHAT_IS_THAT_PERSON_LIKE]          = Help_Text_AnswerWhatIsThatPersonLike,
    [HELP_WHAT_DOES_HIDDEN_MOVE_DO]          = Help_Text_AnswerWhatDoesHiddenMoveDo,
    [HELP_WHAT_DO_I_DO_IN_SAFARI]            = Help_Text_AnswerWhatDoIDoInSafari,
    [HELP_WHAT_ARE_SAFARI_RULES]             = Help_Text_AnswerWhatAreSafariRules,
    [HELP_WANT_TO_END_SAFARI]                = Help_Text_AnswerWantToEndSafari,
    [HELP_WHAT_IS_A_GYM]                     = Help_Text_AnswerWhatIsAGym
};

// Submenu IDs for TOPIC_HOW_TO_DO
enum
{
    HELP_USING_POKEDEX = 1,
    HELP_USING_POKEMON,
    HELP_USING_SUMMARY,
    HELP_USING_SWITCH,
    HELP_USING_ITEM,
    HELP_USING_BAG,
    HELP_USING_AN_ITEM,
    HELP_USING_KEYITEM,
    HELP_USING_POKEBALL,
    HELP_USING_PLAYER,
    HELP_USING_SAVE,
    HELP_USING_OPTION,
    HELP_USING_POTION,
    HELP_USING_TOWN_MAP,
    HELP_USING_TM,
    HELP_USING_HM,
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE,
    HELP_RIDING_BICYCLE,
    HELP_ENTERING_NAME,
    HELP_USING_PC,
    HELP_USING_BILLS_PC,
    HELP_USING_WITHDRAW,
    HELP_USING_DEPOSIT,
    HELP_USING_MOVE,
    HELP_MOVING_ITEMS,
    HELP_USING_PLAYERS_PC,
    HELP_USING_WITHDRAW_ITEM,
    HELP_USING_DEPOSIT_ITEM,
    HELP_USING_MAILBOX,
    HELP_USING_PROF_OAKS_PC,
    HELP_OPENING_MENU,
    HELP_USING_FIGHT,
    HELP_USING_POKEMON2,
    HELP_USING_SHIFT,
    HELP_USING_SUMMARY2,
    HELP_USING_BAG2,
    HELP_READING_POKEDEX,
    HELP_USING_HOME_PC,
    HELP_USING_ITEM_STORAGE,
    HELP_USING_WITHDRAW_ITEM2,
    HELP_USING_DEPOSIT_ITEM2,
    HELP_USING_MAILBOX2,
    HELP_USING_RUN,
    HELP_REGISTER_KEY_ITEM,
    HELP_USING_BALL,
    HELP_USING_BAIT,
    HELP_USING_ROCK,
    HELP_USING_HALL_OF_FAME,
};

static const u8 *const sHelpSystemMenuTopicTextPtrs[] = {
    [HELP_NONE]                         = NULL,
    [HELP_USING_POKEDEX]                = Help_Text_UsingPokedex,
    [HELP_USING_POKEMON]                = Help_Text_UsingPokemon,
    [HELP_USING_SUMMARY]                = Help_Text_UsingSummary,
    [HELP_USING_SWITCH]                 = Help_Text_UsingSwitch,
    [HELP_USING_ITEM]                   = Help_Text_UsingItem,
    [HELP_USING_BAG]                    = Help_Text_UsingBag,
    [HELP_USING_AN_ITEM]                = Help_Text_UsingAnItem,
    [HELP_USING_KEYITEM]                = Help_Text_UsingKeyItem,
    [HELP_USING_POKEBALL]               = Help_Text_UsingPokeBall,
    [HELP_USING_PLAYER]                 = Help_Text_UsingPlayer,
    [HELP_USING_SAVE]                   = Help_Text_UsingSave,
    [HELP_USING_OPTION]                 = Help_Text_UsingOption,
    [HELP_USING_POTION]                 = Help_Text_UsingPotion,
    [HELP_USING_TOWN_MAP]               = Help_Text_UsingTownMap,
    [HELP_USING_TM]                     = Help_Text_UsingTM,
    [HELP_USING_HM]                     = Help_Text_UsingHM,
    [HELP_USING_MOVE_OUTSIDE_OF_BATTLE] = Help_Text_UsingMoveOutsideOfBattle,
    [HELP_RIDING_BICYCLE]               = Help_Text_RidingBicycle,
    [HELP_ENTERING_NAME]                = Help_Text_EnteringName,
    [HELP_USING_PC]                     = Help_Text_UsingPC,
    [HELP_USING_BILLS_PC]               = Help_Text_UsingBillsPC,
    [HELP_USING_WITHDRAW]               = Help_Text_UsingWithdraw,
    [HELP_USING_DEPOSIT]                = Help_Text_UsingDeposit,
    [HELP_USING_MOVE]                   = Help_Text_UsingMove,
    [HELP_MOVING_ITEMS]                 = Help_Text_MovingItems,
    [HELP_USING_PLAYERS_PC]             = Help_Text_UsingPlayersPC,
    [HELP_USING_WITHDRAW_ITEM]          = Help_Text_UsingWithdrawItem,
    [HELP_USING_DEPOSIT_ITEM]           = Help_Text_UsingDepositItem,
    [HELP_USING_MAILBOX]                = Help_Text_UsingMailbox,
    [HELP_USING_PROF_OAKS_PC]           = Help_Text_UsingProfOaksPC,
    [HELP_OPENING_MENU]                 = Help_Text_OpeningMenu,
    [HELP_USING_FIGHT]                  = Help_Text_UsingFight,
    [HELP_USING_POKEMON2]               = Help_Text_UsingPokemon2,
    [HELP_USING_SHIFT]                  = Help_Text_UsingShift,
    [HELP_USING_SUMMARY2]               = Help_Text_UsingSummary2,
    [HELP_USING_BAG2]                   = Help_Text_UsingBag2,
    [HELP_READING_POKEDEX]              = Help_Text_ReadingPokedex,
    [HELP_USING_HOME_PC]                = Help_Text_UsingHomePC,
    [HELP_USING_ITEM_STORAGE]           = Help_Text_UsingItemStorage,
    [HELP_USING_WITHDRAW_ITEM2]         = Help_Text_UsingWithdrawItem2,
    [HELP_USING_DEPOSIT_ITEM2]          = Help_Text_UsingDepositItem2,
    [HELP_USING_MAILBOX2]               = Help_Text_UsingMailbox2,
    [HELP_USING_RUN]                    = Help_Text_UsingRun,
    [HELP_REGISTER_KEY_ITEM]            = Help_Text_RegisterKeyItem,
    [HELP_USING_BALL]                   = Help_Text_UsingBall,
    [HELP_USING_BAIT]                   = Help_Text_UsingBait,
    [HELP_USING_ROCK]                   = Help_Text_UsingRock,
    [HELP_USING_HALL_OF_FAME]           = Help_Text_UsingHallOfFame
};

static const u8 *const sHelpSystemHowToUseMenuTextPtrs[] = {
    [HELP_NONE]                         = NULL,
    [HELP_USING_POKEDEX]                = Help_Text_HowToUsePokedex,
    [HELP_USING_POKEMON]                = Help_Text_HowToUsePokemon,
    [HELP_USING_SUMMARY]                = Help_Text_HowToUseSummary,
    [HELP_USING_SWITCH]                 = Help_Text_HowToUseSwitch,
    [HELP_USING_ITEM]                   = Help_Text_HowToUseItem,
    [HELP_USING_BAG]                    = Help_Text_HowToUseBag,
    [HELP_USING_AN_ITEM]                = Help_Text_HowToUseAnItem,
    [HELP_USING_KEYITEM]                = Help_Text_HowToUseKeyItem,
    [HELP_USING_POKEBALL]               = Help_Text_HowToUsePokeBall,
    [HELP_USING_PLAYER]                 = Help_Text_HowToUsePlayer,
    [HELP_USING_SAVE]                   = Help_Text_HowToUseSave,
    [HELP_USING_OPTION]                 = Help_Text_HowToUseOption,
    [HELP_USING_POTION]                 = Help_Text_HowToUsePotion,
    [HELP_USING_TOWN_MAP]               = Help_Text_HowToUseTownMap,
    [HELP_USING_TM]                     = Help_Text_HowToUseTM,
    [HELP_USING_HM]                     = Help_Text_HowToUseHM,
    [HELP_USING_MOVE_OUTSIDE_OF_BATTLE] = Help_Text_HowToUseMoveOutsideOfBattle,
    [HELP_RIDING_BICYCLE]               = Help_Text_HowToRideBicycle,
    [HELP_ENTERING_NAME]                = Help_Text_HowToEnterName,
    [HELP_USING_PC]                     = Help_Text_HowToUsePC,
    [HELP_USING_BILLS_PC]               = Help_Text_HowToUseBillsPC,
    [HELP_USING_WITHDRAW]               = Help_Text_HowToUseWithdraw,
    [HELP_USING_DEPOSIT]                = Help_Text_HowToUseDeposit,
    [HELP_USING_MOVE]                   = Help_Text_HowToUseMove,
    [HELP_MOVING_ITEMS]                 = Help_Text_HowToMoveItems,
    [HELP_USING_PLAYERS_PC]             = Help_Text_HowToUsePlayersPC,
    [HELP_USING_WITHDRAW_ITEM]          = Help_Text_HowToUseWithdrawItem,
    [HELP_USING_DEPOSIT_ITEM]           = Help_Text_HowToUseDepositItem,
    [HELP_USING_MAILBOX]                = Help_Text_HowToUseMailbox,
    [HELP_USING_PROF_OAKS_PC]           = Help_Text_HowToUseProfOaksPC,
    [HELP_OPENING_MENU]                 = Help_Text_HowToOpenMenu,
    [HELP_USING_FIGHT]                  = Help_Text_HowToUseFight,
    [HELP_USING_POKEMON2]               = Help_Text_HowToUsePokemon2,
    [HELP_USING_SHIFT]                  = Help_Text_HowToUseShift,
    [HELP_USING_SUMMARY2]               = Help_Text_HowToUseSummary2,
    [HELP_USING_BAG2]                   = Help_Text_HowToUseBag2,
    [HELP_READING_POKEDEX]              = Help_Text_HowToReadPokedex,
    [HELP_USING_HOME_PC]                = Help_Text_HowToUseHomePC,
    [HELP_USING_ITEM_STORAGE]           = Help_Text_HowToUseItemStorage,
    [HELP_USING_WITHDRAW_ITEM2]         = Help_Text_HowToUseWithdrawItem2,
    [HELP_USING_DEPOSIT_ITEM2]          = Help_Text_HowToUseDepositItem2,
    [HELP_USING_MAILBOX2]               = Help_Text_HowToUseMailbox2,
    [HELP_USING_RUN]                    = Help_Text_HowToUseRun,
    [HELP_REGISTER_KEY_ITEM]            = Help_Text_HowToRegisterKeyItem,
    [HELP_USING_BALL]                   = Help_Text_HowToUseBall,
    [HELP_USING_BAIT]                   = Help_Text_HowToUseBait,
    [HELP_USING_ROCK]                   = Help_Text_HowToUseRock,
    [HELP_USING_HALL_OF_FAME]           = Help_Text_HowToUseHallOfFame
};

// Submenu IDs for TOPIC_TERMS
enum
{
    HELP_TERM_HP = 1,
    HELP_TERM_EXP,
    HELP_TERM_MOVES,
    HELP_TERM_ATTACK,
    HELP_TERM_DEFENSE,
    HELP_TERM_SPATK,
    HELP_TERM_SPDEF,
    HELP_TERM_SPEED,
    HELP_TERM_LEVEL,
    HELP_TERM_TYPE,
    HELP_TERM_OT,
    HELP_TERM_ITEM,
    HELP_TERM_ABILITY,
    HELP_TERM_MONEY,
    HELP_TERM_MOVE_TYPE,
    HELP_TERM_NATURE,
    HELP_TERM_ID_NO,
    HELP_TERM_PP,
    HELP_TERM_POWER,
    HELP_TERM_ACCURACY,
    HELP_TERM_FNT,
    HELP_TERM_ITEMS,
    HELP_TERM_KEYITEMS,
    HELP_TERM_POKEBALLS,
    HELP_TERM_POKEDEX,
    HELP_TERM_PLAY_TIME,
    HELP_TERM_BADGES,
    HELP_TERM_TEXT_SPEED,
    HELP_TERM_BATTLE_SCENE,
    HELP_TERM_BATTLE_STYLE,
    HELP_TERM_SOUND,
    HELP_TERM_BUTTON_MODE,
    HELP_TERM_FRAME,
    HELP_TERM_CANCEL,
    HELP_TERM_TM,
    HELP_TERM_HM,
    HELP_TERM_HM_MOVE,
    HELP_TERM_EVOLUTION,
    HELP_TERM_STATUS_PROBLEM,
    HELP_TERM_POKEMON,
    HELP_TERM_ID_NO2,
    HELP_TERM_MONEY2,
    HELP_TERM_BADGES2,
};

static const u8 *const sHelpSystemTermTextPtrs[] = {
    [HELP_NONE]                = NULL,
    [HELP_TERM_HP]             = Help_Text_HP,
    [HELP_TERM_EXP]            = Help_Text_EXP,
    [HELP_TERM_MOVES]          = Help_Text_Moves,
    [HELP_TERM_ATTACK]         = Help_Text_Attack,
    [HELP_TERM_DEFENSE]        = Help_Text_Defense,
    [HELP_TERM_SPATK]          = Help_Text_SpAtk,
    [HELP_TERM_SPDEF]          = Help_Text_SpDef,
    [HELP_TERM_SPEED]          = Help_Text_Speed,
    [HELP_TERM_LEVEL]          = Help_Text_Level,
    [HELP_TERM_TYPE]           = Help_Text_Type,
    [HELP_TERM_OT]             = Help_Text_OT,
    [HELP_TERM_ITEM]           = Help_Text_Item,
    [HELP_TERM_ABILITY]        = Help_Text_Ability,
    [HELP_TERM_MONEY]          = Help_Text_Money,
    [HELP_TERM_MOVE_TYPE]      = Help_Text_MoveType,
    [HELP_TERM_NATURE]         = Help_Text_Nature,
    [HELP_TERM_ID_NO]          = Help_Text_IDNo,
    [HELP_TERM_PP]             = Help_Text_PP,
    [HELP_TERM_POWER]          = Help_Text_Power,
    [HELP_TERM_ACCURACY]       = Help_Text_Accuracy,
    [HELP_TERM_FNT]            = Help_Text_FNT,
    [HELP_TERM_ITEMS]          = Help_Text_Items,
    [HELP_TERM_KEYITEMS]       = Help_Text_KeyItems,
    [HELP_TERM_POKEBALLS]      = Help_Text_PokeBalls,
    [HELP_TERM_POKEDEX]        = Help_Text_Pokedex,
    [HELP_TERM_PLAY_TIME]      = Help_Text_PlayTime,
    [HELP_TERM_BADGES]         = Help_Text_Badges,
    [HELP_TERM_TEXT_SPEED]     = Help_Text_TextSpeed,
    [HELP_TERM_BATTLE_SCENE]   = Help_Text_BattleScene,
    [HELP_TERM_BATTLE_STYLE]   = Help_Text_BattleStyle,
    [HELP_TERM_SOUND]          = Help_Text_Sound,
    [HELP_TERM_BUTTON_MODE]    = Help_Text_ButtonMode,
    [HELP_TERM_FRAME]          = Help_Text_Frame,
    [HELP_TERM_CANCEL]         = Help_Text_Cancel2,
    [HELP_TERM_TM]             = Help_Text_TM,
    [HELP_TERM_HM]             = Help_Text_HM,
    [HELP_TERM_HM_MOVE]        = Help_Text_HMMove,
    [HELP_TERM_EVOLUTION]      = Help_Text_Evolution,
    [HELP_TERM_STATUS_PROBLEM] = Help_Text_StatusProblem,
    [HELP_TERM_POKEMON]        = Help_Text_Pokemon,
    [HELP_TERM_ID_NO2]         = Help_Text_IDNo2,
    [HELP_TERM_MONEY2]         = Help_Text_Money2,
    [HELP_TERM_BADGES2]        = Help_Text_Badges2
};

static const u8 *const sHelpSystemTermDefinitionsTextPtrs[] = {
    [HELP_NONE]                = NULL,
    [HELP_TERM_HP]             = Help_Text_DefineHP,
    [HELP_TERM_EXP]            = Help_Text_DefineEXP,
    [HELP_TERM_MOVES]          = Help_Text_DefineMoves,
    [HELP_TERM_ATTACK]         = Help_Text_DefineAttack,
    [HELP_TERM_DEFENSE]        = Help_Text_DefineDefense,
    [HELP_TERM_SPATK]          = Help_Text_DefineSpAtk,
    [HELP_TERM_SPDEF]          = Help_Text_DefineSpDef,
    [HELP_TERM_SPEED]          = Help_Text_DefineSpeed,
    [HELP_TERM_LEVEL]          = Help_Text_DefineLevel,
    [HELP_TERM_TYPE]           = Help_Text_DefineType,
    [HELP_TERM_OT]             = Help_Text_DefineOT,
    [HELP_TERM_ITEM]           = Help_Text_DefineItem,
    [HELP_TERM_ABILITY]        = Help_Text_DefineAbility,
    [HELP_TERM_MONEY]          = Help_Text_DefineMoney,
    [HELP_TERM_MOVE_TYPE]      = Help_Text_DefineMoveType,
    [HELP_TERM_NATURE]         = Help_Text_DefineNature,
    [HELP_TERM_ID_NO]          = Help_Text_DefineIDNo,
    [HELP_TERM_PP]             = Help_Text_DefinePP,
    [HELP_TERM_POWER]          = Help_Text_DefinePower,
    [HELP_TERM_ACCURACY]       = Help_Text_DefineAccuracy,
    [HELP_TERM_FNT]            = Help_Text_DefineFNT,
    [HELP_TERM_ITEMS]          = Help_Text_DefineItems,
    [HELP_TERM_KEYITEMS]       = Help_Text_DefineKeyItems,
    [HELP_TERM_POKEBALLS]      = Help_Text_DefinePokeBalls,
    [HELP_TERM_POKEDEX]        = Help_Text_DefinePokedex,
    [HELP_TERM_PLAY_TIME]      = Help_Text_DefinePlayTime,
    [HELP_TERM_BADGES]         = Help_Text_DefineBadges,
    [HELP_TERM_TEXT_SPEED]     = Help_Text_DefineTextSpeed,
    [HELP_TERM_BATTLE_SCENE]   = Help_Text_DefineBattleScene,
    [HELP_TERM_BATTLE_STYLE]   = Help_Text_DefineBattleStyle,
    [HELP_TERM_SOUND]          = Help_Text_DefineSound,
    [HELP_TERM_BUTTON_MODE]    = Help_Text_DefineButtonMode,
    [HELP_TERM_FRAME]          = Help_Text_DefineFrame,
    [HELP_TERM_CANCEL]         = Help_Text_DefineCancel2,
    [HELP_TERM_TM]             = Help_Text_DefineTM,
    [HELP_TERM_HM]             = Help_Text_DefineHM,
    [HELP_TERM_HM_MOVE]        = Help_Text_DefineHMMove,
    [HELP_TERM_EVOLUTION]      = Help_Text_DefineEvolution,
    [HELP_TERM_STATUS_PROBLEM] = Help_Text_DefineStatusProblem,
    [HELP_TERM_POKEMON]        = Help_Text_DefinePokemon,
    [HELP_TERM_ID_NO2]         = Help_Text_DefineIDNo2,
    [HELP_TERM_MONEY2]         = Help_Text_DefineMoney2,
    [HELP_TERM_BADGES2]        = Help_Text_DefineBadges2
};

// Submenu IDs for TOPIC_ABOUT_GAME
enum
{
    HELP_THE_HELP_SYSTEM = 1,
    HELP_THE_GAME,
    HELP_WIRELESS_ADAPTER,
    HELP_GAME_FUNDAMENTALS_1,
    HELP_GAME_FUNDAMENTALS_2,
    HELP_GAME_FUNDAMENTALS_3,
    HELP_WHAT_ARE_POKEMON,
};

static const u8 *const sHelpSystemGeneralTopicTextPtrs[] = {
    [HELP_NONE]                = NULL,
    [HELP_THE_HELP_SYSTEM]     = Help_Text_TheHelpSystem,
    [HELP_THE_GAME]            = Help_Text_TheGame,
    [HELP_WIRELESS_ADAPTER]    = Help_Text_WirelessAdapter,
    [HELP_GAME_FUNDAMENTALS_1] = Help_Text_GameFundamentals1,
    [HELP_GAME_FUNDAMENTALS_2] = Help_Text_GameFundamentals2,
    [HELP_GAME_FUNDAMENTALS_3] = Help_Text_GameFundamentals3,
    [HELP_WHAT_ARE_POKEMON]    = Help_Text_WhatArePokemon
};

static const u8 *const sHelpSystemGeneralTopicDescriptionTextPtrs[] = {
    [HELP_NONE]                = NULL,
    [HELP_THE_HELP_SYSTEM]     = Help_Text_DescTheHelpSystem,
    [HELP_THE_GAME]            = Help_Text_DescTheGame,
    [HELP_WIRELESS_ADAPTER]    = Help_Text_DescWirelessAdapter,
    [HELP_GAME_FUNDAMENTALS_1] = Help_Text_DescGameFundamentals1,
    [HELP_GAME_FUNDAMENTALS_2] = Help_Text_DescGameFundamentals2,
    [HELP_GAME_FUNDAMENTALS_3] = Help_Text_DescGameFundamentals3,
    [HELP_WHAT_ARE_POKEMON]    = Help_Text_DescWhatArePokemon
};

// An enum for the type matchups isn't necessary, when used they're always used in their entirety
// Macro below is used to reference the entire group at once
#define HELP_TYPE_MATCHUPS  \
    1,                      \
    2, 3,                   \
    4, 5,                   \
    6, 7,                   \
    8, 9,                   \
    10, 11,                 \
    12, 13,                 \
    14, 15,                 \
    16, 17,                 \
    18, 19,                 \
    20, 21,                 \
    22, 23,                 \
    24, 25,                 \
    26, 27,                 \
    28, 29,                 \
    30, 31,                 \
    32, 33,                 \
    34, 35                  \

static const u8 *const sHelpSystemTypeMatchupTextPtrs[] = {
    [HELP_NONE] = NULL,
    [1]  = Help_Text_UsingTypeMatchupList,
    [2]  = Help_Text_OwnMoveDark,
    [3]  = Help_Text_OwnPokemonDark,
    [4]  = Help_Text_OwnMoveRock,
    [5]  = Help_Text_OwnPokemonRock,
    [6]  = Help_Text_OwnMovePsychic,
    [7]  = Help_Text_OwnPokemonPsychic,
    [8]  = Help_Text_OwnMoveFighting,
    [9]  = Help_Text_OwnPokemonFighting,
    [10] = Help_Text_OwnMoveGrass,
    [11] = Help_Text_OwnPokemonGrass,
    [12] = Help_Text_OwnMoveGhost,
    [13] = Help_Text_OwnPokemonGhost,
    [14] = Help_Text_OwnMoveIce,
    [15] = Help_Text_OwnPokemonIce,
    [16] = Help_Text_OwnMoveGround,
    [17] = Help_Text_OwnPokemonGround,
    [18] = Help_Text_OwnMoveElectric,
    [19] = Help_Text_OwnPokemonElectric,
    [20] = Help_Text_OwnMovePoison,
    [21] = Help_Text_OwnPokemonPoison,
    [22] = Help_Text_OwnMoveDragon,
    [23] = Help_Text_OwnPokemonDragon,
    [24] = Help_Text_OwnMoveNormal,
    [25] = Help_Text_OwnPokemonNormal,
    [26] = Help_Text_OwnMoveSteel,
    [27] = Help_Text_OwnPokemonSteel,
    [28] = Help_Text_OwnMoveFlying,
    [29] = Help_Text_OwnPokemonFlying,
    [30] = Help_Text_OwnMoveFire,
    [31] = Help_Text_OwnPokemonFire,
    [32] = Help_Text_OwnMoveWater,
    [33] = Help_Text_OwnPokemonWater,
    [34] = Help_Text_OwnMoveBug,
    [35] = Help_Text_OwnPokemonBug
};

static const u8 *const sHelpSystemTypeMatchupDescriptionTextPtrs[] = {
    [HELP_NONE] = NULL,
    [1]  = Help_Text_HowToUseTypeMatchupList,
    [2]  = Help_Text_TypeMatchupOwnMoveDark,
    [3]  = Help_Text_TypeMatchupOwnPokemonDark,
    [4]  = Help_Text_TypeMatchupOwnMoveRock,
    [5]  = Help_Text_TypeMatchupOwnPokemonRock,
    [6]  = Help_Text_TypeMatchupOwnMovePsychic,
    [7]  = Help_Text_TypeMatchupOwnPokemonPsychic,
    [8]  = Help_Text_TypeMatchupOwnMoveFighting,
    [9]  = Help_Text_TypeMatchupOwnPokemonFighting,
    [10] = Help_Text_TypeMatchupOwnMoveGrass,
    [11] = Help_Text_TypeMatchupOwnPokemonGrass,
    [12] = Help_Text_TypeMatchupOwnMoveGhost,
    [13] = Help_Text_TypeMatchupOwnPokemonGhost,
    [14] = Help_Text_TypeMatchupOwnMoveIce,
    [15] = Help_Text_TypeMatchupOwnPokemonIce,
    [16] = Help_Text_TypeMatchupOwnMoveGround,
    [17] = Help_Text_TypeMatchupOwnPokemonGround,
    [18] = Help_Text_TypeMatchupOwnMoveElectric,
    [19] = Help_Text_TypeMatchupOwnPokemonElectric,
    [20] = Help_Text_TypeMatchupOwnMovePoison,
    [21] = Help_Text_TypeMatchupOwnPokemonPoison,
    [22] = Help_Text_TypeMatchupOwnMoveDragon,
    [23] = Help_Text_TypeMatchupOwnPokemonDragon,
    [24] = Help_Text_TypeMatchupOwnMoveNormal,
    [25] = Help_Text_TypeMatchupOwnPokemonNormal,
    [26] = Help_Text_TypeMatchupOwnMoveSteel,
    [27] = Help_Text_TypeMatchupOwnPokemonSteel,
    [28] = Help_Text_TypeMatchupOwnMoveFlying,
    [29] = Help_Text_TypeMatchupOwnPokemonFlying,
    [30] = Help_Text_TypeMatchupOwnMoveFire,
    [31] = Help_Text_TypeMatchupOwnPokemonFire,
    [32] = Help_Text_TypeMatchupOwnMoveWater,
    [33] = Help_Text_TypeMatchupOwnPokemonWater,
    [34] = Help_Text_TypeMatchupOwnMoveBug,
    [35] = Help_Text_TypeMatchupOwnPokemonBug
};

static const u8 sAboutGame_TitleScreen[] = {
    HELP_THE_HELP_SYSTEM, 
    HELP_THE_GAME, 
    HELP_WIRELESS_ADAPTER, 
    HELP_END
};

static const u8 sAboutGame_NewGame[] = {
    HELP_THE_HELP_SYSTEM, 
    HELP_THE_GAME, 
    HELP_WIRELESS_ADAPTER, 
    HELP_END
};

static const u8 sHowTo_NamingScreen[] = {
    HELP_ENTERING_NAME, 
    HELP_END
};

static const u8 sAboutGame_NamingScreen[] = {
    HELP_THE_HELP_SYSTEM, 
    HELP_THE_GAME, 
    HELP_WIRELESS_ADAPTER, 
    HELP_END
};

static const u8 sHowTo_Pokedex[] = {
    HELP_USING_POKEDEX, 
    HELP_READING_POKEDEX, 
    HELP_END
};

static const u8 sHowTo_PartyMenu[] = {
    HELP_USING_POKEMON, 
    HELP_USING_SUMMARY,
    HELP_USING_SWITCH, 
    HELP_USING_ITEM, 
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE,
    HELP_END
};

static const u8 sTerms_PartyMenu[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_END
};

static const u8 sHowTo_PokemonInfo[] = {
    HELP_USING_POKEMON, 
    HELP_USING_SUMMARY, 
    HELP_END
};

static const u8 sTerms_PokemonInfo[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_TYPE, 
    HELP_TERM_OT, 
    HELP_TERM_ID_NO, 
    HELP_TERM_ITEM, 
    HELP_TERM_NATURE, 
    HELP_END
};

static const u8 sTerms_PokemonSkills[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_ATTACK, 
    HELP_TERM_DEFENSE, 
    HELP_TERM_SPATK, 
    HELP_TERM_SPDEF, 
    HELP_TERM_SPEED, 
    HELP_TERM_EXP, 
    HELP_TERM_ABILITY, 
    HELP_END
};

static const u8 sTerms_PokemonMoves[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_MOVES, 
    HELP_TERM_TYPE, 
    HELP_TERM_MOVE_TYPE, 
    HELP_TERM_PP, 
    HELP_TERM_POWER, 
    HELP_TERM_ACCURACY, 
    HELP_END
};

static const u8 sHowTo_Bag[] = {
    HELP_USING_BAG, 
    HELP_USING_AN_ITEM, 
    HELP_USING_KEYITEM, 
    HELP_REGISTER_KEY_ITEM, 
    HELP_USING_POKEBALL, 
    HELP_USING_POTION, 
    HELP_USING_TOWN_MAP, 
    HELP_USING_TM, 
    HELP_USING_HM, 
    HELP_RIDING_BICYCLE, 
    HELP_END
};

static const u8 sTerms_Bag[] = {
    HELP_TERM_ITEMS, 
    HELP_TERM_KEYITEMS, 
    HELP_TERM_POKEBALLS, 
    HELP_END
};

static const u8 sHowTo_TrainerCardFront[] = {
    HELP_USING_PLAYER, 
    HELP_END
};

static const u8 sTerms_TrainerCardFront[] = {
    HELP_TERM_ID_NO, 
    HELP_TERM_MONEY, 
    HELP_TERM_POKEDEX, 
    HELP_TERM_PLAY_TIME, 
    HELP_TERM_BADGES, 
    HELP_END
};

static const u8 sHowTo_TrainerCardBack[] = {
    HELP_USING_PLAYER, 
    HELP_END
};

static const u8 sHowTo_Save[] = {
    HELP_USING_SAVE, 
    HELP_END
};

static const u8 sTerms_Save[] = {
    HELP_TERM_BADGES2, 
    HELP_TERM_POKEDEX, 
    HELP_TERM_PLAY_TIME, 
    HELP_END
};

static const u8 sHowTo_Options[] = {
    HELP_USING_OPTION, 
    HELP_END
};

static const u8 sTerms_Options[] = {
    HELP_TERM_TEXT_SPEED, 
    HELP_TERM_BATTLE_SCENE, 
    HELP_TERM_BATTLE_STYLE, 
    HELP_TERM_SOUND, 
    HELP_TERM_BUTTON_MODE, 
    HELP_TERM_FRAME, 
    HELP_TERM_CANCEL, 
    HELP_END
};

static const u8 sWhatToDo_PlayersHouse[] = {
    HELP_WHAT_SHOULD_I_BE_DOING, 
    HELP_CANT_GET_OUT_OF_ROOM, 
    HELP_CANT_FIND_PERSON_I_WANT, 
    HELP_END
};

static const u8 sAboutGame_PlayersHouse[] = {
    HELP_THE_HELP_SYSTEM, 
    HELP_THE_GAME, 
    HELP_WIRELESS_ADAPTER, 
    HELP_WHAT_ARE_POKEMON, 
    HELP_END
};

static const u8 sWhatToDo_OaksLab[] = {
    HELP_WHAT_SHOULD_I_BE_DOING, 
    HELP_CANT_FIND_PERSON_I_WANT, 
    HELP_TALKED_TO_EVERYONE_NOW_WHAT, 
    HELP_WHAT_HAPPENED_TO_ITEM_I_GOT, 
    HELP_WANT_TO_END_GAME, 
    HELP_END
};

static const u8 sHowTo_OaksLab[] = {
    HELP_OPENING_MENU, 
    HELP_USING_POKEDEX, 
    HELP_USING_POKEMON, 
    HELP_USING_SUMMARY, 
    HELP_USING_SWITCH, 
    HELP_USING_ITEM, 
    HELP_USING_BAG, 
    HELP_USING_AN_ITEM, 
    HELP_USING_KEYITEM, 
    HELP_REGISTER_KEY_ITEM,
    HELP_USING_POKEBALL, 
    HELP_USING_POTION, 
    HELP_USING_TOWN_MAP, 
    HELP_USING_TM, 
    HELP_USING_HM, 
    HELP_USING_PLAYER, 
    HELP_USING_SAVE, 
    HELP_USING_OPTION, 
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE, 
    HELP_END
};

static const u8 sTerms_OaksLab[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_MOVES, 
    HELP_TERM_TYPE, 
    HELP_TERM_POKEMON, 
    HELP_END
};

static const u8 sWhatToDo_PokeCenter[] = {
    HELP_WHAT_SHOULD_I_BE_DOING, 
    HELP_TALKED_TO_EVERYONE_NOW_WHAT, 
    HELP_SOMEONE_BLOCKING_MY_WAY, 
    HELP_WHAT_ARE_MY_ADVENTURE_BASICS, 
    HELP_WHATS_POKEMON_CENTER, 
    HELP_WHATS_POKEMON_MART, 
    HELP_WHAT_HAPPENED_TO_ITEM_I_GOT, 
    HELP_WANT_TO_END_GAME, 
    HELP_END
};

static const u8 sHowTo_PokeCenter[] = {
    HELP_OPENING_MENU, 
    HELP_USING_POKEDEX, 
    HELP_USING_POKEMON, 
    HELP_USING_SUMMARY, 
    HELP_USING_SWITCH, 
    HELP_USING_ITEM, 
    HELP_USING_BAG, 
    HELP_USING_AN_ITEM, 
    HELP_USING_KEYITEM, 
    HELP_REGISTER_KEY_ITEM, 
    HELP_USING_POKEBALL, 
    HELP_USING_POTION, 
    HELP_USING_TOWN_MAP, 
    HELP_USING_TM, 
    HELP_USING_HM, 
    HELP_USING_PLAYER, 
    HELP_USING_SAVE, 
    HELP_USING_OPTION, 
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE, 
    HELP_USING_PC, 
    HELP_END
};

static const u8 sTerms_PokeCenter[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_MOVES, 
    HELP_TERM_TYPE, 
    HELP_TERM_POKEMON, 
    HELP_END
};

static const u8 sAboutGame_PokeCenter[] = {
    HELP_WIRELESS_ADAPTER, 
    HELP_WHAT_ARE_POKEMON, 
    HELP_GAME_FUNDAMENTALS_1, 
    HELP_GAME_FUNDAMENTALS_2, 
    HELP_GAME_FUNDAMENTALS_3, 
    HELP_END
};

static const u8 sWhatToDo_Mart[] = {
    HELP_WHAT_SHOULD_I_BE_DOING, 
    HELP_TALKED_TO_EVERYONE_NOW_WHAT, 
    HELP_SOMEONE_BLOCKING_MY_WAY, 
    HELP_WHAT_ARE_MY_ADVENTURE_BASICS, 
    HELP_WHATS_POKEMON_CENTER, 
    HELP_WHATS_POKEMON_MART, 
    HELP_WHAT_HAPPENED_TO_ITEM_I_GOT, 
    HELP_WANT_TO_END_GAME, 
    HELP_END
};

static const u8 sHowTo_Mart[] = {
    HELP_OPENING_MENU, 
    HELP_USING_POKEDEX, 
    HELP_USING_POKEMON, 
    HELP_USING_SUMMARY, 
    HELP_USING_SWITCH, 
    HELP_USING_ITEM, 
    HELP_USING_BAG, 
    HELP_USING_AN_ITEM, 
    HELP_USING_KEYITEM, 
    HELP_REGISTER_KEY_ITEM, 
    HELP_USING_POKEBALL, 
    HELP_USING_POTION, 
    HELP_USING_TOWN_MAP, 
    HELP_USING_TM, 
    HELP_USING_HM, 
    HELP_USING_PLAYER, 
    HELP_USING_SAVE, 
    HELP_USING_OPTION, 
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE, 
    HELP_END
};

static const u8 sTerms_Mart[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_MOVES, 
    HELP_TERM_TYPE, 
    HELP_TERM_ITEM, 
    HELP_TERM_MONEY, 
    HELP_TERM_ITEMS, 
    HELP_TERM_KEYITEMS, 
    HELP_TERM_POKEBALLS, 
    HELP_TERM_FNT, 
    HELP_END
};

static const u8 sWhatToDo_Gym[] = {
    HELP_SOMEONE_BLOCKING_MY_WAY, 
    HELP_WHAT_ARE_MY_ADVENTURE_BASICS, 
    HELP_WHATS_POKEMON_CENTER, 
    HELP_WHATS_POKEMON_MART, 
    HELP_WHAT_HAPPENED_TO_ITEM_I_GOT, 
    HELP_WANT_TO_END_GAME, 
    HELP_END
};

static const u8 sHowTo_Gym[] = {
    HELP_OPENING_MENU, 
    HELP_USING_POKEDEX, 
    HELP_USING_POKEMON, 
    HELP_USING_SUMMARY, 
    HELP_USING_SWITCH, 
    HELP_USING_ITEM, 
    HELP_USING_BAG, 
    HELP_USING_AN_ITEM, 
    HELP_USING_KEYITEM, 
    HELP_REGISTER_KEY_ITEM, 
    HELP_USING_POKEBALL, 
    HELP_USING_POTION, 
    HELP_USING_TOWN_MAP, 
    HELP_USING_TM, 
    HELP_USING_HM, 
    HELP_USING_PLAYER, 
    HELP_USING_SAVE, 
    HELP_USING_OPTION, 
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE, 
    HELP_END
};

static const u8 sTerms_Gym[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_MOVES, 
    HELP_TERM_TYPE, 
    HELP_TERM_FNT, 
    HELP_END
};

static const u8 sTypeMatchups_Gym[] = {
    HELP_TYPE_MATCHUPS,
    HELP_END
};

static const u8 sWhatToDo_Indoors[] = {
    HELP_WHAT_SHOULD_I_BE_DOING, 
    HELP_WHAT_ARE_MY_ADVENTURE_BASICS, 
    HELP_CANT_FIND_PERSON_I_WANT, 
    HELP_TALKED_TO_EVERYONE_NOW_WHAT, 
    HELP_SOMEONE_BLOCKING_MY_WAY, 
    HELP_I_CANT_GO_ON, 
    HELP_HOW_DO_I_PROGRESS, 
    HELP_WHAT_IS_THAT_PERSON_LIKE, 
    HELP_OUT_OF_THINGS_TO_DO, 
    HELP_HOW_ARE_ROADS_FORESTS_DIFFERENT, 
    HELP_WHAT_DO_I_DO_IN_CAVE, 
    HELP_WHATS_POKEMON_CENTER, 
    HELP_WHATS_POKEMON_MART, 
    HELP_WHAT_IS_A_GYM, 
    HELP_WHAT_HAPPENED_TO_ITEM_I_GOT, 
    HELP_WHEN_CAN_I_USE_ITEM, 
    HELP_RAN_OUT_OF_POTIONS, 
    HELP_CAN_I_BUY_POKEBALLS, 
    HELP_WHATS_A_BATTLE, 
    HELP_HOW_DO_I_PREPARE_FOR_BATTLE, 
    HELP_WHAT_IS_A_MONS_VITALITY, 
    HELP_WHERE_DO_MONS_APPEAR, 
    HELP_CANT_CATCH_MONS, 
    HELP_WANT_TO_MAKE_MON_STRONGER, 
    HELP_FOE_MONS_TOO_STRONG, 
    HELP_MY_MONS_ARE_HURT, 
    HELP_WHAT_IS_STATUS_PROBLEM, 
    HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT, 
    HELP_WHATS_A_TRAINER, 
    HELP_HOW_DO_I_WIN_AGAINST_TRAINER, 
    HELP_WHAT_ARE_MOVES, 
    HELP_WANT_TO_ADD_MORE_MOVES, 
    HELP_WHAT_ARE_HIDDEN_MOVES, 
    HELP_WHAT_DOES_HIDDEN_MOVE_DO, 
    HELP_WANT_TO_END_GAME, 
    HELP_END
};

static const u8 sHowTo_Indoors[] = {
    HELP_OPENING_MENU, 
    HELP_USING_POKEDEX, 
    HELP_USING_POKEMON, 
    HELP_USING_SUMMARY, 
    HELP_USING_SWITCH, 
    HELP_USING_ITEM, 
    HELP_USING_BAG, 
    HELP_USING_AN_ITEM, 
    HELP_USING_KEYITEM, 
    HELP_REGISTER_KEY_ITEM, 
    HELP_USING_POKEBALL, 
    HELP_USING_POTION, 
    HELP_USING_TOWN_MAP, 
    HELP_USING_TM, 
    HELP_USING_HM, 
    HELP_USING_PLAYER, 
    HELP_USING_SAVE, 
    HELP_USING_OPTION, 
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE, 
    HELP_END
};

static const u8 sTerms_Indoors[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_TYPE, 
    HELP_TERM_OT, 
    HELP_TERM_ITEM, 
    HELP_TERM_ABILITY,
    HELP_TERM_FNT, 
    HELP_END
};

static const u8 sWhatToDo_Overworld[] = {
    HELP_WHAT_SHOULD_I_BE_DOING, 
    HELP_WHAT_ARE_MY_ADVENTURE_BASICS, 
    HELP_CANT_FIND_PERSON_I_WANT, 
    HELP_TALKED_TO_EVERYONE_NOW_WHAT, 
    HELP_SOMEONE_BLOCKING_MY_WAY, 
    HELP_I_CANT_GO_ON, 
    HELP_HOW_DO_I_PROGRESS, 
    HELP_WHAT_IS_THAT_PERSON_LIKE, 
    HELP_OUT_OF_THINGS_TO_DO, 
    HELP_HOW_ARE_ROADS_FORESTS_DIFFERENT, 
    HELP_WHAT_DO_I_DO_IN_CAVE, 
    HELP_WHATS_POKEMON_CENTER, 
    HELP_WHATS_POKEMON_MART, 
    HELP_WHAT_IS_A_GYM, 
    HELP_WHAT_HAPPENED_TO_ITEM_I_GOT, 
    HELP_WHEN_CAN_I_USE_ITEM, 
    HELP_RAN_OUT_OF_POTIONS, 
    HELP_CAN_I_BUY_POKEBALLS, 
    HELP_WHATS_A_BATTLE, 
    HELP_HOW_DO_I_PREPARE_FOR_BATTLE, 
    HELP_WHAT_IS_A_MONS_VITALITY, 
    HELP_WHERE_DO_MONS_APPEAR, 
    HELP_CANT_CATCH_MONS, 
    HELP_WANT_TO_MAKE_MON_STRONGER, 
    HELP_FOE_MONS_TOO_STRONG, 
    HELP_MY_MONS_ARE_HURT, 
    HELP_WHAT_IS_STATUS_PROBLEM, 
    HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT, 
    HELP_WHATS_A_TRAINER, 
    HELP_HOW_DO_I_WIN_AGAINST_TRAINER, 
    HELP_WHAT_ARE_MOVES, 
    HELP_WANT_TO_ADD_MORE_MOVES, 
    HELP_WHAT_ARE_HIDDEN_MOVES, 
    HELP_WHAT_DOES_HIDDEN_MOVE_DO, 
    HELP_WANT_TO_END_GAME, 
    HELP_END
};

static const u8 sHowTo_Overworld[] = {
    HELP_OPENING_MENU, 
    HELP_USING_POKEDEX, 
    HELP_USING_POKEMON, 
    HELP_USING_BAG, 
    HELP_USING_PLAYER, 
    HELP_USING_SAVE, 
    HELP_USING_OPTION, 
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE, 
    HELP_END
};

static const u8 sTerms_Overworld[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_TYPE, 
    HELP_TERM_OT, 
    HELP_TERM_ITEM, 
    HELP_TERM_ABILITY, 
    HELP_TERM_FNT, 
    HELP_TERM_POKEMON, 
    HELP_END
};

static const u8 sWhatToDo_Dungeon[] = {
    HELP_WHAT_ARE_MY_ADVENTURE_BASICS, 
    HELP_I_CANT_GO_ON, 
    HELP_HOW_DO_I_PROGRESS, 
    HELP_WHAT_IS_THAT_PERSON_LIKE, 
    HELP_OUT_OF_THINGS_TO_DO, 
    HELP_HOW_ARE_ROADS_FORESTS_DIFFERENT, 
    HELP_WHAT_DO_I_DO_IN_CAVE, 
    HELP_WHATS_POKEMON_CENTER, 
    HELP_WHATS_POKEMON_MART, 
    HELP_WHAT_IS_A_GYM, 
    HELP_WHAT_HAPPENED_TO_ITEM_I_GOT, 
    HELP_WHEN_CAN_I_USE_ITEM, 
    HELP_RAN_OUT_OF_POTIONS, 
    HELP_WHATS_A_BATTLE, 
    HELP_HOW_DO_I_PREPARE_FOR_BATTLE, 
    HELP_WHAT_IS_A_MONS_VITALITY, 
    HELP_WHERE_DO_MONS_APPEAR, 
    HELP_CANT_CATCH_MONS, 
    HELP_WANT_TO_MAKE_MON_STRONGER, 
    HELP_FOE_MONS_TOO_STRONG, 
    HELP_MY_MONS_ARE_HURT, 
    HELP_WHAT_IS_STATUS_PROBLEM, 
    HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT, 
    HELP_WHATS_A_TRAINER, 
    HELP_HOW_DO_I_WIN_AGAINST_TRAINER, 
    HELP_WHAT_ARE_MOVES, 
    HELP_WANT_TO_ADD_MORE_MOVES, 
    HELP_WHAT_ARE_HIDDEN_MOVES, 
    HELP_WHAT_DOES_HIDDEN_MOVE_DO, 
    HELP_WANT_TO_END_GAME, 
    HELP_END
};

static const u8 sHowTo_Dungeon[] = {
    HELP_OPENING_MENU, 
    HELP_USING_POKEDEX, 
    HELP_USING_POKEMON, 
    HELP_USING_BAG, 
    HELP_USING_PLAYER, 
    HELP_USING_SAVE, 
    HELP_USING_OPTION, 
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE, 
    HELP_END
};

static const u8 sTerms_Dungeon[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_TYPE, 
    HELP_TERM_OT, 
    HELP_TERM_ITEM, 
    HELP_TERM_ABILITY, 
    HELP_TERM_FNT, 
    HELP_END
};

static const u8 sWhatToDo_Surfing[] = {
    HELP_I_CANT_GO_ON, 
    HELP_WHAT_IS_THAT_PERSON_LIKE, 
    HELP_OUT_OF_THINGS_TO_DO, 
    HELP_WHAT_IS_A_GYM, 
    HELP_CANT_CATCH_MONS, 
    HELP_WANT_TO_MAKE_MON_STRONGER, 
    HELP_FOE_MONS_TOO_STRONG, 
    HELP_MY_MONS_ARE_HURT, 
    HELP_WHAT_IS_STATUS_PROBLEM, 
    HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT, 
    HELP_WHATS_A_TRAINER, 
    HELP_HOW_DO_I_WIN_AGAINST_TRAINER, 
    HELP_WHAT_ARE_MOVES, 
    HELP_WANT_TO_ADD_MORE_MOVES, 
    HELP_WHAT_ARE_HIDDEN_MOVES, 
    HELP_WHAT_DOES_HIDDEN_MOVE_DO, 
    HELP_WANT_TO_END_GAME, 
    HELP_END
};

static const u8 sHowTo_Surfing[] = {
    HELP_OPENING_MENU, 
    HELP_USING_POKEDEX, 
    HELP_USING_POKEMON, 
    HELP_USING_BAG, 
    HELP_USING_PLAYER, 
    HELP_USING_SAVE, 
    HELP_USING_OPTION, 
    HELP_USING_MOVE_OUTSIDE_OF_BATTLE, 
    HELP_END
};

static const u8 sTerms_Surfing[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP,
    HELP_TERM_EXP, 
    HELP_TERM_TYPE, 
    HELP_TERM_OT, 
    HELP_TERM_ITEM, 
    HELP_TERM_ABILITY, 
    HELP_TERM_FNT, 
    HELP_END
};

static const u8 sWhatToDo_WildBattle[] = {
    HELP_WHATS_A_BATTLE, 
    HELP_WHAT_ARE_MOVES, 
    HELP_WHAT_MOVES_SHOULD_I_USE, 
    HELP_WHAT_IS_A_MONS_VITALITY, 
    HELP_MY_MONS_ARE_HURT, 
    HELP_CANT_CATCH_MONS, 
    HELP_CAN_I_BUY_POKEBALLS, 
    HELP_RAN_OUT_OF_POTIONS, 
    HELP_WANT_TO_MAKE_MON_STRONGER, 
    HELP_FOE_MONS_TOO_STRONG, 
    HELP_WHAT_IS_STATUS_PROBLEM, 
    HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT, 
    HELP_END
};

static const u8 sHowTo_WildBattle[] = {
    HELP_USING_FIGHT, 
    HELP_USING_POKEMON2, 
    HELP_USING_SHIFT, 
    HELP_USING_SUMMARY2, 
    HELP_USING_BAG2, 
    HELP_USING_AN_ITEM, 
    HELP_USING_POKEBALL, 
    HELP_USING_RUN, 
    HELP_END
};

static const u8 sTerms_WildBattle[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_MOVES, 
    HELP_TERM_ATTACK, 
    HELP_TERM_DEFENSE, 
    HELP_TERM_SPATK, 
    HELP_TERM_SPDEF, 
    HELP_TERM_SPEED, 
    HELP_TERM_TYPE, 
    HELP_TERM_ABILITY, 
    HELP_TERM_MOVE_TYPE, 
    HELP_TERM_PP, 
    HELP_TERM_POWER, 
    HELP_TERM_ACCURACY, 
    HELP_TERM_STATUS_PROBLEM, 
    HELP_TERM_FNT, 
    HELP_END
};

static const u8 sTypeMatchups_WildBattle[] = {
    HELP_TYPE_MATCHUPS,
    HELP_END
};

static const u8 sWhatToDo_TrainerBattleSingle[] = {
    HELP_WHATS_A_BATTLE, 
    HELP_WHAT_ARE_MOVES, 
    HELP_WHAT_MOVES_SHOULD_I_USE, 
    HELP_WHAT_IS_A_MONS_VITALITY, 
    HELP_MY_MONS_ARE_HURT, 
    HELP_RAN_OUT_OF_POTIONS, 
    HELP_WANT_TO_MAKE_MON_STRONGER, 
    HELP_FOE_MONS_TOO_STRONG, 
    HELP_WHAT_IS_STATUS_PROBLEM, 
    HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT,
    HELP_END
};

static const u8 sHowTo_TrainerBattleSingle[] = {
    HELP_USING_FIGHT, 
    HELP_USING_POKEMON2, 
    HELP_USING_SHIFT, 
    HELP_USING_SUMMARY2, 
    HELP_USING_BAG2, 
    HELP_USING_AN_ITEM, 
    HELP_USING_RUN, 
    HELP_END
};

static const u8 sTerms_TrainerBattleSingle[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_MOVES, 
    HELP_TERM_ATTACK, 
    HELP_TERM_DEFENSE, 
    HELP_TERM_SPATK, 
    HELP_TERM_SPDEF, 
    HELP_TERM_SPEED, 
    HELP_TERM_TYPE, 
    HELP_TERM_ABILITY, 
    HELP_TERM_MOVE_TYPE, 
    HELP_TERM_PP, 
    HELP_TERM_POWER, 
    HELP_TERM_ACCURACY, 
    HELP_TERM_STATUS_PROBLEM, 
    HELP_TERM_FNT, 
    HELP_END
};

static const u8 sTypeMatchups_TrainerBattleSingle[] = {
    HELP_TYPE_MATCHUPS, 
    HELP_END
};

static const u8 sWhatToDo_TrainerBattleDouble[] = {
    HELP_WHATS_A_BATTLE, 
    HELP_WHAT_ARE_MOVES, 
    HELP_WHAT_MOVES_SHOULD_I_USE, 
    HELP_WHAT_IS_A_MONS_VITALITY, 
    HELP_MY_MONS_ARE_HURT, 
    HELP_RAN_OUT_OF_POTIONS, 
    HELP_WANT_TO_MAKE_MON_STRONGER, 
    HELP_FOE_MONS_TOO_STRONG, 
    HELP_WHAT_IS_STATUS_PROBLEM, 
    HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT, 
    HELP_END
};

static const u8 sHowTo_TrainerBattleDouble[] = {
    HELP_USING_FIGHT, 
    HELP_USING_POKEMON2, 
    HELP_USING_SHIFT, 
    HELP_USING_SUMMARY2, 
    HELP_USING_BAG2, 
    HELP_USING_AN_ITEM, 
    HELP_USING_RUN, 
    HELP_END
};

static const u8 sTerms_TrainerBattleDouble[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_MOVES, 
    HELP_TERM_ATTACK, 
    HELP_TERM_DEFENSE, 
    HELP_TERM_SPATK, 
    HELP_TERM_SPDEF, 
    HELP_TERM_SPEED, 
    HELP_TERM_TYPE, 
    HELP_TERM_ABILITY, 
    HELP_TERM_MOVE_TYPE, 
    HELP_TERM_PP, 
    HELP_TERM_POWER, 
    HELP_TERM_ACCURACY, 
    HELP_TERM_STATUS_PROBLEM, 
    HELP_TERM_FNT, 
    HELP_END
};

static const u8 sTypeMatchups_TrainerBattleDouble[] = {
    HELP_TYPE_MATCHUPS,
    HELP_END
};

static const u8 sWhatToDo_SafariBattle[] = {
    HELP_WHAT_DO_I_DO_IN_SAFARI, 
    HELP_WHAT_ARE_SAFARI_RULES, 
    HELP_WANT_TO_END_SAFARI, 
    HELP_END
};

static const u8 sHowTo_SafariBattle[] = {
    HELP_USING_BALL, 
    HELP_USING_BAIT, 
    HELP_USING_ROCK, 
    HELP_USING_RUN, 
    HELP_END
};

static const u8 sTerms_SafariBattle[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_MOVES, 
    HELP_TERM_ATTACK, 
    HELP_TERM_DEFENSE, 
    HELP_TERM_SPATK, 
    HELP_TERM_SPDEF, 
    HELP_TERM_SPEED, 
    HELP_TERM_TYPE, 
    HELP_TERM_ABILITY, 
    HELP_TERM_MOVE_TYPE, 
    HELP_TERM_PP, 
    HELP_TERM_POWER, 
    HELP_TERM_ACCURACY, 
    HELP_END
};

static const u8 sTypeMatchups_SafariBattle[] = {
    HELP_TYPE_MATCHUPS,
    HELP_END
};

static const u8 sHowTo_PC[] = {
    HELP_USING_PC, 
    HELP_USING_BILLS_PC, 
    HELP_USING_WITHDRAW, 
    HELP_USING_DEPOSIT, 
    HELP_USING_MOVE, 
    HELP_MOVING_ITEMS, 
    HELP_USING_PLAYERS_PC, 
    HELP_USING_WITHDRAW_ITEM, 
    HELP_USING_DEPOSIT_ITEM,
    HELP_USING_MAILBOX, 
    HELP_USING_PROF_OAKS_PC, 
    HELP_USING_HALL_OF_FAME, 
    HELP_END
};

static const u8 sHowTo_BillsPC[] = {
    HELP_USING_PC, 
    HELP_USING_BILLS_PC, 
    HELP_USING_WITHDRAW, 
    HELP_USING_DEPOSIT, 
    HELP_USING_MOVE, 
    HELP_MOVING_ITEMS, 
    HELP_USING_PLAYERS_PC, 
    HELP_USING_WITHDRAW_ITEM, 
    HELP_USING_DEPOSIT_ITEM,
    HELP_USING_MAILBOX, 
    HELP_USING_PROF_OAKS_PC, 
    HELP_USING_HALL_OF_FAME, 
    HELP_END
};

static const u8 sHowTo_PlayersPCItems[] = {
    HELP_USING_PC, 
    HELP_USING_BILLS_PC, 
    HELP_USING_WITHDRAW, 
    HELP_USING_DEPOSIT, 
    HELP_USING_MOVE, 
    HELP_MOVING_ITEMS, 
    HELP_USING_PLAYERS_PC, 
    HELP_USING_WITHDRAW_ITEM, 
    HELP_USING_DEPOSIT_ITEM,
    HELP_USING_MAILBOX, 
    HELP_USING_PROF_OAKS_PC, 
    HELP_USING_HALL_OF_FAME, 
    HELP_END
};

static const u8 sHowTo_PlayersPCMailbox[] = {
    HELP_USING_PC, 
    HELP_USING_BILLS_PC, 
    HELP_USING_WITHDRAW, 
    HELP_USING_DEPOSIT, 
    HELP_USING_MOVE, 
    HELP_MOVING_ITEMS, 
    HELP_USING_PLAYERS_PC, 
    HELP_USING_WITHDRAW_ITEM, 
    HELP_USING_DEPOSIT_ITEM,
    HELP_USING_MAILBOX, 
    HELP_USING_PROF_OAKS_PC, 
    HELP_USING_HALL_OF_FAME, 
    HELP_END
};

static const u8 sHowTo_PCMisc[] = {
    HELP_USING_PC, 
    HELP_USING_BILLS_PC, 
    HELP_USING_WITHDRAW, 
    HELP_USING_DEPOSIT, 
    HELP_USING_MOVE, 
    HELP_MOVING_ITEMS, 
    HELP_USING_PLAYERS_PC, 
    HELP_USING_WITHDRAW_ITEM, 
    HELP_USING_DEPOSIT_ITEM,
    HELP_USING_MAILBOX, 
    HELP_USING_PROF_OAKS_PC, 
    HELP_USING_HALL_OF_FAME, 
    HELP_END
};

static const u8 sHowTo_BedroomPC[] = {
    HELP_USING_HOME_PC, 
    HELP_USING_ITEM_STORAGE, 
    HELP_USING_WITHDRAW_ITEM2, 
    HELP_USING_DEPOSIT_ITEM2, 
    HELP_USING_MAILBOX2, 
    HELP_END
};

static const u8 sHowTo_BedroomPCItems[] = {
    HELP_USING_HOME_PC, 
    HELP_USING_ITEM_STORAGE, 
    HELP_USING_WITHDRAW_ITEM2, 
    HELP_USING_DEPOSIT_ITEM2, 
    HELP_USING_MAILBOX2, 
    HELP_END
};

static const u8 sHowTo_BedroomPCMailbox[] = {
    HELP_USING_HOME_PC, 
    HELP_USING_ITEM_STORAGE, 
    HELP_USING_WITHDRAW_ITEM2, 
    HELP_USING_DEPOSIT_ITEM2, 
    HELP_USING_MAILBOX2, 
    HELP_END
};

static const u8 sTerms_Basic[] = {
    HELP_TERM_LEVEL, 
    HELP_TERM_HP, 
    HELP_TERM_EXP, 
    HELP_TERM_MOVES, 
    HELP_TERM_TM, 
    HELP_TERM_HM_MOVE, 
    HELP_TERM_HM, 
    HELP_TERM_ATTACK, 
    HELP_TERM_DEFENSE, 
    HELP_TERM_SPATK, 
    HELP_TERM_SPDEF, 
    HELP_TERM_SPEED, 
    HELP_TERM_TYPE, 
    HELP_TERM_OT, 
    HELP_TERM_ITEM, 
    HELP_TERM_ABILITY, 
    HELP_TERM_MOVE_TYPE, 
    HELP_TERM_NATURE, 
    HELP_TERM_ID_NO, 
    HELP_TERM_PP, 
    HELP_TERM_POWER, 
    HELP_TERM_ACCURACY, 
    HELP_TERM_STATUS_PROBLEM, 
    HELP_TERM_FNT, 
    HELP_TERM_EVOLUTION, 
    HELP_TERM_ITEMS, 
    HELP_TERM_KEYITEMS, 
    HELP_TERM_POKEBALLS, 
    HELP_TERM_PLAY_TIME, 
    HELP_TERM_MONEY, 
    HELP_TERM_BADGES, 
    HELP_END
};


// Cant get this to match as a 2D array but it probably should be one, [HELPCONTEXT_COUNT][TOPIC_COUNT - 1] (Excludes TOPIC_EXIT)
static const u8 *const sHelpSystemSubmenuItemLists[HELPCONTEXT_COUNT * (TOPIC_COUNT - 1)] = {
    NULL,                          NULL,                       NULL,                       NULL,                    NULL, // HELPCONTEXT_NONE
    NULL,                          NULL,                       NULL,                       sAboutGame_TitleScreen,  NULL, // HELPCONTEXT_TITLE_SCREEN
    NULL,                          NULL,                       NULL,                       sAboutGame_NewGame,      NULL, // HELPCONTEXT_NEW_GAME
    NULL,                          sHowTo_NamingScreen,        NULL,                       sAboutGame_NamingScreen, NULL, // HELPCONTEXT_NAMING_SCREEN
    NULL,                          sHowTo_Pokedex,             NULL,                       NULL,                    NULL, // HELPCONTEXT_POKEDEX
    NULL,                          sHowTo_PartyMenu,           sTerms_PartyMenu,           NULL,                    NULL, // HELPCONTEXT_PARTY_MENU
    NULL,                          sHowTo_PokemonInfo,         sTerms_PokemonInfo,         NULL,                    NULL, // HELPCONTEXT_POKEMON_INFO
    NULL,                          NULL,                       sTerms_PokemonSkills,       NULL,                    NULL, // HELPCONTEXT_POKEMON_SKILLS
    NULL,                          NULL,                       sTerms_PokemonMoves,        NULL,                    NULL, // HELPCONTEXT_POKEMON_MOVES
    NULL,                          sHowTo_Bag,                 sTerms_Bag,                 NULL,                    NULL, // HELPCONTEXT_BAG
    NULL,                          sHowTo_TrainerCardFront,    sTerms_TrainerCardFront,    NULL,                    NULL, // HELPCONTEXT_TRAINER_CARD_FRONT
    NULL,                          sHowTo_TrainerCardBack,     NULL,                       NULL,                    NULL, // HELPCONTEXT_TRAINER_CARD_BACK
    NULL,                          sHowTo_Save,                sTerms_Save,                NULL,                    NULL, // HELPCONTEXT_SAVE
    NULL,                          sHowTo_Options,             sTerms_Options,             NULL,                    NULL, // HELPCONTEXT_OPTIONS
    sWhatToDo_PlayersHouse,        NULL,                       NULL,                       sAboutGame_PlayersHouse, NULL, // HELPCONTEXT_PLAYERS_HOUSE
    sWhatToDo_OaksLab,             sHowTo_OaksLab,             sTerms_OaksLab,             NULL,                    NULL, // HELPCONTEXT_OAKS_LAB
    sWhatToDo_PokeCenter,          sHowTo_PokeCenter,          sTerms_PokeCenter,          sAboutGame_PokeCenter,   NULL, // HELPCONTEXT_POKECENTER
    sWhatToDo_Mart,                sHowTo_Mart,                sTerms_Mart,                NULL,                    NULL, // HELPCONTEXT_MART
    sWhatToDo_Gym,                 sHowTo_Gym,                 sTerms_Gym,                 NULL,                    sTypeMatchups_Gym, // HELPCONTEXT_GYM
    sWhatToDo_Indoors,             sHowTo_Indoors,             sTerms_Indoors,             NULL,                    NULL, // HELPCONTEXT_INDOORS
    sWhatToDo_Overworld,           sHowTo_Overworld,           sTerms_Overworld,           NULL,                    NULL, // HELPCONTEXT_OVERWORLD
    sWhatToDo_Dungeon,             sHowTo_Dungeon,             sTerms_Dungeon,             NULL,                    NULL, // HELPCONTEXT_DUNGEON
    sWhatToDo_Surfing,             sHowTo_Surfing,             sTerms_Surfing,             NULL,                    NULL, // HELPCONTEXT_SURFING
    sWhatToDo_WildBattle,          sHowTo_WildBattle,          sTerms_WildBattle,          NULL,                    sTypeMatchups_WildBattle, // HELPCONTEXT_WILD_BATTLE
    sWhatToDo_TrainerBattleSingle, sHowTo_TrainerBattleSingle, sTerms_TrainerBattleSingle, NULL,                    sTypeMatchups_TrainerBattleSingle, // HELPCONTEXT_TRAINER_BATTLE_SINGLE
    sWhatToDo_TrainerBattleDouble, sHowTo_TrainerBattleDouble, sTerms_TrainerBattleDouble, NULL,                    sTypeMatchups_TrainerBattleDouble, // HELPCONTEXT_TRAINER_BATTLE_DOUBLE
    sWhatToDo_SafariBattle,        sHowTo_SafariBattle,        sTerms_SafariBattle,        NULL,                    sTypeMatchups_SafariBattle, // HELPCONTEXT_SAFARI_BATTLE
    NULL,                          sHowTo_PC,                  NULL,                       NULL,                    NULL, // HELPCONTEXT_PC
    NULL,                          sHowTo_BillsPC,             NULL,                       NULL,                    NULL, // HELPCONTEXT_BILLS_PC
    NULL,                          sHowTo_PlayersPCItems,      NULL,                       NULL,                    NULL, // HELPCONTEXT_PLAYERS_PC_ITEMS
    NULL,                          sHowTo_PlayersPCMailbox,    NULL,                       NULL,                    NULL, // HELPCONTEXT_PLAYERS_PC_MAILBOX
    NULL,                          sHowTo_PCMisc,              NULL,                       NULL,                    NULL, // HELPCONTEXT_PC_MISC
    NULL,                          sHowTo_BedroomPC,           NULL,                       NULL,                    NULL, // HELPCONTEXT_BEDROOM_PC
    NULL,                          sHowTo_BedroomPCItems,      NULL,                       NULL,                    NULL, // HELPCONTEXT_BEDROOM_PC_ITEMS
    NULL,                          sHowTo_BedroomPCMailbox,    NULL,                       NULL,                    NULL, // HELPCONTEXT_BEDROOM_PC_MAILBOX
    NULL,                          NULL,                       NULL,                       NULL,                    NULL  // HELPCONTEXT_UNUSED
};

static const u16 sUnused[] = INCBIN_U16("graphics/help_system/unused.bin");

static const u8 sHelpSystemContextTopicOrder[TOPIC_COUNT] = {
    TOPIC_ABOUT_GAME, 
    TOPIC_WHAT_TO_DO, 
    TOPIC_HOW_TO_DO, 
    TOPIC_TERMS, 
    TOPIC_TYPE_MATCHUP, 
    TOPIC_EXIT
};

#define CONTEXT_TOPIC_FLAGS(whatToDo, howToDo, terms, aboutGame, typeMatchup, exit)     \
    {                                                                                   \
        [TOPIC_WHAT_TO_DO]   = whatToDo,                                                \
        [TOPIC_HOW_TO_DO]    = howToDo,                                                 \
        [TOPIC_TERMS]        = terms,                                                   \
        [TOPIC_ABOUT_GAME]   = aboutGame,                                               \
        [TOPIC_TYPE_MATCHUP] = typeMatchup,                                             \
        [TOPIC_EXIT]         = exit                                                     \
    }                                                                                   \

static const bool8 sHelpSystemContextTopicFlags[HELPCONTEXT_COUNT + 1][TOPIC_COUNT] = {
    [HELPCONTEXT_NONE]                  = CONTEXT_TOPIC_FLAGS(FALSE, FALSE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_TITLE_SCREEN]          = CONTEXT_TOPIC_FLAGS(FALSE, FALSE, FALSE,  TRUE, FALSE,  TRUE),
    [HELPCONTEXT_NEW_GAME]              = CONTEXT_TOPIC_FLAGS(FALSE, FALSE, FALSE,  TRUE, FALSE,  TRUE),
    [HELPCONTEXT_NAMING_SCREEN]         = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE,  TRUE, FALSE,  TRUE),
    [HELPCONTEXT_POKEDEX]               = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_PARTY_MENU]            = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_POKEMON_INFO]          = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_POKEMON_SKILLS]        = CONTEXT_TOPIC_FLAGS(FALSE, FALSE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_POKEMON_MOVES]         = CONTEXT_TOPIC_FLAGS(FALSE, FALSE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_BAG]                   = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_TRAINER_CARD_FRONT]    = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_TRAINER_CARD_BACK]     = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_SAVE]                  = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_OPTIONS]               = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_PLAYERS_HOUSE]         = CONTEXT_TOPIC_FLAGS( TRUE, FALSE, FALSE,  TRUE, FALSE,  TRUE),
    [HELPCONTEXT_OAKS_LAB]              = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_POKECENTER]            = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE,  TRUE, FALSE,  TRUE),
    [HELPCONTEXT_MART]                  = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_GYM]                   = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE,  TRUE,  TRUE),
    [HELPCONTEXT_INDOORS]               = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_OVERWORLD]             = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_DUNGEON]               = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_SURFING]               = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_WILD_BATTLE]           = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE,  TRUE,  TRUE),
    [HELPCONTEXT_TRAINER_BATTLE_SINGLE] = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE,  TRUE,  TRUE),
    [HELPCONTEXT_TRAINER_BATTLE_DOUBLE] = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE,  TRUE,  TRUE),
    [HELPCONTEXT_SAFARI_BATTLE]         = CONTEXT_TOPIC_FLAGS( TRUE,  TRUE,  TRUE, FALSE,  TRUE,  TRUE),
    [HELPCONTEXT_PC]                    = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_BILLS_PC]              = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_PLAYERS_PC_ITEMS]      = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_PLAYERS_PC_MAILBOX]    = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_PC_MISC]               = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_BEDROOM_PC]            = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_BEDROOM_PC_ITEMS]      = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_BEDROOM_PC_MAILBOX]    = CONTEXT_TOPIC_FLAGS(FALSE,  TRUE, FALSE, FALSE, FALSE,  TRUE),
    [HELPCONTEXT_UNUSED]                = {},
    [HELPCONTEXT_COUNT]                 = {}
};

static const u16 sMartMaps[] = {
    MAP_VIRIDIAN_CITY_MART,
    MAP_PEWTER_CITY_MART,
    MAP_CERULEAN_CITY_MART,
    MAP_LAVENDER_TOWN_MART,
    MAP_VERMILION_CITY_MART,
    MAP_CELADON_CITY_DEPARTMENT_STORE_1F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_2F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_3F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_4F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_5F,
    MAP_CELADON_CITY_DEPARTMENT_STORE_ROOF,
    MAP_CELADON_CITY_DEPARTMENT_STORE_ELEVATOR,
    MAP_FUCHSIA_CITY_MART,
    MAP_CINNABAR_ISLAND_MART,
    MAP_SAFFRON_CITY_MART,
    MAP_THREE_ISLAND_MART,
    MAP_FOUR_ISLAND_MART,
    MAP_SEVEN_ISLAND_MART,
    MAP_SIX_ISLAND_MART,
    MAP_UNDEFINED
};

static const u16 sGymMaps[] = {
    MAP_PEWTER_CITY_GYM,
    MAP_CERULEAN_CITY_GYM,
    MAP_VERMILION_CITY_GYM,
    MAP_CELADON_CITY_GYM,
    MAP_FUCHSIA_CITY_GYM,
    MAP_SAFFRON_CITY_GYM,
    MAP_CINNABAR_ISLAND_GYM,
    MAP_VIRIDIAN_CITY_GYM,
    MAP_UNDEFINED
};

static const u8 sDungeonMaps[][3] = {
    { MAP_GROUP(VIRIDIAN_FOREST), MAP_NUM(VIRIDIAN_FOREST), 1 },
    { MAP_GROUP(MT_MOON_1F), MAP_NUM(MT_MOON_1F), 3 },
    { MAP_GROUP(ROCK_TUNNEL_1F), MAP_NUM(ROCK_TUNNEL_1F), 2 },
    { MAP_GROUP(DIGLETTS_CAVE_NORTH_ENTRANCE), MAP_NUM(DIGLETTS_CAVE_NORTH_ENTRANCE), 3 },
    { MAP_GROUP(SEAFOAM_ISLANDS_1F), MAP_NUM(SEAFOAM_ISLANDS_1F), 5 },
    { MAP_GROUP(VICTORY_ROAD_1F), MAP_NUM(VICTORY_ROAD_1F), 3 },
    { MAP_GROUP(CERULEAN_CAVE_1F), MAP_NUM(CERULEAN_CAVE_1F), 3 },
    { MAP_GROUP(MT_EMBER_RUBY_PATH_B4F), MAP_NUM(MT_EMBER_RUBY_PATH_B4F), 1 },
    { MAP_GROUP(MT_EMBER_SUMMIT_PATH_1F), MAP_NUM(MT_EMBER_SUMMIT_PATH_1F), 3 },
    { MAP_GROUP(MT_EMBER_RUBY_PATH_B5F), MAP_NUM(MT_EMBER_RUBY_PATH_B5F), 7 },
    { MAP_GROUP(THREE_ISLAND_BERRY_FOREST), MAP_NUM(THREE_ISLAND_BERRY_FOREST), 1 },
    { MAP_GROUP(SIX_ISLAND_PATTERN_BUSH), MAP_NUM(SIX_ISLAND_PATTERN_BUSH), 1 },
    { MAP_GROUP(FIVE_ISLAND_LOST_CAVE_ENTRANCE), MAP_NUM(FIVE_ISLAND_LOST_CAVE_ENTRANCE), 15 },
    { MAP_GROUP(FOUR_ISLAND_ICEFALL_CAVE_ENTRANCE), MAP_NUM(FOUR_ISLAND_ICEFALL_CAVE_ENTRANCE), 4 },
    { MAP_GROUP(SIX_ISLAND_ALTERING_CAVE), MAP_NUM(SIX_ISLAND_ALTERING_CAVE), 1 },
    { MAP_GROUP(SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER), MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER), 7 }
};

void SetHelpContextDontCheckBattle(u8 contextId)
{
    sHelpSystemContextId = contextId;
}

void SetHelpContext(u8 contextId)
{
    switch (sHelpSystemContextId)
    {
    case HELPCONTEXT_WILD_BATTLE:
    case HELPCONTEXT_TRAINER_BATTLE_SINGLE:
    case HELPCONTEXT_TRAINER_BATTLE_DOUBLE:
    case HELPCONTEXT_SAFARI_BATTLE:
        if (contextId == HELPCONTEXT_BAG 
         || contextId == HELPCONTEXT_PARTY_MENU 
         || contextId == HELPCONTEXT_POKEMON_INFO 
         || contextId == HELPCONTEXT_POKEMON_SKILLS 
         || contextId == HELPCONTEXT_POKEMON_MOVES)
            break;
        // fallthrough
    default:
        sHelpSystemContextId = contextId;
        break;
    }
}

void Script_SetHelpContext(void)
{
    sHelpSystemContextId = gSpecialVar_0x8004;
}

void BackupHelpContext(void)
{
    gHelpContextIdBackup = sHelpSystemContextId;
}

void RestoreHelpContext(void)
{
    sHelpSystemContextId = gHelpContextIdBackup;
}

static bool32 IsInMartMap(void)
{
    return IsCurrentMapInArray(sMartMaps);
}

static bool32 IsInGymMap(void)
{
    return IsCurrentMapInArray(sGymMaps);
}

static bool32 IsCurrentMapInArray(const u16 * mapIdxs)
{
    u16 mapIdx = (gSaveBlock1Ptr->location.mapGroup << 8) + gSaveBlock1Ptr->location.mapNum;
    s32 i;

    for (i = 0; mapIdxs[i] != MAP_UNDEFINED; i++)
    {
        if (mapIdxs[i] == mapIdx)
            return TRUE;
    }

    return FALSE;
}

static bool8 IsInDungeonMap(void)
{
    u8 i, j;

    for (i = 0; i < NELEMS(sDungeonMaps); i++)
    {
        for (j = 0; j < sDungeonMaps[i][2]; j++)
        {
            if (
                   sDungeonMaps[i][0] == gSaveBlock1Ptr->location.mapGroup
                && sDungeonMaps[i][1] + j == gSaveBlock1Ptr->location.mapNum
                && (i != 15 /* TANOBY */ || FlagGet(FLAG_SYS_UNLOCKED_TANOBY_RUINS) == TRUE)
            )
                return TRUE;
        }
    }

    return FALSE;
}

#define IN_PLAYERS_HOUSE \
    ((gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F) \
  && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F))     \
 || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_2F)  \
  && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_2F)))    \

 #define IN_OAKS_LAB \
    (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PROFESSOR_OAKS_LAB) \
  && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PROFESSOR_OAKS_LAB))    \

void SetHelpContextForMap(void)
{
    HelpSystem_EnableToggleWithRButton();
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        SetHelpContext(HELPCONTEXT_SURFING);
    else if (IsInDungeonMap())
        SetHelpContext(HELPCONTEXT_DUNGEON);
    else if (IsMapTypeIndoors(gMapHeader.mapType))
    {
        if (IN_PLAYERS_HOUSE)
            SetHelpContext(HELPCONTEXT_PLAYERS_HOUSE);
        else if (IN_OAKS_LAB)
            SetHelpContext(HELPCONTEXT_OAKS_LAB);
        else if (IsCurMapPokeCenter() == TRUE)
            SetHelpContext(HELPCONTEXT_POKECENTER);
        else if (IsInMartMap() == TRUE)
            SetHelpContext(HELPCONTEXT_MART);
        else if (IsInGymMap() == TRUE)
            SetHelpContext(HELPCONTEXT_GYM);
        else
            SetHelpContext(HELPCONTEXT_INDOORS);
    }
    else
        SetHelpContext(HELPCONTEXT_OVERWORLD);
}

bool8 HelpSystem_UpdateHasntSeenIntro(void)
{
    if (sSeenHelpSystemIntro == TRUE)
        return FALSE;

    if (gSaveFileStatus != SAVE_STATUS_EMPTY && gSaveFileStatus != SAVE_STATUS_INVALID && FlagGet(FLAG_SYS_SAW_HELP_SYSTEM_INTRO))
        return FALSE;

    FlagSet(FLAG_SYS_SAW_HELP_SYSTEM_INTRO);
    sSeenHelpSystemIntro = TRUE;
    return TRUE;
}

bool8 HelpSystem_IsSinglePlayer(void)
{
    if (gReceivedRemoteLinkPlayers == TRUE)
        return FALSE;
    return TRUE;
}

void HelpSystem_Disable(void)
{
    gHelpSystemEnabled = FALSE;
}

void HelpSystem_Enable(void)
{
    if (!QL_IS_PLAYBACK_STATE)
    {
        gHelpSystemEnabled = TRUE;
        HelpSystem_EnableToggleWithRButton();
    }
}

void HelpSystem_DisableToggleWithRButton(void)
{
    gHelpSystemToggleWithRButtonDisabled = TRUE;
}

void HelpSystem_EnableToggleWithRButton(void)
{
    gHelpSystemToggleWithRButtonDisabled = FALSE;
}

static void ResetHelpSystemListMenu(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    helpListMenu->sub.items = listMenuItemsBuffer;
    helpListMenu->sub.totalItems = 1;
    helpListMenu->sub.maxShowed = 1;
    helpListMenu->sub.left = 1;
    helpListMenu->sub.top = 4;
}

static void BuildAndPrintMainTopicsListMenu(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    ResetHelpSystemListMenu(helpListMenu, listMenuItemsBuffer);
    BuildMainTopicsListAndMoveToH00(helpListMenu, listMenuItemsBuffer);
    PrintTextOnPanel2Row52RightAlign(gText_HelpSystemControls_PickOkEnd);
    HelpSystem_InitListMenuController(helpListMenu, 0, gHelpSystemState.scrollMain);
    PrintHelpSystemTopicMouseoverDescription(helpListMenu, listMenuItemsBuffer);
    HS_ShowOrHideMainWindowText(1);
    HS_ShowOrHideControlsGuideInTopRight(1);
}

static void BuildMainTopicsListAndMoveToH00(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    u8 i;
    u8 totalItems = 0;
    for (i = 0; i < TOPIC_COUNT; i++)
    {
        if (sHelpSystemContextTopicFlags[sHelpSystemContextId][sHelpSystemContextTopicOrder[i]] == TRUE)
        {
            listMenuItemsBuffer[totalItems].label = sHelpSystemTopicPtrs[sHelpSystemContextTopicOrder[i]];
            listMenuItemsBuffer[totalItems].index = sHelpSystemContextTopicOrder[i];
            totalItems++;
        }
    }
    listMenuItemsBuffer[totalItems - 1].index = -2;
    helpListMenu->sub.totalItems = totalItems;
    helpListMenu->sub.maxShowed = totalItems;
    helpListMenu->sub.left = 0;
}

static void BuildAndPrintSubmenuList(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    HS_SetMainWindowBgBrightness(0);
    HS_ShowOrHideHeaderLine_Darker_FooterStyle(0);
    HS_ShowOrHideHeaderAndFooterLines_Lighter(1);
    ResetHelpSystemListMenu(helpListMenu, listMenuItemsBuffer);
    SetHelpSystemSubmenuItems(helpListMenu, listMenuItemsBuffer);
    PrintTextOnPanel2Row52RightAlign(gText_HelpSystemControls_PickOkCancel);
    HelpSystem_InitListMenuController(helpListMenu, helpListMenu->itemsAbove, helpListMenu->cursorPos);
    HelpSystem_PrintTextAt(sHelpSystemTopicPtrs[gHelpSystemState.topic], 0, 0);
    HS_ShowOrHideMainWindowText(1);
    HS_ShowOrHideControlsGuideInTopRight(1);
}

static void SetHelpSystemSubmenuItems(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    u8 totalItems = 0;
    const u8 * submenuItems = sHelpSystemSubmenuItemLists[sHelpSystemContextId * 5 + gHelpSystemState.topic]; // accessing as 2D array
    u8 i;
    for (i = 0; submenuItems[i] != HELP_END; i++)
    {
        if (IsHelpSystemSubmenuEnabled(submenuItems[i]) == TRUE)
        {
            if (gHelpSystemState.topic == TOPIC_WHAT_TO_DO)
                listMenuItemsBuffer[totalItems].label = sHelpSystemSpecializedQuestionTextPtrs[submenuItems[i]];
            else if (gHelpSystemState.topic == TOPIC_HOW_TO_DO)
                listMenuItemsBuffer[totalItems].label = sHelpSystemMenuTopicTextPtrs[submenuItems[i]];
            else if (gHelpSystemState.topic == TOPIC_TERMS)
                listMenuItemsBuffer[totalItems].label = sHelpSystemTermTextPtrs[submenuItems[i]];
            else if (gHelpSystemState.topic == TOPIC_ABOUT_GAME)
                listMenuItemsBuffer[totalItems].label = sHelpSystemGeneralTopicTextPtrs[submenuItems[i]];
            else // TOPIC_TYPE_MATCHUP
                listMenuItemsBuffer[totalItems].label = sHelpSystemTypeMatchupTextPtrs[submenuItems[i]];
            listMenuItemsBuffer[totalItems].index = submenuItems[i];
            totalItems++;
        }
    }
    if (HelpSystem_ShouldShowBasicTerms() == TRUE)
    {
        for (i = 0, submenuItems = sTerms_Basic; submenuItems[i] != HELP_END; i++)
        {
            listMenuItemsBuffer[totalItems].label = sHelpSystemTermTextPtrs[submenuItems[i]];
            listMenuItemsBuffer[totalItems].index = submenuItems[i];
            totalItems++;
        }
    }
    listMenuItemsBuffer[totalItems].label = Help_Text_Cancel;
    listMenuItemsBuffer[totalItems].index = -2;
    totalItems++;
    helpListMenu->sub.totalItems = totalItems;
    helpListMenu->sub.maxShowed = 7;
    helpListMenu->sub.left = 0;
    helpListMenu->sub.top = 21;
}

static bool8 HelpSystem_ShouldShowBasicTerms(void)
{
    if (FlagGet(FLAG_DEFEATED_BROCK) == TRUE && gHelpSystemState.topic == TOPIC_TERMS)
        return TRUE;
    return FALSE;
}

static bool8 IsHelpSystemSubmenuEnabled(u8 id)
{
    u8 i = 0;

    if (gHelpSystemState.topic == TOPIC_WHAT_TO_DO)
    {
        switch (id)
        {
        case HELP_PLAYING_FOR_FIRST_TIME:
        case HELP_WHAT_SHOULD_I_BE_DOING:
        case HELP_CANT_GET_OUT_OF_ROOM:
        case HELP_TALKED_TO_EVERYONE_NOW_WHAT:
        case HELP_OUT_OF_THINGS_TO_DO:
        case HELP_NOTHING_I_WANT_TO_KNOW:
        case HELP_WHATS_A_MON:
        case HELP_WHAT_DO_I_DO_IN_SAFARI:
        case HELP_WHAT_ARE_SAFARI_RULES:
        case HELP_WANT_TO_END_SAFARI:
            return TRUE;
        case HELP_CANT_FIND_PERSON_I_WANT:
            return FlagGet(FLAG_VISITED_OAKS_LAB);
        case HELP_SOMEONE_BLOCKING_MY_WAY:
        case HELP_WHAT_ARE_MY_ADVENTURE_BASICS:
        case HELP_HOW_DO_I_PREPARE_FOR_BATTLE:
        case HELP_WHAT_IS_STATUS_PROBLEM:
        case HELP_RAN_OUT_OF_POTIONS:
        case HELP_WHATS_POKEMON_CENTER:
        case HELP_WHATS_POKEMON_MART:
            return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_CITY);
        case HELP_I_CANT_GO_ON:
            return FlagGet(FLAG_WORLD_MAP_VERMILION_CITY);
        case HELP_HOW_ARE_ROADS_FORESTS_DIFFERENT:
        case HELP_WHATS_A_TRAINER:
            return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_FOREST);
        case HELP_WHAT_HAPPENED_TO_ITEM_I_GOT:
        case HELP_WHEN_CAN_I_USE_ITEM:
        case HELP_HOW_DO_I_PROGRESS:
        case HELP_WHATS_A_BATTLE:
        case HELP_WHAT_IS_A_MONS_VITALITY:
        case HELP_MY_MONS_ARE_HURT:
        case HELP_WHAT_HAPPENS_IF_ALL_MY_MONS_FAINT:
        case HELP_WHERE_DO_MONS_APPEAR:
        case HELP_WHAT_MOVES_SHOULD_I_USE:
        case HELP_WANT_TO_MAKE_MON_STRONGER:
        case HELP_WANT_TO_END_GAME:
            return FlagGet(FLAG_SYS_POKEMON_GET);
        case HELP_CANT_CATCH_MONS:
        case HELP_CAN_I_BUY_POKEBALLS:
            return FlagGet(FLAG_SYS_POKEDEX_GET);
        case HELP_HOW_ARE_CAVES_DIFFERENT:
        case HELP_WHAT_DO_I_DO_IN_CAVE:
        case HELP_HOW_DO_I_WIN_AGAINST_TRAINER:
        case HELP_FOE_MONS_TOO_STRONG:
        case HELP_WHAT_ARE_MOVES:
        case HELP_WANT_TO_ADD_MORE_MOVES:
            return FlagGet(FLAG_BADGE01_GET);
        case HELP_WHAT_ARE_HIDDEN_MOVES:
        case HELP_WHAT_DOES_HIDDEN_MOVE_DO:
            return HasGottenAtLeastOneHM();
        case HELP_WHAT_IS_THAT_PERSON_LIKE:
            return FlagGet(FLAG_GOT_FAME_CHECKER);
        case HELP_WHAT_IS_A_GYM:
            return FlagGet(FLAG_WORLD_MAP_PEWTER_CITY);
        }
        return FALSE;
    }
    if (gHelpSystemState.topic == TOPIC_HOW_TO_DO)
    {
        switch (id)
        {
        case HELP_USING_BAG:
        case HELP_USING_PLAYER:
        case HELP_USING_SAVE:
        case HELP_USING_OPTION:
        case HELP_ENTERING_NAME:
        case HELP_USING_PC:
        case HELP_USING_BILLS_PC:
        case HELP_USING_WITHDRAW:
        case HELP_USING_DEPOSIT:
        case HELP_USING_MOVE:
        case HELP_MOVING_ITEMS:
        case HELP_USING_PLAYERS_PC:
        case HELP_USING_WITHDRAW_ITEM:
        case HELP_USING_DEPOSIT_ITEM:
        case HELP_USING_MAILBOX:
        case HELP_OPENING_MENU:
        case HELP_USING_BAG2:
        case HELP_USING_HOME_PC:
        case HELP_USING_ITEM_STORAGE:
        case HELP_USING_WITHDRAW_ITEM2:
        case HELP_USING_DEPOSIT_ITEM2:
        case HELP_USING_MAILBOX2:
        case HELP_USING_BALL:
        case HELP_USING_BAIT:
        case HELP_USING_ROCK:
            return TRUE;
        case HELP_USING_POKEDEX:
        case HELP_USING_PROF_OAKS_PC:
        case HELP_READING_POKEDEX:
            return FlagGet(FLAG_SYS_POKEDEX_GET);
        case HELP_USING_TOWN_MAP:
            return CheckBagHasItem(ITEM_TOWN_MAP, 1);
        case HELP_USING_POKEMON:
        case HELP_USING_SUMMARY:
        case HELP_USING_ITEM:
        case HELP_USING_AN_ITEM:
        case HELP_USING_KEYITEM:
        case HELP_USING_POKEBALL:
        case HELP_USING_POTION:
        case HELP_USING_FIGHT:
        case HELP_USING_POKEMON2:
        case HELP_USING_SUMMARY2:
        case HELP_USING_RUN:
        case HELP_REGISTER_KEY_ITEM:
            return FlagGet(FLAG_SYS_POKEMON_GET);
        case HELP_USING_SWITCH:
        case HELP_USING_SHIFT:
            // Only show if player has caught mon after starter
            if (GetKantoPokedexCount(1) > 1)
                return TRUE;
            return FALSE;
        case HELP_USING_TM:
            return FlagGet(FLAG_BADGE01_GET);
        case HELP_USING_HM:
        case HELP_USING_MOVE_OUTSIDE_OF_BATTLE:
            return HasGottenAtLeastOneHM();
        case HELP_RIDING_BICYCLE:
            return FlagGet(FLAG_GOT_BICYCLE);
        case HELP_USING_HALL_OF_FAME:
            return FlagGet(FLAG_SYS_GAME_CLEAR);
        }
        return FALSE;
    }
    if (gHelpSystemState.topic == TOPIC_TERMS)
    {
        if (HelpSystem_ShouldShowBasicTerms() == TRUE)
        {
            // After defeating Brock, all basic terms are added
            // This checks to make sure they arent added twice
            for (i = 0; sTerms_Basic[i] != HELP_END; i++)
            {
                if (sTerms_Basic[i] == id)
                    return FALSE;
            }
        }
        switch (id)
        {
        case HELP_TERM_MONEY:
        case HELP_TERM_ID_NO:
        case HELP_TERM_ITEMS:
        case HELP_TERM_KEYITEMS:
        case HELP_TERM_POKEBALLS:
        case HELP_TERM_POKEDEX:
        case HELP_TERM_PLAY_TIME:
        case HELP_TERM_BADGES:
        case HELP_TERM_TEXT_SPEED:
        case HELP_TERM_BATTLE_SCENE:
        case HELP_TERM_BATTLE_STYLE:
        case HELP_TERM_SOUND:
        case HELP_TERM_BUTTON_MODE:
        case HELP_TERM_FRAME:
        case HELP_TERM_CANCEL:
        case HELP_TERM_TM:
        case HELP_TERM_EVOLUTION:
            return TRUE;
        case HELP_TERM_HP:
        case HELP_TERM_EXP:
        case HELP_TERM_ATTACK:
        case HELP_TERM_DEFENSE:
        case HELP_TERM_SPATK:
        case HELP_TERM_SPDEF:
        case HELP_TERM_SPEED:
        case HELP_TERM_LEVEL:
        case HELP_TERM_TYPE:
        case HELP_TERM_OT:
        case HELP_TERM_ITEM:
        case HELP_TERM_ABILITY:
        case HELP_TERM_NATURE:
        case HELP_TERM_POWER:
        case HELP_TERM_ACCURACY:
        case HELP_TERM_FNT:
            return FlagGet(FLAG_SYS_POKEMON_GET);
        case HELP_TERM_HM:
        case HELP_TERM_HM_MOVE:
            return HasGottenAtLeastOneHM();
        case HELP_TERM_MOVES:
        case HELP_TERM_MOVE_TYPE:
        case HELP_TERM_PP:
        case HELP_TERM_STATUS_PROBLEM:
            return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_FOREST);
        }
        return TRUE;
    }
    if (gHelpSystemState.topic == TOPIC_ABOUT_GAME)
    {
        switch (id)
        {
        case HELP_GAME_FUNDAMENTALS_2:
            return FlagGet(FLAG_BADGE01_GET);
        case HELP_GAME_FUNDAMENTALS_3:
            return FlagGet(FLAG_BADGE02_GET);
        }
        return TRUE;
    }
    if (gHelpSystemState.topic == TOPIC_TYPE_MATCHUP)
    {
        return TRUE;
    }

    return FALSE;
}

static bool8 HasGottenAtLeastOneHM(void)
{
    if (FlagGet(FLAG_GOT_HM01) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM02) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM03) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM04) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM05) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_GOT_HM06) == TRUE)
        return TRUE;
    if (FlagGet(FLAG_HIDE_FOUR_ISLAND_ICEFALL_CAVE_1F_HM07) == TRUE)
        return TRUE;
    return FALSE;
}

bool8 RunHelpMenuSubroutine(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    switch (helpListMenu->state)
    {
    case  8:
        return HelpSystemSubroutine_PrintWelcomeMessage(helpListMenu, listMenuItemsBuffer);
    case  9:
        return HelpSystemSubroutine_WelcomeWaitButton(helpListMenu, listMenuItemsBuffer);
    case 10:
        return HelpSystemSubroutine_WelcomeEndGotoMenu(helpListMenu, listMenuItemsBuffer);
    case  0:
        return HelpSystemSubroutine_MenuInputHandlerMain(helpListMenu, listMenuItemsBuffer);
    case  1:
        return HelpMenuSubroutine_InitSubmenu(helpListMenu, listMenuItemsBuffer);
    case  2:
        return HelpMenuSubroutine_ReturnFromSubmenu(helpListMenu, listMenuItemsBuffer);
    case  3:
        return HelpMenuSubroutine_SubmenuInputHandler(helpListMenu, listMenuItemsBuffer);
    case  4:
        return HelpMenuSubroutine_HelpItemPrint(helpListMenu, listMenuItemsBuffer);
    case  5:
        return HelpMenuSubroutine_ReturnFromHelpItem(helpListMenu, listMenuItemsBuffer);
    case  6:
        return HelpMenuSubroutine_HelpItemWaitButton(helpListMenu, listMenuItemsBuffer);
    }
    return FALSE;
}

bool8 HelpSystemSubroutine_PrintWelcomeMessage(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    PrintTextOnPanel2Row52RightAlign(gText_HelpSystemControls_A_Next);
    PrintWelcomeMessageOnPanel1();
    HS_ShowOrHideMainWindowText(1);
    HS_ShowOrHideControlsGuideInTopRight(1);
    helpListMenu->state = 9;
    return TRUE;
}

bool8 HelpSystemSubroutine_WelcomeWaitButton(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        helpListMenu->state = 10;
    }
    return TRUE;
}

bool8 HelpSystemSubroutine_WelcomeEndGotoMenu(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    gHelpSystemState.scrollMain = 0;
    ResetHelpSystemCursor(helpListMenu);
    BuildAndPrintMainTopicsListMenu(helpListMenu, listMenuItemsBuffer);
    helpListMenu->state = 0;
    return TRUE;
}

bool8 HelpSystemSubroutine_MenuInputHandlerMain(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    s32 input = HelpSystem_GetMenuInput();
    switch (input)
    {
    case -6:
    case -2:
        return FALSE;
    case -5:
    case -4:
        PrintHelpSystemTopicMouseoverDescription(helpListMenu, listMenuItemsBuffer);
        break;
    case -3:
    case -1:
        break;
    default:
        gHelpSystemState.topic = input;
        helpListMenu->state = 1;
        break;
    }
    return TRUE;
}

bool8 HelpMenuSubroutine_InitSubmenu(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    gHelpSystemState.level = 1;
    gHelpSystemState.scrollMain = helpListMenu->cursorPos;
    ResetHelpSystemCursor(helpListMenu);
    BuildAndPrintSubmenuList(helpListMenu, listMenuItemsBuffer);
    HS_UpdateMenuScrollArrows();
    HelpSystem_SetInputDelay(2);
    helpListMenu->state = 3;
    return TRUE;
}

bool8 HelpMenuSubroutine_ReturnFromSubmenu(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    HS_ShowOrHideScrollArrows(0, 0);
    HS_ShowOrHideScrollArrows(1, 0);
    gHelpSystemState.level = 0;
    BuildAndPrintMainTopicsListMenu(helpListMenu, listMenuItemsBuffer);
    helpListMenu->state = 0;
    return TRUE;
}

bool8 HelpMenuSubroutine_SubmenuInputHandler(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    s32 input = HelpSystem_GetMenuInput();
    switch (input)
    {
    case -6:
        return FALSE;
    case -2:
        helpListMenu->state = 2;
        break;
    case -5:
    case -4:
    case -3:
    case -1:
        break;
    default:
        gHelpSystemState.scrollSub = input;
        helpListMenu->state = 4;
        break;
    }
    return TRUE;
}

void HelpSystem_PrintTopicLabel(void)
{
    HelpSystem_PrintTextAt(sHelpSystemTopicPtrs[gHelpSystemState.topic], 0, 0);
}

bool8 HelpMenuSubroutine_HelpItemPrint(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    gHelpSystemState.level = 2;
    HS_ShowOrHideMainWindowText(0);
    HelpSystem_FillPanel1();
    PrintTextOnPanel2Row52RightAlign(gText_HelpSystemControls_AorBtoCancel);
    HS_SetMainWindowBgBrightness(1);
    HS_ShowOrHideHeaderAndFooterLines_Darker(1);

    if (gHelpSystemState.topic == TOPIC_WHAT_TO_DO)
    {
        HelpSystem_PrintQuestionAndAnswerPair(sHelpSystemSpecializedQuestionTextPtrs[gHelpSystemState.scrollSub], sHelpSystemSpecializedAnswerTextPtrs[gHelpSystemState.scrollSub]);
    }
    else if (gHelpSystemState.topic == TOPIC_HOW_TO_DO)
    {
        HelpSystem_PrintQuestionAndAnswerPair(sHelpSystemMenuTopicTextPtrs[gHelpSystemState.scrollSub], sHelpSystemHowToUseMenuTextPtrs[gHelpSystemState.scrollSub]);
    }
    else if (gHelpSystemState.topic == TOPIC_TERMS)
    {
        HelpSystem_PrintQuestionAndAnswerPair(sHelpSystemTermTextPtrs[gHelpSystemState.scrollSub], sHelpSystemTermDefinitionsTextPtrs[gHelpSystemState.scrollSub]);
    }
    else if (gHelpSystemState.topic == TOPIC_ABOUT_GAME)
    {
        HelpSystem_PrintQuestionAndAnswerPair(sHelpSystemGeneralTopicTextPtrs[gHelpSystemState.scrollSub], sHelpSystemGeneralTopicDescriptionTextPtrs[gHelpSystemState.scrollSub]);
    }
    else // TOPIC_TYPE_MATCHUP
    {
        HelpSystem_PrintQuestionAndAnswerPair(sHelpSystemTypeMatchupTextPtrs[gHelpSystemState.scrollSub], sHelpSystemTypeMatchupDescriptionTextPtrs[gHelpSystemState.scrollSub]);
    }
    HS_ShowOrHideMainWindowText(1);
    HS_ShowOrHideControlsGuideInTopRight(1);
    helpListMenu->state = 6;
    return TRUE;
}

bool8 HelpMenuSubroutine_ReturnFromHelpItem(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    gHelpSystemState.level = 1;
    BuildAndPrintSubmenuList(helpListMenu, listMenuItemsBuffer);
    HS_UpdateMenuScrollArrows();
    HelpSystem_SetInputDelay(2);
    helpListMenu->state = 3;
    return TRUE;
}

bool8 HelpMenuSubroutine_HelpItemWaitButton(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    if (JOY_NEW(B_BUTTON) || JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        helpListMenu->state = 5;
        return TRUE;
    }
    if (JOY_NEW(L_BUTTON | R_BUTTON))
        return FALSE;
    return TRUE;
}

static void PrintWelcomeMessageOnPanel1(void)
{
    HelpSystem_FillPanel1();
    HelpSystem_PrintTextAt(Help_Text_Greetings, 0, 0);
}

static void PrintTextOnPanel2Row52RightAlign(const u8 * str)
{
    HelpSystem_FillPanel2();
    HelpSystem_PrintTextRightAlign_Row52(str);
}

u8 GetHelpSystemMenuLevel(void)
{
    return gHelpSystemState.level;
}

static void ResetHelpSystemCursor(struct HelpSystemListMenu * helpListMenu)
{
    helpListMenu->itemsAbove = 0;
    helpListMenu->cursorPos = 0;
}

static void PrintHelpSystemTopicMouseoverDescription(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    s32 index = listMenuItemsBuffer[helpListMenu->itemsAbove + helpListMenu->cursorPos].index;
    if (index == -2)
        HelpSystem_PrintTopicMouseoverDescription(sHelpSystemTopicMouseoverDescriptionPtrs[5]);
    else
        HelpSystem_PrintTopicMouseoverDescription(sHelpSystemTopicMouseoverDescriptionPtrs[index]);
    HS_ShowOrHideToplevelTooltipWindow(1);
}
