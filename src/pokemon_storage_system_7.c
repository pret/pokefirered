#include <stdlib.h> // to declare abs
#include "global.h"
#include "gflib.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system_internal.h"
#include "text_window.h"

struct MoveMons
{
    u8 field_0;
    u8 state;
    u8 fromRow;
    u8 fromColumn;
    u8 toRow;
    u8 toColumn;
    u8 field_6;
    u8 field_7;
    u8 minRow;
    u8 minColumn;
    u8 rowsTotal;
    u8 columsTotal;
    u16 bgX;
    u16 bgY;
    u16 field_10;
    struct BoxPokemon boxMons[IN_BOX_COUNT];
};

static EWRAM_DATA struct MoveMons *sMoveMonsPtr = NULL;

static bool8 sub_8095138(void);
static bool8 sub_8095234(void);
static bool8 sub_80952A0(void);
static bool8 sub_8095314(void);
static bool8 sub_8095394(void);
static bool8 sub_80953BC(void);
static void sub_8095520(void);
static void sub_80955C4(u8 arg0, u8 arg1, u8 arg2);
static void sub_80955FC(u8 arg0, u8 arg1, u8 arg2);
static void sub_8095634(u8 arg0, u8 arg1, u8 arg2);
static void sub_809566C(u8 arg0, u8 arg1, u8 arg2);
static void sub_80956A4(u8 x, u8 y);
static void sub_809572C(u8 x, u8 y);
static void sub_8095780(u16 bgX, u16 bgY, u16 duration);
static u8 sub_8095790(void);
static void sub_80957C8(void);
static void sub_80958A0(void);
static void sub_8095918(void);
static void sub_80959A8(void);
static void sub_8095A58(void);

static const struct WindowTemplate gUnknown_83D35D4 = {
    .bg = 0,
    .tilemapLeft = 10,
    .tilemapTop = 3,
    .width = 20,
    .height = 18,
    .paletteNum = 9,
    .baseBlock = 0x00a
};

bool8 sub_8095050(void)
{
    sMoveMonsPtr = Alloc(sizeof(*sMoveMonsPtr));
    if (sMoveMonsPtr != NULL)
    {
        gPSSData->field_2200 = AddWindow8Bit(&gUnknown_83D35D4);
        if (gPSSData->field_2200 != 0xFF)
        {
            FillWindowPixelBuffer(gPSSData->field_2200, PIXEL_FILL(0));
            return TRUE;
        }
    }

    return FALSE;
}

void sub_80950A4(void)
{
    if (sMoveMonsPtr != NULL)
        Free(sMoveMonsPtr);
}

void sub_80950BC(u8 arg0)
{
    sMoveMonsPtr->field_0 = arg0;
    sMoveMonsPtr->state = 0;
}

bool8 sub_80950D0(void)
{
    switch (sMoveMonsPtr->field_0)
    {
    case 0:
        return sub_8095138();
    case 1:
        return sub_8095234();
    case 2:
        return sub_80952A0();
    case 3:
        return sub_8095314();
    case 4:
        return sub_8095394();
    case 5:
        return sub_80953BC();
    }

    return FALSE;
}

static bool8 sub_8095138(void)
{
    switch (sMoveMonsPtr->state)
    {
    case 0:
        HideBg(0);
        LoadMonIconPalettesAt(0x80);
        sMoveMonsPtr->state++;
        break;
    case 1:
        sub_8094CD4(&sMoveMonsPtr->fromRow, &sMoveMonsPtr->fromColumn);
        sMoveMonsPtr->toRow = sMoveMonsPtr->fromRow;
        sMoveMonsPtr->toColumn = sMoveMonsPtr->fromColumn;
        ChangeBgX(0, -1024, 0);
        ChangeBgY(0, -1024, 0);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 0x20, 0x20);
        FillWindowPixelBuffer8Bit(gPSSData->field_2200, PIXEL_FILL(0));
        sub_80956A4(sMoveMonsPtr->fromRow, sMoveMonsPtr->fromColumn);
        SetBgAttribute(0, BG_ATTR_PALETTEMODE, 1);
        PutWindowTilemap(gPSSData->field_2200);
        CopyWindowToVram8Bit(gPSSData->field_2200, COPYWIN_FULL);
        BlendPalettes(0x3F00, 8, RGB_WHITE);
        sub_8094D14(2);
        SetGpuRegBits(REG_OFFSET_BG0CNT, BGCNT_256COLOR);
        sMoveMonsPtr->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 sub_8095234(void)
{
    switch (sMoveMonsPtr->state)
    {
    case 0:
        HideBg(0);
        sMoveMonsPtr->state++;
        break;
    case 1:
        sub_8095A58();
        sub_8094D14(0);
        sMoveMonsPtr->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            sub_8094D40();
            LoadPalette(stdpal_get(3), 0xD0, 0x20);
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 sub_80952A0(void)
{
    switch (sMoveMonsPtr->state)
    {
    case 0:
        if (!sub_80924A8())
        {
            sub_8094CD4(&sMoveMonsPtr->field_6, &sMoveMonsPtr->field_7);
            sub_8095520();
            sMoveMonsPtr->toRow = sMoveMonsPtr->field_6;
            sMoveMonsPtr->toColumn = sMoveMonsPtr->field_7;
            CopyWindowToVram8Bit(gPSSData->field_2200, COPYWIN_GFX);
            sMoveMonsPtr->state++;
        }
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 sub_8095314(void)
{
    u8 var1, var2;

    switch (sMoveMonsPtr->state)
    {
    case 0:
        sub_80957C8();
        sub_80958A0();
        sub_8092BAC(FALSE);
        sMoveMonsPtr->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            sub_8094D14(3);
            sub_8095780(0, 256, 8);
            sub_8092BAC(TRUE);
            sMoveMonsPtr->state++;
        }
        break;
    case 2:
        var1 = sub_8095790();
        var2 = DoMonPlaceChange();
        if (!var1 && !var2)
            return FALSE;
        break;
    }

    return TRUE;
}

static bool8 sub_8095394(void)
{
    u8 var1 = sub_80924A8();
    u8 var2 = sub_8095790();

    if (!var1 && !var2)
        return FALSE;
    else
        return TRUE;
}

static bool8 sub_80953BC(void)
{
    switch (sMoveMonsPtr->state)
    {
    case 0:
        sub_80959A8();
        sub_8095780(0, -256, 8);
        sub_8092BAC(FALSE);
        sMoveMonsPtr->state++;
        break;
    case 1:
        if (!DoMonPlaceChange() && !sub_8095790())
        {
            sub_8095918();
            sub_8094D14(2);
            sub_8092BAC(TRUE);
            HideBg(0);
            sMoveMonsPtr->state++;
        }
        break;
    case 2:
        if (!DoMonPlaceChange())
        {
            sub_8094D14(0);
            sub_8095A58();
            sMoveMonsPtr->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            LoadPalette(stdpal_get(3), 0xD0, 0x20);
            sub_8094D40();
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

bool8 sub_8095474(u8 arg0)
{
    switch (arg0)
    {
    case 0: // up
        if (sMoveMonsPtr->minColumn == 0)
            return FALSE;
        sMoveMonsPtr->minColumn--;
        sub_8095780(0, 1024, 6);
        break;
    case 1: // down
        if (sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal >= 5)
            return FALSE;
        sMoveMonsPtr->minColumn++;
        sub_8095780(0, -1024, 6);
        break;
    case 2: // left
        if (sMoveMonsPtr->minRow == 0)
            return FALSE;
        sMoveMonsPtr->minRow--;
        sub_8095780(1024, 0, 6);
        break;
    case 3: // right
        if (sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal > 5)
            return FALSE;
        sMoveMonsPtr->minRow++;
        sub_8095780(-1024, 0, 6);
        break;
    }

    return TRUE;
}

static void sub_8095520(void)
{
    s16 var = (abs(sMoveMonsPtr->fromRow - sMoveMonsPtr->field_6)) - (abs(sMoveMonsPtr->fromRow - sMoveMonsPtr->toRow));
    s16 var2 = (abs(sMoveMonsPtr->fromColumn - sMoveMonsPtr->field_7)) - (abs(sMoveMonsPtr->fromColumn - sMoveMonsPtr->toColumn));

    if (var > 0)
        sub_80955C4(sMoveMonsPtr->field_6, sMoveMonsPtr->fromColumn, sMoveMonsPtr->toColumn);

    if (var < 0)
    {
        sub_8095634(sMoveMonsPtr->toRow, sMoveMonsPtr->fromColumn, sMoveMonsPtr->toColumn);
        sub_80955C4(sMoveMonsPtr->field_6, sMoveMonsPtr->fromColumn, sMoveMonsPtr->toColumn);
    }

    if (var2 > 0)
        sub_80955FC(sMoveMonsPtr->field_7, sMoveMonsPtr->fromRow, sMoveMonsPtr->toRow);

    if (var2 < 0)
    {
        sub_809566C(sMoveMonsPtr->toColumn, sMoveMonsPtr->fromRow, sMoveMonsPtr->toRow);
        sub_80955FC(sMoveMonsPtr->field_7, sMoveMonsPtr->fromRow, sMoveMonsPtr->toRow);
    }
}

static void sub_80955C4(u8 arg0, u8 arg1, u8 arg2)
{
    u8 var1 = arg1;

    if (arg1 > arg2)
    {
        arg1 = arg2;
        arg2 = var1;
    }

    while (arg1 <= arg2)
        sub_80956A4(arg0, arg1++);
}

static void sub_80955FC(u8 arg0, u8 arg1, u8 arg2)
{
    u8 var1 = arg1;

    if (arg1 > arg2)
    {
        arg1 = arg2;
        arg2 = var1;
    }

    while (arg1 <= arg2)
        sub_80956A4(arg1++, arg0);
}

static void sub_8095634(u8 arg0, u8 arg1, u8 arg2)
{
    u8 var1 = arg1;

    if (arg1 > arg2)
    {
        arg1 = arg2;
        arg2 = var1;
    }

    while (arg1 <= arg2)
        sub_809572C(arg0, arg1++);
}

static void sub_809566C(u8 arg0, u8 arg1, u8 arg2)
{
    u8 var1 = arg1;

    if (arg1 > arg2)
    {
        arg1 = arg2;
        arg2 = var1;
    }

    while (arg1 <= arg2)
        sub_809572C(arg1++, arg0);
}

static void sub_80956A4(u8 x, u8 y)
{
    u8 position = x + (IN_BOX_ROWS * y);
    u16 species = GetCurrentBoxMonData(position, MON_DATA_SPECIES2);
    u32 personality = GetCurrentBoxMonData(position, MON_DATA_PERSONALITY);

    if (species != SPECIES_NONE)
    {
        const u8 *iconGfx = GetMonIconPtr(species, personality, 1);
        u8 index = GetValidMonIconPalIndex(species) + 8;

        BlitBitmapRectToWindow4BitTo8Bit(gPSSData->field_2200,
                                         iconGfx,
                                         0,
                                         0,
                                         32,
                                         32,
                                         24 * x,
                                         24 * y,
                                         32,
                                         32,
                                         index);
    }
}

static void sub_809572C(u8 x, u8 y)
{
    u8 position = x + (IN_BOX_ROWS * y);
    u16 species = GetCurrentBoxMonData(position, MON_DATA_SPECIES2);

    if (species != SPECIES_NONE)
    {
        FillWindowPixelRect8Bit(gPSSData->field_2200,
                                PIXEL_FILL(0),
                                24 * x,
                                24 * y,
                                32,
                                32);
    }
}

static void sub_8095780(u16 bgX, u16 bgY, u16 duration)
{
    sMoveMonsPtr->bgX = bgX;
    sMoveMonsPtr->bgY = bgY;
    sMoveMonsPtr->field_10 = duration;
}

static u8 sub_8095790(void)
{
    if (sMoveMonsPtr->field_10 != 0)
    {
        ChangeBgX(0, sMoveMonsPtr->bgX, 1);
        ChangeBgY(0, sMoveMonsPtr->bgY, 1);
        sMoveMonsPtr->field_10--;
    }

    return sMoveMonsPtr->field_10;
}

static void sub_80957C8(void)
{
    s32 i, j;
    s32 rowCount, columnCount;
    u8 boxId;
    u8 monArrayId;

    sMoveMonsPtr->minRow = min(sMoveMonsPtr->fromRow, sMoveMonsPtr->toRow);
    sMoveMonsPtr->minColumn = min(sMoveMonsPtr->fromColumn, sMoveMonsPtr->toColumn);
    sMoveMonsPtr->rowsTotal = abs(sMoveMonsPtr->fromRow - sMoveMonsPtr->toRow) + 1;
    sMoveMonsPtr->columsTotal = abs(sMoveMonsPtr->fromColumn - sMoveMonsPtr->toColumn) + 1;
    boxId = StorageGetCurrentBox();
    monArrayId = 0;
    rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_ROWS * i) + sMoveMonsPtr->minRow;
        for (j = sMoveMonsPtr->minRow; j < rowCount; j++)
        {
            struct BoxPokemon *boxMon = GetBoxedMonPtr(boxId, boxPosition);
            // UB: possible null dereference
#ifdef UBFIX
            if (boxMon != NULL)
                sMoveMonsPtr->boxMons[monArrayId] = *boxMon;
#else
            sMoveMonsPtr->boxMons[monArrayId] = *boxMon;
#endif
            monArrayId++;
            boxPosition++;
        }
    }
}

static void sub_80958A0(void)
{
    s32 i, j;
    s32 rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    s32 columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    u8 boxId = StorageGetCurrentBox();

    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_ROWS * i) + sMoveMonsPtr->minRow;
        for (j = sMoveMonsPtr->minRow; j < rowCount; j++)
        {
            DestroyBoxMonIconAtPosition(boxPosition);
            ZeroBoxMonAt(boxId, boxPosition);
            boxPosition++;
        }
    }
}

static void sub_8095918(void)
{
    s32 i, j;
    s32 rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    s32 columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    u8 monArrayId = 0;

    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_ROWS * i) + sMoveMonsPtr->minRow;
        for (j = sMoveMonsPtr->minRow; j < rowCount; j++)
        {
            if (GetBoxMonData(&sMoveMonsPtr->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES))
                sub_80901EC(boxPosition);
            monArrayId++;
            boxPosition++;
        }
    }
}

static void sub_80959A8(void)
{
    s32 i, j;
    s32 rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    s32 columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    u8 boxId = StorageGetCurrentBox();
    u8 monArrayId = 0;

    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_ROWS * i) + sMoveMonsPtr->minRow;
        for (j = sMoveMonsPtr->minRow; j < rowCount; j++)
        {
            if (GetBoxMonData(&sMoveMonsPtr->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES))
                SetBoxMonAt(boxId, boxPosition, &sMoveMonsPtr->boxMons[monArrayId]);
            boxPosition++;
            monArrayId++;
        }
    }
}

static void sub_8095A58(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    SetBgAttribute(0, BG_ATTR_PALETTEMODE, 0);
    ClearGpuRegBits(REG_OFFSET_BG0CNT, BGCNT_256COLOR);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
    CopyBgTilemapBufferToVram(0);
}

u8 sub_8095AA0(void)
{
    return (IN_BOX_ROWS * sMoveMonsPtr->fromColumn) + sMoveMonsPtr->fromRow;
}

bool8 sub_8095ABC(void)
{
    s32 i, j;
    s32 rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    s32 columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    u8 monArrayId = 0;

    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_ROWS * i) + sMoveMonsPtr->minRow;
        for (j = sMoveMonsPtr->minRow; j < rowCount; j++)
        {
            if (GetBoxMonData(&sMoveMonsPtr->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES)
                && GetCurrentBoxMonData(boxPosition, MON_DATA_SANITY_HAS_SPECIES))
                return FALSE;

            monArrayId++;
            boxPosition++;
        }
    }

    return TRUE;
}
