#include "global.h"
#include "task.h"
#include "pokemon.h"
#include "party_menu.h"
#include "pokeball.h"
#include "bg.h"
#include "data.h"
#include "palette.h"
#include "util.h"
#include "m4a.h"
#include "link.h"
#include "sound.h"
#include "event_data.h"
#include "item.h"
#include "item_menu.h"
#include "text.h"
#include "strings.h"
#include "string_util.h"
#include "window.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "reshow_battle_screen.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/trainers.h"

struct Unk_84790E8
{
    u8 unk_0;
    u8 unk_1;
    u16 unk_2;
    void (*unk_4)(void);
};

struct PokedudeBattlePartyInfo
{
    u8 side;
    u8 level;
    u16 species;
    u16 moves[4];
    u8 nature;
    u8 gender;
};

void PokedudeHandleGetMonData(void);
void PokedudeHandleGetRawMonData(void);
void PokedudeHandleSetMonData(void);
void PokedudeHandleSetRawMonData(void);
void PokedudeHandleLoadMonSprite(void);
void PokedudeHandleSwitchInAnim(void);
void PokedudeHandleReturnMonToBall(void);
void PokedudeHandleDrawTrainerPic(void);
void PokedudeHandleTrainerSlide(void);
void PokedudeHandleTrainerSlideBack(void);
void PokedudeHandleFaintAnimation(void);
void PokedudeHandlePaletteFade(void);
void PokedudeHandleSuccessBallThrowAnim(void);
void PokedudeHandleBallThrowAnim(void);
void PokedudeHandlePause(void);
void PokedudeHandleMoveAnimation(void);
void PokedudeHandlePrintString(void);
void PokedudeHandlePrintSelectionString(void);
void PokedudeHandleChooseAction(void);
void PokedudeHandleUnknownYesNoBox(void);
void PokedudeHandleChooseMove(void);
void PokedudeHandleChooseItem(void);
void PokedudeHandleChoosePokemon(void);
void PokedudeHandleCmd23(void);
void PokedudeHandleHealthBarUpdate(void);
void PokedudeHandleExpUpdate(void);
void PokedudeHandleStatusIconUpdate(void);
void PokedudeHandleStatusAnimation(void);
void PokedudeHandleStatusXor(void);
void PokedudeHandleDataTransfer(void);
void PokedudeHandleDMA3Transfer(void);
void PokedudeHandlePlayBGM(void);
void PokedudeHandleCmd32(void);
void PokedudeHandleTwoReturnValues(void);
void PokedudeHandleChosenMonReturnValue(void);
void PokedudeHandleOneReturnValue(void);
void PokedudeHandleOneReturnValue_Duplicate(void);
void PokedudeHandleCmd37(void);
void PokedudeHandleCmd38(void);
void PokedudeHandleCmd39(void);
void PokedudeHandleCmd40(void);
void PokedudeHandleHitAnimation(void);
void PokedudeHandleCmd42(void);
void PokedudeHandlePlaySE(void);
void PokedudeHandlePlayFanfare(void);
void PokedudeHandleFaintingCry(void);
void PokedudeHandleIntroSlide(void);
void PokedudeHandleIntroTrainerBallThrow(void);
void PokedudeHandleDrawPartyStatusSummary(void);
void PokedudeHandleHidePartyStatusSummary(void);
void PokedudeHandleEndBounceEffect(void);
void PokedudeHandleSpriteInvisibility(void);
void PokedudeHandleBattleAnimation(void);
void PokedudeHandleLinkStandbyMsg(void);
void PokedudeHandleResetActionMoveSelection(void);
void PokedudeHandleCmd55(void);
void PokedudeCmdEnd(void);

void sub_8159BA8(void);
void sub_8159D04(void);
void PokedudeBufferExecCompleted(void);
void sub_8159824(void);
void PokedudeBufferRunCommand(void);
bool8 sub_8159AB8(void);
void sub_8159998(void);
void WaitForMonSelection_PokedudeTmp(void);
void CompleteWhenChoseItem_PokedudeTmp(void);
void sub_81567B0(void);
void Task_LaunchLvlUpAnim_PokedudeTmp(u8 taskId);
void DestroyExpTaskAndCompleteOnInactiveTextPrinter_PokedudeTmp(u8 taskId);
void CompleteOnInactiveTextPrinter2_PokedudeTmp(void);
void Task_PrepareToGiveExpWithExpBar_PokedudeTmp(u8 taskId);
void sub_8156B24(u8 taskId);
void Task_UpdateLvlInHealthbox_PokedudeTmp(u8 taskId);
u32 CopyPokedudeMonData(u8 monId, u8 *dst);
void SetPokedudeMonData(u8 monId);
void sub_8159478(u8 battlerId);
void PokedudeDoMoveAnimation(void);
void sub_81595EC(u8 taskId);

u8 *gUnknown_3005EE0[MAX_BATTLERS_COUNT];

void (*const sPokedudeBufferCommands[CONTROLLER_CMDS_COUNT])(void) =
{
    PokedudeHandleGetMonData,
    PokedudeHandleGetRawMonData,
    PokedudeHandleSetMonData,
    PokedudeHandleSetRawMonData,
    PokedudeHandleLoadMonSprite,
    PokedudeHandleSwitchInAnim,
    PokedudeHandleReturnMonToBall,
    PokedudeHandleDrawTrainerPic,
    PokedudeHandleTrainerSlide,
    PokedudeHandleTrainerSlideBack,
    PokedudeHandleFaintAnimation,
    PokedudeHandlePaletteFade,
    PokedudeHandleSuccessBallThrowAnim,
    PokedudeHandleBallThrowAnim,
    PokedudeHandlePause,
    PokedudeHandleMoveAnimation,
    PokedudeHandlePrintString,
    PokedudeHandlePrintSelectionString,
    PokedudeHandleChooseAction,
    PokedudeHandleUnknownYesNoBox,
    PokedudeHandleChooseMove,
    PokedudeHandleChooseItem,
    PokedudeHandleChoosePokemon,
    PokedudeHandleCmd23,
    PokedudeHandleHealthBarUpdate,
    PokedudeHandleExpUpdate,
    PokedudeHandleStatusIconUpdate,
    PokedudeHandleStatusAnimation,
    PokedudeHandleStatusXor,
    PokedudeHandleDataTransfer,
    PokedudeHandleDMA3Transfer,
    PokedudeHandlePlayBGM,
    PokedudeHandleCmd32,
    PokedudeHandleTwoReturnValues,
    PokedudeHandleChosenMonReturnValue,
    PokedudeHandleOneReturnValue,
    PokedudeHandleOneReturnValue_Duplicate,
    PokedudeHandleCmd37,
    PokedudeHandleCmd38,
    PokedudeHandleCmd39,
    PokedudeHandleCmd40,
    PokedudeHandleHitAnimation,
    PokedudeHandleCmd42,
    PokedudeHandlePlaySE,
    PokedudeHandlePlayFanfare,
    PokedudeHandleFaintingCry,
    PokedudeHandleIntroSlide,
    PokedudeHandleIntroTrainerBallThrow,
    PokedudeHandleDrawPartyStatusSummary,
    PokedudeHandleHidePartyStatusSummary,
    PokedudeHandleEndBounceEffect,
    PokedudeHandleSpriteInvisibility,
    PokedudeHandleBattleAnimation,
    PokedudeHandleLinkStandbyMsg,
    PokedudeHandleResetActionMoveSelection,
    PokedudeHandleCmd55,
    PokedudeCmdEnd,
};

// not used
const u8 gUnknown_8479000[] = { 0x48, 0x48, 0x20, 0x5a, 0x50, 0x50, 0x50, 0x58 };

const u8 gUnknown_8479008[][8] =
{
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 4, 4, 0, 0,  0, 0, 0, 0 },
};

const u8 gUnknown_8479018[][8] =
{
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 1, 0, 0, 0, 64, 0, 0, 0 },
    { 0, 0, 0, 0, 64, 0, 0, 0 },
};

const u8 gUnknown_8479030[][8] =
{
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 2, 0, 0, 0, 64, 0, 0, 0 },
    { 0, 0, 0, 0, 64, 0, 0, 0 },
};

const u8 gUnknown_8479048[][8] =
{
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 0, 0, 0, 0, 64, 0, 0, 0 },
    { 1, 0, 0, 0, 64, 0, 0, 0 },
};

const u8 (*const gUnknown_8479060[])[8] =
{
    gUnknown_8479008,
    gUnknown_8479018,
    gUnknown_8479030,
    gUnknown_8479048,
};

const u8 gUnknown_8479070[][8] =
{
    {   2,   2, 0, 0, 64, 0, 0, 0 },
    { 255, 255, 0, 0,  0, 0, 0, 0 },
};

const u8 gUnknown_8479080[][8] =
{
    {   2,   2, 0, 0, 64, 0, 0, 0 },
    {   2,   0, 0, 0, 64, 0, 0, 0 },
    {   2,   0, 0, 0, 64, 0, 0, 0 },
    { 255, 255, 0, 0,  0, 0, 0, 0 },
};

const u8 gUnknown_84790A0[][8] =
{
    {   2,   0, 0, 0, 64, 0, 0, 0 },
    {   0,   0, 0, 0, 64, 0, 0, 0 },
    {   0,   0, 0, 0, 64, 0, 0, 0 },
    { 255, 255, 0, 0,  0, 0, 0, 0 },
};

const u8 gUnknown_84790C0[][8] =
{
    {   0,   2, 0, 0, 64, 0, 0, 0 },
    {   2,   2, 0, 0, 64, 0, 0, 0 },
    { 255, 255, 0, 0,  0, 0, 0, 0 },
};

const u8 (*const gUnknown_84790D8[])[8] =
{
    gUnknown_8479070,
    gUnknown_8479080,
    gUnknown_84790A0,
    gUnknown_84790C0,
};

const struct Unk_84790E8 gUnknown_84790E8[] =
{
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 4,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 0,
        .unk_2 = 13,
        .unk_4 = sub_8159BA8,
    },
};

const struct Unk_84790E8 gUnknown_8479108[] =
{
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = NULL,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159D04,
    },
    {
        .unk_0 = 21,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 4,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 0,
        .unk_2 = 13,
        .unk_4 = sub_8159BA8,
    },
};

const struct Unk_84790E8 gUnknown_8479130[] =
{
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 4,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 22,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 4,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 20,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 0,
        .unk_2 = 13,
        .unk_4 = sub_8159BA8,
    },
};

const struct Unk_84790E8 gUnknown_8479168[] =
{
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = NULL,
    },
    {
        .unk_0 = 18,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 16,
        .unk_1 = 1,
        .unk_2 = 107,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 21,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
    {
        .unk_0 = 55,
        .unk_1 = 0,
        .unk_2 = 0,
        .unk_4 = sub_8159BA8,
    },
};

const struct Unk_84790E8 *const gUnknown_8479198[] =
{
    gUnknown_84790E8,
    gUnknown_8479108,
    gUnknown_8479130,
    gUnknown_8479168,
};

const u8 *const gUnknown_84791A8[] =
{
    gUnknown_81C5F69,
    gUnknown_81C5FA7,
    gUnknown_81C5FDC,
    gUnknown_81C601C,
};

const u8 *const gUnknown_84791B8[] =
{
    gUnknown_81C60FA,
    gUnknown_81C60FA,
    gUnknown_81C615A,
    gUnknown_81C6196,
    gUnknown_81C61EA,
};

const u8 *const gUnknown_84791CC[] =
{
    gUnknown_81C6202,
    gUnknown_81C6301,
    gUnknown_81C63A9,
    gUnknown_81C63F9,
    gUnknown_81C6446,
    gUnknown_81C657A,
    gUnknown_81C6637,
};

const u8 *const gUnknown_84791E8[] =
{
    gUnknown_81C6645,
    gUnknown_81C6645,
    gUnknown_81C66CF,
    gUnknown_81C6787,
    gUnknown_81C684B,
    gUnknown_81C686C,
};

const struct PokedudeBattlePartyInfo sParties_Battle[] =
{
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_RATTATA,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_HYPER_FANG, MOVE_QUICK_ATTACK},
        .nature = NATURE_LONELY,
        .gender = MALE,
    },
    {
        .side = 1,
        .level = 18,
        .species = SPECIES_PIDGEY,
        .moves = {MOVE_TACKLE, MOVE_SAND_ATTACK, MOVE_GUST, MOVE_QUICK_ATTACK},
        .nature = NATURE_NAUGHTY,
        .gender = MALE,
    },
    {0xFF}
};

const struct PokedudeBattlePartyInfo sParties_Status[] =
{
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_RATTATA,
        .moves = {MOVE_TACKLE, MOVE_TAIL_WHIP, MOVE_HYPER_FANG, MOVE_QUICK_ATTACK},
        .nature = NATURE_LONELY,
        .gender = MALE,
    },
    {
        .side = 1,
        .level = 14,
        .species = SPECIES_ODDISH,
        .moves = {MOVE_ABSORB, MOVE_SWEET_SCENT, MOVE_POISON_POWDER},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {0xFF}
};

const struct PokedudeBattlePartyInfo sParties_Matchups[] =
{
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_POLIWAG,
        .moves = {MOVE_WATER_GUN, MOVE_HYPNOSIS, MOVE_BUBBLE},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_BUTTERFREE,
        .moves = {MOVE_CONFUSION, MOVE_POISON_POWDER, MOVE_STUN_SPORE, MOVE_SLEEP_POWDER},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = 1,
        .level = 14,
        .species = SPECIES_ODDISH,
        .moves = {MOVE_ABSORB, MOVE_SWEET_SCENT, MOVE_POISON_POWDER},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {0xFF}
};

const struct PokedudeBattlePartyInfo sParties_Catching[] =
{
    {
        .side = 0,
        .level = 15,
        .species = SPECIES_BUTTERFREE,
        .moves = {MOVE_CONFUSION, MOVE_POISON_POWDER, MOVE_SLEEP_POWDER, MOVE_STUN_SPORE},
        .nature = NATURE_RASH,
        .gender = MALE,
    },
    {
        .side = 1,
        .level = 11,
        .species = SPECIES_JIGGLYPUFF,
        .moves = {MOVE_SING, MOVE_DEFENSE_CURL, MOVE_POUND},
        .nature = NATURE_CAREFUL,
        .gender = MALE,
    },
    {0xFF}
};


const struct PokedudeBattlePartyInfo *const sPokedudeBattlePartyPointers[] =
{
    sParties_Battle,
    sParties_Status,
    sParties_Matchups,
    sParties_Catching,
};

void nullsub_99(void)
{
}

void SetControllerToPokedude(void)
{
    gBattlerControllerFuncs[gActiveBattler] = PokedudeBufferRunCommand;
    *(&gBattleStruct->field_96) = gSpecialVar_0x8004;
    gBattleStruct->field_97 = 0;
}

void PokedudeBufferRunCommand(void)
{
    if (gBattleControllerExecFlags & gBitTable[gActiveBattler])
    {
        if (gBattleBufferA[gActiveBattler][0] < NELEMS(sPokedudeBufferCommands))
        {
            if (!sub_8159AB8())
                sPokedudeBufferCommands[gBattleBufferA[gActiveBattler][0]]();
        }
        else
        {
            PokedudeBufferExecCompleted();
        }
    }
}

void sub_8156140(void)
{
    sub_8159824();
}

void CompleteOnBattlerSpriteCallbackDummy_PokedudeTmp(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        PokedudeBufferExecCompleted();
}

void sub_8156184(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].animEnded == TRUE
     && gSprites[gBattlerSpriteIds[gActiveBattler]].pos2.x == 0)
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].flag_x80)
        {
            sub_80F1720(gActiveBattler, &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]]);
        }
        else if (gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].field_1_x1)
        {
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].flag_x80 = 0;
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].field_1_x1 = 0;
            FreeSpriteTilesByTag(0x27F9);
            FreeSpritePaletteByTag(0x27F9);
            PokedudeBufferExecCompleted();
        }
    }
}

void CompleteOnInactiveTextPrinter_PokedudeTmp(void)
{
    if (!IsTextPrinterActive(0))
        PokedudeBufferExecCompleted();
}

void sub_8156254(void)
{
    if (!gPaletteFade.active)
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
}

void sub_8156294(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
    {
        CreateTask(c3_0802FDF4, 10);
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        PokedudeBufferExecCompleted();
    }
}

void sub_81562F0(void)
{
    if (gSprites[gHealthboxSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy
     && gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].field_1_x1)
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].flag_x80 = 0;
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].field_1_x1 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        if (gBattleSpritesDataPtr->battlerData[gActiveBattler].behindSubstitute)
            InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_MON_TO_SUBSTITUTE);
        gBattlerControllerFuncs[gActiveBattler] = sub_8156294;
    }
}

void sub_81563A8(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].flag_x80
     && !gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive)
        sub_80F1720(gActiveBattler, &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]]);
    if (gSprites[gUnknown_3004FFC[gActiveBattler]].callback == SpriteCallbackDummy
     && !(gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive))
    {
        DestroySprite(&gSprites[gUnknown_3004FFC[gActiveBattler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler],
                                 &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]],
                                 HEALTHBOX_ALL);
        sub_804BD94(gActiveBattler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[gActiveBattler]);
        CopyBattleSpriteInvisibility(gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = sub_81562F0;
    }
}

void CompleteOnSpecialAnimDone_PokedudeTmp(void)
{
    if (!gDoingBattleAnim)
        PokedudeBufferExecCompleted();
}

void sub_815649C(void)
{
    if (--gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].field_9 == 255)
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].field_9 = 0;
        PokedudeBufferExecCompleted();
    }
}

void sub_81564E4(void)
{
    sub_8159998();
}

void OpenPartyMenuToChooseMon_PokedudeTmp(void)
{
    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[gActiveBattler] = WaitForMonSelection_PokedudeTmp;
        DestroyTask(gUnknown_3004FFC[gActiveBattler]);
        FreeAllWindowBuffers();
        sub_8127968();
    }
}

void WaitForMonSelection_PokedudeTmp(void)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (gUnknown_203B0C0 == 1)
            BtlController_EmitChosenMonReturnValue(1, gUnknown_203B0C1, gUnknown_203B0DC);
        else
            BtlController_EmitChosenMonReturnValue(1, 6, NULL);
        PokedudeBufferExecCompleted();
    }
}

void OpenBagAndChooseItem_PokedudeTmp(void)
{
    u8 callbackId;

    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[gActiveBattler] = CompleteWhenChoseItem_PokedudeTmp;
        nullsub_44();
        FreeAllWindowBuffers();
        switch (gSpecialVar_0x8004)
        {
        case 1:
        default:
            callbackId = 7;
            break;
        case 3:
            callbackId = 8;
            break;
        }
        sub_810B108(callbackId);
    }
}

void CompleteWhenChoseItem_PokedudeTmp(void)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        BtlController_EmitOneReturnValue(1, gSpecialVar_ItemId);
        PokedudeBufferExecCompleted();
    }
}

void sub_8156624(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].flag_x80
     && !gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive)
        sub_80F1720(gActiveBattler, &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].flag_x80
     && !gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].ballAnimActive)
        sub_80F1720(gActiveBattler ^ BIT_FLANK, &gPlayerParty[gBattlerPartyIndexes[gActiveBattler ^ BIT_FLANK]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive && !gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].ballAnimActive)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gUnknown_3004FFC[gActiveBattler ^ BIT_FLANK]]);
            UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler ^ BIT_FLANK],
                                     &gPlayerParty[gBattlerPartyIndexes[gActiveBattler ^ BIT_FLANK]],
                                     HEALTHBOX_ALL);
            sub_804BD94(gActiveBattler ^ BIT_FLANK);
            SetHealthboxSpriteVisible(gHealthboxSpriteIds[gActiveBattler ^ BIT_FLANK]);
        }
        DestroySprite(&gSprites[gUnknown_3004FFC[gActiveBattler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler],
                                 &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]],
                                 HEALTHBOX_ALL);
        sub_804BD94(gActiveBattler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[gActiveBattler]);
        gBattleSpritesDataPtr->animationData->field_9_x1 = 0;
        gBattlerControllerFuncs[gActiveBattler] = sub_81567B0;
    }
}

void sub_81567B0(void)
{
    bool32 r4 = FALSE;

    if (gSprites[gHealthboxSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        r4 = TRUE;
    if (r4
     && gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].field_1_x1
     && gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].field_1_x1)
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].flag_x80 = 0;
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].field_1_x1 = 0;
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].flag_x80 = 0;
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler ^ BIT_FLANK].field_1_x1 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        CreateTask(c3_0802FDF4, 10);
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = sub_815649C;
    }
}

#define tExpTask_monId      data[0]
#define tExpTask_gainedExp  data[1]
#define tExpTask_battler    data[2]
#define tExpTask_frames     data[10]

void Task_GiveExpToMon_PokedudeTmp(u8 taskId)
{
    u32 monId = (u8)gTasks[taskId].tExpTask_monId;
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    s16 gainedExp = gTasks[taskId].tExpTask_gainedExp;

    if (IsDoubleBattle() == TRUE || monId != gBattlerPartyIndexes[battlerId]) // Give exp without moving the expbar.
    {
        struct Pokemon *mon = &gPlayerParty[monId];
        u16 species = GetMonData(mon, MON_DATA_SPECIES);
        u8 level = GetMonData(mon, MON_DATA_LEVEL);
        u32 currExp = GetMonData(mon, MON_DATA_EXP);
        u32 nextLvlExp = gExperienceTables[gBaseStats[species].growthRate][level + 1];

        if (currExp + gainedExp >= nextLvlExp)
        {
            u8 savedActiveBattler;

            SetMonData(mon, MON_DATA_EXP, &nextLvlExp);
            CalculateMonStats(mon);
            gainedExp -= nextLvlExp - currExp;
            savedActiveBattler = gActiveBattler;
            gActiveBattler = battlerId;
            BtlController_EmitTwoReturnValues(1, RET_VALUE_LEVELED_UP, gainedExp);
            gActiveBattler = savedActiveBattler;
            if (IsDoubleBattle() == TRUE
             && ((u16)monId == gBattlerPartyIndexes[battlerId] || (u16)monId == gBattlerPartyIndexes[battlerId ^ BIT_FLANK]))
                gTasks[taskId].func = Task_LaunchLvlUpAnim_PokedudeTmp;
            else
                gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter_PokedudeTmp;
        }
        else
        {
            currExp += gainedExp;
            SetMonData(mon, MON_DATA_EXP, &currExp);
            gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2_PokedudeTmp;
            DestroyTask(taskId);
        }
    }
    else
    {
        gTasks[taskId].func = Task_PrepareToGiveExpWithExpBar_PokedudeTmp;
    }
}

void Task_PrepareToGiveExpWithExpBar_PokedudeTmp(u8 taskId)
{
    u8 monIndex = gTasks[taskId].tExpTask_monId;
    s32 gainedExp = gTasks[taskId].tExpTask_gainedExp;
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    struct Pokemon *mon = &gPlayerParty[monIndex];
    u8 level = GetMonData(mon, MON_DATA_LEVEL);
    u16 species = GetMonData(mon, MON_DATA_SPECIES);
    u32 exp = GetMonData(mon, MON_DATA_EXP);
    u32 currLvlExp = gExperienceTables[gBaseStats[species].growthRate][level];
    u32 expToNextLvl;

    exp -= currLvlExp;
    expToNextLvl = gExperienceTables[gBaseStats[species].growthRate][level + 1] - currLvlExp;
    SetBattleBarStruct(battlerId, gHealthboxSpriteIds[battlerId], expToNextLvl, exp, -gainedExp);
    PlaySE(SE_EXP);
    gTasks[taskId].func = sub_8156B24;
}

void sub_8156B24(u8 taskId)
{
    if (gTasks[taskId].tExpTask_frames < 13)
    {
        ++gTasks[taskId].tExpTask_frames;
    }
    else
    {
        u8 monId = gTasks[taskId].tExpTask_monId;
        s16 gainedExp = gTasks[taskId].tExpTask_gainedExp;
        u8 battlerId = gTasks[taskId].tExpTask_battler;
        s16 newExpPoints;

        newExpPoints = MoveBattleBar(battlerId, gHealthboxSpriteIds[battlerId], EXP_BAR, 0);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battlerId]);
        if (newExpPoints == -1) // The bar has been filled with given exp points.
        {
            u8 level;
            s32 currExp;
            u16 species;
            s32 expOnNextLvl;

            m4aSongNumStop(SE_EXP);
            level = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);
            currExp = GetMonData(&gPlayerParty[monId], MON_DATA_EXP);
            species = GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);
            expOnNextLvl = gExperienceTables[gBaseStats[species].growthRate][level + 1];
            if (currExp + gainedExp >= expOnNextLvl)
            {
                u8 savedActiveBattler;

                SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &expOnNextLvl);
                CalculateMonStats(&gPlayerParty[monId]);
                gainedExp -= expOnNextLvl - currExp;
                savedActiveBattler = gActiveBattler;
                gActiveBattler = battlerId;
                BtlController_EmitTwoReturnValues(1, RET_VALUE_LEVELED_UP, gainedExp);
                gActiveBattler = savedActiveBattler;
                gTasks[taskId].func = Task_LaunchLvlUpAnim_PokedudeTmp;
            }
            else
            {
                currExp += gainedExp;
                SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &currExp);
                gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2_PokedudeTmp;
                DestroyTask(taskId);
            }
        }
    }
}

void Task_LaunchLvlUpAnim_PokedudeTmp(u8 taskId)
{
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    u8 monIndex = gTasks[taskId].tExpTask_monId;

    if (IsDoubleBattle() == TRUE && monIndex == gBattlerPartyIndexes[battlerId ^ BIT_FLANK])
        battlerId ^= BIT_FLANK;
    InitAndLaunchSpecialAnimation(battlerId, battlerId, battlerId, B_ANIM_LVL_UP);
    gTasks[taskId].func = Task_UpdateLvlInHealthbox_PokedudeTmp;
}

void Task_UpdateLvlInHealthbox_PokedudeTmp(u8 taskId)
{
    u8 battlerId = gTasks[taskId].tExpTask_battler;

    if (!gBattleSpritesDataPtr->healthBoxesData[battlerId].specialAnimActive)
    {
        u8 monIndex = gTasks[taskId].tExpTask_monId;

        GetMonData(&gPlayerParty[monIndex], MON_DATA_LEVEL);  // Unused return value. 
        if (IsDoubleBattle() == TRUE && monIndex == gBattlerPartyIndexes[battlerId ^ BIT_FLANK])
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battlerId ^ BIT_FLANK], &gPlayerParty[monIndex], HEALTHBOX_ALL);
        else
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battlerId], &gPlayerParty[monIndex], HEALTHBOX_ALL);
        gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter_PokedudeTmp;
    }
}

void DestroyExpTaskAndCompleteOnInactiveTextPrinter_PokedudeTmp(u8 taskId)
{
    u8 monIndex = gTasks[taskId].tExpTask_monId;
    u8 battlerId;

    GetMonData(&gPlayerParty[monIndex], MON_DATA_LEVEL); // Unused return value
    battlerId = gTasks[taskId].tExpTask_battler;
    gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2_PokedudeTmp;
    DestroyTask(taskId);
}

void sub_8156DCC(void)
{
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        if (gSprites[gBattlerSpriteIds[gActiveBattler]].pos1.y + gSprites[gBattlerSpriteIds[gActiveBattler]].pos2.y > DISPLAY_HEIGHT)
        {
            FreeOamMatrix(gSprites[gBattlerSpriteIds[gActiveBattler]].oam.matrixNum);
            DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
            SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
            PokedudeBufferExecCompleted();
        }
    }
    else
    {
        if (!gSprites[gBattlerSpriteIds[gActiveBattler]].inUse)
        {
            SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
            PokedudeBufferExecCompleted();
        }
    }
}

void CompleteOnHealthbarDone_PokedudeTmp(void)
{
    s16 hpValue = MoveBattleBar(gActiveBattler, gHealthboxSpriteIds[gActiveBattler], HEALTH_BAR, 0);

    SetHealthboxSpriteVisible(gHealthboxSpriteIds[gActiveBattler]);
    if (hpValue != -1)
    {
        UpdateHpTextInHealthbox(gHealthboxSpriteIds[gActiveBattler], hpValue, HP_CURRENT);
    }
    else
    {
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        PokedudeBufferExecCompleted();
    }
}

void CompleteOnInactiveTextPrinter2_PokedudeTmp(void)
{
    if (!IsTextPrinterActive(0))
        PokedudeBufferExecCompleted();
}

void DoHitAnimBlinkSpriteEffect_PokedudeTmp(void)
{
    u8 spriteId = gBattlerSpriteIds[gActiveBattler];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = FALSE;
        PokedudeBufferExecCompleted();
    }
    else
    {
        if ((gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        ++gSprites[spriteId].data[1];
    }
}

void sub_8156F7C(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
        PokedudeBufferExecCompleted();
    }
}

void CompleteOnBattlerSpriteCallbackDummy2_PokedudeTmp(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        PokedudeBufferExecCompleted();
}

void CompleteOnFinishedBattleAnimation_PokedudeTmp(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animFromTableActive)
        PokedudeBufferExecCompleted();
}

void CompleteOnFinishedStatusAnimation_PokedudeTmp(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].statusAnimActive)
        PokedudeBufferExecCompleted();
}

void PokedudeBufferExecCompleted(void)
{
    gBattlerControllerFuncs[gActiveBattler] = PokedudeBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(2, 4, &playerId);
        gBattleBufferA[gActiveBattler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        gBattleControllerExecFlags &= ~gBitTable[gActiveBattler];
    }
}

// not used
void CompleteOnFinishedStatusAnimation2_PokedudeTmp(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].statusAnimActive)
        PokedudeBufferExecCompleted();
}

void PokedudeHandleGetMonData(void)
{
    u8 monData[sizeof(struct Pokemon) * 2 + 56]; // this allows to get full data of two pokemon, trying to get more will result in overwriting data
    u32 size = 0;
    u8 monToCheck;
    s32 i;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        size += CopyPokedudeMonData(gBattlerPartyIndexes[gActiveBattler], monData);
    }
    else
    {
        monToCheck = gBattleBufferA[gActiveBattler][2];
        for (i = 0; i < PARTY_SIZE; ++i)
        {
            if (monToCheck & 1)
                size += CopyPokedudeMonData(i, monData + size);
            monToCheck >>= 1;
        }
    }
    BtlController_EmitDataTransfer(1, size, monData);
    PokedudeBufferExecCompleted();
}

u32 CopyPokedudeMonData(u8 monId, u8 *dst)
{
    struct BattlePokemon battleMon;
    struct MovePpInfo moveData;
    u8 nickname[20];
    u8 *src;
    s16 data16;
    u32 data32;
    s32 size = 0;
    struct Pokemon *mon;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[monId];
    else
        mon = &gEnemyParty[monId];
    switch (gBattleBufferA[gActiveBattler][1])
    {
    case REQUEST_ALL_BATTLE:
        battleMon.species = GetMonData(mon, MON_DATA_SPECIES);
        battleMon.item = GetMonData(mon, MON_DATA_HELD_ITEM);
        for (size = 0; size < MAX_MON_MOVES; ++size)
        {
            battleMon.moves[size] = GetMonData(mon, MON_DATA_MOVE1 + size);
            battleMon.pp[size] = GetMonData(mon, MON_DATA_PP1 + size);
        }
        battleMon.ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
        battleMon.friendship = GetMonData(mon, MON_DATA_FRIENDSHIP);
        battleMon.experience = GetMonData(mon, MON_DATA_EXP);
        battleMon.hpIV = GetMonData(mon, MON_DATA_HP_IV);
        battleMon.attackIV = GetMonData(mon, MON_DATA_ATK_IV);
        battleMon.defenseIV = GetMonData(mon, MON_DATA_DEF_IV);
        battleMon.speedIV = GetMonData(mon, MON_DATA_SPEED_IV);
        battleMon.spAttackIV = GetMonData(mon, MON_DATA_SPATK_IV);
        battleMon.spDefenseIV = GetMonData(mon, MON_DATA_SPDEF_IV);
        battleMon.personality = GetMonData(mon, MON_DATA_PERSONALITY);
        battleMon.status1 = GetMonData(mon, MON_DATA_STATUS);
        battleMon.level = GetMonData(mon, MON_DATA_LEVEL);
        battleMon.hp = GetMonData(mon, MON_DATA_HP);
        battleMon.maxHP = GetMonData(mon, MON_DATA_MAX_HP);
        battleMon.attack = GetMonData(mon, MON_DATA_ATK);
        battleMon.defense = GetMonData(mon, MON_DATA_DEF);
        battleMon.speed = GetMonData(mon, MON_DATA_SPEED);
        battleMon.spAttack = GetMonData(mon, MON_DATA_SPATK);
        battleMon.spDefense = GetMonData(mon, MON_DATA_SPDEF);
        battleMon.isEgg = GetMonData(mon, MON_DATA_IS_EGG);
        battleMon.abilityNum = GetMonData(mon, MON_DATA_ABILITY_NUM);
        battleMon.otId = GetMonData(mon, MON_DATA_OT_ID);
        GetMonData(mon, MON_DATA_NICKNAME, nickname);
        StringCopy10(battleMon.nickname, nickname);
        GetMonData(mon, MON_DATA_OT_NAME, battleMon.otName);
        src = (u8 *)&battleMon;
        for (size = 0; size < sizeof(battleMon); ++size)
            dst[size] = src[size];
        break;
    case REQUEST_SPECIES_BATTLE:
        data16 = GetMonData(mon, MON_DATA_SPECIES);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_HELDITEM_BATTLE:
        data16 = GetMonData(mon, MON_DATA_HELD_ITEM);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_MOVES_PP_BATTLE:
        for (size = 0; size < MAX_MON_MOVES; ++size)
        {
            moveData.moves[size] = GetMonData(mon, MON_DATA_MOVE1 + size);
            moveData.pp[size] = GetMonData(mon, MON_DATA_PP1 + size);
        }
        moveData.ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
        src = (u8 *)(&moveData);
        for (size = 0; size < sizeof(moveData); ++size)
            dst[size] = src[size];
        break;
    case REQUEST_MOVE1_BATTLE:
    case REQUEST_MOVE2_BATTLE:
    case REQUEST_MOVE3_BATTLE:
    case REQUEST_MOVE4_BATTLE:
        data16 = GetMonData(mon, MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - REQUEST_MOVE1_BATTLE);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_PP_DATA_BATTLE:
        for (size = 0; size < MAX_MON_MOVES; ++size)
            dst[size] = GetMonData(mon, MON_DATA_PP1 + size);
        dst[size] = GetMonData(mon, MON_DATA_PP_BONUSES);
        ++size;
        break;
    case REQUEST_PPMOVE1_BATTLE:
    case REQUEST_PPMOVE2_BATTLE:
    case REQUEST_PPMOVE3_BATTLE:
    case REQUEST_PPMOVE4_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - REQUEST_PPMOVE1_BATTLE);
        size = 1;
        break;
    case REQUEST_OTID_BATTLE:
        data32 = GetMonData(mon, MON_DATA_OT_ID);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case REQUEST_EXP_BATTLE:
        data32 = GetMonData(mon, MON_DATA_EXP);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case REQUEST_HP_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_HP_EV);
        size = 1;
        break;
    case REQUEST_ATK_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_ATK_EV);
        size = 1;
        break;
    case REQUEST_DEF_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_DEF_EV);
        size = 1;
        break;
    case REQUEST_SPEED_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPEED_EV);
        size = 1;
        break;
    case REQUEST_SPATK_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPATK_EV);
        size = 1;
        break;
    case REQUEST_SPDEF_EV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPDEF_EV);
        size = 1;
        break;
    case REQUEST_FRIENDSHIP_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_FRIENDSHIP);
        size = 1;
        break;
    case REQUEST_POKERUS_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_POKERUS);
        size = 1;
        break;
    case REQUEST_MET_LOCATION_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_MET_LOCATION);
        size = 1;
        break;
    case REQUEST_MET_LEVEL_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_MET_LEVEL);
        size = 1;
        break;
    case REQUEST_MET_GAME_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_MET_GAME);
        size = 1;
        break;
    case REQUEST_POKEBALL_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_POKEBALL);
        size = 1;
        break;
    case REQUEST_ALL_IVS_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_HP_IV);
        dst[1] = GetMonData(mon, MON_DATA_ATK_IV);
        dst[2] = GetMonData(mon, MON_DATA_DEF_IV);
        dst[3] = GetMonData(mon, MON_DATA_SPEED_IV);
        dst[4] = GetMonData(mon, MON_DATA_SPATK_IV);
        dst[5] = GetMonData(mon, MON_DATA_SPDEF_IV);
        size = 6;
        break;
    case REQUEST_HP_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_HP_IV);
        size = 1;
        break;
    case REQUEST_ATK_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_ATK_IV);
        size = 1;
        break;
    case REQUEST_DEF_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_DEF_IV);
        size = 1;
        break;
    case REQUEST_SPEED_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPEED_IV);
        size = 1;
        break;
    case REQUEST_SPATK_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPATK_IV);
        size = 1;
        break;
    case REQUEST_SPDEF_IV_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SPDEF_IV);
        size = 1;
        break;
    case REQUEST_PERSONALITY_BATTLE:
        data32 = GetMonData(mon, MON_DATA_PERSONALITY);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        dst[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case REQUEST_CHECKSUM_BATTLE:
        data16 = GetMonData(mon, MON_DATA_CHECKSUM);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_STATUS_BATTLE:
        data32 = GetMonData(mon, MON_DATA_STATUS);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        dst[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case REQUEST_LEVEL_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_LEVEL);
        size = 1;
        break;
    case REQUEST_HP_BATTLE:
        data16 = GetMonData(mon, MON_DATA_HP);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_MAX_HP_BATTLE:
        data16 = GetMonData(mon, MON_DATA_MAX_HP);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_ATK_BATTLE:
        data16 = GetMonData(mon, MON_DATA_ATK);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_DEF_BATTLE:
        data16 = GetMonData(mon, MON_DATA_DEF);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPEED_BATTLE:
        data16 = GetMonData(mon, MON_DATA_SPEED);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPATK_BATTLE:
        data16 = GetMonData(mon, MON_DATA_SPATK);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPDEF_BATTLE:
        data16 = GetMonData(mon, MON_DATA_SPDEF);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_COOL_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_COOL);
        size = 1;
        break;
    case REQUEST_BEAUTY_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_BEAUTY);
        size = 1;
        break;
    case REQUEST_CUTE_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_CUTE);
        size = 1;
        break;
    case REQUEST_SMART_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SMART);
        size = 1;
        break;
    case REQUEST_TOUGH_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_TOUGH);
        size = 1;
        break;
    case REQUEST_SHEEN_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SHEEN);
        size = 1;
        break;
    case REQUEST_COOL_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_COOL_RIBBON);
        size = 1;
        break;
    case REQUEST_BEAUTY_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_BEAUTY_RIBBON);
        size = 1;
        break;
    case REQUEST_CUTE_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_CUTE_RIBBON);
        size = 1;
        break;
    case REQUEST_SMART_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_SMART_RIBBON);
        size = 1;
        break;
    case REQUEST_TOUGH_RIBBON_BATTLE:
        dst[0] = GetMonData(mon, MON_DATA_TOUGH_RIBBON);
        size = 1;
        break;
    }
    return size;
}

void PokedudeHandleGetRawMonData(void)
{
    PlayerHandleGetRawMonData();
}

void PokedudeHandleSetMonData(void)
{
    u8 monToCheck;
    u8 i;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        SetPokedudeMonData(gBattlerPartyIndexes[gActiveBattler]);
    }
    else
    {
        monToCheck = gBattleBufferA[gActiveBattler][2];
        for (i = 0; i < PARTY_SIZE; ++i)
        {
            if (monToCheck & 1)
                SetPokedudeMonData(i);
            monToCheck >>= 1;
        }
    }
    PokedudeBufferExecCompleted();
}

void SetPokedudeMonData(u8 monId)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBattler][3];
    struct MovePpInfo *moveData = (struct MovePpInfo *)&gBattleBufferA[gActiveBattler][3];
    s32 i;
    struct Pokemon *mon;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[monId];
    else
        mon = &gEnemyParty[monId];
    switch (gBattleBufferA[gActiveBattler][1])
    {
    case REQUEST_ALL_BATTLE:
        {
            u8 iv;

            SetMonData(mon, MON_DATA_SPECIES, &battlePokemon->species);
            SetMonData(mon, MON_DATA_HELD_ITEM, &battlePokemon->item);
            for (i = 0; i < MAX_MON_MOVES; ++i)
            {
                SetMonData(mon, MON_DATA_MOVE1 + i, &battlePokemon->moves[i]);
                SetMonData(mon, MON_DATA_PP1 + i, &battlePokemon->pp[i]);
            }
            SetMonData(mon, MON_DATA_PP_BONUSES, &battlePokemon->ppBonuses);
            SetMonData(mon, MON_DATA_FRIENDSHIP, &battlePokemon->friendship);
            SetMonData(mon, MON_DATA_EXP, &battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(mon, MON_DATA_HP_IV, &iv);
            iv = battlePokemon->attackIV;
            SetMonData(mon, MON_DATA_ATK_IV, &iv);
            iv = battlePokemon->defenseIV;
            SetMonData(mon, MON_DATA_DEF_IV, &iv);
            iv = battlePokemon->speedIV;
            SetMonData(mon, MON_DATA_SPEED_IV, &iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(mon, MON_DATA_SPATK_IV, &iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(mon, MON_DATA_SPDEF_IV, &iv);
            SetMonData(mon, MON_DATA_PERSONALITY, &battlePokemon->personality);
            SetMonData(mon, MON_DATA_STATUS, &battlePokemon->status1);
            SetMonData(mon, MON_DATA_LEVEL, &battlePokemon->level);
            SetMonData(mon, MON_DATA_HP, &battlePokemon->hp);
            SetMonData(mon, MON_DATA_MAX_HP, &battlePokemon->maxHP);
            SetMonData(mon, MON_DATA_ATK, &battlePokemon->attack);
            SetMonData(mon, MON_DATA_DEF, &battlePokemon->defense);
            SetMonData(mon, MON_DATA_SPEED, &battlePokemon->speed);
            SetMonData(mon, MON_DATA_SPATK, &battlePokemon->spAttack);
            SetMonData(mon, MON_DATA_SPDEF, &battlePokemon->spDefense);
        }
        break;
    case REQUEST_SPECIES_BATTLE:
        SetMonData(mon, MON_DATA_SPECIES, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_HELDITEM_BATTLE:
        SetMonData(mon, MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MOVES_PP_BATTLE:
        for (i = 0; i < MAX_MON_MOVES; ++i)
        {
            SetMonData(mon, MON_DATA_MOVE1 + i, &moveData->moves[i]);
            SetMonData(mon, MON_DATA_PP1 + i, &moveData->pp[i]);
        }
        SetMonData(mon, MON_DATA_PP_BONUSES, &moveData->ppBonuses);
        break;
    case REQUEST_MOVE1_BATTLE:
    case REQUEST_MOVE2_BATTLE:
    case REQUEST_MOVE3_BATTLE:
    case REQUEST_MOVE4_BATTLE:
        SetMonData(mon, MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - REQUEST_MOVE1_BATTLE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_PP_DATA_BATTLE:
        SetMonData(mon, MON_DATA_PP1, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(mon, MON_DATA_PP2, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(mon, MON_DATA_PP3, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(mon, MON_DATA_PP4, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(mon, MON_DATA_PP_BONUSES, &gBattleBufferA[gActiveBattler][7]);
        break;
    case REQUEST_PPMOVE1_BATTLE:
    case REQUEST_PPMOVE2_BATTLE:
    case REQUEST_PPMOVE3_BATTLE:
    case REQUEST_PPMOVE4_BATTLE:
        SetMonData(mon, MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - REQUEST_PPMOVE1_BATTLE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_OTID_BATTLE:
        SetMonData(mon, MON_DATA_OT_ID, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_EXP_BATTLE:
        SetMonData(mon, MON_DATA_EXP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_HP_EV_BATTLE:
        SetMonData(mon, MON_DATA_HP_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ATK_EV_BATTLE:
        SetMonData(mon, MON_DATA_ATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_DEF_EV_BATTLE:
        SetMonData(mon, MON_DATA_DEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPEED_EV_BATTLE:
        SetMonData(mon, MON_DATA_SPEED_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPATK_EV_BATTLE:
        SetMonData(mon, MON_DATA_SPATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPDEF_EV_BATTLE:
        SetMonData(mon, MON_DATA_SPDEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_FRIENDSHIP_BATTLE:
        SetMonData(mon, MON_DATA_FRIENDSHIP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_POKERUS_BATTLE:
        SetMonData(mon, MON_DATA_POKERUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MET_LOCATION_BATTLE:
        SetMonData(mon, MON_DATA_MET_LOCATION, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MET_LEVEL_BATTLE:
        SetMonData(mon, MON_DATA_MET_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MET_GAME_BATTLE:
        SetMonData(mon, MON_DATA_MET_GAME, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_POKEBALL_BATTLE:
        SetMonData(mon, MON_DATA_POKEBALL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ALL_IVS_BATTLE:
        SetMonData(mon, MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(mon, MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(mon, MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(mon, MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(mon, MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][7]);
        SetMonData(mon, MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][8]);
        break;
    case REQUEST_HP_IV_BATTLE:
        SetMonData(mon, MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ATK_IV_BATTLE:
        SetMonData(mon, MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_DEF_IV_BATTLE:
        SetMonData(mon, MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPEED_IV_BATTLE:
        SetMonData(mon, MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPATK_IV_BATTLE:
        SetMonData(mon, MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPDEF_IV_BATTLE:
        SetMonData(mon, MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_PERSONALITY_BATTLE:
        SetMonData(mon, MON_DATA_PERSONALITY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_CHECKSUM_BATTLE:
        SetMonData(mon, MON_DATA_CHECKSUM, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_STATUS_BATTLE:
        SetMonData(mon, MON_DATA_STATUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_LEVEL_BATTLE:
        SetMonData(mon, MON_DATA_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_HP_BATTLE:
        SetMonData(mon, MON_DATA_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MAX_HP_BATTLE:
        SetMonData(mon, MON_DATA_MAX_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ATK_BATTLE:
        SetMonData(mon, MON_DATA_ATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_DEF_BATTLE:
        SetMonData(mon, MON_DATA_DEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPEED_BATTLE:
        SetMonData(mon, MON_DATA_SPEED, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPATK_BATTLE:
        SetMonData(mon, MON_DATA_SPATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPDEF_BATTLE:
        SetMonData(mon, MON_DATA_SPDEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_COOL_BATTLE:
        SetMonData(mon, MON_DATA_COOL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_BEAUTY_BATTLE:
        SetMonData(mon, MON_DATA_BEAUTY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_CUTE_BATTLE:
        SetMonData(mon, MON_DATA_CUTE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SMART_BATTLE:
        SetMonData(mon, MON_DATA_SMART, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_TOUGH_BATTLE:
        SetMonData(mon, MON_DATA_TOUGH, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SHEEN_BATTLE:
        SetMonData(mon, MON_DATA_SHEEN, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_COOL_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_COOL_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_BEAUTY_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_BEAUTY_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_CUTE_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_CUTE_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SMART_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_SMART_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_TOUGH_RIBBON_BATTLE:
        SetMonData(mon, MON_DATA_TOUGH_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    }
    HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
}

void PokedudeHandleSetRawMonData(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleLoadMonSprite(void)
{
    u32 y;
    u16 species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES);

    BattleLoadOpponentMonSpriteGfx(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
    y = GetBattlerSpriteDefault_Y(gActiveBattler);
    SetMultiuseSpriteTemplateToPokemon(species, GetBattlerPosition(gActiveBattler));
    gBattlerSpriteIds[gActiveBattler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                     GetBattlerSpriteCoord(gActiveBattler, 2),
                                                     y,
                                                     GetBattlerSpriteSubpriority(gActiveBattler));
    gSprites[gBattlerSpriteIds[gActiveBattler]].pos2.x = -240;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = gActiveBattler;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[2] = species;
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[gActiveBattler]], gBattleMonForms[gActiveBattler]);
    SetBattlerShadowSpriteCallback(gActiveBattler, GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES));
    gBattlerControllerFuncs[gActiveBattler] = sub_8156184;
    PokedudeBufferExecCompleted();
}

void PokedudeHandleSwitchInAnim(void)
{
    ClearTemporarySpeciesSpriteData(gActiveBattler, gBattleBufferA[gActiveBattler][2]);
    gBattlerPartyIndexes[gActiveBattler] = gBattleBufferA[gActiveBattler][1];
    BattleLoadPlayerMonSpriteGfx(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
    gActionSelectionCursor[gActiveBattler] = 0;
    gMoveSelectionCursor[gActiveBattler] = 0;
    sub_8159478(gActiveBattler);
    gBattlerControllerFuncs[gActiveBattler] = sub_81563A8;
}

void PokedudeHandleReturnMonToBall(void)
{
    if (gBattleBufferA[gActiveBattler][1] == 0)
    {
        InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_SWITCH_OUT_PLAYER_MON);
        gBattlerControllerFuncs[gActiveBattler] = sub_8156F7C;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
        PokedudeBufferExecCompleted();
    }
}

void PokedudeHandleDrawTrainerPic(void)
{
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        DecompressTrainerBackPalette(4, gActiveBattler);
        SetMultiuseSpriteTemplateToTrainerBack(4, GetBattlerPosition(gActiveBattler));
        gBattlerSpriteIds[gActiveBattler] = CreateSprite(&gMultiuseSpriteTemplate,
                                            80,
                                            (8 - gTrainerBackPicCoords[4].size) * 4 + 80,
                                            30);
        gSprites[gBattlerSpriteIds[gActiveBattler]].pos2.x = 240;
        gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = -2;
        gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
        gSprites[gBattlerSpriteIds[gActiveBattler]].callback = sub_8033EEC;
    }
    else
    {
        u32 tranerPicid = TRAINER_PIC_PROFESSOR_OAK;
        DecompressTrainerFrontPic(tranerPicid, gActiveBattler);
        SetMultiuseSpriteTemplateToTrainerBack(tranerPicid, GetBattlerPosition(gActiveBattler));
        gBattlerSpriteIds[gActiveBattler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                         176,
                                                         (8 - gTrainerFrontPicCoords[tranerPicid].size) * 4 + 40,
                                                         GetBattlerSpriteSubpriority(gActiveBattler));
        gSprites[gBattlerSpriteIds[gActiveBattler]].pos2.x = -240;
        gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = 2;
        gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[tranerPicid].tag);
        gSprites[gBattlerSpriteIds[gActiveBattler]].data[5] = gSprites[gBattlerSpriteIds[gActiveBattler]].oam.tileNum;
        gSprites[gBattlerSpriteIds[gActiveBattler]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[tranerPicid].tag);
        gSprites[gBattlerSpriteIds[gActiveBattler]].oam.affineParam = tranerPicid;
        gSprites[gBattlerSpriteIds[gActiveBattler]].callback = sub_8033EEC;
    }
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnBattlerSpriteCallbackDummy_PokedudeTmp;
}

void PokedudeHandleTrainerSlide(void)
{
    DecompressTrainerBackPalette(4, gActiveBattler);
    SetMultiuseSpriteTemplateToTrainerBack(4, GetBattlerPosition(gActiveBattler));
    gBattlerSpriteIds[gActiveBattler] = CreateSprite(&gMultiuseSpriteTemplate, 
                                                     80, 
                                                     (8 - gTrainerBackPicCoords[4].size) * 4 + 80, 
                                                     30);
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
    gSprites[gBattlerSpriteIds[gActiveBattler]].pos2.x = -96;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = 2;
    gSprites[gBattlerSpriteIds[gActiveBattler]].callback = sub_8033EEC;
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnBattlerSpriteCallbackDummy2_PokedudeTmp;
}

void PokedudeHandleTrainerSlideBack(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleFaintAnimation(void)
{
    if (gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState == 0)
    {
        if (gBattleSpritesDataPtr->battlerData[gActiveBattler].behindSubstitute)
            InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_SUBSTITUTE_TO_MON);
        ++gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState;
    }
    else
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
        {
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 0;
            if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            {
                HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
                PlaySE12WithPanning(SE_POKE_DEAD, SOUND_PAN_ATTACKER);
                gSprites[gBattlerSpriteIds[gActiveBattler]].data[1] = 0;
                gSprites[gBattlerSpriteIds[gActiveBattler]].data[2] = 5;
                gSprites[gBattlerSpriteIds[gActiveBattler]].callback = sub_8012110;
            }
            else
            {
                PlaySE12WithPanning(SE_POKE_DEAD, SOUND_PAN_TARGET);
                gSprites[gBattlerSpriteIds[gActiveBattler]].callback = SpriteCB_FaintOpponentMon;
            }
            gBattlerControllerFuncs[gActiveBattler] = sub_8156DCC;
        }
    }
}

void PokedudeHandlePaletteFade(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleSuccessBallThrowAnim(void)
{
    gBattleSpritesDataPtr->animationData->ballThrowCaseId = BALL_3_SHAKES_SUCCESS;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnSpecialAnimDone_PokedudeTmp;
}

void PokedudeHandleBallThrowAnim(void)
{
    u8 ballThrowCaseId = gBattleBufferA[gActiveBattler][1];

    gBattleSpritesDataPtr->animationData->ballThrowCaseId = ballThrowCaseId;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnSpecialAnimDone_PokedudeTmp;
}

void PokedudeHandlePause(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleMoveAnimation(void)
{
    u16 move = gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8);

    gAnimMoveTurn = gBattleBufferA[gActiveBattler][3];
    gAnimMovePower = gBattleBufferA[gActiveBattler][4] | (gBattleBufferA[gActiveBattler][5] << 8);
    gAnimMoveDmg = gBattleBufferA[gActiveBattler][6] | (gBattleBufferA[gActiveBattler][7] << 8) | (gBattleBufferA[gActiveBattler][8] << 16) | (gBattleBufferA[gActiveBattler][9] << 24);
    gAnimFriendship = gBattleBufferA[gActiveBattler][10];
    gWeatherMoveAnim = gBattleBufferA[gActiveBattler][12] | (gBattleBufferA[gActiveBattler][13] << 8);
    gAnimDisableStructPtr = (struct DisableStruct *)&gBattleBufferA[gActiveBattler][16];
    gTransformedPersonalities[gActiveBattler] = gAnimDisableStructPtr->transformedMonPersonality;
    if (IsMoveWithoutAnimation(move, gAnimMoveTurn)) // always returns FALSE
    {
        PokedudeBufferExecCompleted();
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 0;
        gBattlerControllerFuncs[gActiveBattler] = PokedudeDoMoveAnimation;
    }
}

void PokedudeDoMoveAnimation(void)
{
    u16 move = gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8);

    switch (gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState)
    {
    case 0:
        if (gBattleSpritesDataPtr->battlerData[gActiveBattler].behindSubstitute)
            InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_SUBSTITUTE_TO_MON);
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 1;
        break;
    case 1:
        if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
        {
            sub_8035450(0);
            DoMoveAnim(move);
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            sub_8035450(1);
            if (gBattleSpritesDataPtr->battlerData[gActiveBattler].behindSubstitute)
                InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, gActiveBattler, B_ANIM_MON_TO_SUBSTITUTE);
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 3;
        }
        break;
    case 3:
        if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
        {
            CopyAllBattleSpritesInvisibilities();
            TrySetBehindSubstituteSpriteBit(gActiveBattler, gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
            gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animationState = 0;
            PokedudeBufferExecCompleted();
        }
        break;
    }
}

void PokedudeHandlePrintString(void)
{
    u16 *stringId;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    stringId = (u16 *)(&gBattleBufferA[gActiveBattler][2]);
    BufferStringBattle(*stringId);
    if (sub_80D89B0(*stringId))
        BattlePutTextOnWindow(gDisplayedStringBattle, 64);
    else
        BattlePutTextOnWindow(gDisplayedStringBattle, 0);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnInactiveTextPrinter_PokedudeTmp;
}

void PokedudeHandlePrintSelectionString(void)
{
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        PokedudeHandlePrintString();
    else
        PokedudeBufferExecCompleted();
}

void sub_8158B20(void)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 160;
        gBattlerControllerFuncs[gActiveBattler] = sub_8156140;
    }
}

void PokedudeHandleChooseAction(void)
{
    s32 i;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        gBattlerControllerFuncs[gActiveBattler] = sub_8158B20;
        BattlePutTextOnWindow(gUnknown_83FDA4C, 0);
        BattlePutTextOnWindow(gUnknown_83FE725, 2);
        for (i = 0; i < MAX_MON_MOVES; ++i)
            ActionSelectionDestroyCursorAt((u8)i);
        ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillPkmnDo);
        BattlePutTextOnWindow(gDisplayedStringBattle, 1);
    }
    else
    {
        gBattlerControllerFuncs[gActiveBattler] = sub_8156140;
    }
}

void PokedudeHandleUnknownYesNoBox(void)
{
    PokedudeBufferExecCompleted();
}

void sub_8158C04(void)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 320;
        gBattlerControllerFuncs[gActiveBattler] = sub_81564E4;
    }
}

void PokedudeHandleChooseMove(void)
{
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        InitMoveSelectionsVarsAndStrings();
        gBattlerControllerFuncs[gActiveBattler] = sub_8158C04;
    }
    else
    {
        gBattlerControllerFuncs[gActiveBattler] = sub_81564E4;
    }
}

void PokedudeHandleChooseItem(void)
{
    s32 i;

    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[gActiveBattler] = OpenBagAndChooseItem_PokedudeTmp;
    gBattlerInMenuId = gActiveBattler;
    for (i = 0; i < 3; ++i)
        gUnknown_203B0DC[i] = gBattleBufferA[gActiveBattler][i + 1];
}

void PokedudeHandleChoosePokemon(void)
{
    s32 i;

    gUnknown_3004FFC[gActiveBattler] = CreateTask(TaskDummy, 0xFF);
    gTasks[gUnknown_3004FFC[gActiveBattler]].data[0] = gBattleBufferA[gActiveBattler][1] & 0xF;
    *(&gBattleStruct->battlerPreventingSwitchout) = gBattleBufferA[gActiveBattler][1] >> 4;
    *(&gBattleStruct->field_8B) = gBattleBufferA[gActiveBattler][2];
    *(&gBattleStruct->abilityPreventingSwitchout) = gBattleBufferA[gActiveBattler][3];
    for (i = 0; i < 3; ++i)
        gUnknown_203B0DC[i] = gBattleBufferA[gActiveBattler][4 + i];
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[gActiveBattler] = OpenPartyMenuToChooseMon_PokedudeTmp;
    gBattlerInMenuId = gActiveBattler;
}

void PokedudeHandleCmd23(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleHealthBarUpdate(void)
{
    s16 hpVal;
    struct Pokemon *mon;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]];
    else
        mon = &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]];
    LoadBattleBarGfx(0);
    hpVal = gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8);
    if (hpVal != INSTANT_HP_BAR_DROP)
    {
        u32 maxHP = GetMonData(mon, MON_DATA_MAX_HP);
        u32 curHP = GetMonData(mon, MON_DATA_HP);
        
        SetBattleBarStruct(gActiveBattler, gHealthboxSpriteIds[gActiveBattler], maxHP, curHP, hpVal);
    }
    else
    {
        u32 maxHP = GetMonData(mon, MON_DATA_MAX_HP);
        
        SetBattleBarStruct(gActiveBattler, gHealthboxSpriteIds[gActiveBattler], maxHP, 0, hpVal);
        UpdateHpTextInHealthbox(gHealthboxSpriteIds[gActiveBattler], 0, HP_CURRENT);
    }
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnHealthbarDone_PokedudeTmp;
}

void PokedudeHandleExpUpdate(void)
{
    u8 monId = gBattleBufferA[gActiveBattler][1];

    if (GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL) >= MAX_LEVEL)
    {
        PokedudeBufferExecCompleted();
    }
    else
    {
        s16 expPointsToGive;
        u8 taskId;

        LoadBattleBarGfx(1);
        GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);  // Unused return value.
        expPointsToGive = T1_READ_16(&gBattleBufferA[gActiveBattler][2]);
        taskId = CreateTask(Task_GiveExpToMon_PokedudeTmp, 10);
        gTasks[taskId].tExpTask_monId = monId;
        gTasks[taskId].tExpTask_gainedExp = expPointsToGive;
        gTasks[taskId].tExpTask_battler = gActiveBattler;
        gBattlerControllerFuncs[gActiveBattler] = nullsub_99;
    }
}

void PokedudeHandleStatusIconUpdate(void)
{
    if (!mplay_80342A4(gActiveBattler))
    {
        u8 battlerId;
        struct Pokemon *mon;

        if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            mon = &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]];
        else
            mon = &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]];
        UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler], mon, HEALTHBOX_STATUS_ICON);
        battlerId = gActiveBattler;
        gBattleSpritesDataPtr->healthBoxesData[battlerId].statusAnimActive = FALSE;
        gBattlerControllerFuncs[gActiveBattler] = CompleteOnFinishedStatusAnimation_PokedudeTmp;
    }
}

void PokedudeHandleStatusAnimation(void)
{
    if (!mplay_80342A4(gActiveBattler))
    {
        InitAndLaunchChosenStatusAnimation(gBattleBufferA[gActiveBattler][1],
                                           gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8) | (gBattleBufferA[gActiveBattler][4] << 16) | (gBattleBufferA[gActiveBattler][5] << 24));
        gBattlerControllerFuncs[gActiveBattler] = CompleteOnFinishedStatusAnimation_PokedudeTmp;
    }
}

void PokedudeHandleStatusXor(void)
{
    struct Pokemon *mon;
    u8 val;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]];
    else
        mon = &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]];
    val = GetMonData(mon, MON_DATA_STATUS) ^ gBattleBufferA[gActiveBattler][1];
    SetMonData(mon, MON_DATA_STATUS, &val);
    PokedudeBufferExecCompleted();
}

void PokedudeHandleDataTransfer(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleDMA3Transfer(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandlePlayBGM(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleCmd32(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleTwoReturnValues(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleChosenMonReturnValue(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleOneReturnValue(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleOneReturnValue_Duplicate(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleCmd37(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleCmd38(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleCmd39(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleCmd40(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleHitAnimation(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].invisible == TRUE)
    {
        PokedudeBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gBattlerSpriteIds[gActiveBattler]].data[1] = 0;
        DoHitAnimHealthboxEffect(gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = DoHitAnimBlinkSpriteEffect_PokedudeTmp;
    }
}

void PokedudeHandleCmd42(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandlePlaySE(void)
{
    PlaySE(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
    PokedudeBufferExecCompleted();
}

void PokedudeHandlePlayFanfare(void)
{
    PlayFanfare(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
    PokedudeBufferExecCompleted();
}

void PokedudeHandleFaintingCry(void)
{
    struct Pokemon *mon;
    u16 species;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        mon = &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]];
    else
        mon = &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]];
    species = GetMonData(mon, MON_DATA_SPECIES);
    PlayCry1(species, 25);
    PokedudeBufferExecCompleted();
}

void PokedudeHandleIntroSlide(void)
{
    HandleIntroSlide(gBattleBufferA[gActiveBattler][1]);
    gIntroSlideFlags |= 1;
    PokedudeBufferExecCompleted();
}

void PokedudeHandleIntroTrainerBallThrow(void)
{
    u8 paletteNum;
    u8 taskId;

    SetSpritePrimaryCoordsFromSecondaryCoords(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = 50;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[2] = -40;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[4] = gSprites[gBattlerSpriteIds[gActiveBattler]].pos1.y;
    gSprites[gBattlerSpriteIds[gActiveBattler]].callback = StartAnimLinearTranslation;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[5] = gActiveBattler;
    StoreSpriteCallbackInData6(&gSprites[gBattlerSpriteIds[gActiveBattler]], sub_80335F8);
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[gActiveBattler]], 1);
    paletteNum = AllocSpritePalette(0xD6F8);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[4].data, 0x100 + paletteNum * 16, 32);
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = paletteNum;
    taskId = CreateTask(sub_81595EC, 5);
    gTasks[taskId].data[0] = gActiveBattler;
    if (gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].partyStatusSummaryShown)
        gTasks[gBattlerStatusSummaryTaskId[gActiveBattler]].func = Task_HidePartyStatusSummary;
    gBattleSpritesDataPtr->animationData->field_9_x1 = 1;
    gBattlerControllerFuncs[gActiveBattler] = nullsub_99;
}

void sub_8159478(u8 battlerId)
{
    u16 species;

    gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies = SPECIES_NONE;
    gBattlerPartyIndexes[battlerId] = gBattleBufferA[battlerId][1];
    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES);
    gUnknown_3004FFC[battlerId] = CreateInvisibleSpriteWithCallback(sub_8033E3C);
    SetMultiuseSpriteTemplateToPokemon(species, GetBattlerPosition(battlerId));
    gBattlerSpriteIds[battlerId] = CreateSprite(&gMultiuseSpriteTemplate,
                                                GetBattlerSpriteCoord(battlerId, 2),
                                                GetBattlerSpriteDefault_Y(battlerId),
                                                GetBattlerSpriteSubpriority(battlerId));
    gSprites[gUnknown_3004FFC[battlerId]].data[1] = gBattlerSpriteIds[battlerId];
    gSprites[gBattlerSpriteIds[battlerId]].data[0] = battlerId;
    gSprites[gBattlerSpriteIds[battlerId]].data[2] = species;
    gSprites[gBattlerSpriteIds[battlerId]].oam.paletteNum = battlerId;
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[battlerId]], gBattleMonForms[battlerId]);
    gSprites[gBattlerSpriteIds[battlerId]].invisible = TRUE;
    gSprites[gBattlerSpriteIds[battlerId]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_3004FFC[battlerId]].data[0] = DoPokeballSendOutAnimation(0, POKEBALL_PLAYER_SENDOUT);
}

void sub_81595EC(u8 taskId)
{
    if (gTasks[taskId].data[1] < 31)
    {
        ++gTasks[taskId].data[1];
    }
    else
    {
        u8 savedActiveBattler = gActiveBattler;

        gActiveBattler = gTasks[taskId].data[0];
        gBattleBufferA[gActiveBattler][1] = gBattlerPartyIndexes[gActiveBattler];
        sub_8159478(gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = sub_8156624;
        gActiveBattler = savedActiveBattler;
        DestroyTask(taskId);
    }
}

void PokedudeHandleDrawPartyStatusSummary(void)
{
    if (gBattleBufferA[gActiveBattler][1] != 0
     && GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        PokedudeBufferExecCompleted();
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].partyStatusSummaryShown = TRUE;
        gBattlerStatusSummaryTaskId[gActiveBattler] = CreatePartyStatusSummarySprites(gActiveBattler,
                                                                                      (struct HpAndStatus *)&gBattleBufferA[gActiveBattler][4],
                                                                                      gBattleBufferA[gActiveBattler][1],
                                                                                      gBattleBufferA[gActiveBattler][2]);
        PokedudeBufferExecCompleted();
    }
}

void PokedudeHandleHidePartyStatusSummary(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleEndBounceEffect(void)
{
    EndBounceEffect(gActiveBattler, BOUNCE_HEALTHBOX);
    EndBounceEffect(gActiveBattler, BOUNCE_MON);
    PokedudeBufferExecCompleted();
}

void PokedudeHandleSpriteInvisibility(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleBattleAnimation(void)
{
    u8 animationId = gBattleBufferA[gActiveBattler][1];
    u16 argument = gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8);

    if (TryHandleLaunchBattleTableAnimation(gActiveBattler, gActiveBattler, gActiveBattler, animationId, argument))
        PokedudeBufferExecCompleted();
    else
        gBattlerControllerFuncs[gActiveBattler] = CompleteOnFinishedBattleAnimation_PokedudeTmp;
}

void PokedudeHandleLinkStandbyMsg(void)
{
    switch (gBattleBufferA[gActiveBattler][1])
    {
    case 0:
    case 1:
        EndBounceEffect(gActiveBattler, BOUNCE_HEALTHBOX);
        EndBounceEffect(gActiveBattler, BOUNCE_MON);
        break;
    case 2:
        break;
    }
    PokedudeBufferExecCompleted();
}

void PokedudeHandleResetActionMoveSelection(void)
{
    PokedudeBufferExecCompleted();
}

void PokedudeHandleCmd55(void)
{
    gBattleOutcome = gBattleBufferA[gActiveBattler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    PokedudeBufferExecCompleted();
    if (!(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER) && gBattleTypeFlags & BATTLE_TYPE_LINK)
        gBattlerControllerFuncs[gActiveBattler] = sub_8156254;
}

void PokedudeCmdEnd(void)
{
}

void sub_8159824(void)
{
    const u8 (*r7)[8] = gUnknown_8479060[gBattleStruct->field_96];
    
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
    {
        DoBounceEffect(gActiveBattler, BOUNCE_HEALTHBOX, 7, 1);
        DoBounceEffect(gActiveBattler, BOUNCE_MON, 7, 1);
    }
    if (*(r7[gUnknown_3005EE0[gActiveBattler][0]] + gActiveBattler + 4) == gUnknown_3005EE0[gActiveBattler][2])
    {
        if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            PlaySE(SE_SELECT);
        gUnknown_3005EE0[gActiveBattler][2] = 0;
        switch (r7[gUnknown_3005EE0[gActiveBattler][0]][gActiveBattler])
        {
        case 0:
            BtlController_EmitTwoReturnValues(1, B_ACTION_USE_MOVE, 0);
            break;
        case 1:
            BtlController_EmitTwoReturnValues(1, B_ACTION_USE_ITEM, 0);
            break;
        case 2:
            BtlController_EmitTwoReturnValues(1, B_ACTION_SWITCH, 0);
            break;
        case 3:
            BtlController_EmitTwoReturnValues(1, B_ACTION_RUN, 0);
            break;
        }
        PokedudeBufferExecCompleted();
        ++gUnknown_3005EE0[gActiveBattler][0];
        if (r7[gUnknown_3005EE0[gActiveBattler][0]][gActiveBattler] == 4)
            gUnknown_3005EE0[gActiveBattler][0] = 0;
    }
    else
    {
        if (gActionSelectionCursor[gActiveBattler] != r7[gUnknown_3005EE0[gActiveBattler][0]][gActiveBattler]
          && r7[gUnknown_3005EE0[gActiveBattler][0]][gActiveBattler + 4] / 2 == gUnknown_3005EE0[gActiveBattler][2])
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] = r7[gUnknown_3005EE0[gActiveBattler][0]][gActiveBattler];
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
        ++gUnknown_3005EE0[gActiveBattler][2];
    }
}
