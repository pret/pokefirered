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

static EWRAM_DATA u16 sSomeVariable = 0;
static EWRAM_DATA u8 gUnknown_203B0EE = 0;

u8 sHelpSystemState[4];
u16 gSomeVariableBackup;

static bool32 IsCurrentMapInArray(const u16 * mapIdxs);
static void BuildMainTopicsListAndMoveToH00(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
static void SetHelpSystemSubmenuItems(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);
static bool8 HelpSystem_HasDefeatedBrock(void);
static bool8 HelpSystemSubmenuIndexIsActive(u8);
static bool8 HasGottenAtLeastOneHM(void);

static void PrintWelcomeMessageOnPanel1(void);
static void PrintTextOnPanel2Row52RightAlign(const u8 *);
static void ResetHelpSystemCursor(struct HelpSystemListMenu * a0);
static void PrintHelpSystemTopicMouseoverDescription(struct HelpSystemListMenu * a0, struct ListMenuItem * a1);

static const u8 *const sHelpSystemTopicPtrs[] = {
    Help_Text_WhatShouldIDo,
    Help_Text_HowDoIDoThis,
    Help_Text_WhatDoesThisTermMean,
    Help_Text_AboutThisGame,
    Help_Text_TypeMatchupList,
    Help_Text_Exit
};

static const u8 *const sHelpSystemTopicMouseoverDescriptionPtrs[] = {
    Help_Text_DescWhatShouldIDo,
    Help_Text_DescHowDoIDoThis,
    Help_Text_DescWhatDoesThisTermMean,
    Help_Text_DescAboutThisGame,
    Help_Text_DescTypeMatchupList,
    Help_Text_DescExit
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

static const u8 gUnknown_845B660[] = {
    0x01, 0x02, 0x03, 0xff
};

static const u8 gUnknown_845B664[] = {
    0x01, 0x02, 0x03, 0xff
};

static const u8 gUnknown_845B668[] = {
    0x13, 0xff
};

static const u8 gUnknown_845B66A[] = {
    0x01, 0x02, 0x03, 0xff
};

static const u8 gUnknown_845B66E[] = {
    0x01, 0x25, 0xff
};

static const u8 gUnknown_845B671[] = {
    0x02, 0x03, 0x04, 0x05, 0x11, 0xff
};

static const u8 gUnknown_845B677[] = {
    0x09, 0x01, 0xff
};

static const u8 gUnknown_845B67A[] = {
    0x02, 0x03, 0xff
};

static const u8 gUnknown_845B67D[] = {
    0x09, 0x0a, 0x0b, 0x11, 0x0c, 0x10, 0xff
};

static const u8 gUnknown_845B684[] = {
    0x09, 0x01, 0x04, 0x05, 0x06, 0x07, 0x08, 0x02, 0x0d, 0xff
};

static const u8 gUnknown_845B68E[] = {
    0x09, 0x03, 0x0a, 0x0f, 0x12, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B696[] = {
    0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x12, 0xff
};

static const u8 gUnknown_845B6A1[] = {
    0x16, 0x17, 0x18, 0xff
};

static const u8 gUnknown_845B6A5[] = {
    0x0a, 0xff
};

static const u8 gUnknown_845B6A7[] = {
    0x11, 0x0e, 0x19, 0x1a, 0x1b, 0xff
};

static const u8 gUnknown_845B6AD[] = {
    0x0a, 0xff
};

static const u8 gUnknown_845B6AF[] = {
    0x0b, 0xff
};

static const u8 gUnknown_845B6B1[] = {
    0x2b, 0x19, 0x1a, 0xff
};

static const u8 gUnknown_845B6B5[] = {
    0x0c, 0xff
};

static const u8 gUnknown_845B6B7[] = {
    0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0xff
};

static const u8 gUnknown_845B6BF[] = {
    0x02, 0x03, 0x04, 0xff
};

static const u8 gUnknown_845B6C3[] = {
    0x01, 0x02, 0x03, 0x07, 0xff
};

static const u8 gUnknown_845B6C8[] = {
    0x02, 0x04, 0x05, 0x09, 0x25, 0xff
};

static const u8 gUnknown_845B6CE[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B6E2[] = {
    0x09, 0x01, 0x02, 0x03, 0x0a, 0x28, 0xff
};

static const u8 gUnknown_845B6E9[] = {
    0x02, 0x05, 0x06, 0x0a, 0x23, 0x24, 0x09, 0x25, 0xff
};

static const u8 gUnknown_845B6F2[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0x14, 0xff
};

static const u8 gUnknown_845B707[] = {
    0x09, 0x01, 0x02, 0x03, 0x0a, 0x28, 0xff
};

static const u8 gUnknown_845B70E[] = {
    0x03, 0x07, 0x04, 0x05, 0x06, 0xff
};

static const u8 gUnknown_845B714[] = {
    0x02, 0x05, 0x06, 0x0a, 0x23, 0x24, 0x09, 0x25, 0xff
};

static const u8 gUnknown_845B71D[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B731[] = {
    0x09, 0x01, 0x02, 0x03, 0x0a, 0x0c, 0x0e, 0x16, 0x17, 0x18, 0x15, 0xff
};

static const u8 gUnknown_845B73D[] = {
    0x06, 0x0a, 0x23, 0x24, 0x09, 0x25, 0xff
};

static const u8 gUnknown_845B744[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B758[] = {
    0x09, 0x01, 0x02, 0x03, 0x0a, 0x15, 0xff
};

static const u8 gUnknown_845B75F[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B783[] = {
    0x02, 0x0a, 0x04, 0x05, 0x06, 0x07, 0x0d, 0x27, 0x08, 0x0b, 0x21, 0x23, 0x24, 0x2c, 0x09, 0x0e, 0x16, 0x17, 0x0f, 0x10, 0x11, 0x1a, 0x15, 0x1f, 0x20, 0x12, 0x13, 0x14, 0x18, 0x19, 0x1b, 0x1e, 0x1c, 0x28, 0x25, 0xff
};

static const u8 gUnknown_845B7A7[] = {
    0x1f, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x2c, 0x09, 0x0d, 0x0e, 0x0f, 0x10, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B7BB[] = {
    0x09, 0x01, 0x02, 0x0a, 0x0b, 0x0c, 0x0d, 0x15, 0xff
};

static const u8 gUnknown_845B7C4[] = {
    0x02, 0x0a, 0x04, 0x05, 0x06, 0x07, 0x0d, 0x27, 0x08, 0x0b, 0x21, 0x23, 0x24, 0x2c, 0x09, 0x0e, 0x16, 0x17, 0x0f, 0x10, 0x11, 0x1a, 0x15, 0x1f, 0x20, 0x12, 0x13, 0x14, 0x18, 0x19, 0x1b, 0x1e, 0x1c, 0x28, 0x25, 0xff
};

static const u8 gUnknown_845B7E8[] = {
    0x1f, 0x01, 0x02, 0x06, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B7F1[] = {
    0x09, 0x01, 0x02, 0x0a, 0x0b, 0x0c, 0x0d, 0x15, 0x28, 0xff
};

static const u8 gUnknown_845B7FB[] = {
    0x0a, 0x07, 0x0d, 0x27, 0x08, 0x0b, 0x21, 0x23, 0x24, 0x2c, 0x09, 0x0e, 0x16, 0x0f, 0x10, 0x11, 0x1a, 0x15, 0x1f, 0x20, 0x12, 0x13, 0x14, 0x18, 0x19, 0x1b, 0x1e, 0x1c, 0x28, 0x25, 0xff
};

static const u8 gUnknown_845B81A[] = {
    0x1f, 0x01, 0x02, 0x06, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B823[] = {
    0x09, 0x01, 0x02, 0x0a, 0x0b, 0x0c, 0x0d, 0x15, 0xff
};

static const u8 gUnknown_845B82C[] = {
    0x07, 0x27, 0x08, 0x2c, 0x15, 0x1f, 0x20, 0x12, 0x13, 0x14, 0x18, 0x19, 0x1b, 0x1e, 0x1c, 0x28, 0x25, 0xff
};

static const u8 gUnknown_845B83E[] = {
    0x1f, 0x01, 0x02, 0x06, 0x0a, 0x0b, 0x0c, 0x11, 0xff
};

static const u8 gUnknown_845B847[] = {
    0x09, 0x01, 0x02, 0x0a, 0x0b, 0x0c, 0x0d, 0x15, 0xff
};

static const u8 gUnknown_845B850[] = {
    0x0f, 0x1b, 0x1d, 0x11, 0x12, 0x15, 0x17, 0x16, 0x1f, 0x20, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B85D[] = {
    0x20, 0x21, 0x22, 0x23, 0x24, 0x07, 0x09, 0x2b, 0xff
};

static const u8 gUnknown_845B866[] = {
    0x09, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0d, 0x0f, 0x12, 0x13, 0x14, 0x27, 0x15, 0xff
};

static const u8 gUnknown_845B878[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B89C[] = {
    0x0f, 0x1b, 0x1d, 0x11, 0x12, 0x16, 0x1f, 0x20, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B8A7[] = {
    0x20, 0x21, 0x22, 0x23, 0x24, 0x07, 0x2b, 0xff
};

static const u8 gUnknown_845B8AF[] = {
    0x09, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0d, 0x0f, 0x12, 0x13, 0x14, 0x27, 0x15, 0xff
};

static const u8 gUnknown_845B8C1[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B8E5[] = {
    0x0f, 0x1b, 0x1d, 0x11, 0x12, 0x16, 0x1f, 0x20, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B8F0[] = {
    0x20, 0x21, 0x22, 0x23, 0x24, 0x07, 0x2b, 0xff
};

static const u8 gUnknown_845B8F8[] = {
    0x09, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0d, 0x0f, 0x12, 0x13, 0x14, 0x27, 0x15, 0xff
};

static const u8 gUnknown_845B90A[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B92E[] = {
    0x29, 0x2a, 0x2b, 0xff
};

static const u8 gUnknown_845B932[] = {
    0x2d, 0x2e, 0x2f, 0x2b, 0xff
};

static const u8 gUnknown_845B937[] = {
    0x09, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0d, 0x0f, 0x12, 0x13, 0x14, 0xff
};

static const u8 gUnknown_845B947[] = {
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0xff
};

static const u8 gUnknown_845B96B[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B978[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B985[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B992[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B99F[] = {
    0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x30, 0xff
};

static const u8 gUnknown_845B9AC[] = {
    0x26, 0x27, 0x28, 0x29, 0x2a, 0xff
};

static const u8 gUnknown_845B9B2[] = {
    0x26, 0x27, 0x28, 0x29, 0x2a, 0xff
};

static const u8 gUnknown_845B9B8[] = {
    0x26, 0x27, 0x28, 0x29, 0x2a, 0xff
};

static const u8 gUnknown_845B9BE[] = {
    0x09, 0x01, 0x02, 0x03, 0x23, 0x25, 0x24, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a, 0x0b, 0x0c, 0x0d, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x27, 0x15, 0x26, 0x16, 0x17, 0x18, 0x1a, 0x0e, 0x1b, 0xff
};

static const u8 *const sHelpSystemSubmenuIndexPointers[] = {
    NULL, NULL, NULL, NULL, NULL,
    NULL, NULL, NULL, gUnknown_845B660, NULL,
    NULL, NULL, NULL, gUnknown_845B664, NULL,
    NULL, gUnknown_845B668, NULL, gUnknown_845B66A, NULL,
    NULL, gUnknown_845B66E, NULL, NULL, NULL,
    NULL, gUnknown_845B671, gUnknown_845B677, NULL, NULL,
    NULL, gUnknown_845B67A, gUnknown_845B67D, NULL, NULL,
    NULL, NULL, gUnknown_845B684, NULL, NULL,
    NULL, NULL, gUnknown_845B68E, NULL, NULL,
    NULL, gUnknown_845B696, gUnknown_845B6A1, NULL, NULL,
    NULL, gUnknown_845B6A5, gUnknown_845B6A7, NULL, NULL,
    NULL, gUnknown_845B6AD, NULL, NULL, NULL,
    NULL, gUnknown_845B6AF, gUnknown_845B6B1, NULL, NULL,
    NULL, gUnknown_845B6B5, gUnknown_845B6B7, NULL, NULL,
    gUnknown_845B6BF, NULL, NULL, gUnknown_845B6C3, NULL,
    gUnknown_845B6C8, gUnknown_845B6CE, gUnknown_845B6E2, NULL, NULL,
    gUnknown_845B6E9, gUnknown_845B6F2, gUnknown_845B707, gUnknown_845B70E, NULL,
    gUnknown_845B714, gUnknown_845B71D, gUnknown_845B731, NULL, NULL,
    gUnknown_845B73D, gUnknown_845B744, gUnknown_845B758, NULL, gUnknown_845B75F,
    gUnknown_845B783, gUnknown_845B7A7, gUnknown_845B7BB, NULL, NULL,
    gUnknown_845B7C4, gUnknown_845B7E8, gUnknown_845B7F1, NULL, NULL,
    gUnknown_845B7FB, gUnknown_845B81A, gUnknown_845B823, NULL, NULL,
    gUnknown_845B82C, gUnknown_845B83E, gUnknown_845B847, NULL, NULL,
    gUnknown_845B850, gUnknown_845B85D, gUnknown_845B866, NULL, gUnknown_845B878,
    gUnknown_845B89C, gUnknown_845B8A7, gUnknown_845B8AF, NULL, gUnknown_845B8C1,
    gUnknown_845B8E5, gUnknown_845B8F0, gUnknown_845B8F8, NULL, gUnknown_845B90A,
    gUnknown_845B92E, gUnknown_845B932, gUnknown_845B937, NULL, gUnknown_845B947,
    NULL, gUnknown_845B96B, NULL, NULL, NULL,
    NULL, gUnknown_845B978, NULL, NULL, NULL,
    NULL, gUnknown_845B985, NULL, NULL, NULL,
    NULL, gUnknown_845B992, NULL, NULL, NULL,
    NULL, gUnknown_845B99F, NULL, NULL, NULL,
    NULL, gUnknown_845B9AC, NULL, NULL, NULL,
    NULL, gUnknown_845B9B2, NULL, NULL, NULL,
    NULL, gUnknown_845B9B8, NULL, NULL, NULL,
    NULL, NULL, NULL, NULL, NULL
};

static const u16 unref_845BCB0[] = INCBIN_U16("graphics/help_system/unk_845BCB0.bin");

static const u8 sHelpSystemContextTopicOrder[] = {
    3, 0, 1, 2, 4, 5
};

static const bool8 sHelpSystemContextTopicFlags[][6] = {
    {FALSE, FALSE, FALSE, FALSE, FALSE, TRUE },
    {FALSE, FALSE, FALSE, TRUE,  FALSE, TRUE },
    {FALSE, FALSE, FALSE, TRUE,  FALSE, TRUE },
    {FALSE, TRUE,  FALSE, TRUE,  FALSE, TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {FALSE, TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {FALSE, FALSE, TRUE,  FALSE, FALSE, TRUE },
    {FALSE, FALSE, TRUE,  FALSE, FALSE, TRUE },
    {FALSE, TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {FALSE, TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {FALSE, TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {TRUE,  FALSE, FALSE, TRUE,  FALSE, TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {TRUE,  TRUE,  TRUE,  TRUE,  FALSE, TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, TRUE,  TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, FALSE, TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, TRUE,  TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, TRUE,  TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, TRUE,  TRUE },
    {TRUE,  TRUE,  TRUE,  FALSE, TRUE,  TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE },
    {FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
    {FALSE, FALSE, FALSE, FALSE, FALSE, FALSE}
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

void HelpSystem_SetSomeVariable(u8 a0)
{
    sSomeVariable = a0;
}

void HelpSystem_SetSomeVariable2(u8 a0)
{
    switch (sSomeVariable)
    {
    case 23:
    case 24:
    case 25:
    case 26:
        if (a0 == 9 || a0 == 5 || a0 == 6 || a0 == 7 || a0 == 8)
            break;
        // fallthrough
    default:
        sSomeVariable = a0;
        break;
    }
}

void Special_SetSomeVariable(void)
{
    sSomeVariable = gSpecialVar_0x8004;
}

void HelpSystem_BackupSomeVariable(void)
{
    gSomeVariableBackup = sSomeVariable;
}

void HelpSystem_RestoreSomeVariable(void)
{
    sSomeVariable = gSomeVariableBackup;
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

    for (i = 0; i < 16; i++)
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

void sub_812B35C(void)
{
    HelpSystem_EnableToggleWithRButton();
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        HelpSystem_SetSomeVariable2(0x16);
    else if (IsInDungeonMap())
        HelpSystem_SetSomeVariable2(0x15);
    else if (IsMapTypeIndoors(gMapHeader.mapType))
    {
        if ((gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F)) || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_2F) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_2F)))
            HelpSystem_SetSomeVariable2(0x0E);
        else if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PROFESSOR_OAKS_LAB) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PROFESSOR_OAKS_LAB))
            HelpSystem_SetSomeVariable2(0x0F);
        else if (IsCurMapPokeCenter() == TRUE)
            HelpSystem_SetSomeVariable2(0x10);
        else if (IsInMartMap() == TRUE)
            HelpSystem_SetSomeVariable2(0x11);
        else if (IsInGymMap() == TRUE)
            HelpSystem_SetSomeVariable2(0x12);
        else
            HelpSystem_SetSomeVariable2(0x13);
    }
    else
        HelpSystem_SetSomeVariable2(0x14);
}

bool8 sub_812B40C(void)
{
    if (gUnknown_203B0EE == 1)
        return FALSE;

    if (gSaveFileStatus != SAVE_STATUS_EMPTY && gSaveFileStatus != SAVE_STATUS_INVALID && FlagGet(FLAG_SYS_SAW_HELP_SYSTEM_INTRO))
        return FALSE;

    FlagSet(FLAG_SYS_SAW_HELP_SYSTEM_INTRO);
    gUnknown_203B0EE = 1;
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
    HelpSystem_InitListMenuController(helpListMenu, 0, sHelpSystemState[2]);
    PrintHelpSystemTopicMouseoverDescription(helpListMenu, listMenuItemsBuffer);
    sub_813BDA4(1);
    sub_813BD5C(1);
}

static void BuildMainTopicsListAndMoveToH00(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    u8 i;
    u8 totalItems = 0;
    for (i = 0; i < 6; i++)
    {
        if (sHelpSystemContextTopicFlags[sSomeVariable][sHelpSystemContextTopicOrder[i]] == TRUE)
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
    HelpSystem_PrintTextAt(sHelpSystemTopicPtrs[sHelpSystemState[1]], 0, 0);
    sub_813BDA4(1);
    sub_813BD5C(1);
}

static void SetHelpSystemSubmenuItems(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    u8 totalItems = 0;
    const u8 * indexPtr = sHelpSystemSubmenuIndexPointers[sSomeVariable * 5 + sHelpSystemState[1]];
    u8 i;
    for (i = 0; indexPtr[i] != 0xFF; i++)
    {
        if (HelpSystemSubmenuIndexIsActive(indexPtr[i]) == TRUE)
        {
            if (sHelpSystemState[1] == 0)
                listMenuItemsBuffer[totalItems].label = sHelpSystemSpecializedQuestionTextPtrs[indexPtr[i]];
            else if (sHelpSystemState[1] == 1)
                listMenuItemsBuffer[totalItems].label = sHelpSystemMenuTopicTextPtrs[indexPtr[i]];
            else if (sHelpSystemState[1] == 2)
                listMenuItemsBuffer[totalItems].label = sHelpSystemTermTextPtrs[indexPtr[i]];
            else if (sHelpSystemState[1] == 3)
                listMenuItemsBuffer[totalItems].label = sHelpSystemGeneralTopicTextPtrs[indexPtr[i]];
            else
                listMenuItemsBuffer[totalItems].label = sHelpSystemTypeMatchupTextPtrs[indexPtr[i]];
            listMenuItemsBuffer[totalItems].index = indexPtr[i];
            totalItems++;
        }
    }
    if (HelpSystem_HasDefeatedBrock() == TRUE)
    {
        for (i = 0, indexPtr = gUnknown_845B9BE; indexPtr[i] != 0xFF; i++)
        {
            listMenuItemsBuffer[totalItems].label = sHelpSystemTermTextPtrs[indexPtr[i]];
            listMenuItemsBuffer[totalItems].index = indexPtr[i];
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

static bool8 HelpSystem_HasDefeatedBrock(void)
{
    if (FlagGet(FLAG_DEFEATED_BROCK) == TRUE && sHelpSystemState[1] == 2)
        return TRUE;
    return FALSE;
}

static bool8 HelpSystemSubmenuIndexIsActive(u8 id)
{
    u8 i = 0;

    if (sHelpSystemState[1] == 0)
    {
        switch (id)
        {
        case 1:
        case 2:
        case 3:
        case 5:
        case 8:
        case 34:
        case 38:
        case 41:
        case 42:
        case 43:
            return TRUE;
        case 4:
            return FlagGet(FLAG_VISITED_OAKS_LAB);
        case 6:
        case 10:
        case 16:
        case 19:
        case 22:
        case 35:
        case 36:
            return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_CITY);
        case 7:
            return FlagGet(FLAG_WORLD_MAP_VERMILION_CITY);
        case 11:
        case 24:
            return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_FOREST);
        case 9:
        case 13:
        case 14:
        case 15:
        case 17:
        case 18:
        case 20:
        case 26:
        case 29:
        case 31:
        case 37:
            return FlagGet(FLAG_SYS_POKEMON_GET);
        case 21:
        case 23:
            return FlagGet(FLAG_SYS_POKEDEX_GET);
        case 12:
        case 25:
        case 27:
        case 30:
        case 32:
        case 33:
            return FlagGet(FLAG_BADGE01_GET);
        case 28:
        case 40:
            return HasGottenAtLeastOneHM();
        case 39:
            return FlagGet(FLAG_GOT_FAME_CHECKER);
        case 44:
            return FlagGet(FLAG_WORLD_MAP_PEWTER_CITY);
        }
        return FALSE;
    }
    if (sHelpSystemState[1] == 1)
    {
        switch (id)
        {
        case 06:
        case 10:
        case 11:
        case 12:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 31:
        case 36:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 45:
        case 46:
        case 47:
            return TRUE;
        case 1:
        case 30:
        case 37:
            return FlagGet(FLAG_SYS_POKEDEX_GET);
        case 14:
            return CheckBagHasItem(ITEM_TOWN_MAP, 1);
        case 2:
        case 3:
        case 5:
        case 7:
        case 8:
        case 9:
        case 13:
        case 32:
        case 33:
        case 35:
        case 43:
        case 44:
            return FlagGet(FLAG_SYS_POKEMON_GET);
        case 4:
        case 34:
            if (GetKantoPokedexCount(1) > 1)
                return TRUE;
            return FALSE;
        case 15:
            return FlagGet(FLAG_BADGE01_GET);
        case 16:
        case 17:
            return HasGottenAtLeastOneHM();
        case 18:
            return FlagGet(FLAG_GOT_BICYCLE);
        case 48:
            return FlagGet(FLAG_SYS_GAME_CLEAR);
        }
        return FALSE;
    }
    if (sHelpSystemState[1] == 2)
    {
        if (HelpSystem_HasDefeatedBrock() == TRUE)
        {
            for (i = 0; gUnknown_845B9BE[i] != 0xFF; i++)
            {
                if (gUnknown_845B9BE[i] == id)
                    return FALSE;
            }
        }
        switch (id)
        {
        case 14:
        case 17:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 38:
            return TRUE;
        case 1:
        case 2:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 16:
        case 19:
        case 20:
        case 21:
            return FlagGet(FLAG_SYS_POKEMON_GET);
        case 36:
        case 37:
            return HasGottenAtLeastOneHM();
        case 3:
        case 15:
        case 18:
        case 39:
            return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_FOREST);
        }
        return TRUE;
    }
    if (sHelpSystemState[1] == 3)
    {
        switch (id)
        {
        case 5:
            return FlagGet(FLAG_BADGE01_GET);
        case 6:
            return FlagGet(FLAG_BADGE02_GET);
        }
        return TRUE;
    }
    if (sHelpSystemState[1] == 4)
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
    sHelpSystemState[2] = 0;
    ResetHelpSystemCursor(helpListMenu);
    BuildAndPrintMainTopicsListMenu(helpListMenu, listMenuItemsBuffer);
    helpListMenu->state = 0;
    return TRUE;
}

bool8 HelpSystemSubroutine_MenuInputHandlerMain(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    s32 v0 = HelpSystem_GetMenuInput();
    switch (v0)
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
        sHelpSystemState[1] = v0;
        helpListMenu->state = 1;
        break;
    }
    return TRUE;
}

bool8 HelpMenuSubroutine_InitSubmenu(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    sHelpSystemState[0] = 1;
    sHelpSystemState[2] = helpListMenu->cursorPos;
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
    sHelpSystemState[0] = 0;
    BuildAndPrintMainTopicsListMenu(helpListMenu, listMenuItemsBuffer);
    helpListMenu->state = 0;
    return TRUE;
}

bool8 HelpMenuSubroutine_SubmenuInputHandler(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    s32 v0 = HelpSystem_GetMenuInput();
    switch (v0)
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
        sHelpSystemState[3] = v0;
        helpListMenu->state = 4;
        break;
    }
    return TRUE;
}

void sub_812BDEC(void)
{
    HelpSystem_PrintTextAt(sHelpSystemTopicPtrs[sHelpSystemState[1]], 0, 0);
}

bool8 HelpMenuSubroutine_HelpItemPrint(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    sHelpSystemState[0] = 2;
    sub_813BDA4(0);
    HelpSystem_FillPanel1();
    PrintTextOnPanel2Row52RightAlign(gUnknown_841DFBE);
    sub_813BDE8(1);
    sub_813BEE4(1);

    if (sHelpSystemState[1] == 0)
    {
        HelpSystem_PrintTwoStrings(sHelpSystemSpecializedQuestionTextPtrs[sHelpSystemState[3]], sHelpSystemSpecializedAnswerTextPtrs[sHelpSystemState[3]]);
    }
    else if (sHelpSystemState[1] == 1)
    {
        HelpSystem_PrintTwoStrings(sHelpSystemMenuTopicTextPtrs[sHelpSystemState[3]], sHelpSystemHowToUseMenuTextPtrs[sHelpSystemState[3]]);
    }
    else if (sHelpSystemState[1] == 2)
    {
        HelpSystem_PrintTwoStrings(sHelpSystemTermTextPtrs[sHelpSystemState[3]], sHelpSystemTermDefinitionsTextPtrs[sHelpSystemState[3]]);
    }
    else if (sHelpSystemState[1] == 3)
    {
        HelpSystem_PrintTwoStrings(sHelpSystemGeneralTopicTextPtrs[sHelpSystemState[3]], sHelpSystemGeneralTopicDescriptionTextPtrs[sHelpSystemState[3]]);
    }
    else
    {
        HelpSystem_PrintTwoStrings(sHelpSystemTypeMatchupTextPtrs[sHelpSystemState[3]], sHelpSystemTypeMatchupDescriptionTextPtrs[sHelpSystemState[3]]);
    }
    sub_813BDA4(1);
    sub_813BD5C(1);
    helpListMenu->state = 6;
    return TRUE;
}

bool8 HelpMenuSubroutine_ReturnFromHelpItem(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer)
{
    sHelpSystemState[0] = 1;
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
    return sHelpSystemState[0];
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
