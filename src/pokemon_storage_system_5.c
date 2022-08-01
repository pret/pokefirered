#include "global.h"
#include "gflib.h"
#include "data.h"
#include "item.h"
#include "mail_data.h"
#include "pokemon_storage_system_internal.h"
#include "pokemon_summary_screen.h"
#include "strings.h"
#include "constants/items.h"
#include "constants/moves.h"

static EWRAM_DATA struct Pokemon sMonBeingCarried = {};
static EWRAM_DATA s8 sBoxCursorArea = 0;
static EWRAM_DATA s8 sBoxCursorPosition = 0;
static EWRAM_DATA bool8 sIsMonBeingMoved = FALSE;
static EWRAM_DATA u8 sMovingMonOrigBoxId = 0;
static EWRAM_DATA u8 sMovingMonOrigBoxPos = 0;
static EWRAM_DATA bool8 sCanOnlyMove = FALSE;
static EWRAM_DATA u8 gUnknown_2039826 = 0;

static void sub_80929B0(void);
static bool8 MonPlaceChange_Move(void);
static bool8 MonPlaceChange_Place(void);
static bool8 MonPlaceChange_Shift(void);
static bool8 sub_8092E00(void);
static bool8 sub_8092E10(void);
static bool8 sub_8092E20(void);
static bool8 sub_8092E54(void);
static void MoveMon(void);
static void PlaceMon(void);
static void SetMovedMonData(u8 boxId, u8 cursorPos);
static void SetPlacedMonData(u8 boxId, u8 cursorPos);
static void PurgeMonOrBoxMon(u8 boxId, u8 cursorPos);
static void SetShiftedMonData(u8 boxId, u8 cursorPos);
static void sub_8093A10(void);
static void SetCursorMonData(void *cursorMon, u8 mode);
static void sub_8093AAC(void);
static u8 InBoxInput_Normal(void);
static u8 InBoxInput_GrabbingMultiple(void);
static u8 InBoxInput_MovingMultiple(void);
static void AddBoxMenu(void);
static bool8 sub_8094924(void);
static bool8 sub_809494C(void);
static bool8 sub_8094A0C(void);
static void sub_8094AD8(void);
static void sub_8094C84(void);

static const u16 sHandCursorPalette[] = INCBIN_U16("graphics/interface/pss_unk_83D2BCC.gbapal");
static const u16 sHandCursorTiles[] = INCBIN_U16("graphics/interface/pss_unk_83D2BEC.4bpp");
static const u16 sHandCursorShadowTiles[] = INCBIN_U16("graphics/interface/pss_unk_83D33EC.4bpp");

void sub_80922C0(void)
{
    if (gPSSData->boxOption != BOX_OPTION_DEPOSIT)
        sBoxCursorArea = CURSOR_AREA_IN_BOX;
    else
        sBoxCursorArea = CURSOR_AREA_IN_PARTY;

    sBoxCursorPosition = 0;
    sIsMonBeingMoved = FALSE;
    sMovingMonOrigBoxId = 0;
    sMovingMonOrigBoxPos = 0;
    sCanOnlyMove = FALSE;
    sub_8092B50();
    sub_8094AD8();
    gPSSData->cursorPrevHorizPos = 1;
    gPSSData->inBoxMovingMode = 0;
    sub_8093A10();
}

void sub_8092340(void)
{
    sub_8094AD8();
    sub_8093AAC();
    gPSSData->cursorPrevHorizPos = 1;
    gPSSData->inBoxMovingMode = 0;
    if (sIsMonBeingMoved)
    {
        gPSSData->movingMon = sMonBeingCarried;
        CreateMovingMonIcon();
    }
}

static void sub_8092398(u8 cursorArea, u8 cursorPosition, u16 *x, u16 *y)
{
    switch (cursorArea)
    {
    case CURSOR_AREA_IN_BOX:
        *x = (cursorPosition % IN_BOX_ROWS) * 24 + 100;
        *y = (cursorPosition / IN_BOX_ROWS) * 24 +  32;
        break;
    case CURSOR_AREA_IN_PARTY:
        if (cursorPosition == 0)
        {
            *x = 0x68;
            *y = 0x34;
        }
        else if (cursorPosition == PARTY_SIZE)
        {
            *x = 0x98;
            *y = 0x84;
        }
        else
        {
            *x = 0x98;
            *y = (cursorPosition - 1) * 24 + 4;
        }
        break;
    case CURSOR_AREA_BOX:
        *x = 0xa2;
        *y = 0x0c;
        break;
    case CURSOR_AREA_BUTTONS:
        *y = sIsMonBeingMoved ? 8 : 14;
        *x = cursorPosition * 0x58 + 0x78;
        break;
    case 4:
        *x = 0xa0;
        *y = 0x60;
        break;
    }
}

static u16 sub_8092458(void)
{
    switch (sBoxCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        return GetMonData(&gPlayerParty[sBoxCursorPosition], MON_DATA_SPECIES);
    case CURSOR_AREA_IN_BOX:
        return GetCurrentBoxMonData(sBoxCursorPosition, MON_DATA_SPECIES);
    default:
        return SPECIES_NONE;
    }
}

bool8 sub_80924A8(void)
{
    s16 tmp;

    if (gPSSData->cursorMoveSteps == 0)
    {
        if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
            return FALSE;
        else
            return sub_809610C();
    }
    else if (--gPSSData->cursorMoveSteps != 0)
    {
        gPSSData->cursorNewX += gPSSData->cursorSpeedX;
        gPSSData->cursorNewY += gPSSData->cursorSpeedY;
        gPSSData->cursorSprite->x = gPSSData->cursorNewX >> 8;
        gPSSData->cursorSprite->y = gPSSData->cursorNewY >> 8;
        if (gPSSData->cursorSprite->x > 0x100)
        {
            tmp = gPSSData->cursorSprite->x - 0x100;
            gPSSData->cursorSprite->x = tmp + 0x40;
        }
        if (gPSSData->cursorSprite->x < 0x40)
        {
            tmp = 0x40 - gPSSData->cursorSprite->x;
            gPSSData->cursorSprite->x = 0x100 - tmp;
        }
        if (gPSSData->cursorSprite->y > 0xb0)
        {
            tmp = gPSSData->cursorSprite->y - 0xb0;
            gPSSData->cursorSprite->y = tmp - 0x10;
        }
        if (gPSSData->cursorSprite->y < -0x10)
        {
            tmp = -0x10 - gPSSData->cursorSprite->y;
            gPSSData->cursorSprite->y = 0xb0 - tmp;
        }
        if (gPSSData->cursorFlipTimer && --gPSSData->cursorFlipTimer == 0)
            gPSSData->cursorSprite->vFlip = (gPSSData->cursorSprite->vFlip == FALSE);
    }
    else
    {
        gPSSData->cursorSprite->x = gPSSData->cursorTargetX;
        gPSSData->cursorSprite->y = gPSSData->cursorTargetY;
        sub_80929B0();
    }

    return TRUE;
}

static void sub_8092604(u8 newCurosrArea, u8 newCursorPosition)
{
    u16 x, y;

    sub_8092398(newCurosrArea, newCursorPosition, &x, &y);
    gPSSData->newCursorArea = newCurosrArea;
    gPSSData->newCursorPosition = newCursorPosition;
    gPSSData->cursorTargetX = x;
    gPSSData->cursorTargetY = y;
}

static void sub_8092660(void)
{
    int r7, r0;

    if (gPSSData->cursorVerticalWrap != 0 || gPSSData->cursorHorizontalWrap != 0)
        gPSSData->cursorMoveSteps = 12;
    else
        gPSSData->cursorMoveSteps = 6;

    if (gPSSData->cursorFlipTimer)
        gPSSData->cursorFlipTimer = gPSSData->cursorMoveSteps >> 1;

    switch (gPSSData->cursorVerticalWrap)
    {
    default:
        r7 = gPSSData->cursorTargetY - gPSSData->cursorSprite->y;
        break;
    case -1:
        r7 = gPSSData->cursorTargetY - 0xc0 - gPSSData->cursorSprite->y;
        break;
    case 1:
        r7 = gPSSData->cursorTargetY + 0xc0 - gPSSData->cursorSprite->y;
        break;
    }

    switch (gPSSData->cursorHorizontalWrap)
    {
    default:
        r0 = gPSSData->cursorTargetX - gPSSData->cursorSprite->x;
        break;
    case -1:
        r0 = gPSSData->cursorTargetX - 0xc0 - gPSSData->cursorSprite->x;
        break;
    case 1:
        r0 = gPSSData->cursorTargetX + 0xc0 - gPSSData->cursorSprite->x;
        break;
    }

    r7 <<= 8;
    r0 <<= 8;
    gPSSData->cursorSpeedX = r0 / gPSSData->cursorMoveSteps;
    gPSSData->cursorSpeedY = r7 / gPSSData->cursorMoveSteps;
    gPSSData->cursorNewX = gPSSData->cursorSprite->x << 8;
    gPSSData->cursorNewY = gPSSData->cursorSprite->y << 8;
}

static void sub_80927E8(u8 newCurosrArea, u8 newCursorPosition)
{
    sub_8092604(newCurosrArea, newCursorPosition);
    sub_8092660();
    if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        if (gPSSData->inBoxMovingMode == 0 && !sIsMonBeingMoved)
            StartSpriteAnim(gPSSData->cursorSprite, 1);
    }
    else
    {
        if (!IsActiveItemMoving())
            StartSpriteAnim(gPSSData->cursorSprite, 1);
    }

    if (gPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        if (sBoxCursorArea == CURSOR_AREA_IN_BOX)
            sub_8095D44(CURSOR_AREA_IN_BOX, sBoxCursorPosition);
        else if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
            sub_8095D44(CURSOR_AREA_IN_PARTY, sBoxCursorPosition);

        if (newCurosrArea == CURSOR_AREA_IN_BOX)
            sub_8095C84(newCurosrArea, newCursorPosition);
        else if (newCurosrArea == CURSOR_AREA_IN_PARTY)
            sub_8095C84(newCurosrArea, newCursorPosition);
    }

    if (newCurosrArea == CURSOR_AREA_IN_PARTY && sBoxCursorArea != CURSOR_AREA_IN_PARTY)
    {
        gPSSData->cursorPrevHorizPos = newCurosrArea;
        gPSSData->cursorShadowSprite->invisible = TRUE;
    }

    switch (newCurosrArea)
    {
    case CURSOR_AREA_IN_PARTY:
    case CURSOR_AREA_BOX:
    case CURSOR_AREA_BUTTONS:
        gPSSData->cursorSprite->oam.priority = 1;
        gPSSData->cursorShadowSprite->invisible = TRUE;
        gPSSData->cursorShadowSprite->oam.priority = 1;
        break;
    case CURSOR_AREA_IN_BOX:
        if (gPSSData->inBoxMovingMode != 0)
        {
            gPSSData->cursorSprite->oam.priority = 0;
            gPSSData->cursorShadowSprite->invisible = TRUE;
        }
        else
        {
            gPSSData->cursorSprite->oam.priority = 2;
            if (sBoxCursorArea == CURSOR_AREA_IN_BOX && sIsMonBeingMoved)
                SetMovingMonPriority(2);
        }
        break;
    }
}

static void sub_80929B0(void)
{
    sBoxCursorArea = gPSSData->newCursorArea;
    sBoxCursorPosition = gPSSData->newCursorPosition;
    if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        if (gPSSData->inBoxMovingMode == 0 && !sIsMonBeingMoved)
            StartSpriteAnim(gPSSData->cursorSprite, 1);
    }
    else
    {
        if (!IsActiveItemMoving())
            StartSpriteAnim(gPSSData->cursorSprite, 1);
    }

    sub_8093A10();
    switch (sBoxCursorArea)
    {
    case CURSOR_AREA_BUTTONS:
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_BOX:
        AnimateBoxScrollArrows(TRUE);
        break;
    case CURSOR_AREA_IN_PARTY:
        gPSSData->cursorShadowSprite->subpriority = 13;
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_IN_BOX:
        if (gPSSData->inBoxMovingMode == 0)
        {
            gPSSData->cursorSprite->oam.priority = 1;
            gPSSData->cursorShadowSprite->oam.priority = 2;
            gPSSData->cursorShadowSprite->subpriority = 21;
            gPSSData->cursorShadowSprite->invisible = FALSE;
            SetMovingMonPriority(2);
        }
        break;
    }
}

void sub_8092AE4(void)
{
    u8 partyCount;

    if (!sIsMonBeingMoved)
    {
        partyCount = 0;
    }
    else
    {
        partyCount = CalculatePlayerPartyCount();
        if (partyCount >= PARTY_SIZE)
            partyCount = PARTY_SIZE - 1;
    }
    if (gPSSData->cursorSprite->vFlip)
        gPSSData->cursorFlipTimer = 1;
    sub_80927E8(CURSOR_AREA_IN_PARTY, partyCount);
}

void sub_8092B3C(u8 cursorBoxPosition)
{
    sub_80927E8(CURSOR_AREA_IN_BOX, cursorBoxPosition);
}

void sub_8092B50(void)
{
    gUnknown_2039826 = 0;
}

void sub_8092B5C(void)
{
    gUnknown_2039826 = sBoxCursorPosition;
}

u8 sub_8092B70(void)
{
    return gUnknown_2039826;
}

void InitMonPlaceChange(u8 a0)
{
    static bool8 (*const placeChangeFuncs[])(void) = {
        MonPlaceChange_Move,
        MonPlaceChange_Place,
        MonPlaceChange_Shift,
    };

    gPSSData->monPlaceChangeFunc = placeChangeFuncs[a0];
    gPSSData->monPlaceChangeState = 0;
}

void sub_8092BAC(bool8 arg0)
{
    if (!arg0)
        gPSSData->monPlaceChangeFunc = sub_8092E00;
    else
        gPSSData->monPlaceChangeFunc = sub_8092E10;

    gPSSData->monPlaceChangeState = 0;
}

bool8 DoMonPlaceChange(void)
{
    return gPSSData->monPlaceChangeFunc();
}

static bool8 MonPlaceChange_Move(void)
{
    switch (gPSSData->monPlaceChangeState)
    {
    case 0:
        if (sIsMonBeingMoved)
            return FALSE;
        StartSpriteAnim(gPSSData->cursorSprite, 2);
        gPSSData->monPlaceChangeState++;
        break;
    case 1:
        if (!sub_8092E20())
        {
            StartSpriteAnim(gPSSData->cursorSprite, 3);
            MoveMon();
            gPSSData->monPlaceChangeState++;
        }
        break;
    case 2:
        if (!sub_8092E54())
            gPSSData->monPlaceChangeState++;
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_Place(void)
{
    switch (gPSSData->monPlaceChangeState)
    {
    case 0:
        if (!sub_8092E20())
        {
            StartSpriteAnim(gPSSData->cursorSprite, 2);
            PlaceMon();
            gPSSData->monPlaceChangeState++;
        }
        break;
    case 1:
        if (!sub_8092E54())
        {
            StartSpriteAnim(gPSSData->cursorSprite, 0);
            gPSSData->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_Shift(void)
{
    switch (gPSSData->monPlaceChangeState)
    {
    case 0:
        switch (sBoxCursorArea)
        {
        case CURSOR_AREA_IN_PARTY:
            gPSSData->shiftBoxId = TOTAL_BOXES_COUNT;
            break;
        case CURSOR_AREA_IN_BOX:
            gPSSData->shiftBoxId = StorageGetCurrentBox();
            break;
        default:
            return FALSE;
        }
        StartSpriteAnim(gPSSData->cursorSprite, 2);
        sub_8090E08(gPSSData->shiftBoxId, sBoxCursorPosition);
        gPSSData->monPlaceChangeState++;
        break;
    case 1:
        if (!sub_8090E74())
        {
            StartSpriteAnim(gPSSData->cursorSprite, 3);
            SetShiftedMonData(gPSSData->shiftBoxId, sBoxCursorPosition);
            gPSSData->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 sub_8092E00(void)
{
    return sub_8092E20();
}

static bool8 sub_8092E10(void)
{
    return sub_8092E54();
}

static bool8 sub_8092E20(void)
{
    switch (gPSSData->cursorSprite->y2)
    {
    default:
        gPSSData->cursorSprite->y2++;
        break;
    case 0:
        gPSSData->cursorSprite->y2++;
        break;
    case 8:
        return FALSE;
    }

    return TRUE;
}

static bool8 sub_8092E54(void)
{
    switch (gPSSData->cursorSprite->y2)
    {
    case 0:
        return FALSE;
    default:
        gPSSData->cursorSprite->y2--;
        break;
    }

    return TRUE;
}

static void MoveMon(void)
{
    switch (sBoxCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        SetMovedMonData(TOTAL_BOXES_COUNT, sBoxCursorPosition);
        sub_8090CC0(MODE_PARTY, sBoxCursorPosition);
        break;
    case CURSOR_AREA_IN_BOX:
        if (gPSSData->inBoxMovingMode == 0)
        {
            SetMovedMonData(StorageGetCurrentBox(), sBoxCursorPosition);
            sub_8090CC0(MODE_BOX, sBoxCursorPosition);
        }
        break;
    default:
        return;
    }

    sIsMonBeingMoved = TRUE;
}

static void PlaceMon(void)
{
    u8 boxId;

    switch (sBoxCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        SetPlacedMonData(TOTAL_BOXES_COUNT, sBoxCursorPosition);
        sub_8090D58(TOTAL_BOXES_COUNT, sBoxCursorPosition);
        break;
    case CURSOR_AREA_IN_BOX:
        boxId = StorageGetCurrentBox();
        SetPlacedMonData(boxId, sBoxCursorPosition);
        sub_8090D58(boxId, sBoxCursorPosition);
        break;
    default:
        return;
    }

    sIsMonBeingMoved = FALSE;
}

void sub_8092F54(void)
{
    sub_8093A10();
}

static void SetMovedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        gPSSData->movingMon = gPlayerParty[sBoxCursorPosition];
    else
        BoxMonAtToMon(boxId, position, &gPSSData->movingMon);

    PurgeMonOrBoxMon(boxId, position);
    sMovingMonOrigBoxId = boxId;
    sMovingMonOrigBoxPos = position;
}

static void SetPlacedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
    {
        gPlayerParty[position] = gPSSData->movingMon;
    }
    else
    {
        BoxMonRestorePP(&gPSSData->movingMon.box);
        SetBoxMonAt(boxId, position, &gPSSData->movingMon.box);
    }
}

static void PurgeMonOrBoxMon(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        ZeroMonData(&gPlayerParty[position]);
    else
        ZeroBoxMonAt(boxId, position);
}

static void SetShiftedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        gPSSData->field_2108 = gPlayerParty[position];
    else
        BoxMonAtToMon(boxId, position, &gPSSData->field_2108);

    SetPlacedMonData(boxId, position);
    gPSSData->movingMon = gPSSData->field_2108;
    SetCursorMonData(&gPSSData->movingMon, MODE_PARTY);
    sMovingMonOrigBoxId = boxId;
    sMovingMonOrigBoxPos = position;
}

bool8 TryStorePartyMonInBox(u8 boxId)
{
    s16 boxPosition = GetFirstFreeBoxSpot(boxId);
    if (boxPosition == -1)
        return FALSE;

    if (sIsMonBeingMoved)
    {
        SetPlacedMonData(boxId, boxPosition);
        DestroyMovingMonIcon();
        sIsMonBeingMoved = FALSE;
    }
    else
    {
        SetMovedMonData(TOTAL_BOXES_COUNT, sBoxCursorPosition);
        SetPlacedMonData(boxId, boxPosition);
        DestroyPartyMonIcon(sBoxCursorPosition);
    }

    if (boxId == StorageGetCurrentBox())
        sub_80901EC(boxPosition);

    StartSpriteAnim(gPSSData->cursorSprite, 1);
    return TRUE;
}

void sub_8093174(void)
{
    StartSpriteAnim(gPSSData->cursorSprite, 0);
    sub_8093A10();
}

void sub_8093194(void)
{
    u8 mode;

    if (sIsMonBeingMoved)
        mode = MODE_2;
    else if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
        mode = MODE_PARTY;
    else
        mode = MODE_BOX;

    sub_8090FC4(mode, sBoxCursorPosition);
    StringCopy(gPSSData->field_21E0, gPSSData->displayMonName);
}

bool8 sub_80931EC(void)
{
    if (!sub_8091084())
    {
        StartSpriteAnim(gPSSData->cursorSprite, 0);
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

void ReleaseMon(void)
{
    u8 boxId;

    sub_80910CC();
    if (sIsMonBeingMoved)
    {
        sIsMonBeingMoved = FALSE;
    }
    else
    {
        if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
            boxId = TOTAL_BOXES_COUNT;
        else
            boxId = StorageGetCurrentBox();

        PurgeMonOrBoxMon(boxId, sBoxCursorPosition);
    }
    sub_8093A10();
}

void sub_8093264(void)
{
    if (sIsMonBeingMoved)
        StartSpriteAnim(gPSSData->cursorSprite, 3);
}

void InitCanReleaseMonVars(void)
{
    u16 knownIdx;
    if (sIsMonBeingMoved)
    {
        gPSSData->field_2108 = gPSSData->movingMon;
        gPSSData->field_2170 = -1;
        gPSSData->field_2171 = -1;
    }
    else
    {
        if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
        {
            gPSSData->field_2108 = gPlayerParty[sBoxCursorPosition];
            gPSSData->field_2170 = TOTAL_BOXES_COUNT;
        }
        else
        {
            BoxMonAtToMon(StorageGetCurrentBox(), sBoxCursorPosition, &gPSSData->field_2108);
            gPSSData->field_2170 = StorageGetCurrentBox();
        }
        gPSSData->field_2171 = sBoxCursorPosition;
    }

    gPSSData->isSurfMon = FALSE;
    gPSSData->isDiveMon = FALSE;
    gPSSData->field_2176[0] = MOVE_SURF;
    gPSSData->field_2176[1] = MOVE_DIVE;
    gPSSData->field_2176[2] = MOVES_COUNT;
    knownIdx = GetMonData(&gPSSData->field_2108, MON_DATA_KNOWN_MOVES, (u8 *)gPSSData->field_2176);
    gPSSData->isSurfMon = knownIdx & 1;
    gPSSData->isDiveMon = (knownIdx >> 1) & 1;
    if (gPSSData->isSurfMon || gPSSData->isDiveMon)
    {
        gPSSData->field_216D = 0;
    }
    else
    {
        gPSSData->field_216D = 1;
        gPSSData->field_216C = 1;
    }

    gPSSData->field_2172 = 0;
}

s8 RunCanReleaseMon(void)
{
    u16 i;
    u16 knownMoves;

    if (gPSSData->field_216D)
        return gPSSData->field_216C;

    switch (gPSSData->field_2172)
    {
    case 0:
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (gPSSData->field_2170 != TOTAL_BOXES_COUNT || gPSSData->field_2171 != i)
            {
                knownMoves = GetMonData(gPlayerParty + i, MON_DATA_KNOWN_MOVES, (u8 *)gPSSData->field_2176);
                if (knownMoves & 1)
                    gPSSData->isSurfMon = FALSE;
                if (knownMoves & 2)
                    gPSSData->isDiveMon = FALSE;
            }
        }
        if (!(gPSSData->isSurfMon || gPSSData->isDiveMon))
        {
            gPSSData->field_216D = 1;
            gPSSData->field_216C = 1;
        }
        else
        {
            gPSSData->field_216E = 0;
            gPSSData->field_216F = 0;
            gPSSData->field_2172++;
        }
        break;
    case 1:
        for (i = 0; i < 5; i++)
        {
            knownMoves = GetAndCopyBoxMonDataAt(gPSSData->field_216E, gPSSData->field_216F, MON_DATA_KNOWN_MOVES, (u8 *)gPSSData->field_2176);
            if (knownMoves != 0
                && !(gPSSData->field_2170 == gPSSData->field_216E && gPSSData->field_2171 == gPSSData->field_216F))
            {
                if (knownMoves & 1)
                    gPSSData->isSurfMon = FALSE;
                if (knownMoves & 2)
                    gPSSData->isDiveMon = FALSE;
            }
            if (++gPSSData->field_216F >= IN_BOX_COUNT)
            {
                gPSSData->field_216F = 0;
                if (++gPSSData->field_216E >= TOTAL_BOXES_COUNT)
                {
                    gPSSData->field_216D = 1;
                    gPSSData->field_216C = 0;
                    break;
                }
            }
        }
        if (!(gPSSData->isSurfMon || gPSSData->isDiveMon))
        {
            gPSSData->field_216D = 1;
            gPSSData->field_216C = 1;
        }
        break;
    }

    return -1;
}

void sub_8093630(void)
{
    if (sIsMonBeingMoved)
        sMonBeingCarried = gPSSData->movingMon;
}

void sub_8093660(void)
{
    if (sIsMonBeingMoved)
    {
        if (sMovingMonOrigBoxId == TOTAL_BOXES_COUNT)
            gPSSData->movingMon = sMonBeingCarried;
        else
            gPSSData->movingMon.box = sMonBeingCarried.box;
    }
}

void sub_80936B8(void)
{
    if (sIsMonBeingMoved)
    {
        sub_8093630();
        gPSSData->field_218C.mon = &sMonBeingCarried;
        gPSSData->field_2187 = 0;
        gPSSData->field_2186 = 0;
        gPSSData->summaryScreenMode = PSS_MODE_NORMAL;
    }
    else if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
    {
        gPSSData->field_218C.mon = gPlayerParty;
        gPSSData->field_2187 = sBoxCursorPosition;
        gPSSData->field_2186 = CountPartyMons() - 1;
        gPSSData->summaryScreenMode = PSS_MODE_NORMAL;
    }
    else
    {
        gPSSData->field_218C.box = GetBoxedMonPtr(StorageGetCurrentBox(), 0);
        gPSSData->field_2187 = sBoxCursorPosition;
        gPSSData->field_2186 = IN_BOX_COUNT - 1;
        gPSSData->summaryScreenMode = PSS_MODE_BOX;
    }
}

void sub_80937B4(void)
{
    if (sIsMonBeingMoved)
        sub_8093660();
    else
        sBoxCursorPosition = GetLastViewedMonIndex();
}

// file boundary maybe?

s16 CompactPartySlots(void)
{
    s16 retVal = -1;
    u16 i, last;

    for (i = 0, last = 0; i < PARTY_SIZE; i++)
    {
        u16 species = GetMonData(gPlayerParty + i, MON_DATA_SPECIES);
        if (species != SPECIES_NONE)
        {
            if (i != last)
                gPlayerParty[last] = gPlayerParty[i];
            last++;
        }
        else if (retVal == -1)
        {
            retVal = i;
        }
    }
    for (; last < PARTY_SIZE; last++)
        ZeroMonData(gPlayerParty + last);

    return retVal;
}

void SetMonMarkings(u8 markings)
{
    gPSSData->displayMonMarkings = markings;
    if (sIsMonBeingMoved)
    {
        SetMonData(&gPSSData->movingMon, MON_DATA_MARKINGS, &markings);
    }
    else
    {
        if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
            SetMonData(gPlayerParty + sBoxCursorPosition, MON_DATA_MARKINGS, &markings);
        if (sBoxCursorArea == CURSOR_AREA_IN_BOX)
            SetCurrentBoxMonData(sBoxCursorPosition, MON_DATA_MARKINGS, &markings);
    }
}

bool8 CanMovePartyMon(void)
{
    if (sBoxCursorArea == CURSOR_AREA_IN_PARTY && !sIsMonBeingMoved && CountPartyAliveNonEggMonsExcept(sBoxCursorPosition) == 0)
        return TRUE;
    else
        return FALSE;
}

bool8 CanShiftMon(void)
{
    if (sIsMonBeingMoved)
    {
        if (sBoxCursorArea == CURSOR_AREA_IN_PARTY && CountPartyAliveNonEggMonsExcept(sBoxCursorPosition) == 0)
        {
            if (gPSSData->displayMonIsEgg || GetMonData(&gPSSData->movingMon, MON_DATA_HP) == 0)
                return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

bool8 IsMonBeingMoved(void)
{
    return sIsMonBeingMoved;
}

bool8 IsCursorOnBoxTitle(void)
{
    return (sBoxCursorArea == CURSOR_AREA_BOX);
}

bool8 IsCursorOnCloseBox(void)
{
    return (sBoxCursorArea == CURSOR_AREA_BUTTONS && sBoxCursorPosition == 1);
}

bool8 IsCursorInBox(void)
{
    return (sBoxCursorArea == CURSOR_AREA_IN_BOX);
}

static void sub_8093A10(void)
{
    gPSSData->setMosaic = (sIsMonBeingMoved == FALSE);
    if (!sIsMonBeingMoved)
    {
        switch (sBoxCursorArea)
        {
        case CURSOR_AREA_IN_PARTY:
            if (sBoxCursorPosition < PARTY_SIZE)
            {
                SetCursorMonData(&gPlayerParty[sBoxCursorPosition], MODE_PARTY);
                break;
            }
            // fallthrough
        case CURSOR_AREA_BUTTONS:
        case CURSOR_AREA_BOX:
            SetCursorMonData(NULL, MODE_2);
            break;
        case CURSOR_AREA_IN_BOX:
            SetCursorMonData(GetBoxedMonPtr(StorageGetCurrentBox(), sBoxCursorPosition), MODE_BOX);
            break;
        }
    }
}

static void sub_8093AAC(void)
{
    if (sIsMonBeingMoved)
        SetCursorMonData(&sMonBeingCarried, MODE_PARTY);
    else
        sub_8093A10();
}

static void SetCursorMonData(void *pokemon, u8 mode)
{
    u8 *txtPtr;
    u16 gender;
    bool8 sanityIsBagEgg;

    gPSSData->displayMonItemId = 0;
    gender = MON_MALE;
    sanityIsBagEgg = FALSE;
    if (mode == MODE_PARTY)
    {
        struct Pokemon *mon = (struct Pokemon *)pokemon;

        gPSSData->displayMonSpecies = GetMonData(mon, MON_DATA_SPECIES2);
        if (gPSSData->displayMonSpecies != SPECIES_NONE)
        {
            sanityIsBagEgg = GetMonData(mon, MON_DATA_SANITY_IS_BAD_EGG);
            if (sanityIsBagEgg)
                gPSSData->displayMonIsEgg = TRUE;
            else
                gPSSData->displayMonIsEgg = GetMonData(mon, MON_DATA_IS_EGG);

            GetMonData(mon, MON_DATA_NICKNAME, gPSSData->displayMonName);
            StringGetEnd10(gPSSData->displayMonName);
            gPSSData->displayMonLevel = GetMonData(mon, MON_DATA_LEVEL);
            gPSSData->displayMonMarkings = GetMonData(mon, MON_DATA_MARKINGS);
            gPSSData->displayMonPersonality = GetMonData(mon, MON_DATA_PERSONALITY);
            gPSSData->displayMonPalette = GetMonFrontSpritePal(mon);
            gender = GetMonGender(mon);
            gPSSData->displayMonItemId = GetMonData(mon, MON_DATA_HELD_ITEM);
        }
    }
    else if (mode == MODE_BOX)
    {
        struct BoxPokemon *boxMon = (struct BoxPokemon *)pokemon;

        gPSSData->displayMonSpecies = GetBoxMonData(pokemon, MON_DATA_SPECIES2);
        if (gPSSData->displayMonSpecies != SPECIES_NONE)
        {
            u32 otId = GetBoxMonData(boxMon, MON_DATA_OT_ID);
            sanityIsBagEgg = GetBoxMonData(boxMon, MON_DATA_SANITY_IS_BAD_EGG);
            if (sanityIsBagEgg)
                gPSSData->displayMonIsEgg = TRUE;
            else
                gPSSData->displayMonIsEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG);


            GetBoxMonData(boxMon, MON_DATA_NICKNAME, gPSSData->displayMonName);
            StringGetEnd10(gPSSData->displayMonName);
            gPSSData->displayMonLevel = GetLevelFromBoxMonExp(boxMon);
            gPSSData->displayMonMarkings = GetBoxMonData(boxMon, MON_DATA_MARKINGS);
            gPSSData->displayMonPersonality = GetBoxMonData(boxMon, MON_DATA_PERSONALITY);
            gPSSData->displayMonPalette = GetMonSpritePalFromSpeciesAndPersonality(gPSSData->displayMonSpecies, otId, gPSSData->displayMonPersonality);
            gender = GetGenderFromSpeciesAndPersonality(gPSSData->displayMonSpecies, gPSSData->displayMonPersonality);
            gPSSData->displayMonItemId = GetBoxMonData(boxMon, MON_DATA_HELD_ITEM);
        }
    }
    else
    {
        gPSSData->displayMonSpecies = SPECIES_NONE;
        gPSSData->displayMonItemId = 0;
    }

    if (gPSSData->displayMonSpecies == SPECIES_NONE)
    {
        StringFill(gPSSData->displayMonName, CHAR_SPACE, 5);
        StringFill(gPSSData->displayMonTexts[0], CHAR_SPACE, 8);
        StringFill(gPSSData->displayMonTexts[1], CHAR_SPACE, 8);
        StringFill(gPSSData->displayMonTexts[2], CHAR_SPACE, 8);
        StringFill(gPSSData->displayMonTexts[3], CHAR_SPACE, 8);
    }
    else if (gPSSData->displayMonIsEgg)
    {
        if (sanityIsBagEgg)
            StringCopyPadded(gPSSData->displayMonTexts[0], gPSSData->displayMonName, CHAR_SPACE, 5);
        else
            StringCopyPadded(gPSSData->displayMonTexts[0], gText_EggNickname, CHAR_SPACE, 8);

        StringFill(gPSSData->displayMonTexts[1], CHAR_SPACE, 8);
        StringFill(gPSSData->displayMonTexts[2], CHAR_SPACE, 8);
        StringFill(gPSSData->displayMonTexts[3], CHAR_SPACE, 8);
    }
    else
    {
        if (gPSSData->displayMonSpecies == SPECIES_NIDORAN_F || gPSSData->displayMonSpecies == SPECIES_NIDORAN_M)
            gender = MON_GENDERLESS;

        StringCopyPadded(gPSSData->displayMonTexts[0], gPSSData->displayMonName, CHAR_SPACE, 5);

        txtPtr = gPSSData->displayMonTexts[1];
        *(txtPtr)++ = CHAR_SLASH;
        StringCopyPadded(txtPtr, gSpeciesNames[gPSSData->displayMonSpecies], CHAR_SPACE, 5);

        txtPtr = gPSSData->displayMonTexts[2];
        *(txtPtr)++ = EXT_CTRL_CODE_BEGIN;
        *(txtPtr)++ = EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW;
        switch (gender)
        {
        case MON_MALE:
            *(txtPtr)++ = TEXT_COLOR_RED;
            *(txtPtr)++ = TEXT_COLOR_WHITE;
            *(txtPtr)++ = TEXT_COLOR_LIGHT_RED;
            *(txtPtr)++ = CHAR_MALE;
            break;
        case MON_FEMALE:
            *(txtPtr)++ = TEXT_COLOR_GREEN;
            *(txtPtr)++ = TEXT_COLOR_WHITE;
            *(txtPtr)++ = TEXT_COLOR_LIGHT_GREEN;
            *(txtPtr)++ = CHAR_FEMALE;
            break;
        default:
            *(txtPtr)++ = TEXT_COLOR_DARK_GRAY;
            *(txtPtr)++ = TEXT_COLOR_WHITE;
            *(txtPtr)++ = TEXT_COLOR_LIGHT_GRAY;
            *(txtPtr)++ = CHAR_SPACE;
            break;
        }

        *(txtPtr++) = EXT_CTRL_CODE_BEGIN;
        *(txtPtr++) = EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW;
        *(txtPtr++) = TEXT_COLOR_DARK_GRAY;
        *(txtPtr++) = TEXT_COLOR_WHITE;
        *(txtPtr++) = TEXT_COLOR_LIGHT_GRAY;
        *(txtPtr++) = CHAR_SPACE;
        *(txtPtr++) = CHAR_EXTRA_SYMBOL;
        *(txtPtr++) = 5; // LV_2

        txtPtr = ConvertIntToDecimalStringN(txtPtr, gPSSData->displayMonLevel, STR_CONV_MODE_LEFT_ALIGN, 3);
        txtPtr[0] = CHAR_SPACE;
        txtPtr[1] = EOS;

        if (gPSSData->displayMonItemId != 0)
            StringCopyPadded(gPSSData->displayMonTexts[3], ItemId_GetName(gPSSData->displayMonItemId), CHAR_SPACE, 8);
        else
            StringFill(gPSSData->displayMonTexts[3], CHAR_SPACE, 8);
    }
}

static u8 HandleInput_InBox(void)
{
    switch (gPSSData->inBoxMovingMode)
    {
    case 0:
    default:
        return InBoxInput_Normal();
    case 1:
        return InBoxInput_GrabbingMultiple();
    case 2:
        return InBoxInput_MovingMultiple();
    }
}

static u8 InBoxInput_Normal(void)
{
    u8 retVal;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        cursorArea = sBoxCursorArea;
        cursorPosition = sBoxCursorPosition;
        gPSSData->cursorVerticalWrap = 0;
        gPSSData->cursorHorizontalWrap = 0;
        gPSSData->cursorFlipTimer = 0;
        if (JOY_REPT(DPAD_UP))
        {
            retVal = TRUE;
            if (sBoxCursorPosition >= IN_BOX_ROWS)
            {
                cursorPosition -= IN_BOX_ROWS;
            }
            else
            {
                cursorArea = CURSOR_AREA_BOX;
                cursorPosition = 0;
            }
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            retVal = TRUE;
            cursorPosition += IN_BOX_ROWS;
            if (cursorPosition >= IN_BOX_COUNT)
            {
                cursorArea = CURSOR_AREA_BUTTONS;
                cursorPosition -= IN_BOX_COUNT;
                cursorPosition /= 3;
                gPSSData->cursorVerticalWrap = 1;
                gPSSData->cursorFlipTimer = 1;
            }
            break;
        }
        else if (JOY_REPT(DPAD_LEFT))
        {
            retVal = TRUE;
            if (sBoxCursorPosition % IN_BOX_ROWS != 0)
            {
                cursorPosition--;
            }
            else
            {
                gPSSData->cursorHorizontalWrap = -1;
                cursorPosition += (IN_BOX_ROWS - 1);
            }
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            retVal = TRUE;
            if ((sBoxCursorPosition + 1) % IN_BOX_ROWS != 0)
            {
                cursorPosition++;
            }
            else
            {
                gPSSData->cursorHorizontalWrap = 1;
                cursorPosition -= (IN_BOX_ROWS - 1);
            }
            break;
        }
        else if (JOY_NEW(START_BUTTON))
        {
            retVal = TRUE;
            cursorArea = CURSOR_AREA_BOX;
            cursorPosition = 0;
            break;
        }

        if ((JOY_NEW(A_BUTTON)) && sub_8094924())
        {
            if (!sCanOnlyMove)
                return 8;

            if (gPSSData->boxOption != BOX_OPTION_MOVE_MONS || sIsMonBeingMoved == TRUE)
            {
                switch (sub_8094E50(0))
                {
                case PC_TEXT_STORE:
                    return 11;
                case PC_TEXT_WITHDRAW:
                    return 12;
                case PC_TEXT_MOVE:
                    return 13;
                case PC_TEXT_SHIFT:
                    return 14;
                case PC_TEXT_PLACE:
                    return 15;
                case PC_TEXT_TAKE:
                    return 16;
                case PC_TEXT_GIVE:
                    return 17;
                case PC_TEXT_SWITCH:
                    return 18;
                }
            }
            else
            {
                gPSSData->inBoxMovingMode = 1;
                return 20;
            }
        }

        if (JOY_NEW(B_BUTTON))
            return 19;

        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return 10;
            if (JOY_HELD(R_BUTTON))
                return 9;
        }

        if (JOY_NEW(SELECT_BUTTON))
        {
            sub_8094C84();
            return 0;
        }

        retVal = 0;

    } while (0);

    if (retVal)
        sub_80927E8(cursorArea, cursorPosition);

    return retVal;
}

static u8 InBoxInput_GrabbingMultiple(void)
{
    if (JOY_HELD(A_BUTTON))
    {
        if (JOY_REPT(DPAD_UP))
        {
            if (sBoxCursorPosition / IN_BOX_ROWS != 0)
            {
                sub_80927E8(CURSOR_AREA_IN_BOX, sBoxCursorPosition - IN_BOX_ROWS);
                return 21;
            }
            else
            {
                return 24;
            }
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            if (sBoxCursorPosition + IN_BOX_ROWS < IN_BOX_COUNT)
            {
                sub_80927E8(CURSOR_AREA_IN_BOX, sBoxCursorPosition + IN_BOX_ROWS);
                return 21;
            }
            else
            {
                return 24;
            }
        }
        else if (JOY_REPT(DPAD_LEFT))
        {
            if (sBoxCursorPosition % IN_BOX_ROWS != 0)
            {
                sub_80927E8(CURSOR_AREA_IN_BOX, sBoxCursorPosition - 1);
                return 21;
            }
            else
            {
                return 24;
            }
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            if ((sBoxCursorPosition + 1) % IN_BOX_ROWS != 0)
            {
                sub_80927E8(CURSOR_AREA_IN_BOX, sBoxCursorPosition + 1);
                return 21;
            }
            else
            {
                return 24;
            }
        }
        else
        {
            return 0;
        }
    }
    else
    {
        if (sub_8095AA0() == sBoxCursorPosition)
        {
            gPSSData->inBoxMovingMode = 0;
            gPSSData->cursorShadowSprite->invisible = FALSE;
            return 22;
        }
        else
        {
            sIsMonBeingMoved = (gPSSData->displayMonSpecies != SPECIES_NONE);
            gPSSData->inBoxMovingMode = 2;
            sMovingMonOrigBoxId = StorageGetCurrentBox();
            return 23;
        }
    }
}

static u8 InBoxInput_MovingMultiple(void)
{
    if (JOY_REPT(DPAD_UP))
    {
        if (sub_8095474(0))
        {
            sub_80927E8(CURSOR_AREA_IN_BOX, sBoxCursorPosition - IN_BOX_ROWS);
            return 25;
        }
        else
        {
            return 24;
        }
    }
    else if (JOY_REPT(DPAD_DOWN))
    {
        if (sub_8095474(1))
        {
            sub_80927E8(CURSOR_AREA_IN_BOX, sBoxCursorPosition + IN_BOX_ROWS);
            return 25;
        }
        else
        {
            return 24;
        }
    }
    else if (JOY_REPT(DPAD_LEFT))
    {
        if (sub_8095474(2))
        {
            sub_80927E8(CURSOR_AREA_IN_BOX, sBoxCursorPosition - 1);
            return 25;
        }
        else
        {
            return 10;
        }
    }
    else if (JOY_REPT(DPAD_RIGHT))
    {
        if (sub_8095474(3))
        {
            sub_80927E8(CURSOR_AREA_IN_BOX, sBoxCursorPosition + 1);
            return 25;
        }
        else
        {
            return 9;
        }
    }
    else if (JOY_NEW(A_BUTTON))
    {
        if (sub_8095ABC())
        {
            sIsMonBeingMoved = FALSE;
            gPSSData->inBoxMovingMode = 0;
            return 26;
        }
        else
        {
            return 24;
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        return 24;
    }
    else
    {
        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return 10;
            if (JOY_HELD(R_BUTTON))
                return 9;
        }

        return 0;
    }
}

static u8 HandleInput_InParty(void)
{
    u8 retVal;
    bool8 gotoBox;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        cursorArea = sBoxCursorArea;
        cursorPosition = sBoxCursorPosition;
        gPSSData->cursorHorizontalWrap = 0;
        gPSSData->cursorVerticalWrap = 0;
        gPSSData->cursorFlipTimer = 0;
        gotoBox = FALSE;
        retVal = 0;

        if (JOY_REPT(DPAD_UP))
        {
            if (--cursorPosition < 0)
                cursorPosition = PARTY_SIZE;
            if (cursorPosition != sBoxCursorPosition)
                retVal = 1;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            if (++cursorPosition > PARTY_SIZE)
                cursorPosition = 0;
            if (cursorPosition != sBoxCursorPosition)
                retVal = 1;
            break;
        }
        else if (JOY_REPT(DPAD_LEFT) && sBoxCursorPosition != 0)
        {
            retVal = 1;
            gPSSData->cursorPrevHorizPos = sBoxCursorPosition;
            cursorPosition = 0;
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            if (sBoxCursorPosition == 0)
            {
                retVal = 1;
                cursorPosition = gPSSData->cursorPrevHorizPos;
            }
            else
            {
                retVal = 6;
                cursorArea = CURSOR_AREA_IN_BOX;
                cursorPosition = 0;
            }
            break;
        }

        if (JOY_NEW(A_BUTTON))
        {
            if (sBoxCursorPosition == PARTY_SIZE)
            {
                if (gPSSData->boxOption == BOX_OPTION_DEPOSIT)
                    return 4;

                gotoBox = TRUE;
            }
            else if (sub_8094924())
            {
                if (!sCanOnlyMove)
                    return 8;

                switch (sub_8094E50(0))
                {
                case PC_TEXT_STORE:
                    return 11;
                case PC_TEXT_WITHDRAW:
                    return 12;
                case PC_TEXT_MOVE:
                    return 13;
                case PC_TEXT_SHIFT:
                    return 14;
                case PC_TEXT_PLACE:
                    return 15;
                case PC_TEXT_TAKE:
                    return 16;
                case PC_TEXT_GIVE:
                    return 17;
                case PC_TEXT_SWITCH:
                    return 18;
                }
            }
        }

        if (JOY_NEW(B_BUTTON))
        {
            if (gPSSData->boxOption == BOX_OPTION_DEPOSIT)
                return 19;

            gotoBox = TRUE;
        }

        if (gotoBox)
        {
            retVal = 6;
            cursorArea = CURSOR_AREA_IN_BOX;
            cursorPosition = 0;
        }
        else if (JOY_NEW(SELECT_BUTTON))
        {
            sub_8094C84();
            return 0;
        }

    } while (0);

    if (retVal != 0)
    {
        if (retVal != 6)
            sub_80927E8(cursorArea, cursorPosition);
    }

    return retVal;
}

static u8 HandleInput_OnBox(void)
{
    u8 retVal;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        gPSSData->cursorHorizontalWrap = 0;
        gPSSData->cursorVerticalWrap = 0;
        gPSSData->cursorFlipTimer = 0;

        if (JOY_REPT(DPAD_UP))
        {
            retVal = 1;
            cursorArea = CURSOR_AREA_BUTTONS;
            cursorPosition = 0;
            gPSSData->cursorFlipTimer = 1;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            retVal = 1;
            cursorArea = CURSOR_AREA_IN_BOX;
            cursorPosition = 2;
            break;
        }

        if (JOY_HELD(DPAD_LEFT))
            return 10;
        if (JOY_HELD(DPAD_RIGHT))
            return 9;

        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return 10;
            if (JOY_HELD(R_BUTTON))
                return 9;
        }

        if (JOY_NEW(A_BUTTON))
        {
            AnimateBoxScrollArrows(FALSE);
            AddBoxMenu();
            return 7;
        }

        if (JOY_NEW(B_BUTTON))
            return 19;

        if (JOY_NEW(SELECT_BUTTON))
        {
            sub_8094C84();
            return 0;
        }

        retVal = 0;

    } while (0);

    if (retVal)
    {
        if (cursorArea != CURSOR_AREA_BOX)
            AnimateBoxScrollArrows(FALSE);
        sub_80927E8(cursorArea, cursorPosition);
    }

    return retVal;
}

static u8 HandleInput_OnButtons(void)
{
    u8 retVal;
    s8 cursorArea;
    s8 cursorPosition;
    s8 prevPos;

    do
    {
        cursorArea = sBoxCursorArea;
        cursorPosition = sBoxCursorPosition;
        gPSSData->cursorHorizontalWrap = 0;
        gPSSData->cursorVerticalWrap = 0;
        gPSSData->cursorFlipTimer = 0;

        if (JOY_REPT(DPAD_UP))
        {
            retVal = 1;
            cursorArea = CURSOR_AREA_IN_BOX;
            gPSSData->cursorVerticalWrap = -1;
            if (sBoxCursorPosition == 0)
                cursorPosition = IN_BOX_COUNT - 1 - 5;
            else
                cursorPosition = IN_BOX_COUNT - 1;
            gPSSData->cursorFlipTimer = 1;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN | START_BUTTON))
        {
            retVal = 1;
            cursorArea = CURSOR_AREA_BOX;
            cursorPosition = 0;
            gPSSData->cursorFlipTimer = 1;
            break;
        }

        if (JOY_REPT(DPAD_LEFT))
        {
            retVal = 1;
            if (--cursorPosition < 0)
                cursorPosition = 1;
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            retVal = 1;
            if (++cursorPosition > 1)
                cursorPosition = 0;
            break;
        }

        if (JOY_NEW(A_BUTTON))
        {
            return cursorPosition == 0 ? 5 : 4;
        }
        if (JOY_NEW(B_BUTTON))
            return 19;

        if (JOY_NEW(SELECT_BUTTON))
        {
            sub_8094C84();
            return 0;
        }

        retVal = 0;
    } while (0);

    if (retVal != 0)
        sub_80927E8(cursorArea, cursorPosition);

    return retVal;
}

u8 HandleInput(void)
{
    struct
    {
        u8 (*func)(void);
        s8 area;
    }
    static const inputFuncs[] = {
        {HandleInput_InBox, CURSOR_AREA_IN_BOX},
        {HandleInput_InParty, CURSOR_AREA_IN_PARTY},
        {HandleInput_OnBox, CURSOR_AREA_BOX},
        {HandleInput_OnButtons, CURSOR_AREA_BUTTONS},
        {NULL, 0},
    };

    u16 i = 0;
    while (inputFuncs[i].func != NULL)
    {
        if (inputFuncs[i].area == sBoxCursorArea)
            return inputFuncs[i].func();
        i++;
    }

    return 0;
}

static void AddBoxMenu(void)
{
    InitMenu();
    SetMenuText(PC_TEXT_JUMP);
    SetMenuText(PC_TEXT_WALLPAPER);
    SetMenuText(PC_TEXT_NAME);
    SetMenuText(PC_TEXT_CANCEL);
}

static bool8 sub_8094924(void)
{
    InitMenu();
    if (gPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
        return sub_809494C();
    else
        return sub_8094A0C();
}

static bool8 sub_809494C(void)
{
    u16 var0 = sub_8092458();

    switch (gPSSData->boxOption)
    {
    case BOX_OPTION_DEPOSIT:
        if (var0)
            SetMenuText(PC_TEXT_STORE);
        else
            return FALSE;
        break;
    case BOX_OPTION_WITHDRAW:
        if (var0)
            SetMenuText(PC_TEXT_WITHDRAW);
        else
            return FALSE;
        break;
    case BOX_OPTION_MOVE_MONS:
        if (sIsMonBeingMoved)
        {
            if (var0)
                SetMenuText(PC_TEXT_SHIFT);
            else
                SetMenuText(PC_TEXT_PLACE);
        }
        else
        {
            if (var0)
                SetMenuText(PC_TEXT_MOVE);
            else
                return FALSE;
        }
        break;
    case BOX_OPTION_MOVE_ITEMS:
    default:
        return FALSE;
    }

    SetMenuText(PC_TEXT_SUMMARY);
    if (gPSSData->boxOption == BOX_OPTION_MOVE_MONS)
    {
        if (!sBoxCursorArea)
            SetMenuText(PC_TEXT_WITHDRAW);
        else
            SetMenuText(PC_TEXT_STORE);
    }

    SetMenuText(PC_TEXT_MARK);
    SetMenuText(PC_TEXT_RELEASE);
    SetMenuText(PC_TEXT_CANCEL);
    return TRUE;
}

static bool8 sub_8094A0C(void)
{
    if (gPSSData->displayMonSpecies == SPECIES_EGG)
        return FALSE;

    if (!IsActiveItemMoving())
    {
        if (gPSSData->displayMonItemId == ITEM_NONE)
        {
            if (gPSSData->displayMonSpecies == SPECIES_NONE)
                return FALSE;

            SetMenuText(PC_TEXT_GIVE2);
        }
        else
        {
            if (!ItemIsMail(gPSSData->displayMonItemId))
            {
                SetMenuText(PC_TEXT_TAKE);
                SetMenuText(PC_TEXT_BAG);
            }
            SetMenuText(PC_TEXT_INFO);
        }
    }
    else
    {
        if (gPSSData->displayMonItemId == ITEM_NONE)
        {
            if (gPSSData->displayMonSpecies == SPECIES_NONE)
                return FALSE;

            SetMenuText(PC_TEXT_GIVE);
        }
        else
        {
            if (ItemIsMail(gPSSData->displayMonItemId) == TRUE)
                return FALSE;

            SetMenuText(PC_TEXT_SWITCH);
        }
    }

    SetMenuText(PC_TEXT_CANCEL);
    return TRUE;
}

static void sub_8094AB8(struct Sprite *sprite)
{
    sprite->x = gPSSData->cursorSprite->x;
    sprite->y = gPSSData->cursorSprite->y + 20;
}

static void sub_8094AD8(void)
{
    u16 x, y;
    u8 spriteId;
    u8 priority, subpriority;
    struct SpriteSheet spriteSheets[] = {
        {sHandCursorTiles, 0x800, TAG_TILE_0},
        {sHandCursorShadowTiles, 0x80, TAG_TILE_1},
        {}
    };

    struct SpritePalette spritePalettes[] = {
        {sHandCursorPalette, TAG_PAL_DAC7},
        {}
    };

    static const struct OamData sOamData_857BA0C = {
        .shape = SPRITE_SHAPE(32x32),
        .size = SPRITE_SIZE(32x32),
        .priority = 1,
    };
    static const struct OamData sOamData_857BA14 = {
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .priority = 1,
    };

    static const union AnimCmd sSpriteAnim_857BA1C[] = {
        ANIMCMD_FRAME(0, 30),
        ANIMCMD_FRAME(16, 30),
        ANIMCMD_JUMP(0)
    };
    static const union AnimCmd sSpriteAnim_857BA28[] = {
        ANIMCMD_FRAME(0, 5),
        ANIMCMD_END
    };
    static const union AnimCmd sSpriteAnim_857BA30[] = {
        ANIMCMD_FRAME(32, 5),
        ANIMCMD_END
    };
    static const union AnimCmd sSpriteAnim_857BA38[] = {
        ANIMCMD_FRAME(48, 5),
        ANIMCMD_END
    };

    static const union AnimCmd *const sSpriteAnimTable_857BA40[] = {
        sSpriteAnim_857BA1C,
        sSpriteAnim_857BA28,
        sSpriteAnim_857BA30,
        sSpriteAnim_857BA38
    };

    static const struct SpriteTemplate gSpriteTemplate_857BA50 = {
        .tileTag = TAG_TILE_0,
        .paletteTag = TAG_PAL_WAVEFORM,
        .oam = &sOamData_857BA0C,
        .anims = sSpriteAnimTable_857BA40,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };

    static const struct SpriteTemplate gSpriteTemplate_857BA68 = {
        .tileTag = TAG_TILE_1,
        .paletteTag = TAG_PAL_WAVEFORM,
        .oam = &sOamData_857BA14,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8094AB8,
    };

    LoadSpriteSheets(spriteSheets);
    LoadSpritePalettes(spritePalettes);
    gPSSData->cursorPalNums[0] = IndexOfSpritePaletteTag(TAG_PAL_WAVEFORM);
    gPSSData->cursorPalNums[1] = IndexOfSpritePaletteTag(TAG_PAL_DAC7);

    sub_8092398(sBoxCursorArea, sBoxCursorPosition, &x, &y);
    spriteId = CreateSprite(&gSpriteTemplate_857BA50, x, y, 6);
    if (spriteId != MAX_SPRITES)
    {
        gPSSData->cursorSprite = &gSprites[spriteId];
        gPSSData->cursorSprite->oam.paletteNum = gPSSData->cursorPalNums[sCanOnlyMove];
        gPSSData->cursorSprite->oam.priority = 1;
        if (sIsMonBeingMoved)
            StartSpriteAnim(gPSSData->cursorSprite, 3);
    }
    else
    {
        gPSSData->cursorSprite = NULL;
    }

    if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
    {
        subpriority = 13;
        priority = 1;
    }
    else
    {
        subpriority = 21;
        priority = 2;
    }

    spriteId = CreateSprite(&gSpriteTemplate_857BA68, 0, 0, subpriority);
    if (spriteId != MAX_SPRITES)
    {
        gPSSData->cursorShadowSprite = &gSprites[spriteId];
        gPSSData->cursorShadowSprite->oam.priority = priority;
        if (sBoxCursorArea)
            gPSSData->cursorShadowSprite->invisible = 1;
    }
    else
    {
        gPSSData->cursorShadowSprite = NULL;
    }
}

static void sub_8094C84(void)
{
    sCanOnlyMove = !sCanOnlyMove;
    gPSSData->cursorSprite->oam.paletteNum = gPSSData->cursorPalNums[sCanOnlyMove];
}

u8 GetBoxCursorPosition(void)
{
    return sBoxCursorPosition;
}

void sub_8094CD4(u8 *arg0, u8 *arg1)
{
    if (sBoxCursorArea == CURSOR_AREA_IN_BOX)
    {
        *arg0 = sBoxCursorPosition % IN_BOX_ROWS;
        *arg1 = sBoxCursorPosition / IN_BOX_ROWS;
    }
    else
    {
        *arg0 = 0;
        *arg1 = 0;
    }
}

void sub_8094D14(u8 animNum)
{
    StartSpriteAnim(gPSSData->cursorSprite, animNum);
}

u8 sub_8094D34(void)
{
    return sMovingMonOrigBoxId;
}

void sub_8094D40(void)
{
    gPSSData->cursorSprite->oam.priority = 1;
}

void sub_8094D60(void)
{
    if (sBoxCursorArea == CURSOR_AREA_IN_BOX)
        sub_8095D44(CURSOR_AREA_IN_BOX, sBoxCursorPosition);
}

void sub_8094D84(void)
{
    if (sBoxCursorArea == CURSOR_AREA_IN_BOX)
        sub_8095C84(CURSOR_AREA_IN_BOX, sBoxCursorPosition);
}
