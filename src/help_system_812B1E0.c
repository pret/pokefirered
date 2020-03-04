#include "global.h"
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
#include "sound.h"
#include "strings.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/songs.h"

static EWRAM_DATA u16 sHelpSystemContextId = 0;
static EWRAM_DATA u8 sSeenHelpSystemIntro = 0;

u8 gHelpSystemState[4];
u16 gHelpContextIdBackup;

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

#define HELP_NONE  0
#define HELP_END   0xFF

// Help Main Topics
enum
{
    TOPIC_WHAT_TO_DO,
    TOPIC_HOW_TO_DO,
    TOPIC_TERMS,
    TOPIC_ABOUT_GAME,
    TOPIC_TYPE_MATCHUP,
    TOPIC_EXIT,
    TOPIC_COUNT
};

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
    NULL,
    Help_Text_PlayingForFirstTime,
    Help_Text_WhatShouldIBeDoing,
    Help_Text_CantGetOutOfRoom,
    Help_Text_CantFindPersonIWant,
    Help_Text_TalkedToEveryoneNowWhat,
    Help_Text_SomeoneBlockingMyWay,
    Help_Text_ICantGoOn,
    Help_Text_OutOfThingsToDo,
    Help_Text_WhatHappenedToItemIGot,
    Help_Text_WhatAreMyAdventureBasics,
    Help_Text_HowAreRoadsForestsDifferent,
    Help_Text_HowAreCavesDifferent,
    Help_Text_HowDoIProgress,
    Help_Text_WhenCanIUseItem,
    Help_Text_WhatsABattle,
    Help_Text_HowDoIPrepareForBattle,
    Help_Text_WhatIsAMonsVitality,
    Help_Text_MyMonsAreHurt,
    Help_Text_WhatIsStatusProblem,
    Help_Text_WhatHappensIfAllMyMonsFaint,
    Help_Text_CantCatchMons,
    Help_Text_RanOutOfPotions,
    Help_Text_CanIBuyPokeBalls,
    Help_Text_WhatsATrainer,
    Help_Text_HowDoIWinAgainstTrainer,
    Help_Text_WhereDoMonsAppear,
    Help_Text_WhatAreMoves,
    Help_Text_WhatAreHiddenMoves,
    Help_Text_WhatMovesShouldIUse,
    Help_Text_WantToAddMoreMoves,
    Help_Text_WantToMakeMonStronger,
    Help_Text_FoeMonsTooStrong,
    Help_Text_WhatDoIDoInCave,
    Help_Text_NothingIWantToKnow,
    Help_Text_WhatsPokemonCenter,
    Help_Text_WhatsPokemonMart,
    Help_Text_WantToEndGame,
    Help_Text_WhatsAMon,
    Help_Text_WhatIsThatPersonLike,
    Help_Text_WhatDoesHiddenMoveDo,
    Help_Text_WhatDoIDoInSafari,
    Help_Text_WhatAreSafariRules,
    Help_Text_WantToEndSafari,
    Help_Text_WhatIsAGym
};

static const u8 *const sHelpSystemSpecializedAnswerTextPtrs[] = {
    NULL,
    Help_Text_AnswerPlayingForFirstTime,
    Help_Text_AnswerWhatShouldIBeDoing,
    Help_Text_AnswerCantGetOutOfRoom,
    Help_Text_AnswerCantFindPersonIWant,
    Help_Text_AnswerTalkedToEveryoneNowWhat,
    Help_Text_AnswerSomeoneBlockingMyWay,
    Help_Text_AnswerICantGoOn,
    Help_Text_AnswerOutOfThingsToDo,
    Help_Text_AnswerWhatHappenedToItemIGot,
    Help_Text_AnswerWhatAreMyAdventureBasics,
    Help_Text_AnswerHowAreRoadsForestsDifferent,
    Help_Text_AnswerHowAreCavesDifferent,
    Help_Text_AnswerHowDoIProgress,
    Help_Text_AnswerWhenCanIUseItem,
    Help_Text_AnswerWhatsABattle,
    Help_Text_AnswerHowDoIPrepareForBattle,
    Help_Text_AnswerWhatIsAMonsVitality,
    Help_Text_AnswerMyMonsAreHurt,
    Help_Text_AnswerWhatIsStatusProblem,
    Help_Text_AnswerWhatHappensIfAllMyMonsFaint,
    Help_Text_AnswerCantCatchMons,
    Help_Text_AnswerRanOutOfPotions,
    Help_Text_AnswerCanIBuyPokeBalls,
    Help_Text_AnswerWhatsATrainer,
    Help_Text_AnswerHowDoIWinAgainstTrainer,
    Help_Text_AnswerWhereDoMonsAppear,
    Help_Text_AnswerWhatAreMoves,
    Help_Text_AnswerWhatAreHiddenMoves,
    Help_Text_AnswerWhatMovesShouldIUse,
    Help_Text_AnswerWantToAddMoreMoves,
    Help_Text_AnswerWantToMakeMonStronger,
    Help_Text_AnswerFoeMonsTooStrong,
    Help_Text_AnswerWhatDoIDoInCave,
    Help_Text_AnswerNothingIWantToKnow,
    Help_Text_AnswerWhatsPokemonCenter,
    Help_Text_AnswerWhatsPokemonMart,
    Help_Text_AnswerWantToEndGame,
    Help_Text_AnswerWhatsAMon,
    Help_Text_AnswerWhatIsThatPersonLike,
    Help_Text_AnswerWhatDoesHiddenMoveDo,
    Help_Text_AnswerWhatDoIDoInSafari,
    Help_Text_AnswerWhatAreSafariRules,
    Help_Text_AnswerWantToEndSafari,
    Help_Text_AnswerWhatIsAGym
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
    NULL,
    Help_Text_UsingPokedex,
    Help_Text_UsingPokemon,
    Help_Text_UsingSummary,
    Help_Text_UsingSwitch,
    Help_Text_UsingItem,
    Help_Text_UsingBag,
    Help_Text_UsingAnItem,
    Help_Text_UsingKeyItem,
    Help_Text_UsingPokeBall,
    Help_Text_UsingPlayer,
    Help_Text_UsingSave,
    Help_Text_UsingOption,
    Help_Text_UsingPotion,
    Help_Text_UsingTownMap,
    Help_Text_UsingTM,
    Help_Text_UsingHM,
    Help_Text_UsingMoveOutsideOfBattle,
    Help_Text_RidingBicycle,
    Help_Text_EnteringName,
    Help_Text_UsingPC,
    Help_Text_UsingBillsPC,
    Help_Text_UsingWithdraw,
    Help_Text_UsingDeposit,
    Help_Text_UsingMove,
    Help_Text_MovingItems,
    Help_Text_UsingPlayersPC,
    Help_Text_UsingWithdrawItem,
    Help_Text_UsingDepositItem,
    Help_Text_UsingMailbox,
    Help_Text_UsingProfOaksPC,
    Help_Text_OpeningMenu,
    Help_Text_UsingFight,
    Help_Text_UsingPokemon2,
    Help_Text_UsingShift,
    Help_Text_UsingSummary2,
    Help_Text_UsingBag2,
    Help_Text_ReadingPokedex,
    Help_Text_UsingHomePC,
    Help_Text_UsingItemStorage,
    Help_Text_UsingWithdrawItem2,
    Help_Text_UsingDepositItem2,
    Help_Text_UsingMailbox2,
    Help_Text_UsingRun,
    Help_Text_RegisterKeyItem,
    Help_Text_UsingBall,
    Help_Text_UsingBait,
    Help_Text_UsingRock,
    Help_Text_UsingHallOfFame
};

static const u8 *const sHelpSystemHowToUseMenuTextPtrs[] = {
    NULL,
    Help_Text_HowToUsePokedex,
    Help_Text_HowToUsePokemon,
    Help_Text_HowToUseSummary,
    Help_Text_HowToUseSwitch,
    Help_Text_HowToUseItem,
    Help_Text_HowToUseBag,
    Help_Text_HowToUseAnItem,
    Help_Text_HowToUseKeyItem,
    Help_Text_HowToUsePokeBall,
    Help_Text_HowToUsePlayer,
    Help_Text_HowToUseSave,
    Help_Text_HowToUseOption,
    Help_Text_HowToUsePotion,
    Help_Text_HowToUseTownMap,
    Help_Text_HowToUseTM,
    Help_Text_HowToUseHM,
    Help_Text_HowToUseMoveOutsideOfBattle,
    Help_Text_HowToRideBicycle,
    Help_Text_HowToEnterName,
    Help_Text_HowToUsePC,
    Help_Text_HowToUseBillsPC,
    Help_Text_HowToUseWithdraw,
    Help_Text_HowToUseDeposit,
    Help_Text_HowToUseMove,
    Help_Text_HowToMoveItems,
    Help_Text_HowToUsePlayersPC,
    Help_Text_HowToUseWithdrawItem,
    Help_Text_HowToUseDepositItem,
    Help_Text_HowToUseMailbox,
    Help_Text_HowToUseProfOaksPC,
    Help_Text_HowToOpenMenu,
    Help_Text_HowToUseFight,
    Help_Text_HowToUsePokemon2,
    Help_Text_HowToUseShift,
    Help_Text_HowToUseSummary2,
    Help_Text_HowToUseBag2,
    Help_Text_HowToReadPokedex,
    Help_Text_HowToUseHomePC,
    Help_Text_HowToUseItemStorage,
    Help_Text_HowToUseWithdrawItem2,
    Help_Text_HowToUseDepositItem2,
    Help_Text_HowToUseMailbox2,
    Help_Text_HowToUseRun,
    Help_Text_HowToRegisterKeyItem,
    Help_Text_HowToUseBall,
    Help_Text_HowToUseBait,
    Help_Text_HowToUseRock,
    Help_Text_HowToUseHallOfFame
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
    NULL,
    Help_Text_HP,
    Help_Text_EXP,
    Help_Text_Moves,
    Help_Text_Attack,
    Help_Text_Defense,
    Help_Text_SpAtk,
    Help_Text_SpDef,
    Help_Text_Speed,
    Help_Text_Level,
    Help_Text_Type,
    Help_Text_OT,
    Help_Text_Item,
    Help_Text_Ability,
    Help_Text_Money,
    Help_Text_MoveType,
    Help_Text_Nature,
    Help_Text_IDNo,
    Help_Text_PP,
    Help_Text_Power,
    Help_Text_Accuracy,
    Help_Text_FNT,
    Help_Text_Items,
    Help_Text_KeyItems,
    Help_Text_PokeBalls,
    Help_Text_Pokedex,
    Help_Text_PlayTime,
    Help_Text_Badges,
    Help_Text_TextSpeed,
    Help_Text_BattleScene,
    Help_Text_BattleStyle,
    Help_Text_Sound,
    Help_Text_ButtonMode,
    Help_Text_Frame,
    Help_Text_Cancel2,
    Help_Text_TM,
    Help_Text_HM,
    Help_Text_HMMove,
    Help_Text_Evolution,
    Help_Text_StatusProblem,
    Help_Text_Pokemon,
    Help_Text_IDNo2,
    Help_Text_Money2,
    Help_Text_Badges2
};

static const u8 *const sHelpSystemTermDefinitionsTextPtrs[] = {
    NULL,
    Help_Text_DefineHP,
    Help_Text_DefineEXP,
    Help_Text_DefineMoves,
    Help_Text_DefineAttack,
    Help_Text_DefineDefense,
    Help_Text_DefineSpAtk,
    Help_Text_DefineSpDef,
    Help_Text_DefineSpeed,
    Help_Text_DefineLevel,
    Help_Text_DefineType,
    Help_Text_DefineOT,
    Help_Text_DefineItem,
    Help_Text_DefineAbility,
    Help_Text_DefineMoney,
    Help_Text_DefineMoveType,
    Help_Text_DefineNature,
    Help_Text_DefineIDNo,
    Help_Text_DefinePP,
    Help_Text_DefinePower,
    Help_Text_DefineAccuracy,
    Help_Text_DefineFNT,
    Help_Text_DefineItems,
    Help_Text_DefineKeyItems,
    Help_Text_DefinePokeBalls,
    Help_Text_DefinePokedex,
    Help_Text_DefinePlayTime,
    Help_Text_DefineBadges,
    Help_Text_DefineTextSpeed,
    Help_Text_DefineBattleScene,
    Help_Text_DefineBattleStyle,
    Help_Text_DefineSound,
    Help_Text_DefineButtonMode,
    Help_Text_DefineFrame,
    Help_Text_DefineCancel2,
    Help_Text_DefineTM,
    Help_Text_DefineHM,
    Help_Text_DefineHMMove,
    Help_Text_DefineEvolution,
    Help_Text_DefineStatusProblem,
    Help_Text_DefinePokemon,
    Help_Text_DefineIDNo2,
    Help_Text_DefineMoney2,
    Help_Text_DefineBadges2
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
    NULL,
    Help_Text_TheHelpSystem,
    Help_Text_TheGame,
    Help_Text_WirelessAdapter,
    Help_Text_GameFundamentals1,
    Help_Text_GameFundamentals2,
    Help_Text_GameFundamentals3,
    Help_Text_WhatArePokemon
};

static const u8 *const sHelpSystemGeneralTopicDescriptionTextPtrs[] = {
    NULL,
    Help_Text_DescTheHelpSystem,
    Help_Text_DescTheGame,
    Help_Text_DescWirelessAdapter,
    Help_Text_DescGameFundamentals1,
    Help_Text_DescGameFundamentals2,
    Help_Text_DescGameFundamentals3,
    Help_Text_DescWhatArePokemon
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
    NULL,
    Help_Text_UsingTypeMatchupList,
    Help_Text_OwnMoveDark,
    Help_Text_OwnPokemonDark,
    Help_Text_OwnMoveRock,
    Help_Text_OwnPokemonRock,
    Help_Text_OwnMovePsychic,
    Help_Text_OwnPokemonPsychic,
    Help_Text_OwnMoveFighting,
    Help_Text_OwnPokemonFighting,
    Help_Text_OwnMoveGrass,
    Help_Text_OwnPokemonGrass,
    Help_Text_OwnMoveGhost,
    Help_Text_OwnPokemonGhost,
    Help_Text_OwnMoveIce,
    Help_Text_OwnPokemonIce,
    Help_Text_OwnMoveGround,
    Help_Text_OwnPokemonGround,
    Help_Text_OwnMoveElectric,
    Help_Text_OwnPokemonElectric,
    Help_Text_OwnMovePoison,
    Help_Text_OwnPokemonPoison,
    Help_Text_OwnMoveDragon,
    Help_Text_OwnPokemonDragon,
    Help_Text_OwnMoveNormal,
    Help_Text_OwnPokemonNormal,
    Help_Text_OwnMoveSteel,
    Help_Text_OwnPokemonSteel,
    Help_Text_OwnMoveFlying,
    Help_Text_OwnPokemonFlying,
    Help_Text_OwnMoveFire,
    Help_Text_OwnPokemonFire,
    Help_Text_OwnMoveWater,
    Help_Text_OwnPokemonWater,
    Help_Text_OwnMoveBug,
    Help_Text_OwnPokemonBug
};

static const u8 *const sHelpSystemTypeMatchupDescriptionTextPtrs[] = {
    NULL,
    Help_Text_HowToUseTypeMatchupList,
    Help_Text_TypeMatchupOwnMoveDark,
    Help_Text_TypeMatchupOwnPokemonDark,
    Help_Text_TypeMatchupOwnMoveRock,
    Help_Text_TypeMatchupOwnPokemonRock,
    Help_Text_TypeMatchupOwnMovePsychic,
    Help_Text_TypeMatchupOwnPokemonPsychic,
    Help_Text_TypeMatchupOwnMoveFighting,
    Help_Text_TypeMatchupOwnPokemonFighting,
    Help_Text_TypeMatchupOwnMoveGrass,
    Help_Text_TypeMatchupOwnPokemonGrass,
    Help_Text_TypeMatchupOwnMoveGhost,
    Help_Text_TypeMatchupOwnPokemonGhost,
    Help_Text_TypeMatchupOwnMoveIce,
    Help_Text_TypeMatchupOwnPokemonIce,
    Help_Text_TypeMatchupOwnMoveGround,
    Help_Text_TypeMatchupOwnPokemonGround,
    Help_Text_TypeMatchupOwnMoveElectric,
    Help_Text_TypeMatchupOwnPokemonElectric,
    Help_Text_TypeMatchupOwnMovePoison,
    Help_Text_TypeMatchupOwnPokemonPoison,
    Help_Text_TypeMatchupOwnMoveDragon,
    Help_Text_TypeMatchupOwnPokemonDragon,
    Help_Text_TypeMatchupOwnMoveNormal,
    Help_Text_TypeMatchupOwnPokemonNormal,
    Help_Text_TypeMatchupOwnMoveSteel,
    Help_Text_TypeMatchupOwnPokemonSteel,
    Help_Text_TypeMatchupOwnMoveFlying,
    Help_Text_TypeMatchupOwnPokemonFlying,
    Help_Text_TypeMatchupOwnMoveFire,
    Help_Text_TypeMatchupOwnPokemonFire,
    Help_Text_TypeMatchupOwnMoveWater,
    Help_Text_TypeMatchupOwnPokemonWater,
    Help_Text_TypeMatchupOwnMoveBug,
    Help_Text_TypeMatchupOwnPokemonBug
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

static const u16 unref_845BCB0[] = INCBIN_U16("graphics/help_system/unk_845BCB0.bin");

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

bool8 sub_812B45C(void)
{
    if (gReceivedRemoteLinkPlayers == 1)
        return FALSE;
    return TRUE;
}

void HelpSystem_Disable(void)
{
    gHelpSystemEnabled = FALSE;
}

void HelpSystem_Enable(void)
{
    if (gQuestLogState != 2 && gQuestLogState != 3)
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
    PrintTextOnPanel2Row52RightAlign(gUnknown_841DFAC);
    HelpSystem_InitListMenuController(helpListMenu, 0, gHelpSystemState[2]);
    PrintHelpSystemTopicMouseoverDescription(helpListMenu, listMenuItemsBuffer);
    sub_813BDA4(1);
    sub_813BD5C(1);
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
    sub_813BDE8(0);
    sub_813BFC0(0);
    sub_813BE78(1);
    ResetHelpSystemListMenu(helpListMenu, listMenuItemsBuffer);
    SetHelpSystemSubmenuItems(helpListMenu, listMenuItemsBuffer);
    PrintTextOnPanel2Row52RightAlign(gUnknown_841DFC9);
    HelpSystem_InitListMenuController(helpListMenu, helpListMenu->itemsAbove, helpListMenu->cursorPos);
    HelpSystem_PrintTextAt(sHelpSystemTopicPtrs[gHelpSystemState[1]], 0, 0);
    sub_813BDA4(1);
    sub_813BD5C(1);
}

static void SetHelpSystemSubmenuItems(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    u8 totalItems = 0;
    const u8 * submenuItems = sHelpSystemSubmenuItemLists[sHelpSystemContextId * 5 + gHelpSystemState[1]]; // accessing as 2D array
    u8 i;
    for (i = 0; submenuItems[i] != HELP_END; i++)
    {
        if (IsHelpSystemSubmenuEnabled(submenuItems[i]) == TRUE)
        {
            if (gHelpSystemState[1] == TOPIC_WHAT_TO_DO)
                listMenuItemsBuffer[totalItems].label = sHelpSystemSpecializedQuestionTextPtrs[submenuItems[i]];
            else if (gHelpSystemState[1] == TOPIC_HOW_TO_DO)
                listMenuItemsBuffer[totalItems].label = sHelpSystemMenuTopicTextPtrs[submenuItems[i]];
            else if (gHelpSystemState[1] == TOPIC_TERMS)
                listMenuItemsBuffer[totalItems].label = sHelpSystemTermTextPtrs[submenuItems[i]];
            else if (gHelpSystemState[1] == TOPIC_ABOUT_GAME)
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
    if (FlagGet(FLAG_DEFEATED_BROCK) == TRUE && gHelpSystemState[1] == TOPIC_TERMS)
        return TRUE;
    return FALSE;
}

static bool8 IsHelpSystemSubmenuEnabled(u8 id)
{
    u8 i = 0;

    if (gHelpSystemState[1] == TOPIC_WHAT_TO_DO)
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
    if (gHelpSystemState[1] == TOPIC_HOW_TO_DO)
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
    if (gHelpSystemState[1] == TOPIC_TERMS)
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
    if (gHelpSystemState[1] == TOPIC_ABOUT_GAME)
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
    if (gHelpSystemState[1] == TOPIC_TYPE_MATCHUP)
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
    PrintTextOnPanel2Row52RightAlign(gUnknown_841DFA5);
    PrintWelcomeMessageOnPanel1();
    sub_813BDA4(1);
    sub_813BD5C(1);
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
    gHelpSystemState[2] = 0;
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
        gHelpSystemState[1] = input;
        helpListMenu->state = 1;
        break;
    }
    return TRUE;
}

bool8 HelpMenuSubroutine_InitSubmenu(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    gHelpSystemState[0] = 1;
    gHelpSystemState[2] = helpListMenu->cursorPos;
    ResetHelpSystemCursor(helpListMenu);
    BuildAndPrintSubmenuList(helpListMenu, listMenuItemsBuffer);
    sub_813C75C();
    HelpSystem_SetInputDelay(2);
    helpListMenu->state = 3;
    return TRUE;
}

bool8 HelpMenuSubroutine_ReturnFromSubmenu(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    sub_813C004(0, 0);
    sub_813C004(1, 0);
    gHelpSystemState[0] = 0;
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
        gHelpSystemState[3] = input;
        helpListMenu->state = 4;
        break;
    }
    return TRUE;
}

void HelpSystem_PrintTopicLabel(void)
{
    HelpSystem_PrintTextAt(sHelpSystemTopicPtrs[gHelpSystemState[1]], 0, 0);
}

bool8 HelpMenuSubroutine_HelpItemPrint(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    gHelpSystemState[0] = 2;
    sub_813BDA4(0);
    HelpSystem_FillPanel1();
    PrintTextOnPanel2Row52RightAlign(gUnknown_841DFBE);
    sub_813BDE8(1);
    sub_813BEE4(1);

    if (gHelpSystemState[1] == TOPIC_WHAT_TO_DO)
    {
        HelpSystem_PrintTwoStrings(sHelpSystemSpecializedQuestionTextPtrs[gHelpSystemState[3]], sHelpSystemSpecializedAnswerTextPtrs[gHelpSystemState[3]]);
    }
    else if (gHelpSystemState[1] == TOPIC_HOW_TO_DO)
    {
        HelpSystem_PrintTwoStrings(sHelpSystemMenuTopicTextPtrs[gHelpSystemState[3]], sHelpSystemHowToUseMenuTextPtrs[gHelpSystemState[3]]);
    }
    else if (gHelpSystemState[1] == TOPIC_TERMS)
    {
        HelpSystem_PrintTwoStrings(sHelpSystemTermTextPtrs[gHelpSystemState[3]], sHelpSystemTermDefinitionsTextPtrs[gHelpSystemState[3]]);
    }
    else if (gHelpSystemState[1] == TOPIC_ABOUT_GAME)
    {
        HelpSystem_PrintTwoStrings(sHelpSystemGeneralTopicTextPtrs[gHelpSystemState[3]], sHelpSystemGeneralTopicDescriptionTextPtrs[gHelpSystemState[3]]);
    }
    else // TOPIC_TYPE_MATCHUP
    {
        HelpSystem_PrintTwoStrings(sHelpSystemTypeMatchupTextPtrs[gHelpSystemState[3]], sHelpSystemTypeMatchupDescriptionTextPtrs[gHelpSystemState[3]]);
    }
    sub_813BDA4(1);
    sub_813BD5C(1);
    helpListMenu->state = 6;
    return TRUE;
}

bool8 HelpMenuSubroutine_ReturnFromHelpItem(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    gHelpSystemState[0] = 1;
    BuildAndPrintSubmenuList(helpListMenu, listMenuItemsBuffer);
    sub_813C75C();
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

u8 sub_812BF88(void)
{
    return gHelpSystemState[0];
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
        HelpSystem_PrintText_813C584(sHelpSystemTopicMouseoverDescriptionPtrs[5]);
    else
        HelpSystem_PrintText_813C584(sHelpSystemTopicMouseoverDescriptionPtrs[index]);
    sub_813BE30(1);
}
