#include <stdlib.h> // to declare abs
#include "global.h"
#include "gflib.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system_internal.h"
#include "text_window.h"

struct MoveMons
{
    u8 funcId;
    u8 state;
    u8 fromRow;
    u8 fromColumn;
    u8 toColumn;
    u8 toRow;
    u8 cursorColumn;
    u8 cursorRow;
    u8 minRow;
    u8 minColumn;
    u8 rowsTotal;
    u8 columsTotal;
    u16 bgX;
    u16 bgY;
    u16 bgMoveSteps;
    struct BoxPokemon boxMons[IN_BOX_COUNT];
};

static EWRAM_DATA struct MoveMons *sMoveMonsPtr = NULL;

static bool8 MultiMove_Start(void);
static bool8 MultiMove_Cancel(void);
static bool8 MultiMove_ChangeSelection(void);
static bool8 MultiMove_GrabSelection(void);
static bool8 MultiMove_MoveMons(void);
static bool8 MultiMove_PlaceMons(void);
static void MultiMove_UpdateSelectedIcons(void);
static void MultiMove_SelectColumn(u8 x, u8 y1, u8 y2);
static void MultiMove_SelectRow(u8 y, u8 x1, u8 x2);
static void MultiMove_DeselectColumn(u8 x, u8 y1, u8 y2);
static void MultiMove_DeselectRow(u8 y, u8 x1, u8 x2);
static void MultiMove_SetIconToBg(u8 x, u8 y);
static void MultiMove_ClearIconFromBg(u8 x, u8 y);
static void MultiMove_InitMove(u16 bgX, u16 bgY, u16 duration);
static u8 MultiMove_UpdateMove(void);
static void MultiMove_GetMonsFromSelection(void);
static void MultiMove_RemoveMonsFromBox(void);
static void MultiMove_CreatePlacedMonIcons(void);
static void MultiMove_SetPlacedMonData(void);
static void MultiMove_ResetBg(void);

//------------------------------------------------------------------------------
//  SECTION: MultiMove
//
//  The functions below handle moving and selecting multiple Pokémon at once.
//  The icon sprites are moved to bg 0, and this bg is manipulated to move
//  them as a group.
//------------------------------------------------------------------------------

static const struct WindowTemplate sWindowTemplate_MultiMove = {
    .bg = 0,
    .tilemapLeft = 10,
    .tilemapTop = 3,
    .width = 20,
    .height = 18,
    .paletteNum = 9,
    .baseBlock = 0x00a
};

bool8 MultiMove_Init(void)
{
    sMoveMonsPtr = Alloc(sizeof(*sMoveMonsPtr));
    if (sMoveMonsPtr != NULL)
    {
        sStorage->multiMoveWindowId = AddWindow8Bit(&sWindowTemplate_MultiMove);
        if (sStorage->multiMoveWindowId != 0xFF)
        {
            FillWindowPixelBuffer(sStorage->multiMoveWindowId, PIXEL_FILL(0));
            return TRUE;
        }
    }

    return FALSE;
}

void MultiMove_Free(void)
{
    if (sMoveMonsPtr != NULL)
        Free(sMoveMonsPtr);
}

void MultiMove_SetFunction(u8 action)
{
    sMoveMonsPtr->funcId = action;
    sMoveMonsPtr->state = 0;
}

bool8 MultiMove_RunFunction(void)
{
    switch (sMoveMonsPtr->funcId)
    {
    case MULTIMOVE_START:
        return MultiMove_Start();
    case MULTIMOVE_CANCEL:
        return MultiMove_Cancel();
    case MULTIMOVE_CHANGE_SELECTION:
        return MultiMove_ChangeSelection();
    case MULTIMOVE_GRAB_SELECTION:
        return MultiMove_GrabSelection();
    case MULTIMOVE_MOVE_MONS:
        return MultiMove_MoveMons();
    case MULTIMOVE_PLACE_MONS:
        return MultiMove_PlaceMons();
    }

    return FALSE;
}

static bool8 MultiMove_Start(void)
{
    switch (sMoveMonsPtr->state)
    {
    case 0:
        HideBg(0);
        LoadMonIconPalettesAt(0x80);
        sMoveMonsPtr->state++;
        break;
    case 1:
        GetCursorBoxColumnAndRow(&sMoveMonsPtr->fromRow, &sMoveMonsPtr->fromColumn);
        sMoveMonsPtr->toColumn = sMoveMonsPtr->fromRow;
        sMoveMonsPtr->toRow = sMoveMonsPtr->fromColumn;
        ChangeBgX(0, -1024, 0);
        ChangeBgY(0, -1024, 0);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 0x20, 0x20);
        FillWindowPixelBuffer8Bit(sStorage->multiMoveWindowId, PIXEL_FILL(0));
        MultiMove_SetIconToBg(sMoveMonsPtr->fromRow, sMoveMonsPtr->fromColumn);
        SetBgAttribute(0, BG_ATTR_PALETTEMODE, 1);
        PutWindowTilemap(sStorage->multiMoveWindowId);
        CopyWindowToVram8Bit(sStorage->multiMoveWindowId, COPYWIN_BOTH);
        BlendPalettes(0x3F00, 8, RGB_WHITE);
        StartCursorAnim(2);
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

static bool8 MultiMove_Cancel(void)
{
    switch (sMoveMonsPtr->state)
    {
    case 0:
        HideBg(0);
        sMoveMonsPtr->state++;
        break;
    case 1:
        MultiMove_ResetBg();
        StartCursorAnim(0);
        sMoveMonsPtr->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            SetCursorPriorityTo1();
            LoadPalette(stdpal_get(3), 0xD0, 0x20);
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static bool8 MultiMove_ChangeSelection(void)
{
    switch (sMoveMonsPtr->state)
    {
    case 0:
        if (!UpdateCursorPos())
        {
            GetCursorBoxColumnAndRow(&sMoveMonsPtr->cursorColumn, &sMoveMonsPtr->cursorRow);
            MultiMove_UpdateSelectedIcons();
            sMoveMonsPtr->toColumn = sMoveMonsPtr->cursorColumn;
            sMoveMonsPtr->toRow = sMoveMonsPtr->cursorRow;
            CopyWindowToVram8Bit(sStorage->multiMoveWindowId, COPYWIN_GFX);
            sMoveMonsPtr->state++;
        }
        break;
    case 1:
        return IsDma3ManagerBusyWithBgCopy();
    }

    return TRUE;
}

static bool8 MultiMove_GrabSelection(void)
{
    u8 movingBg, movingMon;

    switch (sMoveMonsPtr->state)
    {
    case 0:
        MultiMove_GetMonsFromSelection();
        MultiMove_RemoveMonsFromBox();
        InitMultiMonPlaceChange(FALSE);
        sMoveMonsPtr->state++;
        break;
    case 1:
        if (!DoMonPlaceChange())
        {
            StartCursorAnim(3);
            MultiMove_InitMove(0, 256, 8);
            InitMultiMonPlaceChange(TRUE);
            sMoveMonsPtr->state++;
        }
        break;
    case 2:
        movingBg = MultiMove_UpdateMove();
        movingMon = DoMonPlaceChange();
        if (!movingBg && !movingMon)
            return FALSE;
        break;
    }

    return TRUE;
}

static bool8 MultiMove_MoveMons(void)
{
    u8 movingCursor = UpdateCursorPos();
    u8 movingBg = MultiMove_UpdateMove();

    if (!movingCursor && !movingBg)
        return FALSE;
    else
        return TRUE;
}

static bool8 MultiMove_PlaceMons(void)
{
    switch (sMoveMonsPtr->state)
    {
    case 0:
        MultiMove_SetPlacedMonData();
        MultiMove_InitMove(0, -256, 8);
        InitMultiMonPlaceChange(FALSE);
        sMoveMonsPtr->state++;
        break;
    case 1:
        if (!DoMonPlaceChange() && !MultiMove_UpdateMove())
        {
            MultiMove_CreatePlacedMonIcons();
            StartCursorAnim(CURSOR_ANIM_OPEN);
            InitMultiMonPlaceChange(TRUE);
            HideBg(0);
            sMoveMonsPtr->state++;
        }
        break;
    case 2:
        if (!DoMonPlaceChange())
        {
            StartCursorAnim(CURSOR_ANIM_BOUNCE);
            MultiMove_ResetBg();
            sMoveMonsPtr->state++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            LoadPalette(stdpal_get(3), 0xD0, 0x20);
            SetCursorPriorityTo1();
            ShowBg(0);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

bool8 MultiMove_TryMoveGroup(u8 dir)
{
    switch (dir)
    {
    case 0: // up
        if (sMoveMonsPtr->minColumn == 0)
            return FALSE;
        sMoveMonsPtr->minColumn--;
        MultiMove_InitMove(0, 1024, 6);
        break;
    case 1: // down
        if (sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal >= 5)
            return FALSE;
        sMoveMonsPtr->minColumn++;
        MultiMove_InitMove(0, -1024, 6);
        break;
    case 2: // left
        if (sMoveMonsPtr->minRow == 0)
            return FALSE;
        sMoveMonsPtr->minRow--;
        MultiMove_InitMove(1024, 0, 6);
        break;
    case 3: // right
        if (sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal > 5)
            return FALSE;
        sMoveMonsPtr->minRow++;
        MultiMove_InitMove(-1024, 0, 6);
        break;
    }

    return TRUE;
}

static void MultiMove_UpdateSelectedIcons(void)
{
    s16 columnChange = (abs(sMoveMonsPtr->fromRow - sMoveMonsPtr->cursorColumn)) - (abs(sMoveMonsPtr->fromRow - sMoveMonsPtr->toColumn));
    s16 rowChange = (abs(sMoveMonsPtr->fromColumn - sMoveMonsPtr->cursorRow)) - (abs(sMoveMonsPtr->fromColumn - sMoveMonsPtr->toRow));

    if (columnChange > 0)
        MultiMove_SelectColumn(sMoveMonsPtr->cursorColumn, sMoveMonsPtr->fromColumn, sMoveMonsPtr->toRow);

    if (columnChange < 0)
    {
        MultiMove_DeselectColumn(sMoveMonsPtr->toColumn, sMoveMonsPtr->fromColumn, sMoveMonsPtr->toRow);
        MultiMove_SelectColumn(sMoveMonsPtr->cursorColumn, sMoveMonsPtr->fromColumn, sMoveMonsPtr->toRow);
    }

    if (rowChange > 0)
        MultiMove_SelectRow(sMoveMonsPtr->cursorRow, sMoveMonsPtr->fromRow, sMoveMonsPtr->toColumn);

    if (rowChange < 0)
    {
        MultiMove_DeselectRow(sMoveMonsPtr->toRow, sMoveMonsPtr->fromRow, sMoveMonsPtr->toColumn);
        MultiMove_SelectRow(sMoveMonsPtr->cursorRow, sMoveMonsPtr->fromRow, sMoveMonsPtr->toColumn);
    }
}

static void MultiMove_SelectColumn(u8 x, u8 y1, u8 y2)
{
    if (y1 > y2)
    {
        u8 temp;
        SWAP(y1, y2, temp)
    }

    while (y1 <= y2)
        MultiMove_SetIconToBg(x, y1++);
}

static void MultiMove_SelectRow(u8 y, u8 x1, u8 x2)
{
    if (x1 > x2)
    {
        u8 temp;
        SWAP(x1, x2, temp)
    }

    while (x1 <= x2)
        MultiMove_SetIconToBg(x1++, y);
}

static void MultiMove_DeselectColumn(u8 x, u8 y1, u8 y2)
{
    if (y1 > y2)
    {
        u8 temp;
        SWAP(y1, y2, temp)
    }

    while (y1 <= y2)
        MultiMove_ClearIconFromBg(x, y1++);
}

static void MultiMove_DeselectRow(u8 y, u8 x1, u8 x2)
{
    if (x1 > x2)
    {
        u8 temp;
        SWAP(x1, x2, temp)
    }

    while (x1 <= x2)
        MultiMove_ClearIconFromBg(x1++, y);
}

static void MultiMove_SetIconToBg(u8 x, u8 y)
{
    u8 position = x + (IN_BOX_COLUMNS * y);
    u16 species = GetCurrentBoxMonData(position, MON_DATA_SPECIES2);
    u32 personality = GetCurrentBoxMonData(position, MON_DATA_PERSONALITY);

    if (species != SPECIES_NONE)
    {
        const u8 *iconGfx = GetMonIconPtr(species, personality, 1);
        u8 index = GetValidMonIconPalIndex(species) + 8;

        BlitBitmapRectToWindow4BitTo8Bit(sStorage->multiMoveWindowId,
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

static void MultiMove_ClearIconFromBg(u8 x, u8 y)
{
    u8 position = x + (IN_BOX_COLUMNS * y);
    u16 species = GetCurrentBoxMonData(position, MON_DATA_SPECIES2);

    if (species != SPECIES_NONE)
    {
        FillWindowPixelRect8Bit(sStorage->multiMoveWindowId,
                                PIXEL_FILL(0),
                                24 * x,
                                24 * y,
                                32,
                                32);
    }
}

static void MultiMove_InitMove(u16 bgX, u16 bgY, u16 duration)
{
    sMoveMonsPtr->bgX = bgX;
    sMoveMonsPtr->bgY = bgY;
    sMoveMonsPtr->bgMoveSteps = duration;
}

static u8 MultiMove_UpdateMove(void)
{
    if (sMoveMonsPtr->bgMoveSteps != 0)
    {
        ChangeBgX(0, sMoveMonsPtr->bgX, 1);
        ChangeBgY(0, sMoveMonsPtr->bgY, 1);
        sMoveMonsPtr->bgMoveSteps--;
    }

    return sMoveMonsPtr->bgMoveSteps;
}

static void MultiMove_GetMonsFromSelection(void)
{
    s32 i, j;
    s32 rowCount, columnCount;
    u8 boxId;
    u8 monArrayId;

    sMoveMonsPtr->minRow = min(sMoveMonsPtr->fromRow, sMoveMonsPtr->toColumn);
    sMoveMonsPtr->minColumn = min(sMoveMonsPtr->fromColumn, sMoveMonsPtr->toRow);
    sMoveMonsPtr->rowsTotal = abs(sMoveMonsPtr->fromRow - sMoveMonsPtr->toColumn) + 1;
    sMoveMonsPtr->columsTotal = abs(sMoveMonsPtr->fromColumn - sMoveMonsPtr->toRow) + 1;
    boxId = StorageGetCurrentBox();
    monArrayId = 0;
    rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMoveMonsPtr->minRow;
        for (j = sMoveMonsPtr->minRow; j < rowCount; j++)
        {
            struct BoxPokemon *boxMon = GetBoxedMonPtr(boxId, boxPosition);

            sMoveMonsPtr->boxMons[monArrayId] = *boxMon;
            monArrayId++;
            boxPosition++;
        }
    }
}

static void MultiMove_RemoveMonsFromBox(void)
{
    s32 i, j;
    s32 rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    s32 columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    u8 boxId = StorageGetCurrentBox();

    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMoveMonsPtr->minRow;
        for (j = sMoveMonsPtr->minRow; j < rowCount; j++)
        {
            DestroyBoxMonIconAtPosition(boxPosition);
            ZeroBoxMonAt(boxId, boxPosition);
            boxPosition++;
        }
    }
}

static void MultiMove_CreatePlacedMonIcons(void)
{
    s32 i, j;
    s32 rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    s32 columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    u8 monArrayId = 0;

    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMoveMonsPtr->minRow;
        for (j = sMoveMonsPtr->minRow; j < rowCount; j++)
        {
            if (GetBoxMonData(&sMoveMonsPtr->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES))
                CreateBoxMonIconAtPos(boxPosition);
            monArrayId++;
            boxPosition++;
        }
    }
}

static void MultiMove_SetPlacedMonData(void)
{
    s32 i, j;
    s32 rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    s32 columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    u8 boxId = StorageGetCurrentBox();
    u8 monArrayId = 0;

    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMoveMonsPtr->minRow;
        for (j = sMoveMonsPtr->minRow; j < rowCount; j++)
        {
            if (GetBoxMonData(&sMoveMonsPtr->boxMons[monArrayId], MON_DATA_SANITY_HAS_SPECIES))
                SetBoxMonAt(boxId, boxPosition, &sMoveMonsPtr->boxMons[monArrayId]);
            boxPosition++;
            monArrayId++;
        }
    }
}

static void MultiMove_ResetBg(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    SetBgAttribute(0, BG_ATTR_PALETTEMODE, 0);
    ClearGpuRegBits(REG_OFFSET_BG0CNT, BGCNT_256COLOR);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 32, 32);
    CopyBgTilemapBufferToVram(0);
}

u8 MultiMove_GetOrigin(void)
{
    return (IN_BOX_COLUMNS * sMoveMonsPtr->fromColumn) + sMoveMonsPtr->fromRow;
}

bool8 MultiMove_CanPlaceSelection(void)
{
    s32 i, j;
    s32 rowCount = sMoveMonsPtr->minRow + sMoveMonsPtr->rowsTotal;
    s32 columnCount = sMoveMonsPtr->minColumn + sMoveMonsPtr->columsTotal;
    u8 monArrayId = 0;

    for (i = sMoveMonsPtr->minColumn; i < columnCount; i++)
    {
        u8 boxPosition = (IN_BOX_COLUMNS * i) + sMoveMonsPtr->minRow;
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
