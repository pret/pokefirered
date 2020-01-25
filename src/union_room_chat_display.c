#include "global.h"
#include "gflib.h"
#include "dynamic_placeholder_text_util.h"
#include "graphics.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "strings.h"
#include "text_window.h"
#include "union_room_chat.h"
#include "union_room_chat_display.h"
#include "union_room_chat_objects.h"

struct UnionRoomChat2_Unk0
{
    bool32 (*unk0)(u8 *);
    u8 unk4;
    u8 unk5;
};

struct UnionRoomChat2
{
    struct UnionRoomChat2_Unk0 unk0[3];
    u16 unk18;
    u16 unk1A;
    u16 unk1C;
    u16 unk1E;
    s16 unk20;
    u8 unk22[0x106];
    u8 unk128[BG_SCREEN_SIZE];
    u8 unk928[BG_SCREEN_SIZE];
    u8 unk1128[BG_SCREEN_SIZE];
    u8 unk1928[BG_SCREEN_SIZE];
    u8 unk2128[0x20];
    u8 unk2148[0x20];
};

struct Unk845AABC
{
    u16 unk0;
    bool32 (*unk4)(u8 *);
};

struct Unk845AB64
{
    const u8 *unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
};

EWRAM_DATA struct UnionRoomChat2 * gUnknown_203B0E4 = NULL;

void sub_8129BB8(struct UnionRoomChat2 * ptr);
void sub_8129BC4(void);
bool32 sub_8129CA0(u8 *state);
bool32 sub_8129D40(u8 *state);
bool32 sub_8129D78(u8 *state);
bool32 sub_8129DB0(u8 *state);
bool32 sub_8129E1C(u8 *state);
bool32 sub_8129E28(u8 *state);
bool32 sub_8129E74(u8 *state);
bool32 sub_8129EB8(u8 *state);
bool32 sub_8129F24(u8 *state);
bool32 sub_8129FCC(u8 *state);
bool32 sub_812A074(u8 *state);
bool32 sub_812A0B0(u8 *state);
bool32 sub_812A18C(u8 *state);
bool32 sub_812A1B8(u8 *state);
bool32 sub_812A1FC(u8 *state);
bool32 sub_812A240(u8 *state);
bool32 sub_812A294(u8 *state);
bool32 sub_812A2E4(u8 *state);
bool32 sub_812A334(u8 *state);
bool32 sub_812A378(u8 *state);
bool32 sub_812A3D0(u8 *state);
bool32 sub_812A420(u8 *state);
void sub_812A424(u8 a0, u8 a1, u8 a2);
void sub_812A51C(void);
void sub_812A544(void);
void sub_812A578(int a0, u16 a1);
void sub_812A6F4(void);
void sub_812A728(void);
void sub_812A74C(u16 a0, u16 a1, u8 a2);
void sub_812A778(u16 a0, u8 *a1, u8 a2, u8 a3, u8 a4);
void sub_812A804(void);
bool32 sub_812A980(void);
bool32 sub_812A9C8(void);
void sub_812AA10(void);
void sub_812AA64(void);
void sub_812AA78(u16 a0, u8 *a1, u8 a2);
void sub_812AAD4(void);
void sub_812AB8C(void);
void sub_812ABD8(void);
void sub_812AC08(void);
void sub_812AC58(void);
void sub_812AC9C(void);
void sub_812ACC0(void);
void sub_812ACEC(void);
void sub_812AD04(void);
void sub_812AD20(void);
void sub_812AD50(void);
void sub_812ADA0(s16 a0);
void sub_812ADF8(s16 a0);

const u16 gUnknown_845AA24[] = INCBIN_U16("graphics/union_room_chat/unk_845AA24.gbapal");
const u16 gUnknown_845AA44[] = INCBIN_U16("graphics/union_room_chat/unk_845AA44.gbapal");
const u16 gUnknown_845AA64[] = INCBIN_U16("graphics/union_room_chat/unk_845AA64.gbapal");

const struct BgTemplate gUnknown_845AA84[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 7,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x0000
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x0000
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 23,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x0000
    }, {
        .bg = 3,
        .charBaseIndex = 1,
        .mapBaseIndex = 15,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x0001
    }
};

const struct WindowTemplate gUnknown_845AA94[] = {
    {
        .bg = 3,
        .tilemapLeft = 8,
        .tilemapTop = 1,
        .width = 21,
        .height = 19,
        .paletteNum = 15,
        .baseBlock = 0x001
    }, {
        .bg = 1,
        .tilemapLeft = 9,
        .tilemapTop = 18,
        .width = 15,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x07a
    }, {
        .bg = 1,
        .tilemapLeft = 0,
        .tilemapTop = 2,
        .width = 6,
        .height = 15,
        .paletteNum = 7,
        .baseBlock = 0x020
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 2,
        .width = 7,
        .height = 9,
        .paletteNum = 14,
        .baseBlock = 0x013
    }, DUMMY_WIN_TEMPLATE
};

const struct Unk845AABC gUnknown_845AABC[] = {
    { 0, sub_8129CA0},
    { 3, sub_8129D40},
    { 4, sub_8129D78},
    { 5, sub_8129DB0},
    { 1, sub_8129E1C},
    { 6, sub_8129E28},
    { 7, sub_8129E74},
    { 8, sub_8129EB8},
    { 9, sub_8129F24},
    {10, sub_8129FCC},
    {11, sub_812A074},
    {12, sub_812A0B0},
    { 2, sub_812A18C},
    {13, sub_812A1B8},
    {18, sub_812A1FC},
    {19, sub_812A240},
    {14, sub_812A294},
    {15, sub_812A2E4},
    {16, sub_812A334},
    {17, sub_812A378},
    {20, sub_812A3D0}
};

const struct Unk845AB64 gUnknown_845AB64[] = {
    {gText_QuitChatting, 1, 0, 0, 1, 2, 0, 0},
    {gText_RegisterTextWhere, 1, 0, 0, 1, 2, 0, 0},
    {gText_RegisterTextHere, 1, 0, 0, 1, 2, 0, 0},
    {gText_InputText, 1, 0, 0, 1, 2, 0, 0},
    {gText_ExitingTheChat, 2, 0, 0, 1, 2, 0, 0},
    {gText_LeaderHasLeftEndingChat, 2, 0, 0, 0, 2, 1, 0},
    {gText_RegisteredTextChanged_OKtoSave, 2, 0, 0, 1, 2, 0, 1},
    {gText_RegisteredTextChanged_AlreadySavedFile, 2, 0, 0, 1, 2, 0, 1},
    {gText_RegisteredTextChanged_SavingDontTurnOff, 2, 0, 0, 1, 2, 0, 1},
    {gText_RegisteredTextChanged_SavedTheGame, 2, 0, 0, 1, 2, 1, 1},
    {gText_IfLeaderLeavesChatWillEnd, 2, 0, 0, 1, 2, 0, 1}
};

const u8 gText_Ellipsis[] = _("…");

const struct MenuAction gUnknown_845ABEC[] = {
    {gText_Upper},
    {gText_Lower},
    {gText_Symbols},
    {gText_Register2},
    {gText_Exit}
};

bool8 sub_8129B14(void)
{
    gUnknown_203B0E4 = Alloc(sizeof(*gUnknown_203B0E4));
    if (gUnknown_203B0E4 && sub_812AE70())
    {
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, gUnknown_845AA84, NELEMS(gUnknown_845AA84));
        InitWindows(gUnknown_845AA94);
        ResetTempTileDataBuffers();
        sub_812AD50();
        sub_8129BB8(gUnknown_203B0E4);
        sub_8129BC4();
        sub_8129C34(0, 0);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool32 sub_8129B78(void)
{
    return sub_8129C8C(0);
}

void sub_8129B88(void)
{
    sub_812AEB0();
    if (gUnknown_203B0E4)
    FREE_AND_SET_NULL(gUnknown_203B0E4);

    FreeAllWindowBuffers();
    gScanlineEffect.state = 3;
}

void sub_8129BB8(struct UnionRoomChat2 *arg0)
{
    arg0->unk18 = 0xFF;
    arg0->unk1E = 0xFF;
    arg0->unk1A = 0;
}

void sub_8129BC4(void)
{
    int i;

    if (!gUnknown_203B0E4)
        return;

    for (i = 0; i < 3; i++)
    {
        gUnknown_203B0E4->unk0[i].unk0 = sub_812A420;
        gUnknown_203B0E4->unk0[i].unk4 = 0;
        gUnknown_203B0E4->unk0[i].unk5 = 0;
    }
}

void sub_8129BFC(void)
{
    int i;

    if (gUnknown_203B0E4 == NULL)
        return;

    for (i = 0; i < 3; i++)
    {
        if (gUnknown_203B0E4->unk0[i].unk4)
            gUnknown_203B0E4->unk0[i].unk4 = gUnknown_203B0E4->unk0[i].unk0(&gUnknown_203B0E4->unk0[i].unk5);
    }
}

void sub_8129C34(u16 arg0, u8 arg1)
{
    int i;

    gUnknown_203B0E4->unk0[arg1].unk0 = sub_812A420;
    for (i = 0; i < NELEMS(gUnknown_845AABC); i++)
    {
        if (gUnknown_845AABC[i].unk0 == arg0)
        {
            gUnknown_203B0E4->unk0[arg1].unk0 = gUnknown_845AABC[i].unk4;
            gUnknown_203B0E4->unk0[arg1].unk4 = 1;
            gUnknown_203B0E4->unk0[arg1].unk5 = 0;
            break;
        }
    }
}

bool8 sub_8129C8C(u8 arg0)
{
    return gUnknown_203B0E4->unk0[arg0].unk4;
}

bool32 sub_8129CA0(u8 *state)
{
    if (FreeTempTileDataBuffersIfPossible() == TRUE)
        return TRUE;

    switch (*state)
    {
    case 0:
        sub_812AAD4();
        sub_812AB8C();
        break;
    case 1:
        sub_812ABD8();
        break;
    case 2:
        sub_812AC08();
        break;
    case 3:
        sub_812AC58();
        break;
    case 4:
        sub_812AC9C();
        break;
    case 5:
        sub_812ACC0();
        sub_812ACEC();
        sub_812AD20();
        sub_812AD04();
        break;
    case 6:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_812AEC8();
            sub_812B048();
            sub_812B100();
        }
        break;
    default:
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

bool32 sub_8129D40(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812AA10();
        CopyWindowToVram(3, 3);
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    (*state)++;
    return TRUE;
}

bool32 sub_8129D78(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812AA64();
        CopyWindowToVram(3, 3);
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    (*state)++;
    return TRUE;
}

bool32 sub_8129DB0(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812AEFC(TRUE);
        if (sub_812A980())
            return TRUE;

        sub_812A804();
        CopyWindowToVram(2, 2);
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;
        break;
    case 2:
        if (sub_812A9C8())
            return TRUE;

        sub_812AF1C();
        sub_812AEFC(FALSE);
        sub_812B160();
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

bool32 sub_8129E1C(u8 *state)
{
    sub_812AF1C();
    return FALSE;
}

bool32 sub_8129E28(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812A578(0, 0);
        sub_812A424(23, 11, 1);
        CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    (*state)++;
    return TRUE;
}

bool32 sub_8129E74(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812A6F4();
        sub_812A51C();
        CopyBgTilemapBufferToVram(0);
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;

        sub_812A728();
        sub_812A544();
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

bool32 sub_8129EB8(u8 *state)
{
    u32 var0, var1;
    u8 *str;

    switch (*state)
    {
    case 0:
        sub_8129730(&var0, &var1);
        sub_812A74C(var0, var1, 0);
        str = sub_8129714();
        sub_812A778(0, str, 3, 1, 2);
        CopyWindowToVram(1, 2);
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_812B160();
            return FALSE;
        }
        return TRUE;
    }

    (*state)++;
    return TRUE;
}

bool32 sub_8129F24(u8 *state)
{
    u16 var0;
    u8 *str;
    u16 length;

    switch (*state)
    {
    case 0:
        var0 = sub_8129788();
        str = sub_8129758();
        length = StringLength_Multibyte(str);
        sub_812A74C(var0, length, PIXEL_FILL(6));
        sub_812A778(var0, str, 0, 4, 5);
        CopyWindowToVram(1, 2);
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_812A578(1, 16);
            CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        }
        else
        {
            return TRUE;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            sub_812AF8C(1);
        else
            return TRUE;
        break;
    case 3:
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

bool32 sub_8129FCC(u8 *state)
{
    u16 var0;
    u8 *str;
    u16 length;

    switch (*state)
    {
    case 0:
        var0 = sub_8129788();
        str = sub_8129758();
        length = StringLength_Multibyte(str);
        sub_812A74C(var0, length, PIXEL_FILL(0));
        sub_812A778(var0, str, 3, 1, 2);
        CopyWindowToVram(1, 2);
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_812A6F4();
            CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        }
        else
        {
            return TRUE;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_812AF8C(0);
            sub_812A728();
        }
        else
        {
            return TRUE;
        }
        break;
    case 3:
        return FALSE;
    }

    (*state)++;
    return TRUE;
}

bool32 sub_812A074(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812A804();
        CopyWindowToVram(2, 2);
        (*state)++;
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;
        else
            return FALSE;
    }

    return TRUE;
}

bool32 sub_812A0B0(u8 *state)
{
    u16 var0;
    u8 *str;
    u8 var1;

    switch (*state)
    {
    case 0:
        var0 = gUnknown_203B0E4->unk1A;
        str = sub_81297C4();
        var1 = sub_81297D0();
        sub_812AA78(var0, str, var1);
        CopyWindowToVram(0, 2);
        break;
    case 1:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;

        if (gUnknown_203B0E4->unk1A < 9)
        {
            gUnknown_203B0E4->unk1A++;
            *state = 4;
            return FALSE;
        }
        else
        {
            gUnknown_203B0E4->unk1C = 0;
            (*state)++;
        }
        // fall through
    case 2:
        ScrollWindow(0, 0, 5, PIXEL_FILL(1));
        CopyWindowToVram(0, 2);
        gUnknown_203B0E4->unk1C++;
        (*state)++;
        // fall through
    case 3:
        if (IsDma3ManagerBusyWithBgCopy())
            return TRUE;

        if (gUnknown_203B0E4->unk1C < 3)
        {
            (*state)--;
            return TRUE;
        }
        break;
    case 4:
        return FALSE;
    default:
        return TRUE;
    }

    (*state)++;
    return TRUE;
}

bool32 sub_812A18C(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812AFC0();
        (*state)++;
        break;
    case 1:
        return sub_812AFFC();
    }

    return TRUE;
}

bool32 sub_812A1B8(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812A578(3, 16);
        CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool32 sub_812A1FC(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812A578(4, 0);
        CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool32 sub_812A240(u8 *state)
{
    u8 *str;

    switch (*state)
    {
    case 0:
        DynamicPlaceholderTextUtil_Reset();
        str = sub_8129814();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, str);
        sub_812A578(5, 0);
        CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool32 sub_812A294(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812A578(6, 0);
        sub_812A424(23, 10, 1);
        CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool32 sub_812A2E4(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812A578(7, 0);
        sub_812A424(23, 10, 1);
        CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool32 sub_812A334(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812A578(8, 0);
        CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool32 sub_812A378(u8 *state)
{
    switch (*state)
    {
    case 0:
        DynamicPlaceholderTextUtil_Reset();
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, gSaveBlock2Ptr->playerName);
        sub_812A578(9, 0);
        CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool32 sub_812A3D0(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_812A578(10, 0);
        sub_812A424(23, 10, 1);
        CopyWindowToVram(gUnknown_203B0E4->unk1E, 3);
        (*state)++;
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

bool32 sub_812A420(u8 *arg0)
{
    return FALSE;
}

void sub_812A424(u8 left, u8 top, u8 initialCursorPos)
{
    struct WindowTemplate template;
    template.bg = 0;
    template.tilemapLeft = left;
    template.tilemapTop = top;
    template.width = 6;
    template.height = 4;
    template.paletteNum = 14;
    template.baseBlock = 0x52;
    gUnknown_203B0E4->unk18 = AddWindow(&template);
    if (gUnknown_203B0E4->unk18 != 0xFF)
    {
        FillWindowPixelBuffer(gUnknown_203B0E4->unk18, PIXEL_FILL(1));
        PutWindowTilemap(gUnknown_203B0E4->unk18);
        AddTextPrinterParameterized(gUnknown_203B0E4->unk18, 2, gText_Yes, 8, 2, TEXT_SPEED_FF, NULL);
        AddTextPrinterParameterized(gUnknown_203B0E4->unk18, 2, gText_No, 8, 16, TEXT_SPEED_FF, NULL);
        DrawTextBorderOuter(gUnknown_203B0E4->unk18, 1, 13);
        Menu_InitCursor(gUnknown_203B0E4->unk18, 2, 0, 2, 14, 2, initialCursorPos);
    }
}

void sub_812A51C(void)
{
    if (gUnknown_203B0E4->unk18 != 0xFF)
    {
        ClearStdWindowAndFrameToTransparent(gUnknown_203B0E4->unk18, FALSE);
        ClearWindowTilemap(gUnknown_203B0E4->unk18);
    }
}

void sub_812A544(void)
{
    if (gUnknown_203B0E4->unk18 != 0xFF)
    {
        RemoveWindow(gUnknown_203B0E4->unk18);
        gUnknown_203B0E4->unk18 = 0xFF;
    }
}

s8 sub_812A568(void)
{
    return Menu_ProcessInput();
}

void sub_812A578(int arg0, u16 arg1)
{
    const u8 *str;
    int windowId;
    struct WindowTemplate template;
    template.bg = 0;
    template.tilemapLeft = 8;
    template.tilemapTop = 16;
    template.width = 21;
    template.height = 4;
    template.paletteNum = 14;
    template.baseBlock = 0x06A;
    if (gUnknown_845AB64[arg0].unkA)
    {
        template.tilemapLeft -= 7;
        template.width += 7;
    }

    gUnknown_203B0E4->unk1E = AddWindow(&template);
    windowId = gUnknown_203B0E4->unk1E;
    if (gUnknown_203B0E4->unk1E == 0xFF)
        return;

    if (gUnknown_845AB64[arg0].unk9)
    {
        DynamicPlaceholderTextUtil_ExpandPlaceholders(gUnknown_203B0E4->unk22, gUnknown_845AB64[arg0].unk0);
        str = gUnknown_203B0E4->unk22;
    }
    else
    {
        str = gUnknown_845AB64[arg0].unk0;
    }

    ChangeBgY(0, arg1 * 256, 0);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    PutWindowTilemap(windowId);
    if (gUnknown_845AB64[arg0].unk4 == 1)
    {
        DrawTextBorderInner(windowId, 0xA, 2);
        AddTextPrinterParameterized5(
            windowId,
            2,
            str,
            gUnknown_845AB64[arg0].unk5 + 8,
            gUnknown_845AB64[arg0].unk6 + 8,
            TEXT_SPEED_FF,
            NULL,
            gUnknown_845AB64[arg0].unk7,
            gUnknown_845AB64[arg0].unk8);
    }
    else
    {
        DrawTextBorderOuter(windowId, 0xA, 2);
        AddTextPrinterParameterized5(
            windowId,
            2,
            str,
            gUnknown_845AB64[arg0].unk5,
            gUnknown_845AB64[arg0].unk6,
            TEXT_SPEED_FF,
            NULL,
            gUnknown_845AB64[arg0].unk7,
            gUnknown_845AB64[arg0].unk8);
    }

    gUnknown_203B0E4->unk1E = windowId;
}

void sub_812A6F4(void)
{
    if (gUnknown_203B0E4->unk1E != 0xFF)
    {
        ClearStdWindowAndFrameToTransparent(gUnknown_203B0E4->unk1E, FALSE);
        ClearWindowTilemap(gUnknown_203B0E4->unk1E);
    }

    ChangeBgY(0, 0, 0);
}

void sub_812A728(void)
{
    if (gUnknown_203B0E4->unk1E != 0xFF)
    {
        RemoveWindow(gUnknown_203B0E4->unk1E);
        gUnknown_203B0E4->unk1E = 0xFF;
    }
}

void sub_812A74C(u16 x, u16 width, u8 fillValue)
{
    FillWindowPixelRect(1, fillValue, x * 8, 1, width * 8, 14);
}

void sub_812A778(u16 x, u8 *str, u8 fillValue, u8 arg3, u8 arg4)
{
    u8 *str2;
    u8 sp[38];
    if (fillValue)
        sub_812A74C(x, sub_81297DC() - x, fillValue);

    sp[0] = fillValue;
    sp[1] = arg3;
    sp[2] = arg4;
    str2 = &sp[4];
    str2[0] = EXT_CTRL_CODE_BEGIN;
    str2[1] = EXT_CTRL_CODE_MIN_LETTER_SPACING;
    str2[2] = 8;
    StringCopy(&str2[3], str);
    AddTextPrinterParameterized3(1, 2, x * 8, 1, sp, TEXT_SPEED_FF, str2);
}

void sub_812A804(void)
{
    u8 page;
    int i;
    int var1;
    u16 left;
    u16 top;
    u8 sp[52];
    u8 *str;
    u8 *str2;

    FillWindowPixelBuffer(2, PIXEL_FILL(15));
    page = GetCurrentKeyboardPage();
    sp[0] = 0;
    sp[1] = 14;
    sp[2] = 13;
    if (page != UNION_ROOM_KB_PAGE_COUNT)
    {
        str = &sp[4];
        str[0] = EXT_CTRL_CODE_BEGIN;
        str[1] = EXT_CTRL_CODE_MIN_LETTER_SPACING;
        var1 = 8;
        str[2] = var1;
        left = var1;
        if (page == UNION_ROOM_KB_PAGE_EMOJI)
            left = 6;

        for (i = 0, top = 0; i < UNION_ROOM_KB_ROW_COUNT; i++, top += 12)
        {
            if (!gUnionRoomKeyboardText[page][i])
                return;

            StringCopy(&sp[7], gUnionRoomKeyboardText[page][i]);
            AddTextPrinterParameterized3(2, 0, left, top, sp, TEXT_SPEED_FF, &sp[4]);
        }
    }
    else
    {
        left = 4;
        for (i = 0, top = 0; i < 10; i++, top += 12)
        {
            str2 = sub_81294B0(i);
            if (GetStringWidth(0, str2, 0) <= 40)
            {
                AddTextPrinterParameterized3(2, 0, left, top, sp, TEXT_SPEED_FF, str2);
            }
            else
            {
                int length = StringLength_Multibyte(str2);
                do
                {
                    length--;
                    StringCopyN_Multibyte(&sp[4], str2, length);
                } while (GetStringWidth(0, &sp[4], 0) > 35);

                AddTextPrinterParameterized3(2, 0, left, top, sp, TEXT_SPEED_FF, &sp[4]);
                AddTextPrinterParameterized3(2, 0, left + 35, top, sp, TEXT_SPEED_FF, gText_Ellipsis);
            }
        }
    }
}

bool32 sub_812A980(void)
{
    if (gUnknown_203B0E4->unk20 < 56)
    {
        gUnknown_203B0E4->unk20 += 12;
        if (gUnknown_203B0E4->unk20 >= 56)
            gUnknown_203B0E4->unk20 = 56;

        if (gUnknown_203B0E4->unk20 < 56)
        {
            sub_812ADA0(gUnknown_203B0E4->unk20);
            return TRUE;
        }
    }

    sub_812ADF8(gUnknown_203B0E4->unk20);
    return FALSE;
}

bool32 sub_812A9C8(void)
{
    if (gUnknown_203B0E4->unk20 > 0)
    {
        gUnknown_203B0E4->unk20 -= 12;
        if (gUnknown_203B0E4->unk20 <= 0)
            gUnknown_203B0E4->unk20 = 0;

        if (gUnknown_203B0E4->unk20 > 0)
        {
            sub_812ADA0(gUnknown_203B0E4->unk20);
            return TRUE;
        }
    }

    sub_812ADF8(gUnknown_203B0E4->unk20);
    return FALSE;
}

void sub_812AA10(void)
{
    FillWindowPixelBuffer(3, PIXEL_FILL(1));
    DrawTextBorderOuter(3, 1, 13);
    UnionRoomAndTradeMenuPrintOptions(3, 2, 14, 5, gUnknown_845ABEC);
    Menu_InitCursor(3, 2, 0, 0, 14, 5, GetCurrentKeyboardPage());
    PutWindowTilemap(3);
}

void sub_812AA64(void)
{
    ClearStdWindowAndFrameToTransparent(3, FALSE);
    ClearWindowTilemap(3);
}

void sub_812AA78(u16 row, u8 *str, u8 arg2)
{
    u8 color[3];
    color[0] = 1;
    color[1] = arg2 * 2 + 2;
    color[2] = arg2 * 2 + 3;
    FillWindowPixelRect(0, PIXEL_FILL(1), 0, row * 15, 168, 15);
    AddTextPrinterParameterized3(0, 2, 0, row * 15, color, TEXT_SPEED_FF, str);
}

void sub_812AAD4(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(64, 240));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 144));
    SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG0 | WININ_WIN0_BG2 | WININ_WIN0_BG3
                                | WININ_WIN0_OBJ | WININ_WIN0_CLR);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR);
}

void sub_812AB8C(void)
{
    SetBgTilemapBuffer(0, gUnknown_203B0E4->unk128);
    SetBgTilemapBuffer(1, gUnknown_203B0E4->unk928);
    SetBgTilemapBuffer(3, gUnknown_203B0E4->unk1128);
    SetBgTilemapBuffer(2, gUnknown_203B0E4->unk1928);
}

void sub_812ABD8(void)
{
    RequestDma3Fill(0, (void *)BG_CHAR_ADDR(0), 0x20, 1);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
    CopyBgTilemapBufferToVram(0);
}

void sub_812AC08(void)
{
    LoadPalette(gUnknown_8EAA9F0, 0x70, 0x20);
    LoadPalette(gUnknown_845AA24, 0xC0, 0x20);
    DecompressAndCopyTileDataToVram(1, gUnknown_8EAAA10, 0, 0, 0);
    CopyToBgTilemapBuffer(1, gUnknown_8EAAA6C, 0, 0);
    CopyBgTilemapBufferToVram(1);
}

void sub_812AC58(void)
{
    u8 *ptr;

    LoadPalette(gLinkMiscMenu_Pal, 0, 0x20);
    ptr = DecompressAndCopyTileDataToVram(2, gLinkMiscMenu_Gfx, 0, 0, 0);
    CopyToBgTilemapBuffer(2, gLinkMiscMenu_Tilemap, 0, 0);
    CopyBgTilemapBufferToVram(2);
}

void sub_812AC9C(void)
{
    LoadPalette(gUnknown_845AA44, 0x80, 0x20);
    RequestDma3Fill(0, (void *)BG_CHAR_ADDR(1) + 0x20, 0x20, 1);
}

void sub_812ACC0(void)
{
    LoadPalette(gUnknown_845AA64, 0xF0, 0x20);
    PutWindowTilemap(0);
    FillWindowPixelBuffer(0, PIXEL_FILL(1));
    CopyWindowToVram(0, 3);
}

void sub_812ACEC(void)
{
    PutWindowTilemap(2);
    sub_812A804();
    CopyWindowToVram(2, 3);
}

void sub_812AD04(void)
{
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    PutWindowTilemap(1);
    CopyWindowToVram(1, 3);
}

void sub_812AD20(void)
{
    FillWindowPixelBuffer(3, PIXEL_FILL(1));
    TextWindow_SetUserSelectedFrame(3, 1, 0xD0);
    TextWindow_SetStdFrame0_WithPal(3, 0xA, 0x20);
    LoadPalette(gTMCaseMainWindowPalette, 0xE0,  0x20);
}

void sub_812AD50(void)
{
    struct ScanlineEffectParams params;
    params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    params.dmaDest = &REG_BG1HOFS;
    params.initState = 1;
    params.unused9 = 0;
    gUnknown_203B0E4->unk20 = 0;
    CpuFastFill(0, gScanlineEffectRegBuffers, sizeof(gScanlineEffectRegBuffers));
    ScanlineEffect_SetParams(params);
}

void sub_812ADA0(s16 arg0)
{
    CpuFill16(arg0, gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer], 0x120);
    CpuFill16(0, gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer] + 0x90, 0x20);
}

void sub_812ADF8(s16 arg0)
{
    CpuFill16(arg0, gScanlineEffectRegBuffers[0],         0x120);
    CpuFill16(0,    gScanlineEffectRegBuffers[0] +  0x90, 0x20);
    CpuFill16(arg0, gScanlineEffectRegBuffers[0] + 0x3C0, 0x120);
    CpuFill16(0,    gScanlineEffectRegBuffers[0] + 0x450, 0x20);
}
