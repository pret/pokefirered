#include "global.h"
#include "gflib.h"
#include "easy_chat.h"
#include "graphics.h"
#include "new_menu_helpers.h"

struct Unk203A11C
{
    u16 unk0;
    u16 windowId;
    u16 unk4;
    u8 unk6;
    u8 unk7;
    s8 unk8;
    u8 unk9;
    u8 unkA;
    u8 unkB[0xC1];
    u8 unkCC[0x202];
    u16 unk2CE;
    int unk2D0;
    int unk2D4;
    struct Sprite *unk2D8;
    struct Sprite *unk2DC;
    struct Sprite *unk2E0;
    struct Sprite *unk2E4;
    struct Sprite *unk2E8;
    struct Sprite *unk2EC;
    struct Sprite *unk2F0;
    struct Sprite *unk2F4;
    struct Sprite *unk2F8;
    struct Sprite *unk2FC;
    u16 unk300[BG_SCREEN_SIZE / 2];
    u16 unkB00[BG_SCREEN_SIZE / 2];
};

struct EasyChatPhraseFrameDimensions
{
    u8 left;
    u8 top;
    u8 width;
    u8 height;
};

EWRAM_DATA struct Unk203A11C *gUnknown_203ACEC = NULL;

bool8 sub_8100258(void);
bool8 sub_8100290(void);
bool8 sub_8100374(void);
bool8 sub_81003A8(void);
bool8 sub_81003EC(void);
bool8 sub_8100430(void);
bool8 sub_8100474(void);
bool8 sub_81004B8(void);
bool8 sub_81004F4(void);
bool8 sub_81005C0(void);
bool8 sub_8100660(void);
bool8 sub_8100720(void);
bool8 sub_810072C(void);
bool8 sub_8100774(void);
bool8 sub_81007D0(void);
bool8 sub_8100890(void);
bool8 sub_810093C(void);
bool8 sub_81009F8(void);
bool8 sub_8100A04(void);
bool8 sub_8100A78(void);
bool8 sub_8100AE8(void);
bool8 sub_8100B70(void);
bool8 sub_8100BF4(void);
void sub_8100C5C(void);
void sub_8100CBC(void);
void sub_8100D24(void);
void sub_8100E34(void);
void sub_8100E7C(u8 a0);
void sub_8100F18(u8 initialCursorPos);
void sub_8100F44(void);
void sub_8100FDC(void);
void sub_8101100(u16 *buffer);
void sub_81012CC(void);
void sub_81012E0(u8 a0);
void sub_810131C(void);
void sub_81013EC(void);
void sub_8101410(void);
void sub_8101434(void);
void sub_8101478(void);
void sub_81015BC(void);
void sub_81015D4(u8 a0);
bool8 sub_81016AC(void);
void sub_81019B0(s16 a0, u8 a1);
bool8 sub_8101A10(void);
s32 sub_8101A48(void);
void sub_8101A5C(u8 left, u8 top, u8 right, u8 bottom);
void sub_8101A90(void);
void sub_8101AC4(void);
void sub_8101B58(u8 a0, u8 a1);
void sub_8101B88(void);
void sub_8101BA8(void);
void sub_8101BC0(void);
void sub_8101C48(void);
void sub_8101C80(void);
void sub_8101E80(void);
void sub_8101F04(void);
void sub_8101F80(void);
void sub_8101FAC(void);
bool8 sub_8102018(void);
void sub_81020AC(void);
bool8 sub_81020D0(void);
void sub_810215C(void);
void sub_8102178(void);
bool8 sub_81021B8(void);
void sub_81021D4(void);
void sub_810224C(void);
void sub_81022B0(void);
void sub_81022E0(u8 a0);
void sub_8102320(void);
void sub_8102394(void);
void sub_81023F8(void);
void sub_8102428(void);

const u16 gUnknown_843F3B8[] = INCBIN_U16("graphics/link_rfu/unk_843F3F8.gbapal");
const u16 gUnknown_843F3D8[] = INCBIN_U16("graphics/link_rfu/unk_8E9BD28.gbapal");
const u16 gUnknown_843F3F8[] = INCBIN_U16("graphics/link_rfu/unk_843F3F8.4bpp");
const u16 gUnknown_843F418[] = INCBIN_U16("graphics/link_rfu/unk_843F418.4bpp");
const u16 gUnknown_843F518[] = INCBIN_U16("graphics/link_rfu/unk_843F518.4bpp");
const u16 gUnknown_843F618[] = INCBIN_U16("graphics/link_rfu/unk_843F638.gbapal");
const u32 gUnknown_843F638[] = INCBIN_U32("graphics/link_rfu/unk_843F638.4bpp.lz");
const u16 gUnknown_843F76C[] = INCBIN_U16("graphics/link_rfu/unk_843F76C.gbapal");
const u16 gUnknown_843F78C[] = INCBIN_U16("graphics/link_rfu/unk_843F78C.gbapal");
const u32 gUnknown_843F7AC[] = INCBIN_U32("graphics/link_rfu/unk_843F7AC.4bpp.lz");

const u16 gUnknown_843F874[] = {
    RGB( 0,  0,  0),
    RGB( 0,  0,  0),
    RGB( 7, 25, 31),
    RGB(21, 21, 29)
};

const u16 gUnknown_843F87C[] = {
    RGB( 0,  0,  0),
    RGB(31, 31, 31),
    RGB(12, 12, 12),
    RGB(27, 26, 27),
    RGB( 8, 17,  9)
};

const struct EasyChatPhraseFrameDimensions sPhraseFrameDimensions[] = {
    {
        .left = 0x03,
        .top = 0x04,
        .width = 0x18,
        .height = 0x04
    }, {
        .left = 0x01,
        .top = 0x04,
        .width = 0x1b,
        .height = 0x04
    }, {
        .left = 0x03,
        .top = 0x00,
        .width = 0x18,
        .height = 0x0a
    }, {
        .left = 0x06,
        .top = 0x06,
        .width = 0x12,
        .height = 0x04
    }, {
        .left = 0x10,
        .top = 0x04,
        .width = 0x09,
        .height = 0x02
    }, {
        .left = 0x0e,
        .top = 0x04,
        .width = 0x12,
        .height = 0x04
    }
};

const struct BgTemplate sEasyChatBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0,
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0,
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x80,
    }, {
        .bg = 3,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0,
    }
};

const struct WindowTemplate sEasyChatWindowTemplates[] = {
    {
        .bg = 1,
        .tilemapLeft = 7,
        .tilemapTop = 0,
        .width = 16,
        .height = 2,
        .paletteNum = 10,
        .baseBlock = 0x10,
    },
    {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 15,
        .width = 22,
        .height = 4,
        .paletteNum = 15,
        .baseBlock = 0xA,
    },
    {
        .bg = 2,
        .tilemapLeft = 1,
        .tilemapTop = 0,
        .width = 28,
        .height = 32,
        .paletteNum = 3,
        .baseBlock = 0,
    },
    DUMMY_WIN_TEMPLATE,
};

const struct WindowTemplate gUnknown_843F8D0 = {
    .bg = 0,
    .tilemapLeft = 22,
    .tilemapTop = 9,
    .width = 5,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x062
};

const u8 gUnknown_843F8D8[] = _("{UNDERSCORE}");
const u8 gUnknown_843F8DB[] = _("{CLEAR 17}");

bool8 sub_80FFF80(void)
{
    if (!sub_8100BF4())
        return FALSE;
    else
        return TRUE;
}

bool8 sub_80FFF98(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, sEasyChatBgTemplates, NELEMS(sEasyChatBgTemplates));
        SetBgTilemapBuffer(3, gUnknown_203ACEC->unkB00);
        SetBgTilemapBuffer(1, gUnknown_203ACEC->unk300);
        InitWindows(sEasyChatWindowTemplates);
        DeactivateAllTextPrinters();
        sub_8100CBC();
        sub_8100C5C();
        CpuFastFill(0, (void *)VRAM + 0x1000000, 0x400);
        break;
    case 1:
        DecompressAndLoadBgGfxUsingHeap(3, gEasyChatWindow_Gfx, 0, 0, 0);
        CopyToBgTilemapBuffer(3, gEasyChatWindow_Tilemap, 0, 0);
        sub_8100F44();
        sub_8102428();
        CopyBgTilemapBufferToVram(3);
        break;
    case 2:
        sub_8101100(gUnknown_203ACEC->unk300);
        DecompressAndLoadBgGfxUsingHeap(1, gUnknown_843F7AC, 0, 0, 0);
        CopyBgTilemapBufferToVram(1);
        break;
    case 3:
        sub_8100D24();
        sub_8100E34();
        sub_8100FDC();
        sub_81012CC();
        break;
    case 4:
        sub_8101A90();
        sub_8101AC4();
        break;
    case 5:
        if (IsDma3ManagerBusyWithBgCopy())
        {
            return TRUE;
        }
        else
        {
            sub_8101A5C(0, 0, 0, 0);
            SetGpuReg(REG_OFFSET_WININ, WIN_RANGE(0, 63));
            SetGpuReg(REG_OFFSET_WINOUT, WIN_RANGE(0, 59));
            ShowBg(3);
            ShowBg(1);
            ShowBg(2);
            ShowBg(0);
            sub_81021D4();
            sub_8102320();
        }
        break;
    default:
        return FALSE;
    }

    gUnknown_203ACEC->unk0++;
    return TRUE;
}

void sub_810011C(void)
{
    if (gUnknown_203ACEC)
        Free(gUnknown_203ACEC);
}

void sub_8100134(u16 arg0)
{
    gUnknown_203ACEC->unk4 = arg0;
    gUnknown_203ACEC->unk0 = 0;
    sub_810014C();
}

bool8 sub_810014C(void)
{
    switch (gUnknown_203ACEC->unk4)
    {
    case 0:  return FALSE;
    case 1:  return sub_8100258();
    case 2:  return sub_8100290();
    case 3:  return sub_8100374();
    case 4:  return sub_8100430();
    case 5:  return sub_81003A8();
    case 6:  return sub_81003EC();
    case 7:  return sub_8100474();
    case 8:  return sub_81004B8();
    case 9:  return sub_81004F4();
    case 10: return sub_81005C0();
    case 11: return sub_81007D0();
    case 12: return sub_8100890();
    case 13: return sub_810093C();
    case 14: return sub_8100720();
    case 15: return sub_810072C();
    case 16: return sub_8100774();
    case 17: return sub_81009F8();
    case 18: return sub_8100A78();
    case 19: return sub_8100A04();
    case 20: return sub_8100B70();
    case 21: return sub_8100AE8();
    case 22: return sub_8100660();
    default: return FALSE;
    }
}

bool8 sub_8100258(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8100FDC();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_8100290(void)
{
    u8 i;
    u16 *ecWordBuffer;
    u16 *ecWord;
    u8 frameId;
    u8 cursorColumn, cursorRow, numColumns;
    s16 var1;
    int stringWidth;
    int trueStringWidth;
    int var2;
    u8 str[64];

    ecWordBuffer = GetEasyChatWordBuffer();
    frameId = GetEasyChatScreenFrameId();
    cursorColumn = GetMainCursorColumn();
    cursorRow = GetMainCursorRow();
    numColumns = GetNumColumns();
    ecWord = &ecWordBuffer[cursorRow * numColumns];
    var1 = 8 * sPhraseFrameDimensions[frameId].left + 13;
    for (i = 0; i < cursorColumn; i++)
    {
        if (*ecWord == 0xFFFF)
        {
            stringWidth = GetStringWidth(1, gUnknown_843F8D8, 0) * 7;
        }
        else
        {
            CopyEasyChatWord(str, *ecWord);
            stringWidth = GetStringWidth(1, str, 0);
        }

        trueStringWidth = stringWidth + 17;
        var1 += trueStringWidth;
        ecWord++;
    }

    var2 = 8 * (sPhraseFrameDimensions[frameId].top + cursorRow * 2 + 1) + 1;
    sub_8101B58(var1, var2);
    return FALSE;
}

bool8 sub_8100374(void)
{
    u8 xOffset;
    switch (GetMainCursorColumn())
    {
    case 0:
        xOffset = 28;
        break;
    case 1:
        xOffset = 115;
        break;
    case 2:
        xOffset = 191;
        break;
    default:
        return FALSE;
    }
    sub_8101B58(xOffset, 97);
    return FALSE;
}

bool8 sub_81003A8(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101B88();
        sub_8100E7C(2);
        sub_8100F18(1);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_81003EC(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101B88();
        sub_8100E7C(3);
        sub_8100F18(0);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_8100430(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101B88();
        sub_8100E7C(1);
        sub_8100F18(1);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_8100474(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101BA8();
        sub_8100E7C(0);
        ShowBg(0);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_81004B8(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101BA8();
        sub_8100E7C(0);
        sub_8100FDC();
        gUnknown_203ACEC->unk0++;
        // Fall through
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool8 sub_81004F4(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101B88();
        HideBg(0);
        sub_8101A5C(0, 0, 0, 0);
        sub_810131C();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(0);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy() && !sub_81016AC())
            gUnknown_203ACEC->unk0++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101FAC();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        if (!sub_8102018())
        {
            sub_8101BC0();
            sub_81022E0(0);
            sub_810224C();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    default:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_81005C0(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101C48();
        sub_81020AC();
        sub_81022B0();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (sub_81020D0() == TRUE)
            break;

        sub_81015D4(1);
        gUnknown_203ACEC->unk0++;
        // Fall through
    case 2:
        if (!sub_81016AC())
            gUnknown_203ACEC->unk0++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101BA8();
            ShowBg(0);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100660(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101C48();
        sub_81022B0();
        sub_810215C();
        sub_81015D4(5);
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!sub_81016AC() && !sub_81021B8())
        {
            sub_810131C();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(6);
            sub_8102178();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 3:
        if (!sub_81016AC() && !sub_81021B8())
        {
            sub_810224C();
            sub_8101BC0();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100720(void)
{
    sub_8101C80();
    return FALSE;
}

bool8 sub_810072C(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_81019B0(1, 2);
        gUnknown_203ACEC->unk0++;
        // Fall through
    case 1:
        if (!sub_8101A10())
        {
            sub_8101C80();
            sub_810224C();
            return FALSE;
        }
        break;
    }

    return TRUE;
}

bool8 sub_8100774(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_81019B0(-1, 2);
        gUnknown_203ACEC->unk0++;
        // Fall through
    case 1:
        if (!sub_8101A10())
        {
            sub_810224C();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_81007D0(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101C48();
        sub_81020AC();
        sub_81022B0();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!sub_81020D0())
        {
            sub_81015BC();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(2);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 3:
        if (!sub_81016AC())
        {
            sub_81012E0(2);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101E80();
            sub_81022E0(1);
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100890(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8100FDC();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        sub_8101F80();
        sub_81022B0();
        sub_81023F8();
        sub_81015BC();
        gUnknown_203ACEC->unk0++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(3);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 3:
        if (!sub_81016AC())
        {
            ShowBg(0);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101BA8();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 5:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_810093C(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101F80();
        sub_81022B0();
        sub_81023F8();
        sub_81015BC();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81015D4(4);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_81016AC())
        {
            sub_810131C();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8101FAC();
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 4:
        if (!sub_8102018())
        {
            sub_8101BC0();
            sub_81022E0(0);
            sub_810224C();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

bool8 sub_81009F8(void)
{
    sub_8101F04();
    return FALSE;
}

bool8 sub_8100A04(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_81013EC();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81019B0(1, 2);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_8101A10())
        {
            sub_8101F04();
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100A78(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101410();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_81019B0(-1, 2);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_8101A10())
        {
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100AE8(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101434();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 var0 = sub_80FFE48() - sub_8101A48();
            sub_81019B0(var0, 4);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_8101A10())
        {
            sub_8101F04();
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8100B70(void)
{
    switch (gUnknown_203ACEC->unk0)
    {
    case 0:
        sub_8101478();
        gUnknown_203ACEC->unk0++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            s16 var0 = sub_80FFE48() - sub_8101A48();
            sub_81019B0(var0, 4);
            gUnknown_203ACEC->unk0++;
        }
        break;
    case 2:
        if (!sub_8101A10())
        {
            sub_810224C();
            sub_8102394();
            gUnknown_203ACEC->unk0++;
            return FALSE;
        }
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}
