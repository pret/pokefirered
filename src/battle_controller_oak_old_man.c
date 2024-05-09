#include "global.h"
#include "gflib.h"
#include "task.h"
#include "pokeball.h"
#include "party_menu.h"
#include "util.h"
#include "m4a.h"
#include "link.h"
#include "item.h"
#include "item_menu.h"
#include "strings.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "reshow_battle_screen.h"
#include "constants/songs.h"
#include "constants/items.h"

static void OakOldManHandleLoadMonSprite(u32 battler);
static void OakOldManHandleSwitchInAnim(u32 battler);
static void OakOldManHandleReturnMonToBall(u32 battler);
static void OakOldManHandleDrawTrainerPic(u32 battler);
static void OakOldManHandleTrainerSlide(u32 battler);
static void OakOldManHandleTrainerSlideBack(u32 battler);
static void OakOldManHandleFaintAnimation(u32 battler);
static void OakOldManHandlePaletteFade(u32 battler);
static void OakOldManHandleSuccessBallThrowAnim(u32 battler);
static void OakOldManHandleBallThrowAnim(u32 battler);
static void OakOldManHandlePause(u32 battler);
static void OakOldManHandleMoveAnimation(u32 battler);
static void OakOldManHandlePrintString(u32 battler);
static void OakOldManHandlePrintSelectionString(u32 battler);
static void OakOldManHandleChooseAction(u32 battler);
static void OakOldManHandleUnknownYesNoBox(u32 battler);
static void OakOldManHandleChooseMove(u32 battler);
static void OakOldManHandleChooseItem(u32 battler);
static void OakOldManHandleChoosePokemon(u32 battler);
static void OakOldManHandleCmd23(u32 battler);
static void OakOldManHandleHealthBarUpdate(u32 battler);
static void OakOldManHandleExpUpdate(u32 battler);
static void OakOldManHandleStatusIconUpdate(u32 battler);
static void OakOldManHandleStatusAnimation(u32 battler);
static void OakOldManHandleStatusXor(u32 battler);
static void OakOldManHandleDataTransfer(u32 battler);
static void OakOldManHandleDMA3Transfer(u32 battler);
static void OakOldManHandlePlayBGM(u32 battler);
static void OakOldManHandleCmd32(u32 battler);
static void OakOldManHandleTwoReturnValues(u32 battler);
static void OakOldManHandleChosenMonReturnValue(u32 battler);
static void OakOldManHandleOneReturnValue(u32 battler);
static void OakOldManHandleOneReturnValue_Duplicate(u32 battler);
static void OakOldManHandleCmd37(u32 battler);
static void OakOldManHandleCmd38(u32 battler);
static void OakOldManHandleCmd39(u32 battler);
static void OakOldManHandleCmd40(u32 battler);
static void OakOldManHandleHitAnimation(u32 battler);
static void OakOldManHandleCmd42(u32 battler);
static void OakOldManHandlePlaySE(u32 battler);
static void OakOldManHandlePlayFanfare(u32 battler);
static void OakOldManHandleFaintingCry(u32 battler);
static void OakOldManHandleIntroSlide(u32 battler);
static void OakOldManHandleIntroTrainerBallThrow(u32 battler);
static void OakOldManHandleDrawPartyStatusSummary(u32 battler);
static void OakOldManHandleHidePartyStatusSummary(u32 battler);
static void OakOldManHandleEndBounceEffect(u32 battler);
static void OakOldManHandleSpriteInvisibility(u32 battler);
static void OakOldManHandleBattleAnimation(u32 battler);
static void OakOldManHandleLinkStandbyMsg(u32 battler);
static void OakOldManHandleResetActionMoveSelection(u32 battler);
static void OakOldManHandleCmd55(u32 battler);
static void OakOldManCmdEnd(u32 battler);

static void OakOldManBufferRunCommand(u32 battler);
static void OakOldManBufferExecCompleted(u32 battler);
static void WaitForMonSelection(u32 battler);
static void CompleteWhenChoseItem(u32 battler);
static void PrintOakText_KeepAnEyeOnHP(u32 battler);
static void Intro_WaitForShinyAnimAndHealthbox(u32 battler);
static void PrintOakText_ForPetesSake(u32 battler);
static void Task_LaunchLvlUpAnim(u8 taskId);
static void DestroyExpTaskAndCompleteOnInactiveTextPrinter(u8 taskId);
static void CompleteOnInactiveTextPrinter2(u32 battler);
static void Task_PrepareToGiveExpWithExpBar(u8 taskId);
static void Task_GiveExpWithExpBar(u8 taskId);
static void Task_UpdateLvlInHealthbox(u8 taskId);
static void PrintOakTextWithMainBgDarkened(u32 battler, const u8 *text, u8 delay);
static void OakOldManDoMoveAnimation(u32 battler);
static void HandleInputChooseAction(u32 battler);
static void Task_StartSendOutAnim(u8 taskId);

static void (*const sOakOldManBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_HandleGetMonData,
    [CONTROLLER_GETRAWMONDATA]            = BtlController_HandleGetRawMonData,
    [CONTROLLER_SETMONDATA]               = BtlController_HandleSetMonData,
    [CONTROLLER_SETRAWMONDATA]            = BtlController_Empty,
    [CONTROLLER_LOADMONSPRITE]            = OakOldManHandleLoadMonSprite,
    [CONTROLLER_SWITCHINANIM]             = OakOldManHandleSwitchInAnim,
    [CONTROLLER_RETURNMONTOBALL]          = OakOldManHandleReturnMonToBall,
    [CONTROLLER_DRAWTRAINERPIC]           = OakOldManHandleDrawTrainerPic,
    [CONTROLLER_TRAINERSLIDE]             = OakOldManHandleTrainerSlide,
    [CONTROLLER_TRAINERSLIDEBACK]         = OakOldManHandleTrainerSlideBack,
    [CONTROLLER_FAINTANIMATION]           = OakOldManHandleFaintAnimation,
    [CONTROLLER_PALETTEFADE]              = OakOldManHandlePaletteFade,
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = OakOldManHandleSuccessBallThrowAnim,
    [CONTROLLER_BALLTHROWANIM]            = OakOldManHandleBallThrowAnim,
    [CONTROLLER_PAUSE]                    = OakOldManHandlePause,
    [CONTROLLER_MOVEANIMATION]            = OakOldManHandleMoveAnimation,
    [CONTROLLER_PRINTSTRING]              = OakOldManHandlePrintString,
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = OakOldManHandlePrintSelectionString,
    [CONTROLLER_CHOOSEACTION]             = OakOldManHandleChooseAction,
    [CONTROLLER_UNKNOWNYESNOBOX]          = OakOldManHandleUnknownYesNoBox,
    [CONTROLLER_CHOOSEMOVE]               = OakOldManHandleChooseMove,
    [CONTROLLER_OPENBAG]                  = OakOldManHandleChooseItem,
    [CONTROLLER_CHOOSEPOKEMON]            = OakOldManHandleChoosePokemon,
    [CONTROLLER_23]                       = OakOldManHandleCmd23,
    [CONTROLLER_HEALTHBARUPDATE]          = OakOldManHandleHealthBarUpdate,
    [CONTROLLER_EXPUPDATE]                = OakOldManHandleExpUpdate,
    [CONTROLLER_STATUSICONUPDATE]         = OakOldManHandleStatusIconUpdate,
    [CONTROLLER_STATUSANIMATION]          = OakOldManHandleStatusAnimation,
    [CONTROLLER_STATUSXOR]                = OakOldManHandleStatusXor,
    [CONTROLLER_DATATRANSFER]             = OakOldManHandleDataTransfer,
    [CONTROLLER_DMA3TRANSFER]             = OakOldManHandleDMA3Transfer,
    [CONTROLLER_PLAYBGM]                  = OakOldManHandlePlayBGM,
    [CONTROLLER_32]                       = OakOldManHandleCmd32,
    [CONTROLLER_TWORETURNVALUES]          = OakOldManHandleTwoReturnValues,
    [CONTROLLER_CHOSENMONRETURNVALUE]     = OakOldManHandleChosenMonReturnValue,
    [CONTROLLER_ONERETURNVALUE]           = OakOldManHandleOneReturnValue,
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = OakOldManHandleOneReturnValue_Duplicate,
    [CONTROLLER_CLEARUNKVAR]              = OakOldManHandleCmd37,
    [CONTROLLER_SETUNKVAR]                = OakOldManHandleCmd38,
    [CONTROLLER_CLEARUNKFLAG]             = OakOldManHandleCmd39,
    [CONTROLLER_TOGGLEUNKFLAG]            = OakOldManHandleCmd40,
    [CONTROLLER_HITANIMATION]             = OakOldManHandleHitAnimation,
    [CONTROLLER_CANTSWITCH]               = OakOldManHandleCmd42,
    [CONTROLLER_PLAYSE]                   = OakOldManHandlePlaySE,
    [CONTROLLER_PLAYFANFAREORBGM]         = OakOldManHandlePlayFanfare,
    [CONTROLLER_FAINTINGCRY]              = OakOldManHandleFaintingCry,
    [CONTROLLER_INTROSLIDE]               = OakOldManHandleIntroSlide,
    [CONTROLLER_INTROTRAINERBALLTHROW]    = OakOldManHandleIntroTrainerBallThrow,
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = OakOldManHandleDrawPartyStatusSummary,
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = OakOldManHandleHidePartyStatusSummary,
    [CONTROLLER_ENDBOUNCE]                = OakOldManHandleEndBounceEffect,
    [CONTROLLER_SPRITEINVISIBILITY]       = OakOldManHandleSpriteInvisibility,
    [CONTROLLER_BATTLEANIMATION]          = OakOldManHandleBattleAnimation,
    [CONTROLLER_LINKSTANDBYMSG]           = OakOldManHandleLinkStandbyMsg,
    [CONTROLLER_RESETACTIONMOVESELECTION] = OakOldManHandleResetActionMoveSelection,
    [CONTROLLER_ENDLINKBATTLE]            = OakOldManHandleCmd55,
    [CONTROLLER_TERMINATOR_NOP]           = OakOldManCmdEnd,
};

static void OakOldManDummy(u32 battler)
{
}

void SetControllerToOakOrOldMan(u32 battler)
{
    gBattlerControllerEndFuncs[battler] = OakOldManBufferExecCompleted;
    gBattlerControllerFuncs[battler] = OakOldManBufferRunCommand;
    gBattleStruct->simulatedInputState[0] = 0;
    gBattleStruct->simulatedInputState[1] = 0;
    gBattleStruct->simulatedInputState[2] = 0;
    gBattleStruct->simulatedInputState[3] = 0;
}

static void OakOldManBufferRunCommand(u32 battler)
{
    if (gBattleControllerExecFlags & gBitTable[battler])
    {
        if (gBattleResources->bufferA[battler][0] < NELEMS(sOakOldManBufferCommands))
            sOakOldManBufferCommands[gBattleResources->bufferA[battler][0]](battler);
        else
            OakOldManBufferExecCompleted(battler);
    }
}

static void HandleInputChooseAction(u32 battler)
{
    // Like player, but specifically for Rival in Oak's Lab
    u16 itemId = gBattleResources->bufferA[battler][2] | (gBattleResources->bufferA[battler][3] << 8);

    DoBounceEffect(battler, BOUNCE_HEALTHBOX, 7, 1);
    DoBounceEffect(battler, BOUNCE_MON, 7, 1);
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        switch (gActionSelectionCursor[battler])
        {
        case 0:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_USE_MOVE, 0);
            break;
        case 1:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_USE_ITEM, 0);
            break;
        case 2:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_SWITCH, 0);
            break;
        case 3:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_RUN, 0);
            break;
        }
        OakOldManBufferExecCompleted(battler);
    }
    else if (JOY_NEW(DPAD_LEFT))
    {
        if (gActionSelectionCursor[battler] & 1) // if is B_ACTION_USE_ITEM or B_ACTION_RUN
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        if (!(gActionSelectionCursor[battler] & 1)) // if is B_ACTION_USE_MOVE or B_ACTION_SWITCH
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(DPAD_UP))
    {
        if (gActionSelectionCursor[battler] & 2) // if is B_ACTION_SWITCH or B_ACTION_RUN
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(DPAD_DOWN))
    {
        if (!(gActionSelectionCursor[battler] & 2)) // if is B_ACTION_USE_MOVE or B_ACTION_USE_ITEM
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
         && GetBattlerPosition(battler) == B_POSITION_PLAYER_RIGHT
         && !(gAbsentBattlerFlags & gBitTable[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)])
         && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            if (gBattleResources->bufferA[battler][1] == B_ACTION_USE_ITEM)
            {
                // Add item to bag if it is a ball
                if (itemId <= ITEM_PREMIER_BALL)
                    AddBagItem(itemId, 1);
                else
                    return;
            }
            PlaySE(SE_SELECT);
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_CANCEL_PARTNER, 0);
            OakOldManBufferExecCompleted(battler);
        }
    }
    else if (JOY_NEW(START_BUTTON))
    {
        SwapHpBarsWithHpText();
    }
}

static void SimulateInputChooseAction(u32 battler)
{
    // Old Man
    switch (gBattleStruct->simulatedInputState[0])
    {
    case 0:
        gBattleStruct->simulatedInputState[2] = 64;
        ++gBattleStruct->simulatedInputState[0];
        // fall through
    case 1:
        if (--gBattleStruct->simulatedInputState[2] == 0)
        {
            // Move cursor to BAG
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(0);
            ActionSelectionCreateCursorAt(1, 0);
            gBattleStruct->simulatedInputState[2] = 64;
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 2:
        if (--gBattleStruct->simulatedInputState[2] == 0)
        {
            // Open bag
            PlaySE(SE_SELECT);
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_USE_ITEM, 0);
            OakOldManBufferExecCompleted(battler);
        }
        break;
    }
}

static void CompleteOnBattlerSpriteCallbackDummy(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy)
        OakOldManBufferExecCompleted(battler);
}

static void CompleteOnInactiveTextPrinter(u32 battler)
{
    if (!IsTextPrinterActive(0))
        OakOldManBufferExecCompleted(battler);
}

static void OakOldManSetBattleEndCallbacks(u32 battler)
{
    if (!gPaletteFade.active)
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
}

static void CompleteOnSpecialAnimDone(u32 battler)
{
    if (!gDoingBattleAnim)
        OakOldManBufferExecCompleted(battler);
}

void OakOldManHandleInputChooseMove(u32 battler)
{
    HandleInputChooseMove(battler);
    if (!(gBattleControllerExecFlags & gBitTable[battler]))
        OakOldManBufferExecCompleted(battler);
}

static void OpenPartyMenuToChooseMon(u32 battler)
{
    if (!gPaletteFade.active)
    {
        u8 caseId;

        gBattlerControllerFuncs[battler] = WaitForMonSelection;
        caseId = gTasks[gBattleControllerData[battler]].data[0];
        DestroyTask(gBattleControllerData[battler]);
        FreeAllWindowBuffers();
        OpenPartyMenuInTutorialBattle(caseId);
    }
}

static void WaitForMonSelection(u32 battler)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (gPartyMenuUseExitCallback == TRUE)
            BtlController_EmitChosenMonReturnValue(battler, 1, gSelectedMonPartyId, gBattlePartyCurrentOrder);
        else
            BtlController_EmitChosenMonReturnValue(battler, 1, 6, NULL);
        OakOldManBufferExecCompleted(battler);
    }
}

static void OpenBagAndChooseItem(u32 battler)
{
    if (!gPaletteFade.active)
    {
        gBattlerControllerFuncs[battler] = CompleteWhenChoseItem;
        ReshowBattleScreenDummy();
        FreeAllWindowBuffers();
        if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
            CB2_BagMenuFromBattle();
        else
            InitOldManBag();
    }
}

static void CompleteWhenChoseItem(u32 battler)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (!BtlCtrl_OakOldMan_TestState2Flag(FIRST_BATTLE_MSG_FLAG_HP_RESTORE)
         && gSpecialVar_ItemId == ITEM_POTION
         && gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
        {
            BtlCtrl_OakOldMan_SetState2Flag(FIRST_BATTLE_MSG_FLAG_HP_RESTORE);
            gBattlerControllerFuncs[battler] = PrintOakText_KeepAnEyeOnHP;
        }
        else
        {
            BtlController_EmitOneReturnValue(battler, 1, gSpecialVar_ItemId);
            OakOldManBufferExecCompleted(battler);
        }
    }
}

static void Intro_TryShinyAnimShowHealthbox(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim
     && !gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive)
        TryShinyAnimation(battler, &gPlayerParty[gBattlerPartyIndexes[battler]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim
     && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive)
        TryShinyAnimation(BATTLE_PARTNER(battler), &gPlayerParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]]);
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].ballAnimActive && !gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].ballAnimActive)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gBattleControllerData[BATTLE_PARTNER(battler)]]);
            UpdateHealthboxAttribute(gHealthboxSpriteIds[BATTLE_PARTNER(battler)],
                                     &gPlayerParty[gBattlerPartyIndexes[BATTLE_PARTNER(battler)]],
                                     HEALTHBOX_ALL);
            StartHealthboxSlideIn(BATTLE_PARTNER(battler));
            SetHealthboxSpriteVisible(gHealthboxSpriteIds[BATTLE_PARTNER(battler)]);
        }
        DestroySprite(&gSprites[gBattleControllerData[battler]]);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler],
                                 &gPlayerParty[gBattlerPartyIndexes[battler]],
                                 HEALTHBOX_ALL);
        StartHealthboxSlideIn(battler);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
        gBattleSpritesDataPtr->animationData->introAnimActive = FALSE;
        gBattlerControllerFuncs[battler] = Intro_WaitForShinyAnimAndHealthbox;
    }
}

static void Intro_WaitForShinyAnimAndHealthbox(u32 battler)
{
    bool32 r4 = FALSE;

    if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
        r4 = TRUE;
    if (r4
     && gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim
     && gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim)
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].triedShinyMonAnim = FALSE;
        gBattleSpritesDataPtr->healthBoxesData[BATTLE_PARTNER(battler)].finishedShinyMonAnim = FALSE;
        FreeSpriteTilesByTag(ANIM_TAG_GOLD_STARS);
        FreeSpritePaletteByTag(ANIM_TAG_GOLD_STARS);
        CreateTask(Task_PlayerController_RestoreBgmAfterCry, 10);
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        gBattlerControllerFuncs[battler] = PrintOakText_ForPetesSake;
    }
}

#define tExpTask_monId      data[0]
#define tExpTask_gainedExp  data[1]
#define tExpTask_battler    data[2]
#define tExpTask_frames     data[10]

static void Task_GiveExpToMon(u8 taskId)
{
    u32 monId = (u8)gTasks[taskId].tExpTask_monId;
    u8 battler = gTasks[taskId].tExpTask_battler;
    s16 gainedExp = gTasks[taskId].tExpTask_gainedExp;

    if (IsDoubleBattle() == TRUE || monId != gBattlerPartyIndexes[battler]) // Give exp without moving the expbar.
    {
        struct Pokemon *mon = &gPlayerParty[monId];
        u16 species = GetMonData(mon, MON_DATA_SPECIES);
        u8 level = GetMonData(mon, MON_DATA_LEVEL);
        u32 currExp = GetMonData(mon, MON_DATA_EXP);
        u32 nextLvlExp = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1];

        if (currExp + gainedExp >= nextLvlExp)
        {
            SetMonData(mon, MON_DATA_EXP, &nextLvlExp);
            // TODO: Dynamax stuff
            CalculateMonStats(mon);
            gainedExp -= nextLvlExp - currExp;
            BtlController_EmitTwoReturnValues(battler, 1, RET_VALUE_LEVELED_UP, gainedExp);
            if (IsDoubleBattle() == TRUE
             && ((u16)monId == gBattlerPartyIndexes[battler] || (u16)monId == gBattlerPartyIndexes[BATTLE_PARTNER(battler)]))
                gTasks[taskId].func = Task_LaunchLvlUpAnim;
            else
                gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter;
        }
        else
        {
            currExp += gainedExp;
            SetMonData(mon, MON_DATA_EXP, &currExp);
            gBattlerControllerFuncs[battler] = CompleteOnInactiveTextPrinter2;
            DestroyTask(taskId);
        }
    }
    else
    {
        gTasks[taskId].func = Task_PrepareToGiveExpWithExpBar;
    }
}

static void Task_PrepareToGiveExpWithExpBar(u8 taskId)
{
    u8 monIndex = gTasks[taskId].tExpTask_monId;
    s32 gainedExp = gTasks[taskId].tExpTask_gainedExp;
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    struct Pokemon *mon = &gPlayerParty[monIndex];
    u8 level = GetMonData(mon, MON_DATA_LEVEL);
    u16 species = GetMonData(mon, MON_DATA_SPECIES);
    u32 exp = GetMonData(mon, MON_DATA_EXP);
    u32 currLvlExp = gExperienceTables[gSpeciesInfo[species].growthRate][level];
    u32 expToNextLvl;

    exp -= currLvlExp;
    expToNextLvl = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1] - currLvlExp;
    SetBattleBarStruct(battlerId, gHealthboxSpriteIds[battlerId], expToNextLvl, exp, -gainedExp);
    PlaySE(SE_EXP);
    gTasks[taskId].func = Task_GiveExpWithExpBar;
}

static void Task_GiveExpWithExpBar(u8 taskId)
{
    if (gTasks[taskId].tExpTask_frames < 13)
    {
        ++gTasks[taskId].tExpTask_frames;
    }
    else
    {
        u8 monId = gTasks[taskId].tExpTask_monId;
        s16 gainedExp = gTasks[taskId].tExpTask_gainedExp;
        u8 battler = gTasks[taskId].tExpTask_battler;
        s16 newExpPoints;

        newExpPoints = MoveBattleBar(battler, gHealthboxSpriteIds[battler], EXP_BAR, 0);
        SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
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
            expOnNextLvl = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1];
            if (currExp + gainedExp >= expOnNextLvl)
            {
                SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &expOnNextLvl);
                CalculateMonStats(&gPlayerParty[monId]);
                gainedExp -= expOnNextLvl - currExp;
                BtlController_EmitTwoReturnValues(battler, 1, RET_VALUE_LEVELED_UP, gainedExp);
                gTasks[taskId].func = Task_LaunchLvlUpAnim;
            }
            else
            {
                currExp += gainedExp;
                SetMonData(&gPlayerParty[monId], MON_DATA_EXP, &currExp);
                gBattlerControllerFuncs[battler] = CompleteOnInactiveTextPrinter2;
                DestroyTask(taskId);
            }
        }
    }
}

static void Task_LaunchLvlUpAnim(u8 taskId)
{
    u8 battlerId = gTasks[taskId].tExpTask_battler;
    u8 monIndex = gTasks[taskId].tExpTask_monId;

    if (IsDoubleBattle() == TRUE && monIndex == gBattlerPartyIndexes[battlerId ^ BIT_FLANK])
        battlerId ^= BIT_FLANK;
    InitAndLaunchSpecialAnimation(battlerId, battlerId, battlerId, B_ANIM_LVL_UP);
    gTasks[taskId].func = Task_UpdateLvlInHealthbox;
}

static void Task_UpdateLvlInHealthbox(u8 taskId)
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
        gTasks[taskId].func = DestroyExpTaskAndCompleteOnInactiveTextPrinter;
    }
}

static void DestroyExpTaskAndCompleteOnInactiveTextPrinter(u8 taskId)
{
    u8 monIndex = gTasks[taskId].tExpTask_monId;
    u8 battlerId;

    GetMonData(&gPlayerParty[monIndex], MON_DATA_LEVEL); // Unused return value
    battlerId = gTasks[taskId].tExpTask_battler;
    gBattlerControllerFuncs[battlerId] = CompleteOnInactiveTextPrinter2;
    DestroyTask(taskId);
}

static void FreeMonSpriteAfterFaintAnim(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].y + gSprites[gBattlerSpriteIds[battler]].y2 > DISPLAY_HEIGHT)
    {
        FreeOamMatrix(gSprites[gBattlerSpriteIds[battler]].oam.matrixNum);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
        OakOldManBufferExecCompleted(battler);
    }
}

static void PrintOakText_ForPetesSake(u32 battler)
{
    u32 mask;

    switch (gBattleStruct->simulatedInputState[0])
    {
    case 0:
        if (!gPaletteFade.active)
        {
            DoLoadHealthboxPalsForLevelUp(&gBattleStruct->simulatedInputState[1], &gBattleStruct->simulatedInputState[3], GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT));
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 2:
        BattleStringExpandPlaceholdersToDisplayedString(gText_ForPetesSake);
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gBattleStruct->simulatedInputState[0];
        break;
    case 3:
        if (!IsTextPrinterActive(24))
        {
            mask = (gBitTable[gBattleStruct->simulatedInputState[1]] | gBitTable[gBattleStruct->simulatedInputState[3]]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            BattleStringExpandPlaceholdersToDisplayedString(gText_TheTrainerThat);
            BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 5:
        if (!IsTextPrinterActive(24))
        {
            mask = (gBitTable[gBattleStruct->simulatedInputState[1]] | gBitTable[gBattleStruct->simulatedInputState[3]]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            BattleStringExpandPlaceholdersToDisplayedString(gText_TryBattling);
            BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
            ++gBattleStruct->simulatedInputState[0];
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
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 8:
        if (!gPaletteFade.active)
        {
            DoFreeHealthboxPalsForLevelUp(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT));
            BtlCtrl_RemoveVoiceoverMessageFrame();
            gBattleStruct->simulatedInputState[0] = 0;
            OakOldManBufferExecCompleted(battler);
        }
        break;
    }
}

void PrintOakText_InflictingDamageIsKey(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_InflictingDamageIsKey, 1);
}

static void PrintOakText_LoweringStats(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_LoweringStats, 64);
}

void PrintOakText_OakNoRunningFromATrainer(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_OakNoRunningFromATrainer, 1);
}

static void PrintOakText_WinEarnsPrizeMoney(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_WinEarnsPrizeMoney, 64);
}

void PrintOakText_HowDisappointing(u32 battler)
{
    PrintOakTextWithMainBgDarkened(battler, gText_HowDissapointing, 64);
}

static void PrintOakTextWithMainBgDarkened(u32 battler, const u8 *text, u8 delay)
{
    // If delay is 0, it's treated as 256.
    switch (gBattleStruct->simulatedInputState[0])
    {
    case 0:
        if (!IsTextPrinterActive(0))
        {
            gBattleStruct->simulatedInputState[3] = delay;
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 1:
        if (--gBattleStruct->simulatedInputState[3] == 0)
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 3:
        BattleStringExpandPlaceholdersToDisplayedString(text);
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gBattleStruct->simulatedInputState[0];
        break;
    case 4:
        if (!IsTextPrinterActive(24))
        {
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            BtlCtrl_RemoveVoiceoverMessageFrame();
            if (GetBattlerSide(battler) == B_SIDE_PLAYER)
                OakOldManBufferExecCompleted(battler);
            else
                OpponentBufferExecCompleted(battler);
            gBattleCommunication[MSG_DISPLAY] = 0;
            gBattleStruct->simulatedInputState[0] = 0;
        }
        break;
    }
}

static void PrintOakText_KeepAnEyeOnHP(u32 battler)
{
    u32 mask;

    switch (gBattleStruct->simulatedInputState[0])
    {
    case 0:
        if (!gPaletteFade.active)
        {
            DoLoadHealthboxPalsForLevelUp(&gBattleStruct->simulatedInputState[1], &gBattleStruct->simulatedInputState[3], battler);
            BeginNormalPaletteFade(0xFFFFFF7E,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            mask = (gBitTable[gBattleStruct->simulatedInputState[1]] | gBitTable[gBattleStruct->simulatedInputState[3]]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   8,
                                   0,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            BtlCtrl_DrawVoiceoverMessageFrame();
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 3:
        BattleStringExpandPlaceholdersToDisplayedString(gText_KeepAnEyeOnHP);
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_OAK_OLD_MAN);
        ++gBattleStruct->simulatedInputState[0];
        break;
    case 4:
        if (!IsTextPrinterActive(24))
        {
            mask = (gBitTable[gBattleStruct->simulatedInputState[1]] | gBitTable[gBattleStruct->simulatedInputState[3]]) << 16;
            BeginNormalPaletteFade(mask,
                                   4,
                                   0,
                                   8,
                                   RGB_BLACK);
            ++gBattleStruct->simulatedInputState[0];
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
            ++gBattleStruct->simulatedInputState[0];
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            BtlCtrl_RemoveVoiceoverMessageFrame();
            BtlController_EmitOneReturnValue(battler, 1, gSpecialVar_ItemId);
            OakOldManBufferExecCompleted(battler);
            gBattleStruct->simulatedInputState[0] = 0;
        }
        break;
    }
}

static void CompleteOnHealthbarDone(u32 battler)
{
    s16 hpValue = MoveBattleBar(battler, gHealthboxSpriteIds[battler], HEALTH_BAR, 0);

    SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
    if (hpValue != -1)
    {
        UpdateHpTextInHealthbox(gHealthboxSpriteIds[battler], HP_CURRENT, hpValue, gBattleMons[battler].maxHP);
    }
    else
    {
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
        OakOldManBufferExecCompleted(battler);
    }
}

static void CompleteOnInactiveTextPrinter2(u32 battler)
{
    if (!IsTextPrinterActive(0))
        OakOldManBufferExecCompleted(battler);
}

static void DoHitAnimBlinkSpriteEffect(u32 battler)
{
    u8 spriteId = gBattlerSpriteIds[battler];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = FALSE;
        OakOldManBufferExecCompleted(battler);
    }
    else
    {
        if ((gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        ++gSprites[spriteId].data[1];
    }
}

static void DoSwitchOutAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[battler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
        OakOldManBufferExecCompleted(battler);
    }
}

static void CompleteOnBattlerSpriteCallbackDummy2(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].callback == SpriteCallbackDummy)
        OakOldManBufferExecCompleted(battler);
}

static void CompleteOnFinishedBattleAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].animFromTableActive)
        OakOldManBufferExecCompleted(battler);
}

static void OakOldManBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = OakOldManBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(battler, 2, 4, &playerId);
        gBattleResources->bufferA[battler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        gBattleControllerExecFlags &= ~gBitTable[battler];
    }
}

static void CompleteOnFinishedStatusAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[battler].statusAnimActive)
        OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleLoadMonSprite(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleSwitchInAnim(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleReturnMonToBall(u32 battler)
{
    if (gBattleResources->bufferA[battler][1] == 0)
    {
        InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SWITCH_OUT_PLAYER_MON);
        gBattlerControllerFuncs[battler] = DoSwitchOutAnimation;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[battler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[battler]]);
        SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
        OakOldManBufferExecCompleted(battler);
    }
}

static void OakOldManHandleDrawTrainerPic(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        DecompressTrainerBackPalette(gSaveBlock2Ptr->playerGender, battler);
        SetMultiuseSpriteTemplateToTrainerBack(gSaveBlock2Ptr->playerGender, GetBattlerPosition(battler));
        gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                         80,
                                                         (8 - gTrainerBackPicCoords[gSaveBlock2Ptr->playerGender].size) * 4 + 80,
                                                         30);
    }
    else
    {
        DecompressTrainerBackPalette(TRAINER_BACK_PIC_OLD_MAN, battler);
        SetMultiuseSpriteTemplateToTrainerBack(TRAINER_BACK_PIC_OLD_MAN, GetBattlerPosition(battler));
        gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                         80,
                                                         (8 - gTrainerBackPicCoords[TRAINER_BACK_PIC_OLD_MAN].size) * 4 + 80,
                                                         30);
    }
    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
    gSprites[gBattlerSpriteIds[battler]].x2 = DISPLAY_WIDTH;
    gSprites[gBattlerSpriteIds[battler]].data[0] = -2;
    gSprites[gBattlerSpriteIds[battler]].callback = SpriteCB_TrainerSlideIn;
    gBattlerControllerFuncs[battler] = CompleteOnBattlerSpriteCallbackDummy;
}

static void OakOldManHandleTrainerSlide(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        DecompressTrainerBackPalette(gSaveBlock2Ptr->playerGender, battler);
        SetMultiuseSpriteTemplateToTrainerBack(gSaveBlock2Ptr->playerGender, GetBattlerPosition(battler));
        gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                         80,
                                                         (8 - gTrainerBackPicCoords[gSaveBlock2Ptr->playerGender].size) * 4 + 80,
                                                         30);
    }
    else
    {
        DecompressTrainerBackPalette(TRAINER_BACK_PIC_OLD_MAN, battler);
        SetMultiuseSpriteTemplateToTrainerBack(TRAINER_BACK_PIC_OLD_MAN, GetBattlerPosition(battler));
        gBattlerSpriteIds[battler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                         80,
                                                         (8 - gTrainerBackPicCoords[TRAINER_BACK_PIC_OLD_MAN].size) * 4 + 80,
                                                         30);
    }
    gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = battler;
    gSprites[gBattlerSpriteIds[battler]].x2 = -96;
    gSprites[gBattlerSpriteIds[battler]].data[0] = 2;
    gSprites[gBattlerSpriteIds[battler]].callback = SpriteCB_TrainerSlideIn;
    gBattlerControllerFuncs[battler] = CompleteOnBattlerSpriteCallbackDummy2;
}

static void OakOldManHandleTrainerSlideBack(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleFaintAnimation(u32 battler)
{
    if (gBattleSpritesDataPtr->healthBoxesData[battler].animationState == 0)
    {
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SUBSTITUTE_TO_MON);
        ++gBattleSpritesDataPtr->healthBoxesData[battler].animationState;
    }
    else
    {
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[battler]], battler);
            PlaySE12WithPanning(SE_FAINT, SOUND_PAN_ATTACKER);
            gSprites[gBattlerSpriteIds[battler]].data[1] = 0;
            gSprites[gBattlerSpriteIds[battler]].data[2] = 5;
            gSprites[gBattlerSpriteIds[battler]].callback = SpriteCB_FaintSlideAnim;
            gBattlerControllerFuncs[battler] = FreeMonSpriteAfterFaintAnim;
        }
    }
}

static void OakOldManHandlePaletteFade(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleSuccessBallThrowAnim(u32 battler)
{
    gBattleSpritesDataPtr->animationData->ballThrowCaseId = BALL_3_SHAKES_SUCCESS;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(battler, battler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW_WITH_TRAINER);
    gBattlerControllerFuncs[battler] = CompleteOnSpecialAnimDone;
}

static void OakOldManHandleBallThrowAnim(u32 battler)
{
    u8 ballThrowCaseId = gBattleResources->bufferA[battler][1];

    gBattleSpritesDataPtr->animationData->ballThrowCaseId = ballThrowCaseId;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(battler, battler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW_WITH_TRAINER);
    gBattlerControllerFuncs[battler] = CompleteOnSpecialAnimDone;
}

static void OakOldManHandlePause(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleMoveAnimation(u32 battler)
{
    u16 move = gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8);

    gAnimMoveTurn = gBattleResources->bufferA[battler][3];
    gAnimMovePower = gBattleResources->bufferA[battler][4] | (gBattleResources->bufferA[battler][5] << 8);
    gAnimMoveDmg = gBattleResources->bufferA[battler][6] | (gBattleResources->bufferA[battler][7] << 8) | (gBattleResources->bufferA[battler][8] << 16) | (gBattleResources->bufferA[battler][9] << 24);
    gAnimFriendship = gBattleResources->bufferA[battler][10];
    gWeatherMoveAnim = gBattleResources->bufferA[battler][12] | (gBattleResources->bufferA[battler][13] << 8);
    gAnimDisableStructPtr = (struct DisableStruct *)&gBattleResources->bufferA[battler][16];
    gTransformedPersonalities[battler] = gAnimDisableStructPtr->transformedMonPersonality;
    if (IsMoveWithoutAnimation(move, gAnimMoveTurn)) // always returns FALSE
    {
        OakOldManBufferExecCompleted(battler);
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
        gBattlerControllerFuncs[battler] = OakOldManDoMoveAnimation;
    }
}

static void OakOldManDoMoveAnimation(u32 battler)
{
    u16 move = gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8);

    switch (gBattleSpritesDataPtr->healthBoxesData[battler].animationState)
    {
    case 0:
        if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
            InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_SUBSTITUTE_TO_MON);
        gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 1;
        break;
    case 1:
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            SetBattlerSpriteAffineMode(ST_OAM_AFFINE_OFF);
            DoMoveAnim(move);
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            SetBattlerSpriteAffineMode(ST_OAM_AFFINE_NORMAL);
            if (gBattleSpritesDataPtr->battlerData[battler].behindSubstitute)
                InitAndLaunchSpecialAnimation(battler, battler, battler, B_ANIM_MON_TO_SUBSTITUTE);
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 3;
        }
        break;
    case 3:
        if (!gBattleSpritesDataPtr->healthBoxesData[battler].specialAnimActive)
        {
            CopyAllBattleSpritesInvisibilities();
            TrySetBehindSubstituteSpriteBit(battler, gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8));
            gBattleSpritesDataPtr->healthBoxesData[battler].animationState = 0;
            OakOldManBufferExecCompleted(battler);
        }
        break;
    }
}

static void OakOldManHandlePrintString(u32 battler)
{
    u16 *stringId;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    stringId = (u16 *)(&gBattleResources->bufferA[battler][2]);
    if (gBattleTypeFlags & BATTLE_TYPE_OLD_MAN_TUTORIAL && *stringId == 1)
    {
        OakOldManBufferExecCompleted(battler);
    }
    else
    {
        BufferStringBattle(battler, *stringId);
        if (BattleStringShouldBeColored(*stringId))
            BattlePutTextOnWindow(gDisplayedStringBattle, (B_WIN_MSG | B_TEXT_FLAG_NPC_CONTEXT_FONT));
        else
            BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_MSG);
        if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
        {
            switch (*stringId)
            {
            case STRINGID_DEFENDERSSTATFELL:
                if (!BtlCtrl_OakOldMan_TestState2Flag(FIRST_BATTLE_MSG_FLAG_STAT_CHG))
                {
                    BtlCtrl_OakOldMan_SetState2Flag(FIRST_BATTLE_MSG_FLAG_STAT_CHG);
                    gBattlerControllerFuncs[battler] = PrintOakText_LoweringStats;
                    return;
                }
                break;
            case STRINGID_PLAYERGOTMONEY:
                gBattlerControllerFuncs[battler] = PrintOakText_WinEarnsPrizeMoney;
                return;
            case STRINGID_TRAINER1WINTEXT:
                gBattlerControllerFuncs[battler] = PrintOakText_HowDisappointing;
                return;
            case STRINGID_DONTLEAVEBIRCH:
                gBattlerControllerFuncs[battler] = PrintOakText_OakNoRunningFromATrainer;
                return;
            }
        }
        gBattlerControllerFuncs[battler] = CompleteOnInactiveTextPrinter;
    }
}

static void OakOldManHandlePrintSelectionString(u32 battler)
{
    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        OakOldManHandlePrintString(battler);
    else
        OakOldManBufferExecCompleted(battler);
}

static void HandleChooseActionAfterDma3(u32 battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 160;
        if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
            gBattlerControllerFuncs[battler] = HandleInputChooseAction;
        else
            gBattlerControllerFuncs[battler] = SimulateInputChooseAction;
    }
}

static void OakOldManHandleChooseAction(u32 battler)
{
    s32 i;

    gBattlerControllerFuncs[battler] = HandleChooseActionAfterDma3;
    BattlePutTextOnWindow(gText_EmptyString3, B_WIN_MSG);
    BattlePutTextOnWindow(gText_BattleMenu, B_WIN_ACTION_MENU);
    for (i = 0; i < MAX_MON_MOVES; ++i)
        ActionSelectionDestroyCursorAt((u8)i);
    ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, battler, gBattlerPartyIndexes[battler]);
        BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillPkmnDo);
    }
    else
        BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillOldManDo);
    BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_ACTION_PROMPT);
}

static void OakOldManHandleUnknownYesNoBox(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakHandleChooseMove_WaitDma3(u32 battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 320;
        gBattlerControllerFuncs[battler] = OakOldManHandleInputChooseMove;
    }
}

static void OakOldManHandleChooseMove(u32 battler)
{
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        InitMoveSelectionsVarsAndStrings(battler);
        gBattlerControllerFuncs[battler] = OakHandleChooseMove_WaitDma3;
    }
    else
    {
        switch (gBattleStruct->simulatedInputState[1])
        {
        case 0:
            InitMoveSelectionsVarsAndStrings(battler);
            ++gBattleStruct->simulatedInputState[1];
            gBattleStruct->simulatedInputState[3] = 80;
            // fall through
        case 1:
            if (--gBattleStruct->simulatedInputState[3] == 0)
            {
                PlaySE(SE_SELECT);
                BtlController_EmitTwoReturnValues(battler, 1, 10, 0x100);
                OakOldManBufferExecCompleted(battler);
            }
            break;
        }
    }
}

static void OakOldManHandleChooseItem(u32 battler)
{
    s32 i;

    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[battler] = OpenBagAndChooseItem;
    gBattlerInMenuId = battler;
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleResources->bufferA[battler][i + 1];
}

static void OakOldManHandleChoosePokemon(u32 battler)
{
    s32 i;

    gBattleControllerData[battler] = CreateTask(TaskDummy, 0xFF);
    gTasks[gBattleControllerData[battler]].data[0] = gBattleResources->bufferA[battler][1] & 0xF;
    *(&gBattleStruct->battlerPreventingSwitchout) = gBattleResources->bufferA[battler][1] >> 4;
    *(&gBattleStruct->playerPartyIdx) = gBattleResources->bufferA[battler][2];
    *(&gBattleStruct->abilityPreventingSwitchout) = (gBattleResources->bufferA[battler][3] & 0xFF) | (gBattleResources->bufferA[battler][7] << 8);
    for (i = 0; i < 3; ++i)
        gBattlePartyCurrentOrder[i] = gBattleResources->bufferA[battler][4 + i];
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[battler] = OpenPartyMenuToChooseMon;
    gBattlerInMenuId = battler;
}

static void OakOldManHandleCmd23(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleHealthBarUpdate(u32 battler)
{
    s16 hpVal;

    LoadBattleBarGfx(0);
    hpVal = gBattleResources->bufferA[battler][2] | (gBattleResources->bufferA[battler][3] << 8);
    if (hpVal != INSTANT_HP_BAR_DROP)
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_MAX_HP);
        u32 curHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_HP);

        SetBattleBarStruct(battler, gHealthboxSpriteIds[battler], maxHP, curHP, hpVal);
    }
    else
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_MAX_HP);

        SetBattleBarStruct(battler, gHealthboxSpriteIds[battler], maxHP, 0, hpVal);
        UpdateHpTextInHealthbox(gHealthboxSpriteIds[battler], HP_CURRENT, 0, maxHP);
    }
    gBattlerControllerFuncs[battler] = CompleteOnHealthbarDone;
}

static void OakOldManHandleExpUpdate(u32 battler)
{
    u8 monId = gBattleResources->bufferA[battler][1];

    if (GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL) >= MAX_LEVEL)
    {
        OakOldManBufferExecCompleted(battler);
    }
    else
    {
        s16 expPointsToGive;
        u8 taskId;

        LoadBattleBarGfx(1);
        GetMonData(&gPlayerParty[monId], MON_DATA_SPECIES);  // Unused return value.
        expPointsToGive = T1_READ_16(&gBattleResources->bufferA[battler][2]);
        taskId = CreateTask(Task_GiveExpToMon, 10);
        gTasks[taskId].tExpTask_monId = monId;
        gTasks[taskId].tExpTask_gainedExp = expPointsToGive;
        gTasks[taskId].tExpTask_battler = battler;
        gBattlerControllerFuncs[battler] = OakOldManDummy;
    }
}

static void OakOldManHandleStatusIconUpdate(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleStatusAnimation(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleStatusXor(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleDataTransfer(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleDMA3Transfer(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandlePlayBGM(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleCmd32(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleTwoReturnValues(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleChosenMonReturnValue(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleOneReturnValue(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleOneReturnValue_Duplicate(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleCmd37(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleCmd38(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleCmd39(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleCmd40(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleHitAnimation(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[battler]].invisible == TRUE)
    {
        OakOldManBufferExecCompleted(battler);
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gBattlerSpriteIds[battler]].data[1] = 0;
        DoHitAnimHealthboxEffect(battler);
        gBattlerControllerFuncs[battler] = DoHitAnimBlinkSpriteEffect;
    }
}

static void OakOldManHandleCmd42(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandlePlaySE(u32 battler)
{
    PlaySE(gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8));
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandlePlayFanfare(u32 battler)
{
    PlayFanfare(gBattleResources->bufferA[battler][1] | (gBattleResources->bufferA[battler][2] << 8));
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleFaintingCry(u32 battler)
{
    u16 species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);

    PlayCry_Normal(species, 25);
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleIntroSlide(u32 battler)
{
    HandleIntroSlide(gBattleResources->bufferA[battler][1]);
    gIntroSlideFlags |= 1;
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleIntroTrainerBallThrow(u32 battler)
{
    u8 paletteNum;
    u8 taskId;

    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        SetSpritePrimaryCoordsFromSecondaryCoords(&gSprites[gBattlerSpriteIds[battler]]);
        gSprites[gBattlerSpriteIds[battler]].data[0] = 50;
        gSprites[gBattlerSpriteIds[battler]].data[2] = -40;
        gSprites[gBattlerSpriteIds[battler]].data[4] = gSprites[gBattlerSpriteIds[battler]].y;
        gSprites[gBattlerSpriteIds[battler]].callback = StartAnimLinearTranslation;
        gSprites[gBattlerSpriteIds[battler]].data[5] = battler;
        StoreSpriteCallbackInData6(&gSprites[gBattlerSpriteIds[battler]], SpriteCB_FreePlayerSpriteLoadMonSprite);
        StartSpriteAnim(&gSprites[gBattlerSpriteIds[battler]], 1);
        paletteNum = AllocSpritePalette(0xD6F8);
        LoadCompressedPalette(gTrainerBackPicPaletteTable[gSaveBlock2Ptr->playerGender].data, OBJ_PLTT_ID(paletteNum), PLTT_SIZE_4BPP);
        gSprites[gBattlerSpriteIds[battler]].oam.paletteNum = paletteNum;
        taskId = CreateTask(Task_StartSendOutAnim, 5);
        gTasks[taskId].data[0] = battler;
        if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown)
            gTasks[gBattlerStatusSummaryTaskId[battler]].func = Task_HidePartyStatusSummary;
        gBattleSpritesDataPtr->animationData->introAnimActive = TRUE;
        gBattlerControllerFuncs[battler] = BattleControllerDummy;
    }
    else
    {
        if (gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown)
            gTasks[gBattlerStatusSummaryTaskId[battler]].func = Task_HidePartyStatusSummary;
        OakOldManBufferExecCompleted(battler);
    }
}

static void StartSendOutAnim(u8 battlerId)
{
    u16 species;

    gBattleSpritesDataPtr->battlerData[battlerId].transformSpecies = SPECIES_NONE;
    gBattlerPartyIndexes[battlerId] = gBattleResources->bufferA[battlerId][1];
    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES);
    gBattleControllerData[battlerId] = CreateInvisibleSpriteWithCallback(SpriteCB_WaitForBattlerBallReleaseAnim);
    SetMultiuseSpriteTemplateToPokemon(species, GetBattlerPosition(battlerId));
    gBattlerSpriteIds[battlerId] = CreateSprite(&gMultiuseSpriteTemplate,
                                                GetBattlerSpriteCoord(battlerId, BATTLER_COORD_X_2),
                                                GetBattlerSpriteDefault_Y(battlerId),
                                                GetBattlerSpriteSubpriority(battlerId));
    gSprites[gBattleControllerData[battlerId]].data[1] = gBattlerSpriteIds[battlerId];
    gSprites[gBattlerSpriteIds[battlerId]].data[0] = battlerId;
    gSprites[gBattlerSpriteIds[battlerId]].data[2] = species;
    gSprites[gBattlerSpriteIds[battlerId]].oam.paletteNum = battlerId;
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[battlerId]], gBattleMonForms[battlerId]);
    gSprites[gBattlerSpriteIds[battlerId]].invisible = TRUE;
    gSprites[gBattlerSpriteIds[battlerId]].callback = SpriteCallbackDummy;
    gSprites[gBattleControllerData[battlerId]].data[0] = DoPokeballSendOutAnimation(battlerId, 0, POKEBALL_PLAYER_SENDOUT);
}

static void Task_StartSendOutAnim(u8 taskId)
{
    if (gTasks[taskId].data[1] < 31)
    {
        ++gTasks[taskId].data[1];
    }
    else
    {
        u32 battler = gTasks[taskId].data[0];

        gBattleResources->bufferA[battler][1] = gBattlerPartyIndexes[battler];
        StartSendOutAnim(battler);
        gBattlerControllerFuncs[battler] = Intro_TryShinyAnimShowHealthbox;
        DestroyTask(taskId);
    }
}

static void OakOldManHandleDrawPartyStatusSummary(u32 battler)
{
    if (gBattleResources->bufferA[battler][1] != 0
     && GetBattlerSide(battler) == B_SIDE_PLAYER)
    {
        OakOldManBufferExecCompleted(battler);
    }
    else
    {
        gBattleSpritesDataPtr->healthBoxesData[battler].partyStatusSummaryShown = TRUE;
        gBattlerStatusSummaryTaskId[battler] = CreatePartyStatusSummarySprites(battler,
                                                                                      (struct HpAndStatus *)&gBattleResources->bufferA[battler][4],
                                                                                      gBattleResources->bufferA[battler][1],
                                                                                      gBattleResources->bufferA[battler][2]);
        OakOldManBufferExecCompleted(battler);
    }
}

static void OakOldManHandleHidePartyStatusSummary(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleEndBounceEffect(u32 battler)
{
    EndBounceEffect(battler, BOUNCE_HEALTHBOX);
    EndBounceEffect(battler, BOUNCE_MON);
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleSpriteInvisibility(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleBattleAnimation(u32 battler)
{
    u8 animationId = gBattleResources->bufferA[battler][1];
    u16 argument = gBattleResources->bufferA[battler][2] | (gBattleResources->bufferA[battler][3] << 8);

    if (TryHandleLaunchBattleTableAnimation(battler, battler, battler, animationId, argument))
        OakOldManBufferExecCompleted(battler);
    else
        gBattlerControllerFuncs[battler] = CompleteOnFinishedBattleAnimation;
}

static void OakOldManHandleLinkStandbyMsg(u32 battler)
{
    switch (gBattleResources->bufferA[battler][1])
    {
    case 0:
    case 1:
        EndBounceEffect(battler, BOUNCE_HEALTHBOX);
        EndBounceEffect(battler, BOUNCE_MON);
        break;
    case 2:
        break;
    }
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleResetActionMoveSelection(u32 battler)
{
    OakOldManBufferExecCompleted(battler);
}

static void OakOldManHandleCmd55(u32 battler)
{
    gBattleOutcome = gBattleResources->bufferA[battler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    OakOldManBufferExecCompleted(battler);
    if (!(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER) && gBattleTypeFlags & BATTLE_TYPE_LINK)
        gBattlerControllerFuncs[battler] = OakOldManSetBattleEndCallbacks;
}

static void OakOldManCmdEnd(u32 battler)
{
}

bool8 BtlCtrl_OakOldMan_TestState2Flag(u8 mask)
{
    return gBattleStruct->simulatedInputState[2] & mask;
}

void BtlCtrl_OakOldMan_SetState2Flag(u8 mask)
{
    gBattleStruct->simulatedInputState[2] |= mask;
}

void BtlCtrl_DrawVoiceoverMessageFrame(void)
{
    u32 width = 0x1A;
    u32 pal = 7;

    FillBgTilemapBufferRect(0, 0x30,                 0,    0xE,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x31,                 1,    0xE,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x32,                 2,    0xE,  width, 1, pal);
    FillBgTilemapBufferRect(0, 0x33,                 0x1C, 0xE,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x34,                 0x1D, 0xE,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x35,                 0,    0xF,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x36,                 1,    0xF,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x38,                 0x1C, 0xF,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x39,                 0x1D, 0xF,  1,     1, pal);
    FillBgTilemapBufferRect(0, 0x3A,                 0,    0x10, 1,     1, pal);
    FillBgTilemapBufferRect(0, 0x3B,                 1,    0x10, 1,     1, pal);
    FillBgTilemapBufferRect(0, 0x3C,                 0x1C, 0x10, 1,     1, pal);
    FillBgTilemapBufferRect(0, 0x3D,                 0x1D, 0x10, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x3A), 0,    0x11, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x3B), 1,    0x11, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x3C), 0x1C, 0x11, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x3D), 0x1D, 0x11, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x35), 0,    0x12, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x36), 1,    0x12, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x38), 0x1C, 0x12, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x39), 0x1D, 0x12, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x30), 0,    0x13, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x31), 1,    0x13, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x32), 2,    0x13, width, 1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x33), 0x1C, 0x13, 1,     1, pal);
    FillBgTilemapBufferRect(0, BG_TILE_V_FLIP(0x34), 0x1D, 0x13, 1,     1, pal);
}

void BtlCtrl_RemoveVoiceoverMessageFrame(void)
{
    u32 pal = 0;
    u32 width = 0x1A;
    u32 height;

    FillBgTilemapBufferRect(0, 3,    0,    0xE,  1,     1,      pal);
    height = 4;
    FillBgTilemapBufferRect(0, 4,    1,    0xE,  1,     1,      pal);
    FillBgTilemapBufferRect(0, 5,    2,    0xE,  width, 1,      pal);
    FillBgTilemapBufferRect(0, 6,    0x1C, 0xE,  1,     1,      pal);
    FillBgTilemapBufferRect(0, 7,    0x1D, 0xE,  1,     1,      pal);
    FillBgTilemapBufferRect(0, 8,    0,    0xF,  1,     height, pal);
    FillBgTilemapBufferRect(0, 9,    1,    0xF,  1,     height, pal);
    FillBgTilemapBufferRect(0, 0xA,  2,    0xF,  width, height, pal);
    FillBgTilemapBufferRect(0, 0xB,  0x1C, 0xF,  1,     height, pal);
    FillBgTilemapBufferRect(0, 0xC,  0x1D, 0xF,  1,     height, pal);
    FillBgTilemapBufferRect(0, 0xD,  0,    0x13, 1,     1,      pal);
    FillBgTilemapBufferRect(0, 0xE,  1,    0x13, 1,     1,      pal);
    FillBgTilemapBufferRect(0, 0xF,  2,    0x13, width, 1,      pal);
    FillBgTilemapBufferRect(0, 0x10, 0x1C, 0x13, 1,     1,      pal);
    FillBgTilemapBufferRect(0, 0x11, 0x1D, 0x13, 1,     1,      pal);
}
