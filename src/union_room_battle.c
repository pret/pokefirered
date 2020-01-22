#include "global.h"
#include "bg.h"
#include "battle.h"
#include "gpu_regs.h"
#include "link.h"
#include "malloc.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "strings.h"
#include "text_window.h"
#include "union_room.h"
#include "window.h"

struct UnkStruct_203B08C
{
    s16 a0;
};

static EWRAM_DATA struct UnkStruct_203B08C * gUnknown_203B08C = NULL;

static const struct BgTemplate gUnknown_8457194[] = {
    {
        .bg = 0,
        .charBaseIndex = 3,
        .mapBaseIndex = 31
    }
};

static const struct WindowTemplate gUnknown_8457198[] = {
    {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 14,
        .baseBlock = 0x014
    }, DUMMY_WIN_TEMPLATE
};

static const u8 gUnknown_84571A8[] = {1, 2, 3};

static void sub_811C04C(void)
{
    s32 i;
    sub_81173C0(BATTLE_TYPE_LINK | BATTLE_TYPE_TRAINER);
    for (i = 0; i < 2; i++)
    {
        gEnemyParty[i] = gPlayerParty[gSelectedOrderFromParty[i] - 1];
    }
    for (i = 0; i < PARTY_SIZE; i++)
    {
        ZeroMonData(&gPlayerParty[i]);
    }
    for (i = 0; i < 2; i++)
    {
        gPlayerParty[i] = gEnemyParty[i];
    }
    IncrementGameStat(GAME_STAT_NUM_UNION_ROOM_BATTLES);
    CalculatePlayerPartyCount();
    gTrainerBattleOpponent_A = TRAINER_OPPONENT_C00;
    SetMainCallback2(CB2_InitBattle);
}

static void sub_811C0E0(u8 windowId, const u8 * str, u8 x, u8 y, s32 speed)
{
    s32 letterSpacing = 1;
    s32 lineSpacing = 1;
    FillWindowPixelBuffer(windowId, PIXEL_FILL(gUnknown_84571A8[0]));
    AddTextPrinterParameterized4(windowId, 3, x, y, letterSpacing, lineSpacing, gUnknown_84571A8, speed, str);
}

static bool32 sub_811C150(s16 * state, const u8 * str, s32 speed)
{
    switch (*state)
    {
    case 0:
        DrawTextBorderOuter(0, 0x001, 0xD);
        sub_811C0E0(0, str, 0, 2, speed);
        PutWindowTilemap(0);
        CopyWindowToVram(0, 3);
        (*state)++;
        break;
    case 1:
        if (!IsTextPrinterActive(0))
        {
            *state = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void sub_811C1B4(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_811C1C8(void)
{
    switch (gMain.state)
    {
    case 0:
        SetGpuReg(REG_OFFSET_DISPCNT, 0x0000);
        gUnknown_203B08C = AllocZeroed(sizeof(struct UnkStruct_203B08C));
        ResetSpriteData();
        FreeAllSpritePalettes();
        ResetTasks();
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, gUnknown_8457194, 1);
        ResetTempTileDataBuffers();
        if (!InitWindows(gUnknown_8457198))
        {
            return;
        }
        DeactivateAllTextPrinters();
        ClearWindowTilemap(0);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        FillBgTilemapBufferRect(0, 0, 0, 0, 30, 20, 0xF);
        TextWindow_SetStdFrame0_WithPal(0, 1, 0xD0);
        Menu_LoadStdPal();
        SetVBlankCallback(sub_811C1B4);
        gMain.state++;
        break;
    case 1:
        if (sub_811C150(&gUnknown_203B08C->a0, gText_CommStandbyAwaitingOtherPlayer, 0))
        {
            gMain.state++;
        }
        break;
    case 2:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        ShowBg(0);
        gMain.state++;
        break;
    case 3:
        if (!UpdatePaletteFade())
        {
            memset(gBlockSendBuffer, 0, 0x20);
            if (gSelectedOrderFromParty[0] == -gSelectedOrderFromParty[1])
            {
                gBlockSendBuffer[0] = 0x52;
            }
            else
            {
                gBlockSendBuffer[0] = 0x51;
            }
            SendBlock(0, gBlockSendBuffer, 0x20);
            gMain.state++;
        }
        break;
    case 4:
        if (GetBlockReceivedStatus() == 3)
        {
            if (gBlockRecvBuffer[0][0] == 0x51 && gBlockRecvBuffer[1][0] == 0x51)
            {
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
                gMain.state = 50;
            }
            else
            {
                sub_800AAC0();
                if (gBlockRecvBuffer[GetMultiplayerId()][0] == 0x52)
                {
                    gMain.state = 6;
                }
                else
                {
                    gMain.state = 8;
                }
            }
            ResetBlockReceivedFlags();
        }
        break;
    case 50:
        if (!UpdatePaletteFade())
        {
            sub_800AB9C();
            gMain.state++;
        }
        break;
    case 51:
        if (IsLinkTaskFinished())
        {
            SetMainCallback2(sub_811C04C);
        }
        break;
    case 6:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            gMain.state++;
        }
        break;
    case 7:
        if (sub_811C150(&gUnknown_203B08C->a0, gText_RefusedBattle, 1))
        {
            SetMainCallback2(CB2_ReturnToField);
        }
        break;
    case 8:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            gMain.state++;
        }
        break;
    case 9:
        if (sub_811C150(&gUnknown_203B08C->a0, gText_BattleWasRefused, 1))
        {
            SetMainCallback2(CB2_ReturnToField);
        }
        break;
    }
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}
