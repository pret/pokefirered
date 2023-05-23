#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "link.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "party_menu.h"
#include "strings.h"
#include "text_window.h"
#include "union_room.h"
#include "constants/union_room.h"

struct UnionRoomBattleWork
{
    s16 textState;
};

static EWRAM_DATA struct UnionRoomBattleWork * sWork = NULL;

static const struct BgTemplate sBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 3,
        .mapBaseIndex = 31
    }
};

static const struct WindowTemplate sWindowTemplates[] = {
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

static const u8 sTextColors[] = {1, 2, 3};

static void SetUpPartiesAndStartBattle(void)
{
    s32 i;
    StartUnionRoomBattle(BATTLE_TYPE_LINK | BATTLE_TYPE_TRAINER);
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
    gTrainerBattleOpponent_A = TRAINER_UNION_ROOM;
    SetMainCallback2(CB2_InitBattle);
}

static void UnionRoomBattle_CreateTextPrinter(u8 windowId, const u8 * str, u8 x, u8 y, s32 speed)
{
    s32 letterSpacing = 1;
    s32 lineSpacing = 1;
    FillWindowPixelBuffer(windowId, PIXEL_FILL(sTextColors[0]));
    AddTextPrinterParameterized4(windowId, FONT_NORMAL_COPY_2, x, y, letterSpacing, lineSpacing, sTextColors, speed, str);
}

static bool32 UnionRoomBattle_PrintTextOnWindow0(s16 * state, const u8 * str, s32 speed)
{
    switch (*state)
    {
    case 0:
        DrawTextBorderOuter(0, 0x001, 13);
        UnionRoomBattle_CreateTextPrinter(0, str, 0, 2, speed);
        PutWindowTilemap(0);
        CopyWindowToVram(0, COPYWIN_FULL);
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

static void VBlankCB_UnionRoomBattle(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_UnionRoomBattle(void)
{
    switch (gMain.state)
    {
    case 0:
        SetGpuReg(REG_OFFSET_DISPCNT, 0x0000);
        sWork = AllocZeroed(sizeof(struct UnionRoomBattleWork));
        ResetSpriteData();
        FreeAllSpritePalettes();
        ResetTasks();
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, sBgTemplates, 1);
        ResetTempTileDataBuffers();
        if (!InitWindows(sWindowTemplates))
        {
            return;
        }
        DeactivateAllTextPrinters();
        ClearWindowTilemap(0);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        FillBgTilemapBufferRect(0, 0, 0, 0, 30, 20, 15);
        LoadStdWindowGfx(0, 1, BG_PLTT_ID(13));
        Menu_LoadStdPal();
        SetVBlankCallback(VBlankCB_UnionRoomBattle);
        gMain.state++;
        break;
    case 1:
        if (UnionRoomBattle_PrintTextOnWindow0(&sWork->textState, gText_CommStandbyAwaitingOtherPlayer, 0))
        {
            gMain.state++;
        }
        break;
    case 2:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        ShowBg(0);
        gMain.state++;
        break;
    case 3:
        if (!UpdatePaletteFade())
        {
            memset(gBlockSendBuffer, 0, 0x20);
            if (gSelectedOrderFromParty[0] == -gSelectedOrderFromParty[1])
            {
                gBlockSendBuffer[0] = ACTIVITY_DECLINE | 0x40;
            }
            else
            {
                gBlockSendBuffer[0] = ACTIVITY_ACCEPT | 0x40;
            }
            SendBlock(0, gBlockSendBuffer, 0x20);
            gMain.state++;
        }
        break;
    case 4:
        if (GetBlockReceivedStatus() == 3)
        {
            if (gBlockRecvBuffer[0][0] == (ACTIVITY_ACCEPT | 0x40) && gBlockRecvBuffer[1][0] == (ACTIVITY_ACCEPT | 0x40))
            {
                BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
                gMain.state = 50;
            }
            else
            {
                SetCloseLinkCallback();
                if (gBlockRecvBuffer[GetMultiplayerId()][0] == (ACTIVITY_DECLINE | 0x40))
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
            SetLinkStandbyCallback();
            gMain.state++;
        }
        break;
    case 51:
        if (IsLinkTaskFinished())
        {
            SetMainCallback2(SetUpPartiesAndStartBattle);
        }
        break;
    case 6:
        if (!gReceivedRemoteLinkPlayers)
        {
            gMain.state++;
        }
        break;
    case 7:
        if (UnionRoomBattle_PrintTextOnWindow0(&sWork->textState, gText_RefusedBattle, 1))
        {
            SetMainCallback2(CB2_ReturnToField);
        }
        break;
    case 8:
        if (!gReceivedRemoteLinkPlayers)
        {
            gMain.state++;
        }
        break;
    case 9:
        if (UnionRoomBattle_PrintTextOnWindow0(&sWork->textState, gText_BattleWasRefused, 1))
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
