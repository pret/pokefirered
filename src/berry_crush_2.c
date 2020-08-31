#include "global.h"
#include "gflib.h"
#include "berry.h"
#include "berry_crush.h"
#include "berry_powder.h"
#include "item.h"
#include "link.h"
#include "link_rfu.h"
#include "math_util.h"
#include "menu.h"
#include "minigame_countdown.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "random.h"
#include "save.h"
#include "strings.h"
#include "constants/songs.h"

static u32 BerryCrushCommand_BeginNormalPaletteFade(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_WaitPaletteFade(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_PrintMessage(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_InitGfx(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_TeardownGfx(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_SignalReadyToBegin(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_AskPickBerry(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_GoToBerryPouch(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_WaitForOthersToPickBerries(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_DropBerriesIntoCrusher(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_DropLid(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_Countdown(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_PlayGame_Master(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_PlayGame_Slave(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_FinishGame(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_HandleTimeUp(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_TabulateResults(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_ShowResults(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_SaveTheGame(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_AskPlayAgain(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_CommunicatePlayAgainResponses(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_FadeOutToPlayAgain(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_PlayAgainFailureMessage(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_GracefulExit(struct BerryCrushGame * game, u8 *params);
static u32 BerryCrushCommand_Quit(struct BerryCrushGame * game, u8 *params);
static void sub_814D4D8(struct BerryCrushGame * game);
static void BerryCrush_SetShowMessageParams(u8 *params, u8 stringId, u8 flags, u16 waitKeys, u8 followupCmd);

static const u8 gUnknown_846E2E0[] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
static const u8 gUnknown_846E2E8[] = {0x00, 0x01, 0x02, 0x03, 0x05, 0x00, 0x00, 0x00};

static const s8 gUnknown_846E2F0[][7] = {
    {0x04, 0x01, 0x00, 0xff, 0x00, 0x00, 0x00},
    {0x04, 0x02, 0x00, 0xff, 0x00, 0x00, 0x00},
    {0x04, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00},
    {0x06, 0x03, 0x01, 0xff, 0xfd, 0xff, 0x00},
    {0x06, 0x04, 0x01, 0xfe, 0xfc, 0xfe, 0x00},
};

ALIGNED(4) const u8 gUnknown_846E314[][4] = {
    {0x03, 0x02, 0x01, 0x00},
    {0x03, 0x03, 0x01, 0x00},
    {0x03, 0x03, 0x02, 0x00},
    {0x03, 0x04, 0x02, 0x00},
    {0x03, 0x05, 0x03, 0x00}
};

static const u8 *const sBerryCrushMessages[] = {
    gText_BerryCrush_AreYouReady,
    gText_BerryCrush_WaitForOthersToChooseBerry,
    gText_BerryCrush_GainedXUnitsOfPowder,
    gText_BerryCrush_RecordingGameResults,
    gText_BerryCrush_WantToPlayAgain,
    gText_BerryCrush_NoBerries,
    gText_BerryCrush_MemberDroppedOut,
    gText_BerryCrush_TimeUp,
    gText_BerryCrush_CommunicationStandby
};

static u32 (*const sBerryCrushCommands[])(struct BerryCrushGame * berryCrushGame, u8 *params) = {
    NULL,
    BerryCrushCommand_BeginNormalPaletteFade,
    BerryCrushCommand_WaitPaletteFade,
    BerryCrushCommand_PrintMessage,
    BerryCrushCommand_InitGfx,
    BerryCrushCommand_TeardownGfx,
    BerryCrushCommand_SignalReadyToBegin,
    BerryCrushCommand_AskPickBerry,
    BerryCrushCommand_GoToBerryPouch,
    BerryCrushCommand_WaitForOthersToPickBerries,
    BerryCrushCommand_DropBerriesIntoCrusher,
    BerryCrushCommand_DropLid,
    BerryCrushCommand_Countdown,
    BerryCrushCommand_PlayGame_Master,
    BerryCrushCommand_PlayGame_Slave,
    BerryCrushCommand_FinishGame,
    BerryCrushCommand_HandleTimeUp,
    BerryCrushCommand_TabulateResults,
    BerryCrushCommand_ShowResults,
    BerryCrushCommand_SaveTheGame,
    BerryCrushCommand_AskPlayAgain,
    BerryCrushCommand_CommunicatePlayAgainResponses,
    BerryCrushCommand_FadeOutToPlayAgain,
    BerryCrushCommand_PlayAgainFailureMessage,
    BerryCrushCommand_GracefulExit,
    BerryCrushCommand_Quit
};

static const u8 gUnknown_846E3B4[][4] = {
    {0x02, 0x04, 0x06, 0x07},
    {0x03, 0x05, 0x08, 0x0b},
    {0x03, 0x07, 0x0b, 0x0f},
    {0x04, 0x08, 0x0c, 0x11}
};

static const u8 gUnknown_846E3C4[] = {5, 7, 9, 12};

static const u8 sReceivedPlayerBitmasks[] = {0x03, 0x07, 0x0F, 0x1F};

void BerryCrush_RunOrScheduleCommand(u16 command, u8 runMode, u8 *params)
{
    struct BerryCrushGame * game = GetBerryCrushGame();

    if (command >= NELEMS(sBerryCrushCommands))
        command = 0;
    switch (runMode)
    {
    case 0:
        // Call now and set followup to game->nextCmd
        if (command != 0)
            sBerryCrushCommands[command](game, params);
        if (game->nextCmd >= NELEMS(sBerryCrushCommands))
            game->nextCmd = 0;
        game->cmdCallback = sBerryCrushCommands[game->nextCmd];
        break;
    case 1:
        // Schedule for next frame
        game->cmdCallback = sBerryCrushCommands[command];
        break;
    }
}

static u32 BerryCrushCommand_BeginNormalPaletteFade(struct BerryCrushGame * game, u8 *params)
{
    // params points to packed values:
    // bytes 0-3: selectedPals (bitfield)
    // byte 4: delay
    // byte 5: startY
    // byte 6: stopY
    // bytes 7-8: fade color
    // byte 9: if TRUE, communicate on fade complete

    u16 color;
    u32 selectedPals;
    selectedPals = ({
#ifndef NONMATCHING
        register u32 value asm("r2");
        register u32 b asm("r3");
#else
        u32 value;
        u32 b;
#endif //NONMATCHING
        value  =      params[0] << 0;
        value |= (b = params[1] << 8);
        value |= (b = params[2] << 16);
        value |= (b = params[3] << 24);
        value;
    });

    params[0] = params[9];

    color  = params[8] << 8;
    color |= params[7] << 0;

    gPaletteFade.bufferTransferDisabled = FALSE;
    BeginNormalPaletteFade(selectedPals, params[4], params[5], params[6], color);
    UpdatePaletteFade();
    game->nextCmd = BCCMD_WaitPaletteFade;
    return 0;
}

static u32 BerryCrushCommand_WaitPaletteFade(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        if (UpdatePaletteFade())
            return 0;
        if(params[0] != 0)
            ++game->cmdState;
        else
            game->cmdState = 3;
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        ++game->cmdState;
        return 0;
    case 2:
        if (IsLinkTaskFinished())
        {
            ++game->cmdState;
            return 0;
        }
        return 0;
    case 3:
        BerryCrush_RunOrScheduleCommand(game->afterPalFadeCmd, 1, NULL);
        game->cmdState = 0;
        return 0;
    default:
        ++game->cmdState;
        return 0;
    }
}

static u32 BerryCrushCommand_PrintMessage(struct BerryCrushGame * game, u8 *params)
{
    u16 waitKeys;

    waitKeys  = params[3];
    waitKeys <<= 8;
    waitKeys |= params[2] << 0;
    switch (game->cmdState)
    {
    case 0:
        DrawDialogueFrame(0, FALSE);
        if (params[1] & 2)
        {
            StringExpandPlaceholders(gStringVar4, sBerryCrushMessages[params[0]]);
            AddTextPrinterParameterized2(0, 2, gStringVar4, game->textSpeed, 0, TEXT_COLOR_DARK_GREY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GREY);
        }
        else
        {
            AddTextPrinterParameterized2(0, 2, sBerryCrushMessages[params[0]], game->textSpeed, NULL, TEXT_COLOR_DARK_GREY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GREY);
        }
        CopyWindowToVram(0, COPYWIN_BOTH);
        break;
    case 1:
        if (!IsTextPrinterActive(0))
        {
            if (waitKeys == 0)
                ++game->cmdState;
            break;
        }
        return 0;
    case 2:
        if (!(waitKeys & gMain.newKeys))
            return 0;
        break;
    case 3:
        if (params[1] & 1)
            ClearDialogWindowAndFrame(0, TRUE);
        BerryCrush_RunOrScheduleCommand(game->nextCmd, 1, NULL);
        game->cmdState = params[4];
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_InitGfx(struct BerryCrushGame * game, UNUSED u8 *params)
{
    if (BerryCrush_InitBgs() != 0)
        BerryCrush_RunOrScheduleCommand(game->nextCmd, 0, game->commandParams);
    return 0;
}

static u32 BerryCrushCommand_TeardownGfx(struct BerryCrushGame * game, UNUSED u8 *params)
{
    if (BerryCrush_TeardownBgs() != 0)
        BerryCrush_RunOrScheduleCommand(game->nextCmd, 0, game->commandParams);
    return 0;
}

static u32 BerryCrushCommand_SignalReadyToBegin(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            PlayNewMapMusic(MUS_GAME_CORNER);
            BerryCrush_RunOrScheduleCommand(BCCMD_AskPickBerry, 1, NULL);
            game->gameState = 3;
            game->cmdState = 0;
        }
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_AskPickBerry(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    default:
        ++game->cmdState;
        break;
    case 0:
        sub_814D4D8(game);
        BerryCrush_SetShowMessageParams(params, BCTEXT_AREYOUREADY, 1, 0, BCCMD_BeginNormalPaletteFade);
        game->nextCmd = BCCMD_AskPickBerry;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        break;
    case 1:
        game->nextCmd = BCCMD_GoToBerryPouch;
        BerryCrush_RunOrScheduleCommand(BCCMD_TeardownGfx, 1, NULL);
        game->cmdState = 2;
        break;
    }
    return 0;
}

static u32 BerryCrushCommand_GoToBerryPouch(struct BerryCrushGame * game, UNUSED u8 *params)
{
    game->cmdCallback = NULL;
    SetMainCallback2(CB2_BerryCrush_GoToBerryPouch);
    return 0;
}

static u32 BerryCrushCommand_WaitForOthersToPickBerries(struct BerryCrushGame * game, u8 *params)
{
    u8 i;

    switch (game->cmdState)
    {
    case 0:
        BerryCrush_SetShowMessageParams(params, BCTEXT_WAITFOROTHERS, 0, 0, BCCMD_BeginNormalPaletteFade);
        game->nextCmd = BCCMD_WaitForOthersToPickBerries;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        memset(game->sendCmd + 1, 0, sizeof(game->sendCmd) - 2);
        game->sendCmd[1] = game->unk68.as_four_players.others[game->localId].berryId;
        SendBlock(0, game->sendCmd + 1, 2);
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        game->unk10 = 0;
        break;
    case 4:
        if (GetBlockReceivedStatus() != sReceivedPlayerBitmasks[game->playerCount - 2])
            return 0;
        for (i = 0; i < game->playerCount; ++i)
        {
            game->unk68.as_four_players.others[i].berryId = gBlockRecvBuffer[i][0];
            if (game->unk68.as_four_players.others[i].berryId > 0xB0)
                game->unk68.as_four_players.others[i].berryId = 0;
            game->unk18 += gBerryCrushStats[game->unk68.as_four_players.others[i].berryId].unk0;
            game->powder += gBerryCrushStats[game->unk68.as_four_players.others[i].berryId].powder;
        }
        game->unk10 = 0;
        ResetBlockReceivedFlags();
        game->unk20 = MathUtil_Div32(game->unk18 << 8, 0x2000);
        break;
    case 5:
        ClearDialogWindowAndFrame(0, TRUE);
        BerryCrush_RunOrScheduleCommand(BCCMD_DropBerriesIntoCrusher, 1, NULL);
        game->gameState = 4;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_DropBerriesIntoCrusher(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        BerryCrush_CreateBerrySprites(game, &game->spritesManager);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        game->spritesManager.animBerryIdx = 0;
        game->spritesManager.unk1 = 0;
        game->spritesManager.unk2 = 0;
        game->spritesManager.unk3 = 0;
        break;
    case 2:
        game->spritesManager.berrySprites[game->spritesManager.animBerryIdx]->callback = SpriteCB_DropBerryIntoCrusher;
        game->spritesManager.berrySprites[game->spritesManager.animBerryIdx]->affineAnimPaused = FALSE;
        PlaySE(SE_BALL_THROW);
        break;
    case 3:
        if (game->spritesManager.berrySprites[game->spritesManager.animBerryIdx]->callback == SpriteCB_DropBerryIntoCrusher)
            return 0;
        game->spritesManager.berrySprites[game->spritesManager.animBerryIdx] = NULL;
        ++game->spritesManager.animBerryIdx;
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 4:
        if (!IsLinkTaskFinished())
            return 0;
        if (game->spritesManager.animBerryIdx < game->playerCount)
        {
            game->cmdState = 2;
            return 0;
        }
        game->spritesManager.animBerryIdx = 0;
        break;
    case 5:
        BerryCrushFreeBerrySpriteGfx(game, &game->spritesManager);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 6:
        if (!IsLinkTaskFinished())
            return 0;
        PlaySE(SE_FALL);
        BerryCrush_RunOrScheduleCommand(BCCMD_DropLid, 1, NULL);
        game->gameState = 5;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_DropLid(struct BerryCrushGame * game,  UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        game->depth += 4;
        if (game->depth < 0)
            return 0;
        game->depth = 0;
        game->spritesManager.unk1 = 4;
        game->spritesManager.animBerryIdx = 0;
        game->spritesManager.unk2 = gUnknown_846E2F0[game->spritesManager.unk1][0];
        PlaySE(SE_M_STRENGTH);
        break;
    case 1:
        game->vibration = gUnknown_846E2F0[game->spritesManager.unk1][game->spritesManager.animBerryIdx];
        SetGpuReg(REG_OFFSET_BG0VOFS, -game->vibration);
        SetGpuReg(REG_OFFSET_BG2VOFS, -game->vibration);
        SetGpuReg(REG_OFFSET_BG3VOFS, -game->vibration);
        ++game->spritesManager.animBerryIdx;
        if (game->spritesManager.animBerryIdx < game->spritesManager.unk2)
            return 0;
        if (game->spritesManager.unk1 == 0)
            break;
        --game->spritesManager.unk1;
        game->spritesManager.unk2 = gUnknown_846E2F0[game->spritesManager.unk1][0];
        game->spritesManager.animBerryIdx = 0;
        return 0;
    case 2:
        game->vibration = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        BerryCrush_RunOrScheduleCommand(BCCMD_Countdown, 1, NULL);
        game->gameState = 6;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_Countdown(struct BerryCrushGame * game,  UNUSED u8 *params)
{
    switch (game-> cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        StartMinigameCountdown(0x1000, 0x1000, 120, 80, 0);
        break;
    case 2:
        if (IsMinigameCountdownRunning())
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        game->spritesManager.animBerryIdx = 0;
        game->spritesManager.unk1 = 0;
        game->spritesManager.unk2 = 0;
        game->spritesManager.unk3 = 0;
        game->unk10 = 0;
        if (game->localId == 0)
            BerryCrush_RunOrScheduleCommand(BCCMD_PlayGame_Master, 1, NULL);
        else
            BerryCrush_RunOrScheduleCommand(BCCMD_PlayGame_Slave, 1, NULL);
        game->gameState = 7;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static void BerryCrush_ProcessGamePartnerInput(struct BerryCrushGame * game)
{
    u8 numPressedA = 0;
    u16 r3;
    u16 *curRecvCmd;
    u8 i = 0;
    s32 r2_ = 0;
    s32 r0;

    for (i = 0; i < game->playerCount; ++i)
    {
        curRecvCmd = gRecvCmds[i];
        if ((curRecvCmd[0] & 0xFF00) == 0x2F00
            && curRecvCmd[1] == 2)
        {
            if ((u8)curRecvCmd[2] & 4) // pushedAButton
            {
                game->localState.unk02_3 |= gUnknown_846E2E0[i];
                game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][5] = 1;
                ++game->unk68.as_four_players.others[i].unk4.as_hwords[3];
                ++numPressedA;
                r3 = game->timer - game->unk68.as_four_players.others[i].unk2;
                if (r3 >= game->unk68.as_four_players.others[i].unk4.as_hwords[1] - 1
                    && r3 <= game->unk68.as_four_players.others[i].unk4.as_hwords[1] + 1)
                {
                    ++game->unk68.as_four_players.others[i].unk4.as_hwords[0];
                    game->unk68.as_four_players.others[i].unk4.as_hwords[1] = r3;
                    if (game->unk68.as_four_players.others[i].unk4.as_hwords[0] > game->unk68.as_four_players.others[i].unk4.as_hwords[2])
                        game->unk68.as_four_players.others[i].unk4.as_hwords[2] = game->unk68.as_four_players.others[i].unk4.as_hwords[0];
                }
                else
                {
                    game->unk68.as_four_players.others[i].unk4.as_hwords[0] = 0;
                    game->unk68.as_four_players.others[i].unk4.as_hwords[1] = r3;
                }
                game->unk68.as_four_players.others[i].unk2 = game->timer;
                if (++game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][4] > 2)
                    game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][4] = 0;
            }
            else
            {
                game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][5] = 0;
            }
        }
    }
    if (numPressedA > 1)
    {
        for (i = 0; i < game->playerCount; ++i)
        {
            if (game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][5] != 0)
            {
                game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][5] |= 2;
                ++game->unk68.as_four_players.others[i].unk4.as_hwords[4];
            }
        }
    }
    if (numPressedA != 0)
    {
        game->unk2E += numPressedA;
        numPressedA += gUnknown_846E2E8[numPressedA - 1];
        game->unk34 += numPressedA;
        game->unk1A += numPressedA;
        r0 = game->unk18;
        r2_ = game->unk1A;
        if (r0 - r2_ > 0)
        {
            r2_ <<= 8;
            r2_ = MathUtil_Div32(r2_, game->unk20);
            r2_ >>= 8;
            game->unk24 = r2_;
        }
        else
        {
            game->unk24 = 32;
            game->localState.unk02_0 = 1;
        }
    }
}

static void BerryCrush_BuildLocalState(struct BerryCrushGame * game)
{
    u8 count = 0;
    u16 r1 = 0;
    u8 i = 0;

    for (i = 0; i < game->playerCount; ++i)
    {
        if (game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][5] != 0)
        {
            ++count;
            r1 = game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][4] + 1;
            if (game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][5] & 2)
                r1 |= 4;
            r1 <<= 3 * i;
            game->localState.unk08 |= r1;
        }
    }
    game->localState.unk04 = game->unk24;
    if (count == 0)
    {
        if (game->spritesManager.unk3 != 0)
            ++game->spritesManager.animBerryIdx;
        else
            goto SET_UNK5F_0;
    }
    else
    {
        if (game->spritesManager.unk3 != 0)
        {
            if (count != game->spritesManager.unk1)
            {
                game->spritesManager.unk1 = count - 1;
                game->spritesManager.unk2 = gUnknown_846E314[count - 1][0];
            }
            else
            {
                ++game->spritesManager.animBerryIdx;
            }
        }
        else
        {
            game->spritesManager.animBerryIdx = 0;
            game->spritesManager.unk1 = count - 1;
            game->spritesManager.unk2 = gUnknown_846E314[count - 1][0];
            game->spritesManager.unk3 = 1;
        }
    }
    if (game->spritesManager.unk3 != 0)
    {
        if (game->spritesManager.animBerryIdx >= game->spritesManager.unk2)
        {
            game->spritesManager.animBerryIdx = 0;
            game->spritesManager.unk1 = 0;
            game->spritesManager.unk2 = 0;
            game->spritesManager.unk3 = 0;
            r1 = 0;
        }
        else
        {
            r1 = gUnknown_846E314[game->spritesManager.unk1][game->spritesManager.animBerryIdx + 1];
        }
        game->localState.unk03 = r1;
    }
    else
    {
        SET_UNK5F_0:
        game->localState.unk03 = 0;
    }
    game->localState.unk06 = game->unk26;
}

static void BerryCrush_HandlePlayerInput(struct BerryCrushGame * game)
{
    if (JOY_NEW(A_BUTTON))
        game->localState.pushedAButton = TRUE;
    if (JOY_HELD(A_BUTTON))
    {
        if (game->unk68.as_four_players.others[game->localId].unk4.as_hwords[5] < game->timer)
            ++game->unk68.as_four_players.others[game->localId].unk4.as_hwords[5];
    }
    if (game->localId != 0 && !game->localState.pushedAButton)
        return;
    game->localState.unk00 = 2;
    if (game->timer % 30 == 0)
    {
        if (game->unk2E > gUnknown_846E3C4[game->playerCount - 2])
        {
            ++game->unk30;
            game->unk25_4 = 1;
        }
        else
        {
            game->unk25_4 = 0;
        }
        game->unk2E = 0;
        ++game->unk32;
    }
    if (game->timer % 15 == 0)
    {
        if (game->unk34 < gUnknown_846E3B4[game->playerCount - 2][0])
            game->unk25_5 = 0;
        else if (game->unk34 < gUnknown_846E3B4[game->playerCount - 2][1])
            game->unk25_5 = 1;
        else if (game->unk34 < gUnknown_846E3B4[game->playerCount - 2][2])
            game->unk34 = 2; // typo since game->unk34 will be reset?
        else if (game->unk34 < gUnknown_846E3B4[game->playerCount - 2][3])
            game->unk34 = 3; // typo since game->unk34 will be reset?
        else
            game->unk25_5 = 4;
        game->unk34 = 0;
    }
    else
    {
        ++game->unk10;
        if (game->unk10 > 60)
        {
            if (game->unk10 > 70)
            {
                sub_80FBA44();
                game->unk10 = 0;
            }
            else if (game->localState.unk02_3 == 0)
            {
                sub_80FBA44();
                game->unk10 = 0;
            }
        }

    }
    if (game->timer >= 36000)
        game->localState.unk02_0 = 1;
    game->localState.unk02_1 = game->unk25_4;
    game->localState.unk0A = game->unk25_5;
    memcpy(&game->sendCmd[1], &game->localState, sizeof(game->sendCmd) - 2);
    RfuPrepareSend0x2f00(game->sendCmd + 1);
}

static void BerryCrush_UpdateGameState(struct BerryCrushGame * game)
{
    struct BerryCrushGame_4E * r4_;
#ifndef NONMATCHING
    register u32 i asm("r4");
    register u32 iPlusPlus asm("r0");

    for (i = 0; i < game->playerCount; i = (u8)iPlusPlus)
    {
        game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][5] = 0;
        iPlusPlus = i + 1;
    }
#else
    u8 i;

    for (i = 0; i < game->playerCount; ++i)
        game->unk68.as_four_players.others[i].unk4.as_2d_bytes[1][5] = 0;
#endif
    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00
        || gRecvCmds[0][1] != 2)
    {
        game->unk25_2 = 0;
    }
    else
    {
        r4_ = (struct BerryCrushGame_4E *)&game->recvCmd;
        memcpy(r4_, gRecvCmds, sizeof(struct BerryCrushGame_4E));
        game->depth = r4_->data.unk04;
        game->vibration = r4_->data.unk03;
        game->timer = r4_->data.unk06;
        sub_814DC5C(game, &game->spritesManager);
        if (r4_->data.unk02_0)
            game->unk25_3 = 1;
    }
}

static u32 BerryCrushCommand_PlayGame_Master(struct BerryCrushGame * game, UNUSED u8 *params)
{
    memset(&game->localState, 0, sizeof(game->localState));
    memset(&game->recvCmd, 0, sizeof(game->recvCmd));
    BerryCrush_UpdateGameState(game);
    SetGpuReg(REG_OFFSET_BG0VOFS, -game->vibration);
    SetGpuReg(REG_OFFSET_BG2VOFS, -game->vibration);
    SetGpuReg(REG_OFFSET_BG3VOFS, -game->vibration);
    if (game->unk25_3)
    {
        if (game->timer >= 36000)
        {
            game->timer = 36000;
            BerryCrush_RunOrScheduleCommand(BCCMD_HandleTimeUp, 1, NULL);
        }
        else
        {
            BerryCrush_RunOrScheduleCommand(BCCMD_FinishGame, 1, NULL);
        }
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    else
    {
        ++game->unk26;
        BerryCrush_ProcessGamePartnerInput(game);
        BerryCrush_BuildLocalState(game);
        BerryCrush_HandlePlayerInput(game);
        return 0;
    }
}

static u32 BerryCrushCommand_PlayGame_Slave(struct BerryCrushGame * game, UNUSED u8 *params)
{
    memset(&game->localState, 0, sizeof(game->localState));
    memset(&game->recvCmd, 0, sizeof(game->recvCmd));
    BerryCrush_UpdateGameState(game);
    SetGpuReg(REG_OFFSET_BG0VOFS, -game->vibration);
    SetGpuReg(REG_OFFSET_BG2VOFS, -game->vibration);
    SetGpuReg(REG_OFFSET_BG3VOFS, -game->vibration);
    if (game->unk25_3)
    {
        if (game->timer >= 36000)
        {
            game->timer = 36000;
            BerryCrush_RunOrScheduleCommand(BCCMD_HandleTimeUp, 1, NULL);
        }
        else
        {
            BerryCrush_RunOrScheduleCommand(BCCMD_FinishGame, 1, NULL);
        }
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    else
    {
        BerryCrush_HandlePlayerInput(game);
        return 0;
    }
}

static u32 BerryCrushCommand_FinishGame(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        game->gameState = 8;
        PlaySE(SE_M_STRENGTH);
        BlendPalettes(0xFFFFFFFF, 8, RGB(31, 31, 0));
        game->spritesManager.animBerryIdx = 2;
        break;
    case 1:
        if (--game->spritesManager.animBerryIdx != 255)
            return 0;
        BlendPalettes(0xFFFFFFFF, 0, RGB(31, 31, 0));
        game->spritesManager.unk1 = 4;
        game->spritesManager.animBerryIdx = 0;
        game->spritesManager.unk2 = gUnknown_846E2F0[game->spritesManager.unk1][0];
        break;
    case 2:
        game->vibration = gUnknown_846E2F0[game->spritesManager.unk1][game->spritesManager.animBerryIdx];
        SetGpuReg(REG_OFFSET_BG0VOFS, -game->vibration);
        SetGpuReg(REG_OFFSET_BG2VOFS, -game->vibration);
        SetGpuReg(REG_OFFSET_BG3VOFS, -game->vibration);
        if (++game->spritesManager.animBerryIdx < game->spritesManager.unk2)
            return 0;
        if (game->spritesManager.unk1 != 0)
        {
            --game->spritesManager.unk1;
            game->spritesManager.unk2 = gUnknown_846E2F0[game->spritesManager.unk1][0];
            game->spritesManager.animBerryIdx = 0;
            return 0;
        }
        break;
    case 3:
        game->vibration = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        break;
    case 4:
        if (!sub_814DE50(game, &game->spritesManager))
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        game->unk10 = 0;
        break;
    case 5:
        if (!IsLinkTaskFinished())
            return 0;
        BerryCrush_RunOrScheduleCommand(BCCMD_TabulateResults, 1, NULL);
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_HandleTimeUp(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        game->gameState = 9;
        PlaySE(SE_FAILURE);
        BlendPalettes(0xFFFFFFFF, 8, RGB(31, 0, 0));
        game->spritesManager.animBerryIdx = 4;
        break;
    case 1:
        if (--game->spritesManager.animBerryIdx != 255)
            return 0;
        BlendPalettes(0xFFFFFFFF, 0, RGB(31, 0, 0));
        game->spritesManager.animBerryIdx = 0;
        break;
    case 2:
        if (!sub_814DE50(game, &game->spritesManager))
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        game->unk10 = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        ConvertIntToDecimalStringN(gStringVar1, game->powder, STR_CONV_MODE_LEFT_ALIGN, 6);
        BerryCrush_SetShowMessageParams(params, BCTEXT_TIMEUP, 1, 0, 0);
        game->nextCmd = BCCMD_SaveTheGame;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_TabulateResults(struct BerryCrushGame * game, UNUSED u8 *params)
{
    u8 i, j;
    s32 r2;
    s32 r4;
    u8 r6; // ???

    switch (game->cmdState)
    {
    case 0:
        memset(game->sendCmd + 1, 0, 2 * sizeof(u16));
        if (game->unk68.as_four_players.others[game->localId].unk4.as_hwords[5] > game->timer)
            game->unk68.as_four_players.others[game->localId].unk4.as_hwords[5] = game->timer;
        game->sendCmd[1] = game->unk68.as_four_players.others[game->localId].unk4.as_hwords[5];
        SendBlock(0, game->sendCmd + 1, 2);
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        game->unk10 = 0;
        break;
    case 2:
        if (GetBlockReceivedStatus() != sReceivedPlayerBitmasks[game->playerCount - 2])
            return 0;
        for (i = 0; i < game->playerCount; ++i)
            game->unk68.as_four_players.others[i].unk4.as_hwords[5] = gBlockRecvBuffer[i][0];
        game->unk10 = 0;
        game->sendCmd[1] = 0;
        ResetBlockReceivedFlags();
        if (game->localId == 0)
            game->cmdState = 3;
        else
            game->cmdState = 6;
        return 0;
    case 3:
        memset(
            &game->unk68,
            0,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        game->unk68.as_four_players.unk00.unk04 = game->timer;
        game->unk68.as_four_players.unk00.unk06 = game->unk18 / (game->timer / 60);
        // (unk30 * 50 / unk32) + 50
        r2 = MathUtil_Mul32(game->unk30 << 8, 50 << 8);
        r2 = MathUtil_Div32(r2, game->unk32 << 8) + (50 << 8);
        r2 >>= 8;
        game->unk68.as_four_players.unk00.unk08 = r2 & 0x7F;
        // powder + playerCount * (r2 / 100)
        r2 <<= 8;
        r2 = MathUtil_Div32(r2, 100 << 8);
        r4 = (game->powder * game->playerCount) << 8;
        r4 = MathUtil_Mul32(r4, r2);
        game->unk68.as_four_players.unk00.unk00 = r4 >> 8;
        game->unk68.as_five_players.players[0].unk4.as_2d_bytes[0][7] = Random() % 3;
        for (r6 = 0, i = 0; i < game->playerCount; ++i)
        {
            game->unk68.as_five_players.players[0].unk4.as_2d_bytes[0][i] = i;
            game->unk68.as_five_players.players[0].unk4.as_2d_bytes[1][i] = i;
            game->unk68.as_four_players.unk00.stats[0][i] = game->unk68.as_four_players.others[i].unk4.as_hwords[3];
            game->unk68.as_four_players.unk00.unk0A += game->unk68.as_four_players.unk00.stats[0][i];
            switch (game->unk68.as_five_players.players[0].unk4.as_2d_bytes[0][7])
            {
            case 0:
                if (game->unk68.as_four_players.others[i].unk4.as_hwords[3] != 0)
                {
                    r2 = game->unk68.as_four_players.others[i].unk4.as_hwords[2];
                    r2 <<= 8;
                    r2 = MathUtil_Mul32(r2, 0x6400);
                    r4 = game->unk68.as_four_players.others[i].unk4.as_hwords[3];
                    r4 <<= 8;
                    r4 = MathUtil_Div32(r2, r4);
                }
                else
                {
                    r4 = 0;
                }
                break;
            case 1:
                if (game->unk68.as_four_players.others[i].unk4.as_hwords[3] != 0)
                {
                    r2 = game->unk68.as_four_players.others[i].unk4.as_hwords[4];
                    r2 <<= 8;
                    r2 = MathUtil_Mul32(r2, 0x6400);
                    r4 = game->unk68.as_four_players.others[i].unk4.as_hwords[3];
                    r4 <<= 8;
                    r4 = MathUtil_Div32(r2, r4);
                }
                else
                {
                    r4 = 0;
                }
                break;
            case 2:
                if (game->unk68.as_four_players.others[i].unk4.as_hwords[3] == 0)
                {
                    r4 = 0;
                }
                else if (game->unk68.as_four_players.others[i].unk4.as_hwords[5] >= game->timer)
                {
                    r4 = 0x6400;
                }
                else
                {
                    r2 = game->unk68.as_four_players.others[i].unk4.as_hwords[5];
                    r2 <<= 8;
                    r2 = MathUtil_Mul32(r2, 0x6400);
                    r4 = game->timer;
                    r4 <<= 8;
                    r4 = MathUtil_Div32(r2, r4);
                }
                break;
            }
            r4 >>= 4;
            game->unk68.as_four_players.unk00.stats[1][i] = r4;
        }
        break;
    case 4:
        for (r6 = 0, i = 0; i < game->playerCount - 1; ++i)
        {
            for (j = game->playerCount - 1; j > i; --j)
            {
                u16 r0;
                u8 r3;
                u16 *numPresses_p = game->unk68.as_four_players.unk00.stats[0];
                u8 *sp04 = game->unk68.as_five_players.players[0].unk4.as_2d_bytes[0];
                u8 *r10 = game->unk68.as_five_players.players[0].unk4.as_2d_bytes[1];
                u16 *r9 = game->unk68.as_four_players.unk00.stats[1];
                s32 r12 = j - 1;
                u16 *p1 = numPresses_p + r12; // these have to be here
                u16 *p2 = numPresses_p + j; // to swap operands. macro?

                if (*p1 < *p2)
                {
                    r0 = numPresses_p[j];
                    numPresses_p[j] = numPresses_p[r12];
                    numPresses_p[r12] = r0;
                    r3 = sp04[j];
                    sp04[j] = sp04[r12];
                    sp04[r12] = r3;
                }
                p1 = r9 + r12;
                p2 = r9 + j;
                if (*p1 < *p2)
                {
                    r0 = r9[j];
                    r9[j] = r9[r12];
                    r9[r12] = r0;
                    r3 = r10[j];
                    r10[j] = r10[r12];
                    r10[r12] = r3;
                }
            }
        }
        SendBlock(
            0,
            &game->unk68,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        break;
    case 5:
        if (!IsLinkTaskFinished())
            return 0;
        game->unk10 = 0;
        break;
    case 6:
        if (GetBlockReceivedStatus() != 1)
            return 0;
        memset(
            &game->unk68,
            0,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        memcpy(
            &game->unk68,
            gBlockRecvBuffer,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        ResetBlockReceivedFlags();
        game->unk10 = 0;
        break;
    case 7:
        BerryCrush_UpdateSav2Records();
        BerryCrush_RunOrScheduleCommand(BCCMD_ShowResults, 1, NULL);
        game->gameState = 11;
        game->cmdState = 0;
        game->unk24 = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_ShowResults(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        if (!sub_814E644(game, &game->spritesManager))
            return 0;
        break;
    case 1:
        CopyBgTilemapBufferToVram(0);
        game->spritesManager.animBerryIdx = 30;
        break;
    case 2:
        if (game->spritesManager.animBerryIdx != 0)
        {
            --game->spritesManager.animBerryIdx;
            return 0;
        }
        if (!JOY_NEW(A_BUTTON))
            return 0;
        PlaySE(SE_SELECT);
        sub_814E80C(game);
        break;
    case 3:
        if (game->gameState <= 12)
        {
            ++game->gameState;
            game->cmdState = 0;
            return 0;
        }
        break;
    case 4:
        ConvertIntToDecimalStringN(gStringVar1, game->powder, STR_CONV_MODE_LEFT_ALIGN, 6);
        ConvertIntToDecimalStringN(gStringVar2, GetBerryPowder(), STR_CONV_MODE_LEFT_ALIGN, 6);
        BerryCrush_SetShowMessageParams(params, BCTEXT_GAINEDPOWDER, 3, 0, 0);
        game->nextCmd = BCCMD_SaveTheGame;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_SaveTheGame(struct BerryCrushGame * game, u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        if (game->timer >= 36000)
            BerryCrush_HideTimerSprites(&game->spritesManager);
        BerryCrush_SetShowMessageParams(params, BCTEXT_COMMSTANDBY, 0, 0, BCCMD_BeginNormalPaletteFade);
        game->nextCmd = BCCMD_SaveTheGame;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        game->cmdState = 0;
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        DrawDialogueFrame(0, FALSE);
        AddTextPrinterParameterized2(0, 2, gText_SavingDontTurnOffThePower2, 0, NULL, 2, 1, 3);
        CopyWindowToVram(0, COPYWIN_BOTH);
        CreateTask(Task_SaveGame_UpdatedLinkRecords, 0);
        break;
    case 3:
        if (FuncIsActiveTask(Task_SaveGame_UpdatedLinkRecords))
            return 0;
        break;
    case 4:
        BerryCrush_RunOrScheduleCommand(BCCMD_AskPlayAgain, 1, NULL);
        game->gameState = 15;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_AskPlayAgain(struct BerryCrushGame * game, u8 *params)
{
    s32 r4;
#ifndef NONMATCHING
    register s32 r0 asm("r0");
#else
    s32 r0;
#endif

    switch (game->cmdState)
    {
    case 0:
        BerryCrush_SetShowMessageParams(params, BCTEXT_ASKPLAYAGAIN, 0, 0, BCCMD_BeginNormalPaletteFade);
        game->nextCmd = BCCMD_AskPlayAgain;
        BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
        r0 = 0;
        game->cmdState = r0; // dunno what it's doing because it's already in case 0
        return 0;
    case 1:
        DisplayYesNoMenuDefaultYes();
        break;
    case 2:
        if ((r4 = Menu_ProcessInputNoWrapClearOnChoose()) != -2)
        {
            memset(game->sendCmd + 1, 0, sizeof(game->sendCmd) - 2);
            if (r4 == 0)
            {
                if (CheckHasAtLeastOneBerry())
                    game->unk14 = 0;
                else
                    game->unk14 = 3;
            }
            else
            {
                game->unk14 = 1;
            }
            ClearDialogWindowAndFrame(0, TRUE);
            BerryCrush_SetShowMessageParams(params, BCTEXT_COMMSTANDBY, 0, 0, 0);
            game->nextCmd = BCCMD_CommunicatePlayAgainResponses;
            BerryCrush_RunOrScheduleCommand(BCCMD_PrintMessage, 1, NULL);
            game->cmdState = 0;
        }
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_CommunicatePlayAgainResponses(struct BerryCrushGame * game, UNUSED u8 *params)
{
    u8 i = 0;

    switch (game->cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        game->sendCmd[1] = game->unk14;
        game->recvCmd[0] = 0;
        SendBlock(0, game->sendCmd + 1, sizeof(u16));
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        game->unk10 = 0;
        break;
    case 3:
        if (GetBlockReceivedStatus() != sReceivedPlayerBitmasks[game->playerCount - 2])
            return 0;
        for (; i < game->playerCount; ++i)
            game->recvCmd[0] += gBlockRecvBuffer[i][0];
        if (game->recvCmd[0] != 0)
            BerryCrush_RunOrScheduleCommand(BCCMD_PlayAgainFailureMessage, 1, NULL);
        else
            BerryCrush_RunOrScheduleCommand(BCCMD_FadeOutToPlayAgain, 1, NULL);
        ResetBlockReceivedFlags();
        game->sendCmd[1] = 0;
        game->recvCmd[0] = 0;
        game->unk10 = 0;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_FadeOutToPlayAgain(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 1, 0, 0x10, RGB_BLACK);
        UpdatePaletteFade();
        break;
    case 1:
        if (UpdatePaletteFade())
            return 0;
        break;
    case 2:
        ClearDialogWindowAndFrame(0, TRUE);
        sub_814DA04(game);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, RGB_BLACK);
        UpdatePaletteFade();
        break;
    case 3:
        if (UpdatePaletteFade())
            return 0;
        BerryCrush_RunOrScheduleCommand(BCCMD_AskPickBerry, 1, NULL);
        game->gameState = 3;
        game->cmdState = 0;
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_PlayAgainFailureMessage(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        DrawDialogueFrame(0, FALSE);
        if (game->unk14 == 3)
            AddTextPrinterParameterized2(0, 2, sBerryCrushMessages[BCTEXT_CANCEL_NOBERRIES], game->textSpeed, NULL, 2, 1, 3);
        else
            AddTextPrinterParameterized2(0, 2, sBerryCrushMessages[BCTEXT_CANCEL_DROPPEDOUT], game->textSpeed, NULL, 2, 1, 3);
        CopyWindowToVram(0, COPYWIN_BOTH);
        break;
    case 1:
        if (IsTextPrinterActive(0))
            return 0;
        game->spritesManager.animBerryIdx = 120;
        break;
    case 2:
        if (game->spritesManager.animBerryIdx != 0)
            --game->spritesManager.animBerryIdx;
        else
        {
            BerryCrush_RunOrScheduleCommand(BCCMD_GracefulExit, 1, NULL);
            game->cmdState = 0;
        }
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_GracefulExit(struct BerryCrushGame * game, UNUSED u8 *params)
{
    switch (game->cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        Link_TryStartSend5FFF();
        break;
    case 2:
        if (gReceivedRemoteLinkPlayers)
            return 0;
        game->nextCmd = BCCMD_Quit;
        BerryCrush_RunOrScheduleCommand(BCCMD_TeardownGfx, 1, NULL);
        game->cmdState = 2; // ???
        return 0;
    }
    ++game->cmdState;
    return 0;
}

static u32 BerryCrushCommand_Quit(UNUSED struct BerryCrushGame * game, UNUSED u8 *params)
{
    ExitBerryCrushWithCallback(NULL);
    return 0;
}

static void sub_814D4D8(struct BerryCrushGame * game)
{
    u8 r5 = 0;

    IncrementGameStat(GAME_STAT_BERRY_CRUSH_POINTS);
    game->unkD = 0;
    game->unk10 = 0;
    game->gameState = 2;
    game->unk14 = 0;
    game->powder = 0;
    game->unk18 = 0;
    game->unk1A = 0;
    game->unk20 = 0;
    game->unk24 = 0;
    game->unk25_0 = 0;
    game->unk25_1 = 0;
    game->unk25_2 = 0;
    game->unk25_3 = FALSE;
    game->unk25_4 = 0;
    game->unk25_5 = 0;
    game->unk26 = 0;
    game->timer = 0;
    game->unk2E = 0;
    game->unk32 = -1;
    game->unk30 = 0;
    game->unk34 = 0;
    for (; r5 < 5; ++r5) // why is it 5 instead of 4? fillerBC isn't sufficient for one player
    {
        game->unk68.as_four_players.others[r5].berryId = -1;
        game->unk68.as_four_players.others[r5].unk2 = 0;
        game->unk68.as_four_players.others[r5].unk4.as_hwords[0] = 0;
        game->unk68.as_four_players.others[r5].unk4.as_hwords[1] = 1;
        game->unk68.as_four_players.others[r5].unk4.as_hwords[2] = 0;
        game->unk68.as_four_players.others[r5].unk4.as_hwords[3] = 0;
        game->unk68.as_four_players.others[r5].unk4.as_hwords[4] = 0;
        game->unk68.as_four_players.others[r5].unk4.as_hwords[5] = 0;
        game->unk68.as_four_players.others[r5].unk4.as_2d_bytes[1][4] = 0;
        game->unk68.as_four_players.others[r5].unk4.as_2d_bytes[1][5] = 0;
    }
}

void BerryCrush_SetPaletteFadeParams(u8 *params, bool8 communicateAfter, u32 selectedPals, s8 delay, u8 startY, u8 targetY, u16 palette)
{
    params[0] = ((u8 *)&selectedPals)[0];
    params[1] = ((u8 *)&selectedPals)[1];
    params[2] = ((u8 *)&selectedPals)[2];
    params[3] = ((u8 *)&selectedPals)[3];
    params[4] = delay;
    params[5] = startY;
    params[6] = targetY;
    params[7] = ((u8 *)&palette)[0];
    params[8] = ((u8 *)&palette)[1];
    params[9] = communicateAfter;
}

void BerryCrush_SetShowMessageParams(u8 *params, u8 stringId, u8 flags, u16 waitKeys, u8 followupCmd)
{
    params[0] = stringId;
    params[1] = flags;
    params[2] = ((u8 *)&waitKeys)[0];
    params[3] = ((u8 *)&waitKeys)[1];
    params[4] = followupCmd;
}
