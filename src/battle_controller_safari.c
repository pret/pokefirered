#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "data.h"
#include "item_menu.h"
#include "link.h"
#include "main.h"
#include "pokeball.h"
#include "util.h"
#include "strings.h"
#include "constants/songs.h"
#include "constants/battle_anim.h"

static void SafariHandleGetMonData(u32 battler);
static void SafariHandleGetRawMonData(u32 battler);
static void SafariHandleSetMonData(u32 battler);
static void SafariHandleSetRawMonData(u32 battler);
static void SafariHandleLoadMonSprite(u32 battler);
static void SafariHandleSwitchInAnim(u32 battler);
static void SafariHandleReturnMonToBall(u32 battler);
static void SafariHandleDrawTrainerPic(u32 battler);
static void SafariHandleTrainerSlide(u32 battler);
static void SafariHandleTrainerSlideBack(u32 battler);
static void SafariHandleFaintAnimation(u32 battler);
static void SafariHandlePaletteFade(u32 battler);
static void SafariHandleSuccessBallThrowAnim(u32 battler);
static void SafariHandleBallThrowAnim(u32 battler);
static void SafariHandlePause(u32 battler);
static void SafariHandleMoveAnimation(u32 battler);
static void SafariHandlePrintString(u32 battler);
static void SafariHandlePrintSelectionString(u32 battler);
static void SafariHandleChooseAction(u32 battler);
static void SafariHandleUnknownYesNoBox(u32 battler);
static void SafariHandleChooseMove(u32 battler);
static void SafariHandleChooseItem(u32 battler);
static void SafariHandleChoosePokemon(u32 battler);
static void SafariHandleCmd23(u32 battler);
static void SafariHandleHealthBarUpdate(u32 battler);
static void SafariHandleExpUpdate(u32 battler);
static void SafariHandleStatusIconUpdate(u32 battler);
static void SafariHandleStatusAnimation(u32 battler);
static void SafariHandleStatusXor(u32 battler);
static void SafariHandleDataTransfer(u32 battler);
static void SafariHandleDMA3Transfer(u32 battler);
static void SafariHandlePlayBGM(u32 battler);
static void SafariHandleCmd32(u32 battler);
static void SafariHandleTwoReturnValues(u32 battler);
static void SafariHandleChosenMonReturnValue(u32 battler);
static void SafariHandleOneReturnValue(u32 battler);
static void SafariHandleOneReturnValue_Duplicate(u32 battler);
static void SafariHandleCmd37(u32 battler);
static void SafariHandleCmd38(u32 battler);
static void SafariHandleCmd39(u32 battler);
static void SafariHandleCmd40(u32 battler);
static void SafariHandleHitAnimation(u32 battler);
static void SafariHandleCmd42(u32 battler);
static void SafariHandlePlaySE(u32 battler);
static void SafariHandlePlayFanfareOrBGM(u32 battler);
static void SafariHandleFaintingCry(u32 battler);
static void SafariHandleIntroSlide(u32 battler);
static void SafariHandleIntroTrainerBallThrow(u32 battler);
static void SafariHandleDrawPartyStatusSummary(u32 battler);
static void SafariHandleHidePartyStatusSummary(u32 battler);
static void SafariHandleEndBounceEffect(u32 battler);
static void SafariHandleSpriteInvisibility(u32 battler);
static void SafariHandleBattleAnimation(u32 battler);
static void SafariHandleLinkStandbyMsg(u32 battler);
static void SafariHandleResetActionMoveSelection(u32 battler);
static void SafariHandleCmd55(u32 battler);
static void SafariCmdEnd(u32 battler);

static void SafariBufferRunCommand(u32 battler);
static void SafariBufferExecCompleted(u32 battler);
static void CompleteWhenChosePokeblock(u32 battler);

static void (*const sSafariBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = SafariHandleGetMonData,
    [CONTROLLER_GETRAWMONDATA]            = SafariHandleGetRawMonData,
    [CONTROLLER_SETMONDATA]               = SafariHandleSetMonData,
    [CONTROLLER_SETRAWMONDATA]            = SafariHandleSetRawMonData,
    [CONTROLLER_LOADMONSPRITE]            = SafariHandleLoadMonSprite,
    [CONTROLLER_SWITCHINANIM]             = SafariHandleSwitchInAnim,
    [CONTROLLER_RETURNMONTOBALL]          = SafariHandleReturnMonToBall,
    [CONTROLLER_DRAWTRAINERPIC]           = SafariHandleDrawTrainerPic,
    [CONTROLLER_TRAINERSLIDE]             = SafariHandleTrainerSlide,
    [CONTROLLER_TRAINERSLIDEBACK]         = SafariHandleTrainerSlideBack,
    [CONTROLLER_FAINTANIMATION]           = SafariHandleFaintAnimation,
    [CONTROLLER_PALETTEFADE]              = SafariHandlePaletteFade,
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = SafariHandleSuccessBallThrowAnim,
    [CONTROLLER_BALLTHROWANIM]            = SafariHandleBallThrowAnim,
    [CONTROLLER_PAUSE]                    = SafariHandlePause,
    [CONTROLLER_MOVEANIMATION]            = SafariHandleMoveAnimation,
    [CONTROLLER_PRINTSTRING]              = SafariHandlePrintString,
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = SafariHandlePrintSelectionString,
    [CONTROLLER_CHOOSEACTION]             = SafariHandleChooseAction,
    [CONTROLLER_UNKNOWNYESNOBOX]          = SafariHandleUnknownYesNoBox,
    [CONTROLLER_CHOOSEMOVE]               = SafariHandleChooseMove,
    [CONTROLLER_OPENBAG]                  = SafariHandleChooseItem,
    [CONTROLLER_CHOOSEPOKEMON]            = SafariHandleChoosePokemon,
    [CONTROLLER_23]                       = SafariHandleCmd23,
    [CONTROLLER_HEALTHBARUPDATE]          = SafariHandleHealthBarUpdate,
    [CONTROLLER_EXPUPDATE]                = SafariHandleExpUpdate,
    [CONTROLLER_STATUSICONUPDATE]         = SafariHandleStatusIconUpdate,
    [CONTROLLER_STATUSANIMATION]          = SafariHandleStatusAnimation,
    [CONTROLLER_STATUSXOR]                = SafariHandleStatusXor,
    [CONTROLLER_DATATRANSFER]             = SafariHandleDataTransfer,
    [CONTROLLER_DMA3TRANSFER]             = SafariHandleDMA3Transfer,
    [CONTROLLER_PLAYBGM]                  = SafariHandlePlayBGM,
    [CONTROLLER_32]                       = SafariHandleCmd32,
    [CONTROLLER_TWORETURNVALUES]          = SafariHandleTwoReturnValues,
    [CONTROLLER_CHOSENMONRETURNVALUE]     = SafariHandleChosenMonReturnValue,
    [CONTROLLER_ONERETURNVALUE]           = SafariHandleOneReturnValue,
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = SafariHandleOneReturnValue_Duplicate,
    [CONTROLLER_CLEARUNKVAR]              = SafariHandleCmd37,
    [CONTROLLER_SETUNKVAR]                = SafariHandleCmd38,
    [CONTROLLER_CLEARUNKFLAG]             = SafariHandleCmd39,
    [CONTROLLER_TOGGLEUNKFLAG]            = SafariHandleCmd40,
    [CONTROLLER_HITANIMATION]             = SafariHandleHitAnimation,
    [CONTROLLER_CANTSWITCH]               = SafariHandleCmd42,
    [CONTROLLER_PLAYSE]                   = SafariHandlePlaySE,
    [CONTROLLER_PLAYFANFAREORBGM]         = SafariHandlePlayFanfareOrBGM,
    [CONTROLLER_FAINTINGCRY]              = SafariHandleFaintingCry,
    [CONTROLLER_INTROSLIDE]               = SafariHandleIntroSlide,
    [CONTROLLER_INTROTRAINERBALLTHROW]    = SafariHandleIntroTrainerBallThrow,
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = SafariHandleDrawPartyStatusSummary,
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = SafariHandleHidePartyStatusSummary,
    [CONTROLLER_ENDBOUNCE]                = SafariHandleEndBounceEffect,
    [CONTROLLER_SPRITEINVISIBILITY]       = SafariHandleSpriteInvisibility,
    [CONTROLLER_BATTLEANIMATION]          = SafariHandleBattleAnimation,
    [CONTROLLER_LINKSTANDBYMSG]           = SafariHandleLinkStandbyMsg,
    [CONTROLLER_RESETACTIONMOVESELECTION] = SafariHandleResetActionMoveSelection,
    [CONTROLLER_ENDLINKBATTLE]            = SafariHandleCmd55,
    [CONTROLLER_TERMINATOR_NOP]           = SafariCmdEnd,
};

// not used
static void SafariDummy(void)
{
}

void SetControllerToSafari(u32 battler)
{
    gBattlerControllerFuncs[gActiveBattler] = SafariBufferRunCommand;
}

static void SafariBufferRunCommand(u32 battler)
{
    if (gBattleControllerExecFlags & gBitTable[gActiveBattler])
    {
        if (gBattleBufferA[gActiveBattler][0] < NELEMS(sSafariBufferCommands))
            sSafariBufferCommands[gBattleBufferA[gActiveBattler][0]](battler);
        else
            SafariBufferExecCompleted(battler);
    }
}

static void HandleInputChooseAction(u32 battler)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        switch (gActionSelectionCursor[gActiveBattler])
        {
        case 0:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_SAFARI_BALL, 0);
            break;
        case 1:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_SAFARI_BAIT, 0);
            break;
        case 2:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_SAFARI_GO_NEAR, 0);
            break;
        case 3:
            BtlController_EmitTwoReturnValues(battler, 1, B_ACTION_SAFARI_RUN, 0);
            break;
        }
        SafariBufferExecCompleted(battler);
    }
    else if (JOY_NEW(DPAD_LEFT))
    {
        if (gActionSelectionCursor[gActiveBattler] & 1)
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        if (!(gActionSelectionCursor[gActiveBattler] & 1))
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
    }
    else if (JOY_NEW(DPAD_UP))
    {
        if (gActionSelectionCursor[gActiveBattler] & 2)
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
    }
    else if (JOY_NEW(DPAD_DOWN))
    {
        if (!(gActionSelectionCursor[gActiveBattler] & 2))
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[gActiveBattler]);
            gActionSelectionCursor[gActiveBattler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
        }
    }
}

static void CompleteOnBattlerSpriteCallbackDummy(u32 battler)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        SafariBufferExecCompleted(battler);
}

static void CompleteOnInactiveTextPrinter(u32 battler)
{
    if (!IsTextPrinterActive(0))
        SafariBufferExecCompleted(battler);
}

static void CompleteOnHealthboxSpriteCallbackDummy(u32 battler)
{
    if (gSprites[gHealthboxSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        SafariBufferExecCompleted(battler);
}

static void Safari_SetBattleEndCallbacks(u32 battler)
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
    if (!gDoingBattleAnim || !gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].specialAnimActive)
        SafariBufferExecCompleted(battler);
}

static void SafariOpenPokeblockCase(u32 battler)
{
    if (!gPaletteFade.active)
        gBattlerControllerFuncs[gActiveBattler] = CompleteWhenChosePokeblock;
}

static void CompleteWhenChosePokeblock(u32 battler)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        BtlController_EmitOneReturnValue(battler, 1, gSpecialVar_ItemId);
        SafariBufferExecCompleted(battler);
    }
}

static void CompleteOnFinishedBattleAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].animFromTableActive)
        SafariBufferExecCompleted(battler);
}

static void SafariBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = SafariBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(battler, 2, 4, &playerId);
        gBattleBufferA[battler][0] = CONTROLLER_TERMINATOR_NOP;
    }
    else
    {
        gBattleControllerExecFlags &= ~gBitTable[battler];
    }
}

// not used
static void CompleteOnFinishedStatusAnimation(u32 battler)
{
    if (!gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].statusAnimActive)
        SafariBufferExecCompleted(battler);
}

static void SafariHandleGetMonData(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleGetRawMonData(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleSetMonData(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleSetRawMonData(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleLoadMonSprite(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleSwitchInAnim(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleReturnMonToBall(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleDrawTrainerPic(u32 battler)
{
    DecompressTrainerBackPalette(gSaveBlock2Ptr->playerGender, gActiveBattler);
    SetMultiuseSpriteTemplateToTrainerBack(gSaveBlock2Ptr->playerGender, GetBattlerPosition(gActiveBattler));
    gBattlerSpriteIds[gActiveBattler] = CreateSprite(&gMultiuseSpriteTemplate,
                                                     80,
                                                     (8 - gTrainerBackPicCoords[gSaveBlock2Ptr->playerGender].size) * 4 + 80,
                                                     30);
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
    gSprites[gBattlerSpriteIds[gActiveBattler]].x2 = DISPLAY_WIDTH;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = -2;
    gSprites[gBattlerSpriteIds[gActiveBattler]].callback = SpriteCB_TrainerSlideIn;
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnBattlerSpriteCallbackDummy;
}

static void SafariHandleTrainerSlide(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleTrainerSlideBack(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleFaintAnimation(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandlePaletteFade(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleSuccessBallThrowAnim(u32 battler)
{
    gBattleSpritesDataPtr->animationData->ballThrowCaseId = BALL_3_SHAKES_SUCCESS;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW_WITH_TRAINER);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnSpecialAnimDone;
}

static void SafariHandleBallThrowAnim(u32 battler)
{
    u8 ballThrowCaseId = gBattleBufferA[gActiveBattler][1];

    gBattleSpritesDataPtr->animationData->ballThrowCaseId = ballThrowCaseId;
    gDoingBattleAnim = TRUE;
    InitAndLaunchSpecialAnimation(gActiveBattler, gActiveBattler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW_WITH_TRAINER);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnSpecialAnimDone;
}

static void SafariHandlePause(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleMoveAnimation(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandlePrintString(u32 battler)
{
    u16 *stringId;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    stringId = (u16 *)(&gBattleBufferA[gActiveBattler][2]);
    BufferStringBattle(*stringId);
    if (BattleStringShouldBeColored(*stringId))
        BattlePutTextOnWindow(gDisplayedStringBattle, (B_WIN_MSG | B_TEXT_FLAG_NPC_CONTEXT_FONT));
    else
        BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_MSG);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnInactiveTextPrinter;
}

static void SafariHandlePrintSelectionString(u32 battler)
{
    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        SafariHandlePrintString(battler);
    else
        SafariBufferExecCompleted(battler);
}

static void HandleChooseActionAfterDma3(u32 battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 160;
        gBattlerControllerFuncs[gActiveBattler] = HandleInputChooseAction;
    }
}

static void SafariHandleChooseAction(u32 battler)
{
    s32 i;

    gBattlerControllerFuncs[gActiveBattler] = HandleChooseActionAfterDma3;
    BattlePutTextOnWindow(gText_EmptyString3, B_WIN_MSG);
    BattlePutTextOnWindow(gText_SafariZoneMenu, B_WIN_ACTION_MENU);
    for (i = 0; i < 4; ++i)
        ActionSelectionDestroyCursorAt(i);
    ActionSelectionCreateCursorAt(gActionSelectionCursor[gActiveBattler], 0);
    BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillPlayerThrow);
    BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_ACTION_PROMPT);
}

static void SafariHandleUnknownYesNoBox(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleChooseMove(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleChooseItem(u32 battler)
{
    s32 i;

    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[gActiveBattler] = SafariOpenPokeblockCase;
    gBattlerInMenuId = gActiveBattler;
}

static void SafariHandleChoosePokemon(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleCmd23(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleHealthBarUpdate(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleExpUpdate(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleStatusIconUpdate(u32 battler)
{
    UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler], &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], HEALTHBOX_SAFARI_BALLS_TEXT);
    SafariBufferExecCompleted(battler);
}

static void SafariHandleStatusAnimation(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleStatusXor(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleDataTransfer(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleDMA3Transfer(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandlePlayBGM(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleCmd32(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleTwoReturnValues(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleChosenMonReturnValue(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleOneReturnValue(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleOneReturnValue_Duplicate(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleCmd37(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleCmd38(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleCmd39(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleCmd40(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleHitAnimation(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleCmd42(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandlePlaySE(u32 battler)
{
    s8 pan;

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        pan = SOUND_PAN_ATTACKER;
    else
        pan = SOUND_PAN_TARGET;
    PlaySE12WithPanning(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8), pan);
    SafariBufferExecCompleted(battler);
}

static void SafariHandlePlayFanfareOrBGM(u32 battler)
{
    PlayFanfare(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
    SafariBufferExecCompleted(battler);
}

static void SafariHandleFaintingCry(u32 battler)
{
    u16 species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES);

    PlayCry_Normal(species, 25);
    SafariBufferExecCompleted(battler);
}

static void SafariHandleIntroSlide(u32 battler)
{
    HandleIntroSlide(gBattleBufferA[gActiveBattler][1]);
    gIntroSlideFlags |= 1;
    SafariBufferExecCompleted(battler);
}

static void SafariHandleIntroTrainerBallThrow(u32 battler)
{
    UpdateHealthboxAttribute(gHealthboxSpriteIds[gActiveBattler], &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], HEALTHBOX_SAFARI_ALL_TEXT);
    StartHealthboxSlideIn(gActiveBattler);
    SetHealthboxSpriteVisible(gHealthboxSpriteIds[gActiveBattler]);
    gBattlerControllerFuncs[gActiveBattler] = CompleteOnHealthboxSpriteCallbackDummy;
}

static void SafariHandleDrawPartyStatusSummary(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleHidePartyStatusSummary(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleEndBounceEffect(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleSpriteInvisibility(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleBattleAnimation(u32 battler)
{
    u8 animationId = gBattleBufferA[gActiveBattler][1];
    u16 argument = gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8);

    if (TryHandleLaunchBattleTableAnimation(gActiveBattler, gActiveBattler, gActiveBattler, animationId, argument))
        SafariBufferExecCompleted(battler);
    else
        gBattlerControllerFuncs[gActiveBattler] = CompleteOnFinishedBattleAnimation;
}

static void SafariHandleLinkStandbyMsg(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleResetActionMoveSelection(u32 battler)
{
    SafariBufferExecCompleted(battler);
}

static void SafariHandleCmd55(u32 battler)
{
    gBattleOutcome = gBattleBufferA[gActiveBattler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    SafariBufferExecCompleted(battler);
    if ((gBattleTypeFlags & BATTLE_TYPE_LINK) && !(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER))
        gBattlerControllerFuncs[gActiveBattler] = Safari_SetBattleEndCallbacks;
}

static void SafariCmdEnd(u32 battler)
{
}
