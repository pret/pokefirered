#include "global.h"
#include "gflib.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
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
