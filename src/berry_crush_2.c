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

static u32 BerryCrushCommand_BeginNormalPaletteFade(struct BerryCrushGame * game, u8 *r1);
static u32 BerryCrushCommand_WaitPaletteFade(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 BerryCrushCommand_PrintMessage(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 BerryCrushCommand_InitGfx(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 BerryCrushCommand_TeardownGfx(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BDBC(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BE0C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BE64(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BE7C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814BFD0(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C118(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C24C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C850(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C8F8(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814C990(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814CB20(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814CC0C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814CFA8(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D094(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D188(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D240(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D31C(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D3A4(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D468(struct BerryCrushGame * berryCrushGame, u8 *params);
static u32 sub_814D4C8(struct BerryCrushGame * berryCrushGame, u8 *params);
static void sub_814D4D8(struct BerryCrushGame * r4);
static void sub_814D5A4(u8 *r0, u32 r1, u32 r2, u32 r3, u32 r5);

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

static const u8 *const gUnknown_846E328[] = {
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
    sub_814BDBC,
    sub_814BE0C,
    sub_814BE64,
    sub_814BE7C,
    sub_814BFD0,
    sub_814C118,
    sub_814C24C,
    sub_814C850,
    sub_814C8F8,
    sub_814C990,
    sub_814CB20,
    sub_814CC0C,
    sub_814CFA8,
    sub_814D094,
    sub_814D188,
    sub_814D240,
    sub_814D31C,
    sub_814D3A4,
    sub_814D468,
    sub_814D4C8
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

    if (command > 25)
        command = 0;
    switch (runMode)
    {
    case 0:
        // Call now and set followup to game->nextCmd
        if (command != 0)
            sBerryCrushCommands[command](game, params);
        if (game->nextCmd > 25)
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
    game->nextCmd = 2;
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
    u16 r4 = params[3];

    r4 <<= 8;
    r4 |= params[2];
    switch (game->cmdState)
    {
    case 0:
        DrawDialogueFrame(0, FALSE);
        if (params[1] & 2)
        {
            StringExpandPlaceholders(gStringVar4, gUnknown_846E328[params[0]]);
            AddTextPrinterParameterized2(0, 2, gStringVar4, game->textSpeed, 0, TEXT_COLOR_DARK_GREY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GREY);
        }
        else
        {
            AddTextPrinterParameterized2(0, 2, gUnknown_846E328[params[0]], game->textSpeed, NULL, TEXT_COLOR_DARK_GREY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GREY);
        }
        CopyWindowToVram(0, COPYWIN_BOTH);
        break;
    case 1:
        if (!IsTextPrinterActive(0))
        {
            if (r4 == 0)
                ++game->cmdState;
            break;
        }
        return 0;
    case 2:
        if (!(r4 & gMain.newKeys))
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

static u32 sub_814BDBC(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    switch (r4->cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            PlayNewMapMusic(MUS_SLOT);
            BerryCrush_RunOrScheduleCommand(7, 1, NULL);
            r4->unk12 = 3;
            r4->cmdState = 0;
        }
        return 0;
    }
    ++r4->cmdState;
    return 0;
}

static u32 sub_814BE0C(struct BerryCrushGame * r4, u8 *r5)
{
    switch (r4->cmdState)
    {
    default:
        ++r4->cmdState;
        break;
    case 0:
        sub_814D4D8(r4);
        sub_814D5A4(r5, 0, 1, 0, 1);
        r4->nextCmd = 7;
        BerryCrush_RunOrScheduleCommand(3, 1, NULL);
        break;
    case 1:
        r4->nextCmd = 8;
        BerryCrush_RunOrScheduleCommand(5, 1, NULL);
        r4->cmdState = 2;
        break;
    }
    return 0;
}

static u32 sub_814BE64(struct BerryCrushGame * game, UNUSED u8 *params)
{
    game->cmdCallback = NULL;
    SetMainCallback2(CB2_BerryCrush_GoToBerryPouch);
    return 0;
}

static u32 sub_814BE7C(struct BerryCrushGame * r5, u8 *r2)
{
    u8 r3;

    switch (r5->cmdState)
    {
    case 0:
        sub_814D5A4(r2, 1, 0, 0, 1);
        r5->nextCmd = 9;
        BerryCrush_RunOrScheduleCommand(3, 1, NULL);
        return 0;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        memset(r5->unk40.unk2, 0, sizeof(r5->unk40.unk2));
        r5->unk40.unk2[0] = r5->unk68.as_four_players.others[r5->localId].unk0;
        SendBlock(0, r5->unk40.unk2, 2);
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        r5->unk10 = 0;
        break;
    case 4:
        if (GetBlockReceivedStatus() != sReceivedPlayerBitmasks[r5->playerCount - 2])
            return 0;
        for (r3 = 0; r3 < r5->playerCount; ++r3)
        {
            r5->unk68.as_four_players.others[r3].unk0 = gBlockRecvBuffer[r3][0];
            if (r5->unk68.as_four_players.others[r3].unk0 > 0xB0)
                r5->unk68.as_four_players.others[r3].unk0 = 0;
            r5->unk18 += gUnknown_83DFC9C[r5->unk68.as_four_players.others[r3].unk0].unk0;
            r5->unk1C += gUnknown_83DFC9C[r5->unk68.as_four_players.others[r3].unk0].unk1;
        }
        r5->unk10 = 0;
        ResetBlockReceivedFlags();
        r5->unk20 = sub_80D8B68(r5->unk18 << 8, 0x2000);
        break;
    case 5:
        ClearDialogWindowAndFrame(0, TRUE);
        BerryCrush_RunOrScheduleCommand(10, 1, NULL);
        r5->unk12 = 4;
        r5->cmdState = 0;
        return 0;
    }
    ++r5->cmdState;
    return 0;
}

static u32 sub_814BFD0(struct BerryCrushGame * r4,  UNUSED u8 *r1)
{
    switch (r4->cmdState)
    {
    case 0:
        sub_814DA24(r4, &r4->unk138);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        r4->unk138.unk0 = 0;
        r4->unk138.unk1 = 0;
        r4->unk138.unk2 = 0;
        r4->unk138.unk3 = 0;
        break;
    case 2:
        r4->unk138.unk38[r4->unk138.unk0]->callback = sub_814DB84;
        r4->unk138.unk38[r4->unk138.unk0]->affineAnimPaused = FALSE;
        PlaySE(SE_NAGERU);
        break;
    case 3:
        if (r4->unk138.unk38[r4->unk138.unk0]->callback == sub_814DB84)
            return 0;
        r4->unk138.unk38[r4->unk138.unk0] = NULL;
        ++r4->unk138.unk0;
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 4:
        if (!IsLinkTaskFinished())
            return 0;
        if (r4->unk138.unk0 < r4->playerCount)
        {
            r4->cmdState = 2;
            return 0;
        }
        r4->unk138.unk0 = 0;
        break;
    case 5:
        sub_814DC24(r4, &r4->unk138);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 6:
        if (!IsLinkTaskFinished())
            return 0;
        PlaySE(SE_RU_HYUU);
        BerryCrush_RunOrScheduleCommand(11, 1, NULL);
        r4->unk12 = 5;
        r4->cmdState = 0;
        return 0;
    }
    ++r4->cmdState;
    return 0;
}

static u32 sub_814C118(struct BerryCrushGame * r4,  UNUSED u8 *r1)
{
    switch (r4->cmdState)
    {
    case 0:
        r4->unk2A += 4;
        if (r4->unk2A < 0)
            return 0;
        r4->unk2A = 0;
        r4->unk138.unk1 = 4;
        r4->unk138.unk0 = 0;
        r4->unk138.unk2 = gUnknown_846E2F0[r4->unk138.unk1][0];
        PlaySE(SE_W070);
        break;
    case 1:
        r4->unk2C = gUnknown_846E2F0[r4->unk138.unk1][r4->unk138.unk0];
        SetGpuReg(REG_OFFSET_BG0VOFS, -r4->unk2C);
        SetGpuReg(REG_OFFSET_BG2VOFS, -r4->unk2C);
        SetGpuReg(REG_OFFSET_BG3VOFS, -r4->unk2C);
        ++r4->unk138.unk0;
        if (r4->unk138.unk0 < r4->unk138.unk2)
            return 0;
        if (r4->unk138.unk1 == 0)
            break;
        --r4->unk138.unk1;
        r4->unk138.unk2 = gUnknown_846E2F0[r4->unk138.unk1][0];
        r4->unk138.unk0 = 0;
        return 0;
    case 2:
        r4->unk2C = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        BerryCrush_RunOrScheduleCommand(12, 1, NULL);
        r4->unk12 = 6;
        r4->cmdState = 0;
        return 0;
    }
    ++r4->cmdState;
    return 0;
}

static u32 sub_814C24C(struct BerryCrushGame * r4,  UNUSED u8 *r1)
{
    switch (r4-> cmdState)
    {
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        StartMinigameCountdown(0x1000, 0x1000, 120, 80, 0);
        break;
    case 2:
        if (IsMinigameCountdownRunning())
            return 0;
        // fallthrough
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        r4->unk138.unk0 = 0;
        r4->unk138.unk1 = 0;
        r4->unk138.unk2 = 0;
        r4->unk138.unk3 = 0;
        r4->unk10 = 0;
        if (r4->localId == 0)
            BerryCrush_RunOrScheduleCommand(13, 1, NULL);
        else
            BerryCrush_RunOrScheduleCommand(14, 1, NULL);
        r4->unk12 = 7;
        r4->cmdState = 0;
        return 0;
    }
    ++r4->cmdState;
    return 0;
}

void sub_814C2FC(struct BerryCrushGame * r4)
{
    u8 r8 = 0;
    u16 r3;
    u16 *r2;
    u8 r7 = 0;
    s32 r2_ = 0;
    s32 r0;

    for (r7 = 0; r7 < r4->playerCount; ++r7)
    {
        r2 = gRecvCmds[r7];
        if ((r2[0] & 0xFF00) == 0x2F00
            && r2[1] == 2)
        {
            if ((u8)r2[2] & 4)
            {
                r4->unk5C.unk02_3 |= gUnknown_846E2E0[r7];
                r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][5] = 1;
                ++r4->unk68.as_four_players.others[r7].unk4.as_hwords[3];
                ++r8;
                r3 = r4->unk28 - r4->unk68.as_four_players.others[r7].unk2;
                if (r3 >= r4->unk68.as_four_players.others[r7].unk4.as_hwords[1] - 1
                    && r3 <= r4->unk68.as_four_players.others[r7].unk4.as_hwords[1] + 1)
                {
                    ++r4->unk68.as_four_players.others[r7].unk4.as_hwords[0];
                    r4->unk68.as_four_players.others[r7].unk4.as_hwords[1] = r3;
                    if (r4->unk68.as_four_players.others[r7].unk4.as_hwords[0] > r4->unk68.as_four_players.others[r7].unk4.as_hwords[2])
                        r4->unk68.as_four_players.others[r7].unk4.as_hwords[2] = r4->unk68.as_four_players.others[r7].unk4.as_hwords[0];
                }
                else
                {
                    r4->unk68.as_four_players.others[r7].unk4.as_hwords[0] = 0;
                    r4->unk68.as_four_players.others[r7].unk4.as_hwords[1] = r3;
                }
                r4->unk68.as_four_players.others[r7].unk2 = r4->unk28;
                if (++r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][4] > 2)
                    r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][4] = 0;
            }
            else
            {
                r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][5] = 0;
            }
        }
    }
    if (r8 > 1)
    {
        for (r7 = 0; r7 < r4->playerCount; ++r7)
        {
            if (r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][5] != 0)
            {
                r4->unk68.as_four_players.others[r7].unk4.as_2d_bytes[1][5] |= 2;
                ++r4->unk68.as_four_players.others[r7].unk4.as_hwords[4];
            }
        }
    }
    if (r8 != 0)
    {
        r4->unk2E += r8;
        r8 += gUnknown_846E2E8[r8 - 1];
        r4->unk34 += r8;
        r4->unk1A += r8;
        r0 = r4->unk18;
        r2_ = r4->unk1A;
        if (r0 - r2_ > 0)
        {
            r2_ <<= 8;
            r2_ = sub_80D8B68(r2_, r4->unk20);
            r2_ >>= 8;
            r4->unk24 = r2_;
        }
        else
        {
            r4->unk24 = 32;
            r4->unk5C.unk02_0 = 1;
        }
    }
}

void sub_814C4B8(struct BerryCrushGame * r3)
{
    u8 r6 = 0;
    u16 r1 = 0;
    u8 r4 = 0;

    for (r4 = 0; r4 < r3->playerCount; ++r4)
    {
        if (r3->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][5] != 0)
        {
            ++r6;
            r1 = r3->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][4] + 1;
            if (r3->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][5] & 2)
                r1 |= 4;
            r1 <<= 3 * r4;
            r3->unk5C.unk08 |= r1;
        }
    }
    r3->unk5C.unk04 = r3->unk24;
    if (r6 == 0)
    {
        if (r3->unk138.unk3 != 0)
            ++r3->unk138.unk0;
        else
            goto SET_UNK5F_0;
    }
    else
    {
        if (r3->unk138.unk3 != 0)
        {
            if (r6 != r3->unk138.unk1)
            {
                r3->unk138.unk1 = r6 - 1;
                r3->unk138.unk2 = gUnknown_846E314[r6 - 1][0];
            }
            else
            {
                ++r3->unk138.unk0;
            }
        }
        else
        {
            r3->unk138.unk0 = 0;
            r3->unk138.unk1 = r6 - 1;
            r3->unk138.unk2 = gUnknown_846E314[r6 - 1][0];
            r3->unk138.unk3 = 1;
        }
    }
    if (r3->unk138.unk3 != 0)
    {
        if (r3->unk138.unk0 >= r3->unk138.unk2)
        {
            r3->unk138.unk0 = 0;
            r3->unk138.unk1 = 0;
            r3->unk138.unk2 = 0;
            r3->unk138.unk3 = 0;
            r1 = 0;
        }
        else
        {
            r1 = gUnknown_846E314[r3->unk138.unk1][r3->unk138.unk0 + 1];
        }
        r3->unk5C.unk03 = r1;
    }
    else
    {
        SET_UNK5F_0:
        r3->unk5C.unk03 = 0;
    }
    r3->unk5C.unk06 = r3->unk26;
}

void sub_814C618(struct BerryCrushGame * r5)
{
    if (gMain.newKeys & A_BUTTON)
        r5->unk5C.unk02_2 = 1;
    if (gMain.heldKeys & A_BUTTON)
    {
        if (r5->unk68.as_four_players.others[r5->localId].unk4.as_hwords[5] < r5->unk28)
            ++r5->unk68.as_four_players.others[r5->localId].unk4.as_hwords[5];
    }
    if (r5->localId != 0 && r5->unk5C.unk02_2 == 0)
        return;
    r5->unk5C.unk00 = 2;
    if (r5->unk28 % 30 == 0)
    {
        if (r5->unk2E > gUnknown_846E3C4[r5->playerCount - 2])
        {
            ++r5->unk30;
            r5->unk25_4 = 1;
        }
        else
        {
            r5->unk25_4 = 0;
        }
        r5->unk2E = 0;
        ++r5->unk32;
    }
    if (r5->unk28 % 15 == 0)
    {
        if (r5->unk34 < gUnknown_846E3B4[r5->playerCount - 2][0])
            r5->unk25_5 = 0;
        else if (r5->unk34 < gUnknown_846E3B4[r5->playerCount - 2][1])
            r5->unk25_5 = 1;
        else if (r5->unk34 < gUnknown_846E3B4[r5->playerCount - 2][2])
            r5->unk34 = 2; // typo since r5->unk34 will be reset?
        else if (r5->unk34 < gUnknown_846E3B4[r5->playerCount - 2][3])
            r5->unk34 = 3; // typo since r5->unk34 will be reset?
        else
            r5->unk25_5 = 4;
        r5->unk34 = 0;
    }
    else
    {
        ++r5->unk10;
        if (r5->unk10 > 60)
        {
            if (r5->unk10 > 70)
            {
                sub_80FBA44();
                r5->unk10 = 0;
            }
            else if (r5->unk5C.unk02_3 == 0)
            {
                sub_80FBA44();
                r5->unk10 = 0;
            }
        }

    }
    if (r5->unk28 >= 36000)
        r5->unk5C.unk02_0 = 1;
    r5->unk5C.unk02_1 = r5->unk25_4;
    r5->unk5C.unk0A = r5->unk25_5;
    memcpy(r5->unk40.unk2, &r5->unk5C, sizeof(r5->unk40.unk2));
    RfuPrepareSend0x2f00(r5->unk40.unk2);
}

void sub_814C7BC(struct BerryCrushGame * r5)
{
    struct BerryCrushGame_4E * r4_;
#ifndef NONMATCHING
    register u32 r4 asm("r4");
    register u32 r0 asm("r0");

    for (r4 = 0; r4 < r5->playerCount; r4 = (u8)r0)
    {
        r5->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][5] = 0;
        r0 = r4 + 1;
    }
#else
    u8 r4;

    for (r4 = 0; r4 < r5->unk9; ++r4)
        r5->unk68.as_four_players.others[r4].unk4.as_2d_bytes[1][5] = 0;
#endif
    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00
        || gRecvCmds[0][1] != 2)
    {
        r5->unk25_2 = 0;
    }
    else
    {
        r4_ = &r5->unk40.unkE;
        memcpy(r4_, gRecvCmds, sizeof(struct BerryCrushGame_4E));
        r5->unk2A = r4_->unk6;
        r5->unk2C = r4_->unk5;
        r5->unk28 = r4_->unk8;
        sub_814DC5C(r5, &r5->unk138);
        if (r4_->unk4_0)
            r5->unk25_3 = 1;
    }
}

static u32 sub_814C850(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    memset(&r4->unk5C, 0, sizeof(r4->unk5C));
    memset(&r4->unk40.unkE, 0, sizeof(r4->unk40.unkE));
    sub_814C7BC(r4);
    SetGpuReg(REG_OFFSET_BG0VOFS, -r4->unk2C);
    SetGpuReg(REG_OFFSET_BG2VOFS, -r4->unk2C);
    SetGpuReg(REG_OFFSET_BG3VOFS, -r4->unk2C);
    if (r4->unk25_3)
    {
        if (r4->unk28 >= 36000)
        {
            r4->unk28 = 36000;
            BerryCrush_RunOrScheduleCommand(16, 1, NULL);
        }
        else
        {
            BerryCrush_RunOrScheduleCommand(15, 1, NULL);
        }
        r4->unk10 = 0;
        r4->cmdState = 0;
        return 0;
    }
    else
    {
        ++r4->unk26;
        sub_814C2FC(r4);
        sub_814C4B8(r4);
        sub_814C618(r4);
        return 0;
    }
}

static u32 sub_814C8F8(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    memset(&r4->unk5C, 0, sizeof(r4->unk5C));
    memset(&r4->unk40.unkE, 0, sizeof(r4->unk40.unkE));
    sub_814C7BC(r4);
    SetGpuReg(REG_OFFSET_BG0VOFS, -r4->unk2C);
    SetGpuReg(REG_OFFSET_BG2VOFS, -r4->unk2C);
    SetGpuReg(REG_OFFSET_BG3VOFS, -r4->unk2C);
    if (r4->unk25_3)
    {
        if (r4->unk28 >= 36000)
        {
            r4->unk28 = 36000;
            BerryCrush_RunOrScheduleCommand(16, 1, NULL);
        }
        else
        {
            BerryCrush_RunOrScheduleCommand(15, 1, NULL);
        }
        r4->unk10 = 0;
        r4->cmdState = 0;
        return 0;
    }
    else
    {
        sub_814C618(r4);
        return 0;
    }
}

static u32 sub_814C990(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    switch (r4->cmdState)
    {
    case 0:
        r4->unk12 = 8;
        PlaySE(SE_W070);
        BlendPalettes(0xFFFFFFFF, 8, RGB(31, 31, 0));
        r4->unk138.unk0 = 2;
        break;
    case 1:
        if (--r4->unk138.unk0 != 255)
            return 0;
        BlendPalettes(0xFFFFFFFF, 0, RGB(31, 31, 0));
        r4->unk138.unk1 = 4;
        r4->unk138.unk0 = 0;
        r4->unk138.unk2 = gUnknown_846E2F0[r4->unk138.unk1][0];
        break;
    case 2:
        r4->unk2C = gUnknown_846E2F0[r4->unk138.unk1][r4->unk138.unk0];
        SetGpuReg(REG_OFFSET_BG0VOFS, -r4->unk2C);
        SetGpuReg(REG_OFFSET_BG2VOFS, -r4->unk2C);
        SetGpuReg(REG_OFFSET_BG3VOFS, -r4->unk2C);
        if (++r4->unk138.unk0 < r4->unk138.unk2)
            return 0;
        if (r4->unk138.unk1 != 0)
        {
            --r4->unk138.unk1;
            r4->unk138.unk2 = gUnknown_846E2F0[r4->unk138.unk1][0];
            r4->unk138.unk0 = 0;
            return 0;
        }
        break;
    case 3:
        r4->unk2C = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        break;
    case 4:
        if (!sub_814DE50(r4, &r4->unk138))
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        r4->unk10 = 0;
        break;
    case 5:
        if (!IsLinkTaskFinished())
            return 0;
        BerryCrush_RunOrScheduleCommand(17, 1, NULL);
        r4->unk10 = 0;
        r4->cmdState = 0;
        return 0;
    }
    ++r4->cmdState;
    return 0;
}

static u32 sub_814CB20(struct BerryCrushGame * r5, u8 *r6)
{
    switch (r5->cmdState)
    {
    case 0:
        r5->unk12 = 9;
        PlaySE(SE_HAZURE);
        BlendPalettes(0xFFFFFFFF, 8, RGB(31, 0, 0));
        r5->unk138.unk0 = 4;
        break;
    case 1:
        if (--r5->unk138.unk0 != 255)
            return 0;
        BlendPalettes(0xFFFFFFFF, 0, RGB(31, 0, 0));
        r5->unk138.unk0 = 0;
        break;
    case 2:
        if (!sub_814DE50(r5, &r5->unk138))
            return 0;
        LinkRfu_SetRfuFuncToSend6600();
        r5->unk10 = 0;
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
        break;
    case 3:
        if (!IsLinkTaskFinished())
            return 0;
        ConvertIntToDecimalStringN(gStringVar1, r5->unk1C, STR_CONV_MODE_LEFT_ALIGN, 6);
        sub_814D5A4(r6, 7, 1, 0, 0);
        r5->nextCmd = 19;
        BerryCrush_RunOrScheduleCommand(3, 1, NULL);
        r5->unk10 = 0;
        r5->cmdState = 0;
        return 0;
    }
    ++r5->cmdState;
    return 0;
}

static u32 sub_814CC0C(struct BerryCrushGame * r7, UNUSED u8 *r1)
{
    u8 r8, r4_;
    s32 r2;
    s32 r4;
    u8 r6; // ???

    switch (r7->cmdState)
    {
    case 0:
        memset(r7->unk40.unk2, 0, 2 * sizeof(u16));
        if (r7->unk68.as_four_players.others[r7->localId].unk4.as_hwords[5] > r7->unk28)
            r7->unk68.as_four_players.others[r7->localId].unk4.as_hwords[5] = r7->unk28;
        r7->unk40.unk2[0] = r7->unk68.as_four_players.others[r7->localId].unk4.as_hwords[5];
        SendBlock(0, r7->unk40.unk2, 2);
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        r7->unk10 = 0;
        break;
    case 2:
        if (GetBlockReceivedStatus() != sReceivedPlayerBitmasks[r7->playerCount - 2])
            return 0;
        for (r8 = 0; r8 < r7->playerCount; ++r8)
            r7->unk68.as_four_players.others[r8].unk4.as_hwords[5] = gBlockRecvBuffer[r8][0];
        r7->unk10 = 0;
        r7->unk40.unk2[0] = 0;
        ResetBlockReceivedFlags();
        if (r7->localId == 0)
            r7->cmdState = 3;
        else
            r7->cmdState = 6;
        return 0;
    case 3:
        memset(
            &r7->unk68,
            0,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        r7->unk68.as_four_players.unk00.unk04 = r7->unk28;
        r7->unk68.as_four_players.unk00.unk06 = r7->unk18 / (r7->unk28 / 60);
        r2 = sub_80D8AE0(r7->unk30 << 8, 0x3200);
        r2 = sub_80D8B68(r2, r7->unk32 << 8) + 0x3200;
        r2 >>= 8;
        r7->unk68.as_four_players.unk00.unk08 = r2 & 0x7F;
        r2 <<= 8;
        r2 = sub_80D8B68(r2, 0x6400);
        r4 = (r7->unk1C * r7->playerCount) << 8;
        r4 = sub_80D8AE0(r4, r2);
        r7->unk68.as_four_players.unk00.unk00 = r4 >> 8;
        r7->unk68.as_five_players.players[0].unk4.as_2d_bytes[0][7] = Random() % 3;
        for (r6 = 0, r8 = 0; r8 < r7->playerCount; ++r8)
        {
            r7->unk68.as_five_players.players[0].unk4.as_2d_bytes[0][r8] = r8;
            r7->unk68.as_five_players.players[0].unk4.as_2d_bytes[1][r8] = r8;
            r7->unk68.as_four_players.unk00.unk0C[0][r8] = r7->unk68.as_four_players.others[r8].unk4.as_hwords[3];
            r7->unk68.as_four_players.unk00.unk0A += r7->unk68.as_four_players.unk00.unk0C[0][r8];
            switch (r7->unk68.as_five_players.players[0].unk4.as_2d_bytes[0][7])
            {
            case 0:
                if (r7->unk68.as_four_players.others[r8].unk4.as_hwords[3] != 0)
                {
                    r2 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[2];
                    r2 <<= 8;
                    r2 = sub_80D8AE0(r2, 0x6400);
                    r4 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[3];
                    r4 <<= 8;
                    r4 = sub_80D8B68(r2, r4);
                }
                else
                {
                    r4 = 0;
                }
                break;
            case 1:
                if (r7->unk68.as_four_players.others[r8].unk4.as_hwords[3] != 0)
                {
                    r2 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[4];
                    r2 <<= 8;
                    r2 = sub_80D8AE0(r2, 0x6400);
                    r4 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[3];
                    r4 <<= 8;
                    r4 = sub_80D8B68(r2, r4);
                }
                else
                {
                    r4 = 0;
                }
                break;
            case 2:
                if (r7->unk68.as_four_players.others[r8].unk4.as_hwords[3] == 0)
                {
                    r4 = 0;
                }
                else if (r7->unk68.as_four_players.others[r8].unk4.as_hwords[5] >= r7->unk28)
                {
                    r4 = 0x6400;
                }
                else
                {
                    r2 = r7->unk68.as_four_players.others[r8].unk4.as_hwords[5];
                    r2 <<= 8;
                    r2 = sub_80D8AE0(r2, 0x6400);
                    r4 = r7->unk28;
                    r4 <<= 8;
                    r4 = sub_80D8B68(r2, r4);
                }
                break;
            }
            r4 >>= 4;
            r7->unk68.as_four_players.unk00.unk0C[1][r8] = r4;
        }
        break;
    case 4:
        for (r6 = 0, r8 = 0; r8 < r7->playerCount - 1; ++r8)
        {
            for (r4_ = r7->playerCount - 1; r4_ > r8; --r4_)
            {
                u16 r0;
                u8 r3;
                u16 *sp00 = r7->unk68.as_four_players.unk00.unk0C[0];
                u8 *sp04 = r7->unk68.as_five_players.players[0].unk4.as_2d_bytes[0];
                u8 *r10 = r7->unk68.as_five_players.players[0].unk4.as_2d_bytes[1];
                u16 *r9 = r7->unk68.as_four_players.unk00.unk0C[1];
                s32 r12 = r4_ - 1;
                u16 *p1 = sp00 + r12; // these have to be here
                u16 *p2 = sp00 + r4_; // to swap operands. macro?

                if (*p1 < *p2)
                {
                    r0 = sp00[r4_];
                    sp00[r4_] = sp00[r12];
                    sp00[r12] = r0;
                    r3 = sp04[r4_];
                    sp04[r4_] = sp04[r12];
                    sp04[r12] = r3;
                }
                p1 = r9 + r12;
                p2 = r9 + r4_;
                if (*p1 < *p2)
                {
                    r0 = r9[r4_];
                    r9[r4_] = r9[r12];
                    r9[r12] = r0;
                    r3 = r10[r4_];
                    r10[r4_] = r10[r12];
                    r10[r12] = r3;
                }
            }
        }
        SendBlock(
            0,
            &r7->unk68,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        break;
    case 5:
        if (!IsLinkTaskFinished())
            return 0;
        r7->unk10 = 0;
        break;
    case 6:
        if (GetBlockReceivedStatus() != 1)
            return 0;
        memset(
            &r7->unk68,
            0,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        memcpy(
            &r7->unk68,
            gBlockRecvBuffer,
            sizeof(struct BerryCrushGame_68_x_SubStruct)
        );
        ResetBlockReceivedFlags();
        r7->unk10 = 0;
        break;
    case 7:
        sub_814B930();
        BerryCrush_RunOrScheduleCommand(18, 1, NULL);
        r7->unk12 = 11;
        r7->cmdState = 0;
        r7->unk24 = 0;
        return 0;
    }
    ++r7->cmdState;
    return 0;
}

static u32 sub_814CFA8(struct BerryCrushGame * r5, u8 *r6)
{
    switch (r5->cmdState)
    {
    case 0:
        if (!sub_814E644(r5, &r5->unk138))
            return 0;
        break;
    case 1:
        CopyBgTilemapBufferToVram(0);
        r5->unk138.unk0 = 30;
        break;
    case 2:
        if (r5->unk138.unk0 != 0)
        {
            --r5->unk138.unk0;
            return 0;
        }
        if (!(gMain.newKeys & A_BUTTON))
            return 0;
        PlaySE(SE_SELECT);
        sub_814E80C(r5);
        break;
    case 3:
        if (r5->unk12 <= 12)
        {
            ++r5->unk12;
            r5->cmdState = 0;
            return 0;
        }
        break;
    case 4:
        ConvertIntToDecimalStringN(gStringVar1, r5->unk1C, STR_CONV_MODE_LEFT_ALIGN, 6);
        ConvertIntToDecimalStringN(gStringVar2, GetBerryPowder(), STR_CONV_MODE_LEFT_ALIGN, 6);
        sub_814D5A4(r6, 2, 3, 0, 0);
        r5->nextCmd = 19;
        BerryCrush_RunOrScheduleCommand(3, 1, NULL);
        r5->cmdState = 0;
        return 0;
    }
    ++r5->cmdState;
    return 0;
}

static u32 sub_814D094(struct BerryCrushGame * r5, u8 *r4)
{
    switch (r5->cmdState)
    {
    case 0:
        if (r5->unk28 >= 36000)
            sub_814EB04(&r5->unk138);
        sub_814D5A4(r4, 8, 0, 0, 1);
        r5->nextCmd = 19;
        BerryCrush_RunOrScheduleCommand(3, 1, NULL);
        r5->cmdState = 0;
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
        CreateTask(sub_80DA634, 0);
        break;
    case 3:
        if (FuncIsActiveTask(sub_80DA634))
            return 0;
        break;
    case 4:
        BerryCrush_RunOrScheduleCommand(20, 1, NULL);
        r5->unk12 = 15;
        r5->cmdState = 0;
        return 0;
    }
    ++r5->cmdState;
    return 0;
}

static u32 sub_814D188(struct BerryCrushGame * r5, u8 *r6)
{
    s32 r4;
#ifndef NONMATCHING
    register s32 r0 asm("r0");
#else
    s32 r0;
#endif

    switch (r5->cmdState)
    {
    case 0:
        sub_814D5A4(r6, 4, 0, 0, 1);
        r5->nextCmd = 20;
        BerryCrush_RunOrScheduleCommand(3, 1, NULL);
        r0 = 0;
        r5->cmdState = r0; // dunno what it's doing because it's already in case 0
        return 0;
    case 1:
        DisplayYesNoMenuDefaultYes();
        break;
    case 2:
        if ((r4 = Menu_ProcessInputNoWrapClearOnChoose()) != -2)
        {
            memset(r5->unk40.unk2, 0, sizeof(r5->unk40.unk2));
            if (r4 == 0)
            {
                if (CheckHasAtLeastOneBerry())
                    r5->unk14 = 0;
                else
                    r5->unk14 = 3;
            }
            else
            {
                r5->unk14 = 1;
            }
            ClearDialogWindowAndFrame(0, TRUE);
            sub_814D5A4(r6, 8, 0, 0, 0);
            r5->nextCmd = 21;
            BerryCrush_RunOrScheduleCommand(3, 1, NULL);
            r5->cmdState = 0;
        }
        return 0;
    }
    ++r5->cmdState;
    return 0;
}

static u32 sub_814D240(struct BerryCrushGame * r4, UNUSED u8 *r1)
{
    u8 r5 = 0;

    switch (r4->cmdState)
    {
    case 0:
        LinkRfu_SetRfuFuncToSend6600();
        break;
    case 1:
        if (!IsLinkTaskFinished())
            return 0;
        r4->unk40.unk2[0] = r4->unk14;
        r4->unk40.unkE.unk0 = 0;
        SendBlock(0, r4->unk40.unk2, sizeof(u16));
        break;
    case 2:
        if (!IsLinkTaskFinished())
            return 0;
        r4->unk10 = 0;
        break;
    case 3:
        if (GetBlockReceivedStatus() != sReceivedPlayerBitmasks[r4->playerCount - 2])
            return 0;
        for (; r5 < r4->playerCount; ++r5)
            r4->unk40.unkE.unk0 += gBlockRecvBuffer[r5][0];
        if (r4->unk40.unkE.unk0 != 0)
            BerryCrush_RunOrScheduleCommand(23, 1, NULL);
        else
            BerryCrush_RunOrScheduleCommand(22, 1, NULL);
        ResetBlockReceivedFlags();
        r4->unk40.unk2[0] = 0;
        r4->unk40.unkE.unk0 = 0;
        r4->unk10 = 0;
        r4->cmdState = 0;
        return 0;
    }
    ++r4->cmdState;
    return 0;
}

static u32 sub_814D31C(struct BerryCrushGame * r5, UNUSED u8 *r1)
{
    switch (r5->cmdState)
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
        sub_814DA04(r5);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, RGB_BLACK);
        UpdatePaletteFade();
        break;
    case 3:
        if (UpdatePaletteFade())
            return 0;
        BerryCrush_RunOrScheduleCommand(7, 1, NULL);
        r5->unk12 = 3;
        r5->cmdState = 0;
        return 0;
    }
    ++r5->cmdState;
    return 0;
}

static u32 sub_814D3A4(struct BerryCrushGame * r5, UNUSED u8 *r1)
{
    switch (r5->cmdState)
    {
    case 0:
        DrawDialogueFrame(0, FALSE);
        if (r5->unk14 == 3)
            AddTextPrinterParameterized2(0, 2, gUnknown_846E328[5], r5->textSpeed, NULL, 2, 1, 3);
        else
            AddTextPrinterParameterized2(0, 2, gUnknown_846E328[6], r5->textSpeed, NULL, 2, 1, 3);
        CopyWindowToVram(0, COPYWIN_BOTH);
        break;
    case 1:
        if (IsTextPrinterActive(0))
            return 0;
        r5->unk138.unk0 = 120;
        break;
    case 2:
        if (r5->unk138.unk0 != 0)
            --r5->unk138.unk0;
        else
        {
            BerryCrush_RunOrScheduleCommand(24, 1, NULL);
            r5->cmdState = 0;
        }
        return 0;
    }
    ++r5->cmdState;
    return 0;
}

static u32 sub_814D468(struct BerryCrushGame * r5, UNUSED u8 *r1)
{
    switch (r5->cmdState)
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
        r5->nextCmd = 25;
        BerryCrush_RunOrScheduleCommand(5, 1, NULL);
        r5->cmdState = 2; // ???
        return 0;
    }
    ++r5->cmdState;
    return 0;
}

static u32 sub_814D4C8(UNUSED struct BerryCrushGame * r0, UNUSED u8 *r1)
{
    ExitBerryCrushWithCallback(NULL);
    return 0;
}

static void sub_814D4D8(struct BerryCrushGame * r4)
{
    u8 r5 = 0;

    IncrementGameStat(GAME_STAT_BERRY_CRUSH_POINTS);
    r4->unkD = 0;
    r4->unk10 = 0;
    r4->unk12 = 2;
    r4->unk14 = 0;
    r4->unk1C = 0;
    r4->unk18 = 0;
    r4->unk1A = 0;
    r4->unk20 = 0;
    r4->unk24 = 0;
    r4->unk25_0 = 0;
    r4->unk25_1 = 0;
    r4->unk25_2 = 0;
    r4->unk25_3 = 0;
    r4->unk25_4 = 0;
    r4->unk25_5 = 0;
    r4->unk26 = 0;
    r4->unk28 = 0;
    r4->unk2E = 0;
    r4->unk32 = -1;
    r4->unk30 = 0;
    r4->unk34 = 0;
    for (; r5 < 5; ++r5) // why is it 5 instead of 4? fillerBC isn't sufficient for one player
    {
        r4->unk68.as_four_players.others[r5].unk0 = -1;
        r4->unk68.as_four_players.others[r5].unk2 = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[0] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[1] = 1;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[2] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[3] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[4] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_hwords[5] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_2d_bytes[1][4] = 0;
        r4->unk68.as_four_players.others[r5].unk4.as_2d_bytes[1][5] = 0;
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

static void sub_814D5A4(u8 *r0, u32 r1, u32 r2, u32 r3, u32 r5)
{
    u8 sp[4];

    0[(u16 *)sp] = r3;
    r0[0] = r1;
    r0[1] = r2;
    r0[2] = sp[0];
    r0[3] = sp[1];
    r0[4] = r5;
}
