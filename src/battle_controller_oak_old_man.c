#include "global.h"
#include "task.h"
#include "pokemon.h"
#include "pokeball.h"
#include "party_menu.h"
#include "bg.h"
#include "data.h"
#include "palette.h"
#include "util.h"
#include "m4a.h"
#include "link.h"
#include "sound.h"
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

void OakOldManHandleGetMonData(void);
void OakOldManHandleGetRawMonData(void);
void OakOldManHandleSetMonData(void);
void OakOldManHandleSetRawMonData(void);
void OakOldManHandleLoadMonSprite(void);
void OakOldManHandleSwitchInAnim(void);
void OakOldManHandleReturnMonToBall(void);
void OakOldManHandleDrawTrainerPic(void);
void OakOldManHandleTrainerSlide(void);
void OakOldManHandleTrainerSlideBack(void);
void OakOldManHandleFaintAnimation(void);
void OakOldManHandlePaletteFade(void);
void OakOldManHandleSuccessBallThrowAnim(void);
void OakOldManHandleBallThrowAnim(void);
void OakOldManHandlePause(void);
void OakOldManHandleMoveAnimation(void);
void OakOldManHandlePrintString(void);
void OakOldManHandlePrintSelectionString(void);
void OakOldManHandleChooseAction(void);
void OakOldManHandleUnknownYesNoBox(void);
void OakOldManHandleChooseMove(void);
void OakOldManHandleChooseItem(void);
void OakOldManHandleChoosePokemon(void);
void OakOldManHandleCmd23(void);
void OakOldManHandleHealthBarUpdate(void);
void OakOldManHandleExpUpdate(void);
void OakOldManHandleStatusIconUpdate(void);
void OakOldManHandleStatusAnimation(void);
void OakOldManHandleStatusXor(void);
void OakOldManHandleDataTransfer(void);
void OakOldManHandleDMA3Transfer(void);
void OakOldManHandlePlayBGM(void);
void OakOldManHandleCmd32(void);
void OakOldManHandleTwoReturnValues(void);
void OakOldManHandleChosenMonReturnValue(void);
void OakOldManHandleOneReturnValue(void);
void OakOldManHandleOneReturnValue_Duplicate(void);
void OakOldManHandleCmd37(void);
void OakOldManHandleCmd38(void);
void OakOldManHandleCmd39(void);
void OakOldManHandleCmd40(void);
void OakOldManHandleHitAnimation(void);
void OakOldManHandleCmd42(void);
void OakOldManHandlePlaySE(void);
void OakOldManHandlePlayFanfare(void);
void OakOldManHandleFaintingCry(void);
void OakOldManHandleIntroSlide(void);
void OakOldManHandleIntroTrainerBallThrow(void);
void OakOldManHandleDrawPartyStatusSummary(void);
void OakOldManHandleHidePartyStatusSummary(void);
void OakOldManHandleEndBounceEffect(void);
void OakOldManHandleSpriteInvisibility(void);
void OakOldManHandleBattleAnimation(void);
void OakOldManHandleLinkStandbyMsg(void);
void OakOldManHandleResetActionMoveSelection(void);
void OakOldManHandleCmd55(void);
void OakOldManCmdEnd(void);

void OakOldManBufferRunCommand(void);
void OakOldManBufferExecCompleted(void);
void WaitForMonSelection_tmp(void);
void CompleteWhenChoseItem_tmp(void);
void sub_80E8704(void);
void sub_80E7CD8(void);
void sub_80E835C(void);
void Task_LaunchLvlUpAnim_tmp(u8 taskId);
void DestroyExpTaskAndCompleteOnInactiveTextPrinter_tmp(u8 taskId);
void CompleteOnInactiveTextPrinter2_tmp(void);
void Task_PrepareToGiveExpWithExpBar_tmp(u8 taskId);
void sub_80E804C(u8 taskId);
void Task_UpdateLvlInHealthbox_tmp(u8 taskId);
void sub_80EB524(void);
void sub_80EB30C(void);
void sub_80E85D4(const u8 *text, u8 a1);
u32 CopyOakOldManMonData(u8 monId, u8 *dst);
void SetOakOldManMonData(u8 monId);

void (*const sOakOldManBufferCommands[CONTROLLER_CMDS_COUNT])(void) =
{
    OakOldManHandleGetMonData,
    OakOldManHandleGetRawMonData,
    OakOldManHandleSetMonData,
    OakOldManHandleSetRawMonData,
    OakOldManHandleLoadMonSprite,
    OakOldManHandleSwitchInAnim,
    OakOldManHandleReturnMonToBall,
    OakOldManHandleDrawTrainerPic,
    OakOldManHandleTrainerSlide,
    OakOldManHandleTrainerSlideBack,
    OakOldManHandleFaintAnimation,
    OakOldManHandlePaletteFade,
    OakOldManHandleSuccessBallThrowAnim,
    OakOldManHandleBallThrowAnim,
    OakOldManHandlePause,
    OakOldManHandleMoveAnimation,
    OakOldManHandlePrintString,
    OakOldManHandlePrintSelectionString,
    OakOldManHandleChooseAction,
    OakOldManHandleUnknownYesNoBox,
    OakOldManHandleChooseMove,
    OakOldManHandleChooseItem,
    OakOldManHandleChoosePokemon,
    OakOldManHandleCmd23,
    OakOldManHandleHealthBarUpdate,
    OakOldManHandleExpUpdate,
    OakOldManHandleStatusIconUpdate,
    OakOldManHandleStatusAnimation,
    OakOldManHandleStatusXor,
    OakOldManHandleDataTransfer,
    OakOldManHandleDMA3Transfer,
    OakOldManHandlePlayBGM,
    OakOldManHandleCmd32,
    OakOldManHandleTwoReturnValues,
    OakOldManHandleChosenMonReturnValue,
    OakOldManHandleOneReturnValue,
    OakOldManHandleOneReturnValue_Duplicate,
    OakOldManHandleCmd37,
    OakOldManHandleCmd38,
    OakOldManHandleCmd39,
    OakOldManHandleCmd40,
    OakOldManHandleHitAnimation,
    OakOldManHandleCmd42,
    OakOldManHandlePlaySE,
    OakOldManHandlePlayFanfare,
    OakOldManHandleFaintingCry,
    OakOldManHandleIntroSlide,
    OakOldManHandleIntroTrainerBallThrow,
    OakOldManHandleDrawPartyStatusSummary,
    OakOldManHandleHidePartyStatusSummary,
    OakOldManHandleEndBounceEffect,
    OakOldManHandleSpriteInvisibility,
    OakOldManHandleBattleAnimation,
    OakOldManHandleLinkStandbyMsg,
    OakOldManHandleResetActionMoveSelection,
    OakOldManHandleCmd55,
    OakOldManCmdEnd,
};

void nullsub_81(void)
{
}

void SetControllerToOakOrOldMan(void)
{
    gBattlerControllerFuncs[gActiveBattler] = OakOldManBufferRunCommand;
    gBattleStruct->field_94 = 0;
    gBattleStruct->field_95 = 0;
    gBattleStruct->field_96 = 0;
    gBattleStruct->field_97 = 0;
}

void OakOldManBufferRunCommand(void)
{
    if (gBattleControllerExecFlags & gBitTable[gActiveBattler])
    {
        if (gBattleBufferA[gActiveBattler][0] < ARRAY_COUNT(sOakOldManBufferCommands))
            sOakOldManBufferCommands[gBattleBufferA[gActiveBattler][0]]();
        else
            OakOldManBufferExecCompleted();
    }
}

void HandleInputChooseAction_tmp(void)
{
    u16 itemId = gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8);

    DoBounceEffect(gActiveBattler, BOUNCE_HEALTHBOX, 7, 1);
    DoBounceEffect(gActiveBattler, BOUNCE_MON, 7, 1);
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        switch (gActionSelectionCursor[gActiveBattler])
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
        OakOldManBufferExecCompleted();
    }
    else if (JOY_NEW(DPAD_LEFT))
    {
        if (gActionSelectionCursor[gActiveBattler] & 1) // if is B_ACTION_USE_ITEM or B_ACTION_RUN
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        if (!(gActionSelectionCursor[gActiveBattler] & 1)) // if is B_ACTION_USE_MOVE or B_ACTION_SWITCH
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
    }
    else if (JOY_NEW(DPAD_UP))
    {
        if (gActionSelectionCursor[gActiveBattler] & 2) // if is B_ACTION_SWITCH or B_ACTION_RUN
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
    }
    else if (JOY_NEW(DPAD_DOWN))
    {
        if (!(gActionSelectionCursor[gActiveBattler] & 2)) // if is B_ACTION_USE_MOVE or B_ACTION_USE_ITEM
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
         && GetBattlerPosition(gActiveBattler) == B_POSITION_PLAYER_RIGHT
         && !(gAbsentBattlerFlags & gBitTable[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)])
         && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            if (gBattleBufferA[gActiveBattler][1] == B_ACTION_USE_ITEM)
            {
                // Add item to bag if it is a ball
                if (itemId <= ITEM_PREMIER_BALL)
                    AddBagItem(itemId, 1);
                else
                    return;
            }
            PlaySE(SE_SELECT);
            BtlController_EmitTwoReturnValues(1, B_ACTION_CANCEL_PARTNER, 0);
            OakOldManBufferExecCompleted();
        }
    }
    else if (JOY_NEW(START_BUTTON))
    {
        SwapHpBarsWithHpText();
    }
}

void sub_80E7844(void)
{
    switch (gBattleStruct->field_94)
    {
    case 0:
        gBattleStruct->field_96 = 64;
        ++gBattleStruct->field_94;
        // fall through
    case 1:
        if (--gBattleStruct->field_96 == 0)
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(0);
            ActionSelectionCreateCursorAt(1, 0);
            gBattleStruct->field_96 = 64;
            ++gBattleStruct->field_94;
        }
        break;
    case 2:
        if (--gBattleStruct->field_96 == 0)
        {
            PlaySE(SE_SELECT);
            BtlController_EmitTwoReturnValues(1, B_ACTION_USE_ITEM, 0);
            OakOldManBufferExecCompleted();
        }
        break;
    }
}

void CompleteOnBattlerSpriteCallbackDummy_tmp(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        OakOldManBufferExecCompleted();
}

void CompleteOnInactiveTextPrinter_tmp(void)
{
    if (!IsTextPrinterActive(0))
        OakOldManBufferExecCompleted();
}

void sub_80E7930(void)
{
    if (!gPaletteFade.active)
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
}

void CompleteOnSpecialAnimDone_tmp(void)
{
    if (!gDoingBattleAnim)
        OakOldManBufferExecCompleted();
}

void sub_80E7988(void)
{
    HandleInputChooseMove();
    if (!(gBattleControllerExecFlags & gBitTable[gActiveBattler]))
        OakOldManBufferExecCompleted();
}

void OpenPartyMenuToChooseMon_tmp(void)
{
    if (!gPaletteFade.active)
    {
        u8 caseId;

        gBattlerControllerFuncs[gActiveBattler] = WaitForMonSelection_tmp;
        caseId = gTasks[gUnknown_3004FFC[gActiveBattler]].data[0];
        DestroyTask(gUnknown_3004FFC[gActiveBattler]);
        FreeAllWindowBuffers();
        OpenPartyMenuInBattle(caseId);
    }
}

void WaitForMonSelection_tmp(void)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (gUnknown_203B0C0 == 1)
            BtlController_EmitChosenMonReturnValue(1, gUnknown_203B0C1, gUnknown_203B0DC);
        else
            BtlController_EmitChosenMonReturnValue(1, 6, NULL);
        OakOldManBufferExecCompleted();
    }
}

void OpenBagAndChooseItem_tmp(void)
{
    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[gActiveBattler] = CompleteWhenChoseItem_tmp;
        nullsub_44();
        FreeAllWindowBuffers();
        if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
            sub_8107ECC();
        else
            sub_810AF74();
    }
}

void CompleteWhenChoseItem_tmp(void)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (!sub_80EB2E0(4)
         && gSpecialVar_ItemId == ITEM_POTION
         && gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
        {
            sub_80EB2F4(4);
            gBattlerControllerFuncs[gActiveBattler] = sub_80E8704;
        }
        else
        {
            BtlController_EmitOneReturnValue(1, gSpecialVar_ItemId);
            OakOldManBufferExecCompleted();
        }
    }
}

void sub_80E7B4C(void)
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
        gBattlerControllerFuncs[gActiveBattler] = sub_80E7CD8;
    }
}

void sub_80E7CD8(void)
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
        gBattlerControllerFuncs[gActiveBattler] = sub_80E835C;
    }
}

#define tExpTask_monId      data[0]
#define tExpTask_gainedExp  data[1]
#define tExpTask_battler    data[2]
#define tExpTask_frames     data[10]

void Task_GiveExpToMon_tmp(u8 taskId)
{
    u32 monId = (u8)(gTasks[taskId].tExpTask_monId);
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
             && ((u16)(monId) == gBattlerPartyIndexes[battlerId] || (u16)(monId) == gBattlerPartyIndexes[battlerId ^ BIT_FLANK]))
                gTasks[taskId].func = Task_LaunchLvlUpAnim_tmp;
            else
                gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter_tmp;
        }
        else
        {
            currExp += gainedExp;
            SetMonData(mon, MON_DATA_EXP, &currExp);
            gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2_tmp;
            DestroyTask(taskId);
        }
    }
    else
    {
        gTasks[taskId].func = Task_PrepareToGiveExpWithExpBar_tmp;
    }
}

void Task_PrepareToGiveExpWithExpBar_tmp(u8 taskId)
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
    gTasks[taskId].func = sub_80E804C;
}

void sub_80E804C(u8 taskId)
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
                gTasks[taskId].func = Task_LaunchLvlUpAnim_tmp;
            }
            else
            {
                currExp += gainedExp;
                SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &currExp);
                gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2_tmp;
                DestroyTask(taskId);
            }
        }
    }
}

void Task_LaunchLvlUpAnim_tmp(u8 taskId)
{
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    u8 monIndex = gTasks[taskId].tExpTask_monId;

    if (IsDoubleBattle() == TRUE && monIndex == gBattlerPartyIndexes[battlerId ^ BIT_FLANK])
        battlerId ^= BIT_FLANK;
    InitAndLaunchSpecialAnimation(battlerId, battlerId, battlerId, B_ANIM_LVL_UP);
    gTasks[taskId].func = Task_UpdateLvlInHealthbox_tmp;
}

void Task_UpdateLvlInHealthbox_tmp(u8 taskId)
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
        gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter_tmp;
    }
}

void DestroyExpTaskAndCompleteOnInactiveTextPrinter_tmp(u8 taskId)
{
    u8 monIndex = gTasks[taskId].tExpTask_monId;
    u8 battlerId;

    GetMonData(&gPlayerParty[monIndex], MON_DATA_LEVEL); // Unused return value
    battlerId = gTasks[taskId].tExpTask_battler;
    gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2_tmp;
    DestroyTask(taskId);
}

void sub_80E82F4(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].pos1.y + gSprites[gBattlerSpriteIds[gActiveBattler]].pos2.y > DISPLAY_HEIGHT)
    {
        FreeOamMatrix(gSprites[gBattlerSpriteIds[gActiveBattler]].oam.matrixNum);
        DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
        OakOldManBufferExecCompleted();
    }
}

void sub_80E835C(void)
{
    u32 mask;
    
    switch (gBattleStruct->field_94)
    {
    case 0:
        if (!gPaletteFade.active)
        {
            sub_80EEFC8(&gBattleStruct->field_95, &gBattleStruct->field_97, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT));
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4, 
                                   0, 
                                   8, 
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            sub_80EB30C();
            ++gBattleStruct->field_94;
        }
        break;
    case 2:
        BattleStringExpandPlaceholdersToDisplayedString(gUnknown_83FDAE2);
        BattlePutTextOnWindow(gDisplayedStringBattle, 24);
        ++gBattleStruct->field_94;
        break;
    case 3:
        if (!IsTextPrinterActive(24))
        {
            mask = (gBitTable[gBattleStruct->field_95] | gBitTable[gBattleStruct->field_97]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            BattleStringExpandPlaceholdersToDisplayedString(gUnknown_83FDB92);
            BattlePutTextOnWindow(gDisplayedStringBattle, 24);
            ++gBattleStruct->field_94;
        }
        break;
    case 5:
        if (!IsTextPrinterActive(24))
        {
            mask = (gBitTable[gBattleStruct->field_95] | gBitTable[gBattleStruct->field_97]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            BattleStringExpandPlaceholdersToDisplayedString(gUnknown_83FDBEF);
            BattlePutTextOnWindow(gDisplayedStringBattle, 24);
            ++gBattleStruct->field_94;
        }
        break;
    case 7:
        if (!IsTextPrinterActive(24))
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 8:
        if (!gPaletteFade.active)
        {
            sub_80EF0E0(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT));
            sub_80EB524();
            gBattleStruct->field_94 = 0;
            OakOldManBufferExecCompleted();
        }
        break;
    }
}

void sub_80E8570(void)
{
    sub_80E85D4(gUnknown_83FDC58, 1);
}

void sub_80E8584(void)
{
    sub_80E85D4(gUnknown_83FDC95, 64);
}

void sub_80E8598(void)
{
    sub_80E85D4(gUnknown_83FDD23, 1);
}

void sub_80E85AC(void)
{
    sub_80E85D4(gUnknown_83FDD64, 64);
}

void sub_80E85C0(void)
{
    sub_80E85D4(gUnknown_83FDDEB, 64);
}

void sub_80E85D4(const u8 *text, u8 a2)
{
    switch (gBattleStruct->field_94)
    {
    case 0:
        if (!IsTextPrinterActive(0))
        {
            gBattleStruct->field_97 = a2;
            ++gBattleStruct->field_94;
        }
        break;
    case 1:
        if (--gBattleStruct->field_97 == 0)
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4, 
                                   0, 
                                   8, 
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            sub_80EB30C();
            ++gBattleStruct->field_94;
        }
        break;
    case 3:
        BattleStringExpandPlaceholdersToDisplayedString(text);
        BattlePutTextOnWindow(gDisplayedStringBattle, 24);
        ++gBattleStruct->field_94;
        break;
    case 4:
        if (!IsTextPrinterActive(24))
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            sub_80EB524();
            if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
                OakOldManBufferExecCompleted();
            else
                OpponentBufferExecCompleted();
            gBattleCommunication[MSG_DISPLAY] = 0;
            gBattleStruct->field_94 = 0;
        }
        break;
    }
}

void sub_80E8704(void)
{
    u32 mask;

    switch (gBattleStruct->field_94)
    {
    case 0:
        if (!gPaletteFade.active)
        {
            sub_80EEFC8(&gBattleStruct->field_95, &gBattleStruct->field_97, gActiveBattler);
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4, 
                                   0, 
                                   8, 
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            mask = (gBitTable[gBattleStruct->field_95] | gBitTable[gBattleStruct->field_97]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            sub_80EB30C();
            ++gBattleStruct->field_94;
        }
        break;
    case 3:
        BattleStringExpandPlaceholdersToDisplayedString(gUnknown_83FDCD2);
        BattlePutTextOnWindow(gDisplayedStringBattle, 24);
        ++gBattleStruct->field_94;
        break;
    case 4:
        if (!IsTextPrinterActive(24))
        {
            mask = (gBitTable[gBattleStruct->field_95] | gBitTable[gBattleStruct->field_97]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->field_94;
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            sub_80EB524();
            BtlController_EmitOneReturnValue(1, gSpecialVar_ItemId);
            OakOldManBufferExecCompleted();
            gBattleStruct->field_94 = 0;
        }
        break;
    }
}

void CompleteOnHealthbarDone_tmp(void)
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
        OakOldManBufferExecCompleted();
    }
}

void CompleteOnInactiveTextPrinter2_tmp(void)
{
    if (!IsTextPrinterActive(0))
        OakOldManBufferExecCompleted();
}

void DoHitAnimBlinkSpriteEffect_tmp(void)
{
    u8 spriteId = gBattlerSpriteIds[gActiveBattler];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = FALSE;
        OakOldManBufferExecCompleted();
    }
    else
    {
        if ((gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        ++gSprites[spriteId].data[1];
    }
}

void sub_80E89C4(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[gActiveBattler]);
        OakOldManBufferExecCompleted();
    }
}

void CompleteOnBattlerSpriteCallbackDummy2_tmp(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        OakOldManBufferExecCompleted();
}

void CompleteOnFinishedBattleAnimation_tmp(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animFromTableActive)
        OakOldManBufferExecCompleted();
}

void OakOldManBufferExecCompleted(void)
{
    gBattlerControllerFuncs[gActiveBattler] = OakOldManBufferRunCommand;
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

void CompleteOnFinishedStatusAnimation_tmp(void)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].statusAnimActive)
        OakOldManBufferExecCompleted();
}

void OakOldManHandleGetMonData(void)
{
    u8 monData[sizeof(struct Pokemon) * 2 + 56]; // this allows to get full data of two pokemon, trying to get more will result in overwriting data
    u32 size = 0;
    u8 monToCheck;
    s32 i;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        size += CopyOakOldManMonData(gBattlerPartyIndexes[gActiveBattler], monData);
    }
    else
    {
        monToCheck = gBattleBufferA[gActiveBattler][2];
        for (i = 0; i < PARTY_SIZE; ++i)
        {
            if (monToCheck & 1)
                size += CopyOakOldManMonData(i, monData + size);
            monToCheck >>= 1;
        }
    }
    BtlController_EmitDataTransfer(1, size, monData);
    OakOldManBufferExecCompleted();
}

u32 CopyOakOldManMonData(u8 monId, u8 *dst)
{
    struct BattlePokemon battleMon;
    struct MovePpInfo moveData;
    u8 nickname[20];
    u8 *src;
    s16 data16;
    u32 data32;
    s32 size = 0;

    switch (gBattleBufferA[gActiveBattler][1])
    {
    case REQUEST_ALL_BATTLE:
        battleMon.species = GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);
        battleMon.item = GetMonData(&gPlayerParty[monId], MON_DATA_HELD_ITEM);
        for (size = 0; size < MAX_MON_MOVES; ++size)
        {
            battleMon.moves[size] = GetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + size);
            battleMon.pp[size] = GetMonData(&gPlayerParty[monId], MON_DATA_PP1 + size);
        }
        battleMon.ppBonuses = GetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES);
        battleMon.friendship = GetMonData(&gPlayerParty[monId], MON_DATA_FRIENDSHIP);
        battleMon.experience = GetMonData(&gPlayerParty[monId], MON_DATA_EXP);
        battleMon.hpIV = GetMonData(&gPlayerParty[monId], MON_DATA_HP_IV);
        battleMon.attackIV = GetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV);
        battleMon.defenseIV = GetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV);
        battleMon.speedIV = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV);
        battleMon.spAttackIV = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV);
        battleMon.spDefenseIV = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV);
        battleMon.personality = GetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY);
        battleMon.status1 = GetMonData(&gPlayerParty[monId], MON_DATA_STATUS);
        battleMon.level = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);
        battleMon.hp = GetMonData(&gPlayerParty[monId], MON_DATA_HP);
        battleMon.maxHP = GetMonData(&gPlayerParty[monId], MON_DATA_MAX_HP);
        battleMon.attack = GetMonData(&gPlayerParty[monId], MON_DATA_ATK);
        battleMon.defense = GetMonData(&gPlayerParty[monId], MON_DATA_DEF);
        battleMon.speed = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED);
        battleMon.spAttack = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK);
        battleMon.spDefense = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF);
        battleMon.isEgg = GetMonData(&gPlayerParty[monId], MON_DATA_IS_EGG);
        battleMon.abilityNum = GetMonData(&gPlayerParty[monId], MON_DATA_ABILITY_NUM);
        battleMon.otId = GetMonData(&gPlayerParty[monId], MON_DATA_OT_ID);
        GetMonData(&gPlayerParty[monId], MON_DATA_NICKNAME, nickname);
        StringCopy10(battleMon.nickname, nickname);
        GetMonData(&gPlayerParty[monId], MON_DATA_OT_NAME, battleMon.otName);
        src = (u8 *)&battleMon;
        for (size = 0; size < sizeof(battleMon); ++size)
            dst[size] = src[size];
        break;
    case REQUEST_SPECIES_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_HELDITEM_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_HELD_ITEM);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_MOVES_PP_BATTLE:
        for (size = 0; size < MAX_MON_MOVES; ++size)
        {
            moveData.moves[size] = GetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + size);
            moveData.pp[size] = GetMonData(&gPlayerParty[monId], MON_DATA_PP1 + size);
        }
        moveData.ppBonuses = GetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES);
        src = (u8 *)(&moveData);
        for (size = 0; size < sizeof(moveData); ++size)
            dst[size] = src[size];
        break;
    case REQUEST_MOVE1_BATTLE:
    case REQUEST_MOVE2_BATTLE:
    case REQUEST_MOVE3_BATTLE:
    case REQUEST_MOVE4_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - REQUEST_MOVE1_BATTLE);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_PP_DATA_BATTLE:
        for (size = 0; size < MAX_MON_MOVES; ++size)
            dst[size] = GetMonData(&gPlayerParty[monId], MON_DATA_PP1 + size);
        dst[size] = GetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES);
        ++size;
        break;
    case REQUEST_PPMOVE1_BATTLE:
    case REQUEST_PPMOVE2_BATTLE:
    case REQUEST_PPMOVE3_BATTLE:
    case REQUEST_PPMOVE4_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - REQUEST_PPMOVE1_BATTLE);
        size = 1;
        break;
    case REQUEST_OTID_BATTLE:
        data32 = GetMonData(&gPlayerParty[monId], MON_DATA_OT_ID);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case REQUEST_EXP_BATTLE:
        data32 = GetMonData(&gPlayerParty[monId], MON_DATA_EXP);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case REQUEST_HP_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_HP_EV);
        size = 1;
        break;
    case REQUEST_ATK_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_ATK_EV);
        size = 1;
        break;
    case REQUEST_DEF_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_DEF_EV);
        size = 1;
        break;
    case REQUEST_SPEED_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED_EV);
        size = 1;
        break;
    case REQUEST_SPATK_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK_EV);
        size = 1;
        break;
    case REQUEST_SPDEF_EV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_EV);
        size = 1;
        break;
    case REQUEST_FRIENDSHIP_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_FRIENDSHIP);
        size = 1;
        break;
    case REQUEST_POKERUS_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_POKERUS);
        size = 1;
        break;
    case REQUEST_MET_LOCATION_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_MET_LOCATION);
        size = 1;
        break;
    case REQUEST_MET_LEVEL_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_MET_LEVEL);
        size = 1;
        break;
    case REQUEST_MET_GAME_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_MET_GAME);
        size = 1;
        break;
    case REQUEST_POKEBALL_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_POKEBALL);
        size = 1;
        break;
    case REQUEST_ALL_IVS_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_HP_IV);
        dst[1] = GetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV);
        dst[2] = GetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV);
        dst[3] = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV);
        dst[4] = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV);
        dst[5] = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV);
        size = 6;
        break;
    case REQUEST_HP_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_HP_IV);
        size = 1;
        break;
    case REQUEST_ATK_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV);
        size = 1;
        break;
    case REQUEST_DEF_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV);
        size = 1;
        break;
    case REQUEST_SPEED_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV);
        size = 1;
        break;
    case REQUEST_SPATK_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV);
        size = 1;
        break;
    case REQUEST_SPDEF_IV_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV);
        size = 1;
        break;
    case REQUEST_PERSONALITY_BATTLE:
        data32 = GetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        dst[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case REQUEST_CHECKSUM_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_CHECKSUM);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_STATUS_BATTLE:
        data32 = GetMonData(&gPlayerParty[monId], MON_DATA_STATUS);
        dst[0] = (data32 & 0x000000FF);
        dst[1] = (data32 & 0x0000FF00) >> 8;
        dst[2] = (data32 & 0x00FF0000) >> 16;
        dst[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case REQUEST_LEVEL_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);
        size = 1;
        break;
    case REQUEST_HP_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_HP);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_MAX_HP_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_MAX_HP);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_ATK_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_ATK);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_DEF_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_DEF);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPEED_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_SPEED);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPATK_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_SPATK);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_SPDEF_BATTLE:
        data16 = GetMonData(&gPlayerParty[monId], MON_DATA_SPDEF);
        dst[0] = data16;
        dst[1] = data16 >> 8;
        size = 2;
        break;
    case REQUEST_COOL_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_COOL);
        size = 1;
        break;
    case REQUEST_BEAUTY_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_BEAUTY);
        size = 1;
        break;
    case REQUEST_CUTE_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_CUTE);
        size = 1;
        break;
    case REQUEST_SMART_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SMART);
        size = 1;
        break;
    case REQUEST_TOUGH_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_TOUGH);
        size = 1;
        break;
    case REQUEST_SHEEN_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SHEEN);
        size = 1;
        break;
    case REQUEST_COOL_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_COOL_RIBBON);
        size = 1;
        break;
    case REQUEST_BEAUTY_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_BEAUTY_RIBBON);
        size = 1;
        break;
    case REQUEST_CUTE_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_CUTE_RIBBON);
        size = 1;
        break;
    case REQUEST_SMART_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_SMART_RIBBON);
        size = 1;
        break;
    case REQUEST_TOUGH_RIBBON_BATTLE:
        dst[0] = GetMonData(&gPlayerParty[monId], MON_DATA_TOUGH_RIBBON);
        size = 1;
        break;
    }
    return size;
}

void OakOldManHandleGetRawMonData(void)
{
    PlayerHandleGetRawMonData();
}

void OakOldManHandleSetMonData(void)
{
    u8 monToCheck;
    u8 i;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        SetOakOldManMonData(gBattlerPartyIndexes[gActiveBattler]);
    }
    else
    {
        monToCheck = gBattleBufferA[gActiveBattler][2];
        for (i = 0; i < PARTY_SIZE; ++i)
        {
            if (monToCheck & 1)
                SetOakOldManMonData(i);
            monToCheck >>= 1;
        }
    }
    OakOldManBufferExecCompleted();
}

void SetOakOldManMonData(u8 monId)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBattler][3];
    struct MovePpInfo *moveData = (struct MovePpInfo *)&gBattleBufferA[gActiveBattler][3];
    s32 i;

    switch (gBattleBufferA[gActiveBattler][1])
    {
    case REQUEST_ALL_BATTLE:
        {
            u8 iv;

            SetMonData(&gPlayerParty[monId], MON_DATA_SPECIES, &battlePokemon->species);
            SetMonData(&gPlayerParty[monId], MON_DATA_HELD_ITEM, &battlePokemon->item);
            for (i = 0; i < MAX_MON_MOVES; ++i)
            {
                SetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + i, &battlePokemon->moves[i]);
                SetMonData(&gPlayerParty[monId], MON_DATA_PP1 + i, &battlePokemon->pp[i]);
            }
            SetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES, &battlePokemon->ppBonuses);
            SetMonData(&gPlayerParty[monId], MON_DATA_FRIENDSHIP, &battlePokemon->friendship);
            SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_HP_IV, &iv);
            iv = battlePokemon->attackIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV, &iv);
            iv = battlePokemon->defenseIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV, &iv);
            iv = battlePokemon->speedIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV, &iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV, &iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV, &iv);
            SetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY, &battlePokemon->personality);
            SetMonData(&gPlayerParty[monId], MON_DATA_STATUS, &battlePokemon->status1);
            SetMonData(&gPlayerParty[monId], MON_DATA_LEVEL, &battlePokemon->level);
            SetMonData(&gPlayerParty[monId], MON_DATA_HP, &battlePokemon->hp);
            SetMonData(&gPlayerParty[monId], MON_DATA_MAX_HP, &battlePokemon->maxHP);
            SetMonData(&gPlayerParty[monId], MON_DATA_ATK, &battlePokemon->attack);
            SetMonData(&gPlayerParty[monId], MON_DATA_DEF, &battlePokemon->defense);
            SetMonData(&gPlayerParty[monId], MON_DATA_SPEED, &battlePokemon->speed);
            SetMonData(&gPlayerParty[monId], MON_DATA_SPATK, &battlePokemon->spAttack);
            SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF, &battlePokemon->spDefense);
        }
        break;
    case REQUEST_SPECIES_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPECIES, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_HELDITEM_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MOVES_PP_BATTLE:
        for (i = 0; i < MAX_MON_MOVES; ++i)
        {
            SetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + i, &moveData->moves[i]);
            SetMonData(&gPlayerParty[monId], MON_DATA_PP1 + i, &moveData->pp[i]);
        }
        SetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES, &moveData->ppBonuses);
        break;
    case REQUEST_MOVE1_BATTLE:
    case REQUEST_MOVE2_BATTLE:
    case REQUEST_MOVE3_BATTLE:
    case REQUEST_MOVE4_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - REQUEST_MOVE1_BATTLE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_PP_DATA_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_PP1, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(&gPlayerParty[monId], MON_DATA_PP2, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(&gPlayerParty[monId], MON_DATA_PP3, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(&gPlayerParty[monId], MON_DATA_PP4, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(&gPlayerParty[monId], MON_DATA_PP_BONUSES, &gBattleBufferA[gActiveBattler][7]);
        break;
    case REQUEST_PPMOVE1_BATTLE:
    case REQUEST_PPMOVE2_BATTLE:
    case REQUEST_PPMOVE3_BATTLE:
    case REQUEST_PPMOVE4_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - REQUEST_PPMOVE1_BATTLE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_OTID_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_OT_ID, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_EXP_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_HP_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HP_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ATK_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_ATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_DEF_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_DEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPEED_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPEED_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPATK_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPDEF_EV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_FRIENDSHIP_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_FRIENDSHIP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_POKERUS_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_POKERUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MET_LOCATION_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MET_LOCATION, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MET_LEVEL_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MET_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MET_GAME_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MET_GAME, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_POKEBALL_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_POKEBALL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ALL_IVS_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][7]);
        SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][8]);
        break;
    case REQUEST_HP_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ATK_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_DEF_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPEED_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPATK_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPDEF_IV_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_PERSONALITY_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_PERSONALITY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_CHECKSUM_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_CHECKSUM, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_STATUS_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_STATUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_LEVEL_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_HP_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_MAX_HP_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_MAX_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_ATK_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_ATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_DEF_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_DEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPEED_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPEED, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPATK_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SPDEF_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SPDEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_COOL_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_COOL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_BEAUTY_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_BEAUTY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_CUTE_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_CUTE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SMART_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SMART, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_TOUGH_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_TOUGH, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SHEEN_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SHEEN, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_COOL_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_COOL_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_BEAUTY_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_BEAUTY_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_CUTE_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_CUTE_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_SMART_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_SMART_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case REQUEST_TOUGH_RIBBON_BATTLE:
        SetMonData(&gPlayerParty[monId], MON_DATA_TOUGH_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    }
    HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
}

void OakOldManHandleSetRawMonData(void)
{
    OakOldManBufferExecCompleted();
}

void OakOldManHandleLoadMonSprite(void)
{
    OakOldManBufferExecCompleted();
}

void OakOldManHandleSwitchInAnim(void)
{
    OakOldManBufferExecCompleted();
}
