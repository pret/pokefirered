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

static void SafariHandleDrawTrainerPic(u32 battler);
static void SafariHandleSuccessBallThrowAnim(u32 battler);
static void SafariHandleBallThrowAnim(u32 battler);
static void SafariHandlePrintSelectionString(u32 battler);
static void SafariHandleChooseAction(u32 battler);
static void SafariHandleChooseItem(u32 battler);
static void SafariHandleStatusIconUpdate(u32 battler);
static void SafariHandleFaintingCry(u32 battler);
static void SafariHandleIntroTrainerBallThrow(u32 battler);
static void SafariHandleBattleAnimation(u32 battler);
static void SafariHandleEndLinkBattle(u32 battler);

static void SafariBufferRunCommand(u32 battler);
static void SafariBufferExecCompleted(u32 battler);
static void CompleteWhenChosePokeblock(u32 battler);

static void (*const sSafariBufferCommands[CONTROLLER_CMDS_COUNT])(u32 battler) =
{
    [CONTROLLER_GETMONDATA]               = BtlController_Empty,                    // done
    [CONTROLLER_GETRAWMONDATA]            = BtlController_Empty,                    // done
    [CONTROLLER_SETMONDATA]               = BtlController_Empty,                    // done
    [CONTROLLER_SETRAWMONDATA]            = BtlController_Empty,                    // done
    [CONTROLLER_LOADMONSPRITE]            = BtlController_Empty,                    // done
    [CONTROLLER_SWITCHINANIM]             = BtlController_Empty,                    // done             
    [CONTROLLER_RETURNMONTOBALL]          = BtlController_Empty,                    // done
    [CONTROLLER_DRAWTRAINERPIC]           = SafariHandleDrawTrainerPic,             // done
    [CONTROLLER_TRAINERSLIDE]             = BtlController_Empty,                    // done
    [CONTROLLER_TRAINERSLIDEBACK]         = BtlController_Empty,                    // done
    [CONTROLLER_FAINTANIMATION]           = BtlController_Empty,                    // done
    [CONTROLLER_PALETTEFADE]              = BtlController_Empty,                    // done
    [CONTROLLER_SUCCESSBALLTHROWANIM]     = SafariHandleSuccessBallThrowAnim,       // done
    [CONTROLLER_BALLTHROWANIM]            = SafariHandleBallThrowAnim,              // done
    [CONTROLLER_PAUSE]                    = BtlController_Empty,                    // done
    [CONTROLLER_MOVEANIMATION]            = BtlController_Empty,                    // done
    [CONTROLLER_PRINTSTRING]              = BtlController_HandlePrintString,        // done
    [CONTROLLER_PRINTSTRINGPLAYERONLY]    = SafariHandlePrintSelectionString,       // done
    [CONTROLLER_CHOOSEACTION]             = SafariHandleChooseAction,               // done
    [CONTROLLER_UNKNOWNYESNOBOX]          = BtlController_Empty,                    // done
    [CONTROLLER_CHOOSEMOVE]               = BtlController_Empty,                    // done
    [CONTROLLER_OPENBAG]                  = SafariHandleChooseItem,                 // done
    [CONTROLLER_CHOOSEPOKEMON]            = BtlController_Empty,                    // done
    [CONTROLLER_23]                       = BtlController_Empty,                    // done
    [CONTROLLER_HEALTHBARUPDATE]          = BtlController_Empty,                    // done
    [CONTROLLER_EXPUPDATE]                = BtlController_Empty,                    // done
    [CONTROLLER_STATUSICONUPDATE]         = SafariHandleStatusIconUpdate,           // done
    [CONTROLLER_STATUSANIMATION]          = BtlController_Empty,                    // done
    [CONTROLLER_STATUSXOR]                = BtlController_Empty,                    // done
    [CONTROLLER_DATATRANSFER]             = BtlController_Empty,                    // done
    [CONTROLLER_DMA3TRANSFER]             = BtlController_Empty,                    // done
    [CONTROLLER_PLAYBGM]                  = BtlController_Empty,                    // done
    [CONTROLLER_32]                       = BtlController_Empty,                    // done
    [CONTROLLER_TWORETURNVALUES]          = BtlController_Empty,                    // done
    [CONTROLLER_CHOSENMONRETURNVALUE]     = BtlController_Empty,                    // done
    [CONTROLLER_ONERETURNVALUE]           = BtlController_Empty,                    // done
    [CONTROLLER_ONERETURNVALUE_DUPLICATE] = BtlController_Empty,                    // done
    [CONTROLLER_CLEARUNKVAR]              = BtlController_Empty,                    // done
    [CONTROLLER_SETUNKVAR]                = BtlController_Empty,                    // done
    [CONTROLLER_CLEARUNKFLAG]             = BtlController_Empty,                    // done
    [CONTROLLER_TOGGLEUNKFLAG]            = BtlController_Empty,                    // done
    [CONTROLLER_HITANIMATION]             = BtlController_Empty,                    // done
    [CONTROLLER_CANTSWITCH]               = BtlController_Empty,                    // done
    [CONTROLLER_PLAYSE]                   = BtlController_HandlePlaySE,             // done
    [CONTROLLER_PLAYFANFAREORBGM]         = BtlController_HandlePlayFanfareOrBGM,   // done
    [CONTROLLER_FAINTINGCRY]              = SafariHandleFaintingCry,                // done
    [CONTROLLER_INTROSLIDE]               = BtlController_HandleIntroSlide,         // done
    [CONTROLLER_INTROTRAINERBALLTHROW]    = SafariHandleIntroTrainerBallThrow,      // done
    [CONTROLLER_DRAWPARTYSTATUSSUMMARY]   = BtlController_Empty,                    // done
    [CONTROLLER_HIDEPARTYSTATUSSUMMARY]   = BtlController_Empty,                    // done
    [CONTROLLER_ENDBOUNCE]                = BtlController_Empty,                    // done
    [CONTROLLER_SPRITEINVISIBILITY]       = BtlController_Empty,                    // done
    [CONTROLLER_BATTLEANIMATION]          = SafariHandleBattleAnimation,            // done
    [CONTROLLER_LINKSTANDBYMSG]           = BtlController_Empty,                    // done
    [CONTROLLER_RESETACTIONMOVESELECTION] = BtlController_Empty,                    // done
    [CONTROLLER_ENDLINKBATTLE]            = SafariHandleEndLinkBattle,              // done
    [CONTROLLER_DEBUGMENU]                = BtlController_Empty,
    [CONTROLLER_TERMINATOR_NOP]           = BtlController_TerminatorNop,            // done
};

void SetControllerToSafari(u32 battler)
{
    gBattlerControllerEndFuncs[battler] = SafariBufferExecCompleted;
    gBattlerControllerFuncs[battler] = SafariBufferRunCommand;
}

static void SafariBufferRunCommand(u32 battler)
{
    if (gBattleControllerExecFlags & gBitTable[battler])
    {
        if (gBattleResources->bufferA[battler][0] < NELEMS(sSafariBufferCommands))
            sSafariBufferCommands[gBattleResources->bufferA[battler][0]](battler);
        else
            SafariBufferExecCompleted(battler);
    }
}

static void HandleInputChooseAction(u32 battler)
{
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);

        switch (gActionSelectionCursor[battler])
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
        if (gActionSelectionCursor[battler] & 1)
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        if (!(gActionSelectionCursor[battler] & 1))
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 1;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(DPAD_UP))
    {
        if (gActionSelectionCursor[battler] & 2)
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
    else if (JOY_NEW(DPAD_DOWN))
    {
        if (!(gActionSelectionCursor[battler] & 2))
        {
            PlaySE(SE_SELECT);
            ActionSelectionDestroyCursorAt(gActionSelectionCursor[battler]);
            gActionSelectionCursor[battler] ^= 2;
            ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
        }
    }
}

static void Controller_WaitForHealthbox(u32 battler)
{
    if (gSprites[gHealthboxSpriteIds[battler]].callback == SpriteCallbackDummy)
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

static void SafariOpenPokeblockCase(u32 battler)
{
    if (!gPaletteFade.active)
        gBattlerControllerFuncs[battler] = CompleteWhenChosePokeblock;
}

static void CompleteWhenChosePokeblock(u32 battler)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        BtlController_EmitOneReturnValue(battler, 1, gSpecialVar_ItemId);
        SafariBufferExecCompleted(battler);
    }
}

static void SafariBufferExecCompleted(u32 battler)
{
    gBattlerControllerFuncs[battler] = SafariBufferRunCommand;
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

static void SafariHandleDrawTrainerPic(u32 battler)
{
    u32 trainerPicId = gSaveBlock2Ptr->playerGender + TRAINER_BACK_PIC_RED;

    BtlController_HandleDrawTrainerPic(battler, trainerPicId, FALSE,
                                       80, 80 + 4 * (8 - gTrainerBackPicCoords[trainerPicId].size),
                                       30);
}

static void SafariHandleSuccessBallThrowAnim(u32 battler)
{
    BtlController_HandleSuccessBallThrowAnim(battler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW_WITH_TRAINER, FALSE);
}

static void SafariHandleBallThrowAnim(u32 battler)
{
    BtlController_HandleBallThrowAnim(battler, GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), B_ANIM_BALL_THROW_WITH_TRAINER, FALSE);
}

static void SafariHandlePrintSelectionString(u32 battler)
{
    if (GetBattlerSide(battler) == B_SIDE_PLAYER)
        BtlController_HandlePrintString(battler);
    else
        SafariBufferExecCompleted(battler);
}

static void HandleChooseActionAfterDma3(u32 battler)
{
    if (!IsDma3ManagerBusyWithBgCopy())
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 160;
        gBattlerControllerFuncs[battler] = HandleInputChooseAction;
    }
}

static void SafariHandleChooseAction(u32 battler)
{
    s32 i;

    gBattlerControllerFuncs[battler] = HandleChooseActionAfterDma3;
    BattlePutTextOnWindow(gText_EmptyString3, B_WIN_MSG);
    BattlePutTextOnWindow(gText_SafariZoneMenu, B_WIN_ACTION_MENU);
    for (i = 0; i < 4; ++i)
        ActionSelectionDestroyCursorAt(i);
    ActionSelectionCreateCursorAt(gActionSelectionCursor[battler], 0);
    BattleStringExpandPlaceholdersToDisplayedString(gText_WhatWillPlayerThrow);
    BattlePutTextOnWindow(gDisplayedStringBattle, B_WIN_ACTION_PROMPT);
}

static void SafariHandleChooseItem(u32 battler)
{
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
    gBattlerControllerFuncs[battler] = SafariOpenPokeblockCase;
    gBattlerInMenuId = battler;
}

static void SafariHandleStatusIconUpdate(u32 battler)
{
    UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gPlayerParty[gBattlerPartyIndexes[battler]], HEALTHBOX_SAFARI_BALLS_TEXT);
    SafariBufferExecCompleted(battler);
}

static void SafariHandleFaintingCry(u32 battler)
{
    u16 species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES);

    PlayCry_Normal(species, 25);
    SafariBufferExecCompleted(battler);
}

static void SafariHandleIntroTrainerBallThrow(u32 battler)
{
    UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], &gPlayerParty[gBattlerPartyIndexes[battler]], HEALTHBOX_SAFARI_ALL_TEXT);
    StartHealthboxSlideIn(battler);
    SetHealthboxSpriteVisible(gHealthboxSpriteIds[battler]);
    gBattlerControllerFuncs[battler] = Controller_WaitForHealthbox;
}

static void SafariHandleBattleAnimation(u32 battler)
{
    BtlController_HandleBattleAnimation(battler, TRUE);
}

static void SafariHandleEndLinkBattle(u32 battler)
{
    gBattleOutcome = gBattleResources->bufferA[battler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    SafariBufferExecCompleted(battler);
    if ((gBattleTypeFlags & BATTLE_TYPE_LINK) && !(gBattleTypeFlags & BATTLE_TYPE_IS_MASTER))
        gBattlerControllerFuncs[battler] = Safari_SetBattleEndCallbacks;
}
