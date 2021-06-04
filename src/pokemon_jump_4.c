#include "global.h"
#include "gflib.h"
#include "data.h"
#include "digit_obj_util.h"
#include "dynamic_placeholder_text_util.h"
#include "item.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_jump.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "constants/songs.h"
#include "constants/items.h"

EWRAM_DATA static struct PokemonJump2 *gUnknown_203F3D8 = NULL;

static void sub_8149D80(void (*func)(void));
static void sub_8149DA4(u8 taskId);
static void sub_8149DC8(void);
static void sub_8149F64(void);
static void sub_8149FD0(void);
static void sub_814A03C(void);
static void sub_814A0C8(void);
static void sub_814A174(void);
static void sub_814A218(void);
static void sub_814A264(void);
static void sub_814A308(void);
static void sub_814A3AC(void);
static u32 sub_814A754(u32 left, u32 top, u32 width, u32 height);
static void sub_814A7D0(u16 left, u16 top, u8 cursorPos);
static void sub_814A84C(void);
static void sub_814A8B8(void);
static void sub_814A9C8(void);
static void sub_814AADC(void);
static void sub_814AC30(bool32 arg0);
static void sub_814AC94(void);
static void sub_814ACCC(u8 arg0);
static void sub_814AD50(u8 taskId);

static void sub_8149D34(struct PokemonJump2 *);

void sub_8149CEC(struct PokemonJump2 *arg0)
{
    u8 taskId;

    gUnknown_203F3D8 = arg0;
    sub_8149D34(gUnknown_203F3D8);
    taskId = CreateTask(sub_8149DA4, 3);
    gUnknown_203F3D8->unk6 = taskId;
    SetWordTaskArg(gUnknown_203F3D8->unk6, 2, (uintptr_t)gUnknown_203F3D8);
    sub_8149D80(sub_8149DC8);
}

void sub_8149D24(void)
{
    FreeAllWindowBuffers();
    DigitObjUtil_Free();
}

static void sub_8149D34(struct PokemonJump2 *arg0)
{
    arg0->unk4 = 0;
    arg0->unk0 = 0;
    arg0->unk12 = 0xFF;
}

// Gfx
static const u16 sPkmnJumpPal3[] = INCBIN_U16("graphics/link_games/pkmnjump_pal3.gbapal");

static const u16 sPkmnJumpBgPal[] = INCBIN_U16("graphics/link_games/pkmnjump_bg.gbapal");
static const u32 sPkmnJumpBgGfx[] = INCBIN_U32("graphics/link_games/pkmnjump_bg.4bpp.lz");
static const u32 sPkmnJumpBgTilemap[] = INCBIN_U32("graphics/link_games/pkmnjump_bg.bin.lz");

static const u16 sPkmnJumpVenusaurPal[] = INCBIN_U16("graphics/link_games/pkmnjump_venusaur.gbapal");
static const u32 sPkmnJumpVenusaurGfx[] = INCBIN_U32("graphics/link_games/pkmnjump_venusaur.4bpp.lz");
static const u32 sPkmnJumpVenusaurTilemap[] = INCBIN_U32("graphics/link_games/pkmnjump_venusaur.bin.lz");

static const u16 sPkmnJumpResultsPal[] = INCBIN_U16("graphics/link_games/pkmnjump_results.gbapal");
static const u32 sPkmnJumpResultsGfx[] = INCBIN_U32("graphics/link_games/pkmnjump_results.4bpp.lz");
static const u32 sPkmnJumpResultsTilemap[] = INCBIN_U32("graphics/link_games/pkmnjump_results.bin.lz");

static const struct BgTemplate gUnknown_846D8D4[] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 27,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 12,
        .screenSize = 3,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0
    },
};

static const struct WindowTemplate gUnknown_846D8E4[] =
{
    {
        .bg = 0,
        .tilemapLeft = 19,
        .tilemapTop = 0,
        .width = 6,
        .height = 2,
        .paletteNum = 2,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 8,
        .tilemapTop = 0,
        .width = 6,
        .height = 2,
        .paletteNum = 2,
        .baseBlock = 0x1F,
    },
    DUMMY_WIN_TEMPLATE,
};

struct
{
    int id;
    void (*func)(void);
} static const gUnknown_846D8FC[] =
{
    {0x00, sub_8149DC8},
    {0x01, sub_8149F64},
    {0x02, sub_8149FD0},
    {0x03, sub_814A03C},
    {0x04, sub_814A0C8},
    {0x05, sub_814A174},
    {0x06, sub_814A218},
    {0x07, sub_814A264},
    {0x09, sub_814A3AC},
    {0x08, sub_814A308},
};

void sub_8149D40(int arg0)
{
    int i;

    for (i = 0; i < NELEMS(gUnknown_846D8FC); i++)
    {
        if (gUnknown_846D8FC[i].id == arg0)
            sub_8149D80(gUnknown_846D8FC[i].func);
    }
}

bool32 sub_8149D68(void)
{
    return (gUnknown_203F3D8->unk0 != 1);
}

static void sub_8149D80(void (*func)(void))
{
    SetWordTaskArg(gUnknown_203F3D8->unk6, 0, (uintptr_t)func);
    gUnknown_203F3D8->unk4 = 0;
    gUnknown_203F3D8->unk0 = 0;
}

static void sub_8149DA4(u8 taskId)
{
    if (!gUnknown_203F3D8->unk0)
    {
        void (*func)(void) = (void *)(GetWordTaskArg(taskId, 0));

        func();
    }
}

static void sub_8149DC8(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, gUnknown_846D8D4, NELEMS(gUnknown_846D8D4));
        InitWindows(gUnknown_846D8E4);
        ResetBgPositions();
        ResetTempTileDataBuffers();
        sub_814AD6C(gUnknown_203F3D8);
        sub_814A9C8();
        LoadPalette(sPkmnJumpBgPal, 0, 0x20);
        DecompressAndCopyTileDataToVram(3, sPkmnJumpBgGfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, sPkmnJumpBgTilemap, 0, 0, 1);
        LoadPalette(sPkmnJumpVenusaurPal, 0x30, 0x20);
        DecompressAndCopyTileDataToVram(2, sPkmnJumpVenusaurGfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(2, sPkmnJumpVenusaurTilemap, 0, 0, 1);
        LoadPalette(sPkmnJumpResultsPal, 0x10, 0x20);
        DecompressAndCopyTileDataToVram(1, sPkmnJumpResultsGfx, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, sPkmnJumpResultsTilemap, 0, 0, 1);
        LoadPalette(sPkmnJumpPal3, 0x20, 0x20);
        SetBgTilemapBuffer(0, gUnknown_203F3D8->tilemapBuffer);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 0x20, 0x20);
        sub_814A84C();
        sub_814AA24(0);
        DrawWindowBorderWithStdpal3(0, 1, 0xE0);
        LoadUserWindowBorderGfx(0, 0x00A, 0xD0);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            sub_814A8B8();
            sub_814B294(gUnknown_203F3D8);
            sub_814B348(gUnknown_203F3D8, 6);
            ShowBg(3);
            ShowBg(0);
            ShowBg(2);
            HideBg(1);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_8149F64(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        sub_814AADC();
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_814AC30(FALSE);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_814AC94();
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_8149FD0(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        sub_814AADC();
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_814AC30(TRUE);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_814AC94();
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A03C(void)
{
    int i, numPlayers;

    numPlayers = sub_81499A4();
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        for (i = 0; i < numPlayers; i++)
            ClearWindowTilemap(gUnknown_203F3D8->unk1C[i]);

        CopyBgTilemapBufferToVram(0);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            for (i = 0; i < numPlayers; i++)
                RemoveWindow(gUnknown_203F3D8->unk1C[i]);

            gUnknown_203F3D8->unk0 = 1;
        }
        break;
    }
}

static void sub_814A0C8(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        gUnknown_203F3D8->unk12 = sub_814A754(1, 8, 20, 2);
        AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gText_WantToPlayAgain2, 0, 2, TEXT_SPEED_FF, NULL);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            sub_814A7D0(23, 7, 0);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A174(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        gUnknown_203F3D8->unk12 = sub_814A754(2, 7, 26, 4);
        AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gText_SavingDontTurnOffPower, 0, 2, TEXT_SPEED_FF, NULL);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A218(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        sub_814A6CC();
        DestroyYesNoMenu();
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!sub_814A6FC() && !IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A264(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        gUnknown_203F3D8->unk12 = sub_814A754(2, 8, 22, 4);
        AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gText_SomeoneDroppedOut2, 0, 2, TEXT_SPEED_FF, NULL);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A308(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        gUnknown_203F3D8->unk12 = sub_814A754(7, 10, 16, 2);
        AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gText_CommunicationStandby4, 0, 2, TEXT_SPEED_FF, NULL);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unk4++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

static void sub_814A3AC(void)
{
    switch (gUnknown_203F3D8->unk4)
    {
    case 0:
        sub_814B43C(gUnknown_203F3D8);
        gUnknown_203F3D8->unk4++;
        break;
    case 1:
        if (!sub_814B460())
            gUnknown_203F3D8->unk0 = 1;
        break;
    }
}

void sub_814A3E4(void)
{
    gUnknown_203F3D8->unkA = 0;
    gUnknown_203F3D8->unkB = 0;
    gUnknown_203F3D8->unkC = 6;
    sub_814A95C(gUnknown_203F3D8->unkC);
}

bool32 sub_814A408(void)
{
    switch (gUnknown_203F3D8->unkA)
    {
    case 0:
        gUnknown_203F3D8->unkB++;
        if (gUnknown_203F3D8->unkB > 10)
        {
            gUnknown_203F3D8->unkB = 0;
            gUnknown_203F3D8->unkC++;
            if (gUnknown_203F3D8->unkC >= 10)
            {
                gUnknown_203F3D8->unkC = 0;
                gUnknown_203F3D8->unkA++;
            }
        }
        sub_814A95C(gUnknown_203F3D8->unkC);
        if (gUnknown_203F3D8->unkC != 7)
            break;
    case 1:
        return FALSE;
    }

    return TRUE;
}

static const u8 sPluralTxt[] = _("IES");

void sub_814A468(u16 itemId, u16 quantity)
{
    CopyItemName(itemId, gUnknown_203F3D8->txtBuff[0]);
    ConvertIntToDecimalStringN(gUnknown_203F3D8->txtBuff[1], quantity, STR_CONV_MODE_LEFT_ALIGN, 1);
    if (itemId >= FIRST_BERRY_INDEX && itemId < LAST_BERRY_INDEX)
    {
        if (quantity > 1)
        {
            int endi = StringLength(gUnknown_203F3D8->txtBuff[0]);
            if (endi != 0)
            {
                endi--;
                endi[gUnknown_203F3D8->txtBuff[0]] = EOS;
                StringAppend(gUnknown_203F3D8->txtBuff[0], sPluralTxt);
            }
        }
    }
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(1, gUnknown_203F3D8->txtBuff[1]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gUnknown_203F3D8->strBuff, gText_AwesomeWonF701F700);
    gUnknown_203F3D8->unk12 = sub_814A754(4, 8, 22, 4);
    AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gUnknown_203F3D8->strBuff, 0, 2, TEXT_SPEED_FF, NULL);
    CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
    gUnknown_203F3D8->unk14 = MUS_LEVEL_UP;
    gUnknown_203F3D8->unkD = 0;
}

void sub_814A53C(u16 itemId)
{
    CopyItemName(itemId, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gUnknown_203F3D8->strBuff, gText_FilledStorageSpace2);
    gUnknown_203F3D8->unk12 = sub_814A754(4, 8, 22, 4);
    AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gUnknown_203F3D8->strBuff, 0, 2, TEXT_SPEED_FF, NULL);
    CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
    gUnknown_203F3D8->unk14 = 0;
    gUnknown_203F3D8->unkD = 0;
}

void sub_814A5B4(u16 itemId)
{
    CopyItemName(itemId, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_Reset();
    DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gUnknown_203F3D8->txtBuff[0]);
    DynamicPlaceholderTextUtil_ExpandPlaceholders(gUnknown_203F3D8->strBuff, gText_CantHoldMore);
    gUnknown_203F3D8->unk12 = sub_814A754(4, 9, 22, 2);
    AddTextPrinterParameterized(gUnknown_203F3D8->unk12, 2, gUnknown_203F3D8->strBuff, 0, 2, TEXT_SPEED_FF, NULL);
    CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_GFX);
    gUnknown_203F3D8->unk14 = 0;
    gUnknown_203F3D8->unkD = 0;
}

bool32 sub_814A62C(void)
{
    switch (gUnknown_203F3D8->unkD)
    {
    case 0:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F3D8->unk12);
            DrawTextBorderOuter(gUnknown_203F3D8->unk12, 1, 14);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F3D8->unkD++;
        }
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            break;
        if (gUnknown_203F3D8->unk14 == 0)
        {
            gUnknown_203F3D8->unkD += 2;
            return FALSE;
        }
        PlayFanfare(gUnknown_203F3D8->unk14);
        gUnknown_203F3D8->unkD++;
    case 2:
        if (!IsFanfareTaskInactive())
            break;
        gUnknown_203F3D8->unkD++;
    case 3:
        return FALSE;
    }

    return TRUE;
}

void sub_814A6CC(void)
{
    if (gUnknown_203F3D8->unk12 != 0xFF)
    {
        rbox_fill_rectangle(gUnknown_203F3D8->unk12);
        CopyWindowToVram(gUnknown_203F3D8->unk12, COPYWIN_MAP);
        gUnknown_203F3D8->unkD = 0;
    }
}

// Can't match this without the ugly GOTO, oh well.
bool32 sub_814A6FC(void)
{
    if (gUnknown_203F3D8->unk12 == 0xFF)
    {
        RET_FALSE:
        return FALSE;
    }

    if (gUnknown_203F3D8->unkD == 0)
    {
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            RemoveWindow(gUnknown_203F3D8->unk12);
            gUnknown_203F3D8->unk12 = 0xFF;
            gUnknown_203F3D8->unkD++;
            goto RET_FALSE;
        }
    }
    else if (gUnknown_203F3D8->unkD == 1)
        goto RET_FALSE;

    return TRUE;
}

s8 sub_814A744(void)
{
    return Menu_ProcessInputNoWrapClearOnChoose();
}

static u32 sub_814A754(u32 left, u32 top, u32 width, u32 height)
{
    u32 windowId;
    struct WindowTemplate window;

    window.bg = 0;
    window.tilemapLeft = left;
    window.tilemapTop = top;
    window.width = width;
    window.height = height;
    window.paletteNum = 0xF;
    window.baseBlock = 0x43;

    windowId = AddWindow(&window);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    return windowId;
}

static void sub_814A7D0(u16 left, u16 top, u8 cursorPos)
{
    struct WindowTemplate window;
    u8 a = cursorPos;

    window.bg = 0;
    window.tilemapLeft = left;
    window.tilemapTop = top;
    window.width = 6;
    window.height = 4;
    window.paletteNum = 2;
    window.baseBlock = 0x2B;

    CreateYesNoMenu(&window, 2, 0, 2, 0x00a, 0xD, a);
}

static void sub_814A84C(void)
{
    u8 color[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY};

    PutWindowTilemap(0);
    PutWindowTilemap(1);
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    AddTextPrinterParameterized3(0, 0, 0, 2, color, 0, gText_SpacePoints2);
    AddTextPrinterParameterized3(1, 0, 0, 2, color, 0, gText_SpaceTimes3);
}

static const u8 gUnknown_846D953[] = {2, 2, 0, 0, 1, 1, 1, 0, 0, 2, 0, 0, 0};

static const struct CompressedSpriteSheet gUnknown_846D960 = {gUnknown_8479688, 0, 0x320};
static const struct SpritePalette gUnknown_846D968 = {gUnknown_8479668, 0x320};

static const u16 gUnknown_846D970[] = {0x06, 0x08, 0x10, 0x08};
static const u16 gUnknown_846D978[] = {0x06, 0x08, 0x0b, 0x06, 0x10, 0x08};
static const u16 gUnknown_846D984[] = {0x02, 0x06, 0x06, 0x08, 0x10, 0x08, 0x14, 0x06};
static const u16 gUnknown_846D994[] = {0x02, 0x06, 0x06, 0x08, 0x0b, 0x06, 0x10, 0x08, 0x14, 0x06};

static const u16 *const gUnknown_846D9A8[] =
{
    gUnknown_846D970,
    gUnknown_846D978,
    gUnknown_846D984,
    gUnknown_846D994,
};

static const s16 gUnknown_846D9B8[] = {0x0058, 0x0098};
static const s16 gUnknown_846D9BC[] = {0x0058, 0x0078, 0x0098};
static const s16 gUnknown_846D9C2[] = {0x0038, 0x0058, 0x0098, 0x00b8};
static const s16 gUnknown_846D9CA[] = {0x0038, 0x0058, 0x0078, 0x0098, 0x00b8};

static const s16 *const gUnknown_846D9D4[] =
{
    gUnknown_846D9B8,
    gUnknown_846D9BC,
    gUnknown_846D9C2,
    gUnknown_846D9CA,
};

static void sub_814A8B8(void)
{
    int i, y, playersCount = sub_81499A4();
    const s16 *xCoords = gUnknown_846D9D4[playersCount - 2];

    for (i = 0; i < playersCount; i++)
    {
        struct PokemonJump1_MonInfo *info = sub_81499C0(i);

        y = gMonFrontPicCoords[info->species].y_offset;
        sub_814ADCC(gUnknown_203F3D8, info, *xCoords, y + 112, i);
        sub_814B240(gUnknown_203F3D8, *xCoords, 112, i);
        xCoords++;
    }
}

void sub_814A940(u32 id, s16 y)
{
    gUnknown_203F3D8->unk81A8[id]->pos2.y = y;
}

void sub_814A95C(int id)
{
    sub_814B348(gUnknown_203F3D8, id);
    ChangeBgY(2, (gUnknown_846D953[id] * 5) << 0xD, 0);
}

int sub_814A98C(u8 flags)
{
    int i, count;

    for (i = 0, count = 0; i < 5; i++)
    {
        if (flags & 1)
        {
            sub_814AF0C(gUnknown_203F3D8, i);
            count++;
        }
        flags >>= 1;
    }

    sub_814ACCC(count - 2);
    return count;
}

static void sub_814A9C8(void)
{
    struct DigitObjUtilTemplate unkStruct;
    struct DigitObjUtilTemplate *ptr = &unkStruct; // This temp variable is needed to match, don't ask me why.

    ptr->shape = SPRITE_SHAPE(8x8);
    ptr->size = SPRITE_SIZE(8x8);
    ptr->strConvMode = 0;
    ptr->priority = 1;
    ptr->oamCount = 5;
    ptr->xDelta = 8;
    ptr->x = 108;
    ptr->y = 6;
    ptr->spriteSheet.compressed = &gUnknown_846D960;
    ptr->spritePal = &gUnknown_846D968;

    DigitObjUtil_Init(2);
    DigitObjUtil_CreatePrinter(0, 0, ptr);

    unkStruct.oamCount = 4;
    unkStruct.x = 30;
    unkStruct.y = 6;
    DigitObjUtil_CreatePrinter(1, 0, &unkStruct);
}

void sub_814AA24(int arg0)
{
    DigitObjUtil_PrintNumOn(0, arg0);
}

void sub_814AA34(u16 arg0)
{
    DigitObjUtil_PrintNumOn(1, arg0);
}

void sub_814AA48(u8 multiplayerId)
{
    sub_814AFE8(gUnknown_203F3D8, multiplayerId);
}

void sub_814AA60(u8 multiplayerId)
{
    sub_814B080(gUnknown_203F3D8, multiplayerId);
}

int sub_814AA78(int multiplayerId)
{
    return sub_814B010(gUnknown_203F3D8, multiplayerId);
}

void sub_814AA8C(void)
{
    sub_814B0A8(gUnknown_203F3D8);
}

void sub_814AAA0(void)
{
    sub_814B134(gUnknown_203F3D8);
}

void sub_814AAB4(int multiplayerId)
{
    sub_814B168(gUnknown_203F3D8, multiplayerId);
}

int sub_814AAC8(void)
{
    return sub_814B190(gUnknown_203F3D8);
}

static void sub_814AADC(void)
{
    struct WindowTemplate window;
    int i, playersCount = sub_81499A4();
    const u16 *winCoords = gUnknown_846D9A8[playersCount - 2];

    window.bg = 0;
    window.width = 8;
    window.height = 2;
    window.paletteNum = 2;
    window.baseBlock = 0x2B;

    for (i = 0; i < playersCount; i++)
    {
        window.tilemapLeft = winCoords[0];
        window.tilemapTop = winCoords[1];
        gUnknown_203F3D8->unk1C[i] = AddWindow(&window);
        ClearWindowTilemap(gUnknown_203F3D8->unk1C[i]);
        window.baseBlock += 0x10;
        winCoords += 2;
    }

    CopyBgTilemapBufferToVram(0);
}

static void sub_814AB98(int multiplayerId, u8 clr1, u8 clr2, u8 clr3)
{
    u32 x;
    u8 colors[3] = {clr1, clr2, clr3};

    FillWindowPixelBuffer(gUnknown_203F3D8->unk1C[multiplayerId], PIXEL_FILL(0));
    x = 64 - GetStringWidth(0, sub_81499E0(multiplayerId), -1);
    x /= 2;
    AddTextPrinterParameterized3(gUnknown_203F3D8->unk1C[multiplayerId], 0, x, 2, colors, -1, sub_81499E0(multiplayerId));
    CopyWindowToVram(gUnknown_203F3D8->unk1C[multiplayerId], COPYWIN_GFX);
}

static void sub_814AC30(bool32 arg0)
{
    int i, var, playersCount = sub_81499A4();

    if (!arg0)
    {
        for (i = 0; i < playersCount; i++)
            sub_814AB98(i, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY);
    }
    else
    {
        var = sub_81499B4();
        for (i = 0; i < playersCount; i++)
        {
            if (var != i)
                sub_814AB98(i, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY);
            else
                sub_814AB98(i, TEXT_COLOR_TRANSPARENT, TEXT_COLOR_RED, TEXT_COLOR_LIGHT_RED);
        }
    }
}

static void sub_814AC94(void)
{
    int i, playersCount = sub_81499A4();

    for (i = 0; i < playersCount; i++)
        PutWindowTilemap(gUnknown_203F3D8->unk1C[i]);
    CopyBgTilemapBufferToVram(0);
}

static void sub_814ACCC(u8 arg0)
{
    gUnknown_203F3D8->unk18 = 0;
    ChangeBgX(1, (arg0 / 2) << 16, 0);
    ChangeBgY(1, (((arg0 % 2) << 8) - 40) << 8, 0);
    ShowBg(1);
    CreateTask(sub_814AD50, 4);
}

static bool32 sub_814AD18(void)
{
    if (gUnknown_203F3D8->unk18 >= 32)
    {
        return FALSE;
    }
    else
    {
        ChangeBgY(1, 128, 1);
        if (++gUnknown_203F3D8->unk18 >= 32)
            HideBg(1);
        return TRUE;
    }
}

static void sub_814AD50(u8 taskId)
{
    if (!sub_814AD18())
        DestroyTask(taskId);
}
