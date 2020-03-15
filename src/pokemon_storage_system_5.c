#include "global.h"
#include "gflib.h"
#include "pokemon_storage_system_internal.h"
#include "constants/species.h"
#include "constants/moves.h"

EWRAM_DATA struct Pokemon gUnknown_20397BC = {};
EWRAM_DATA s8 sBoxCursorArea = 0;
EWRAM_DATA s8 sBoxCursorPosition = 0;
EWRAM_DATA bool8 sIsMonBeingMoved = FALSE;
EWRAM_DATA u8 sMovingMonOrigBoxId = 0;
EWRAM_DATA u8 sMovingMonOrigBoxPos = 0;
EWRAM_DATA bool8 sCanOnlyMove = FALSE;
EWRAM_DATA u8 gUnknown_2039826 = 0;

void sub_80929B0(void);
bool8 MonPlaceChange_Move(void);
bool8 MonPlaceChange_Place(void);
bool8 MonPlaceChange_Shift(void);
bool8 sub_8092E00(void);
bool8 sub_8092E10(void);
bool8 sub_8092E20(void);
bool8 sub_8092E54(void);
void MoveMon(void);
void PlaceMon(void);
void SetMovedMonData(u8 boxId, u8 cursorPos);
void SetPlacedMonData(u8 boxId, u8 cursorPos);
void PurgeMonOrBoxMon(u8 boxId, u8 cursorPos);
void SetShiftedMonData(u8 boxId, u8 cursorPos);
void sub_8093A10(void);
void SetCursorMonData(struct Pokemon * cursorMon, u8 mode);
void sub_8094AD8(void);
void sub_8093AAC(void);
void sub_8095D44(u8 cursorArea, u8 cursorPos);

const u16 gUnknown_83D2BCC[] = INCBIN_U16("graphics/interface/pss_unk_83D2BCC.gbapal");
const u16 gUnknown_83D2BEC[] = INCBIN_U16("graphics/interface/pss_unk_83D2BEC.4bpp");
const u16 gUnknown_83D33EC[] = INCBIN_U16("graphics/interface/pss_unk_83D33EC.4bpp");

void sub_80922C0(void)
{
    if (sPSSData->boxOption != BOX_OPTION_DEPOSIT)
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
    sPSSData->field_CD6 = 1;
    sPSSData->inBoxMovingMode = 0;
    sub_8093A10();
}

void sub_8092340(void)
{
    sub_8094AD8();
    sub_8093AAC();
    sPSSData->field_CD6 = 1;
    sPSSData->inBoxMovingMode = 0;
    if (sIsMonBeingMoved)
    {
        sPSSData->movingMon = gUnknown_20397BC;
        CreateMovingMonIcon();
    }
}

void sub_8092398(u8 cursorArea, u8 cursorPosition, u16 *x, u16 *y)
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

u16 sub_8092458(void)
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

    if (sPSSData->field_CD0 == 0)
    {
        if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
            return FALSE;
        else
            return sub_809610C();
    }
    else if (--sPSSData->field_CD0 != 0)
    {
        sPSSData->field_CBC += sPSSData->field_CC4;
        sPSSData->field_CC0 += sPSSData->field_CC8;
        sPSSData->field_CB4->pos1.x = sPSSData->field_CBC >> 8;
        sPSSData->field_CB4->pos1.y = sPSSData->field_CC0 >> 8;
        if (sPSSData->field_CB4->pos1.x > 0x100)
        {
            tmp = sPSSData->field_CB4->pos1.x - 0x100;
            sPSSData->field_CB4->pos1.x = tmp + 0x40;
        }
        if (sPSSData->field_CB4->pos1.x < 0x40)
        {
            tmp = 0x40 - sPSSData->field_CB4->pos1.x;
            sPSSData->field_CB4->pos1.x = 0x100 - tmp;
        }
        if (sPSSData->field_CB4->pos1.y > 0xb0)
        {
            tmp = sPSSData->field_CB4->pos1.y - 0xb0;
            sPSSData->field_CB4->pos1.y = tmp - 0x10;
        }
        if (sPSSData->field_CB4->pos1.y < -0x10)
        {
            tmp = -0x10 - sPSSData->field_CB4->pos1.y;
            sPSSData->field_CB4->pos1.y = 0xb0 - tmp;
        }
        if (sPSSData->field_CD7 && --sPSSData->field_CD7 == 0)
            sPSSData->field_CB4->vFlip = (sPSSData->field_CB4->vFlip == FALSE);
    }
    else
    {
        sPSSData->field_CB4->pos1.x = sPSSData->field_CCC;
        sPSSData->field_CB4->pos1.y = sPSSData->field_CCE;
        sub_80929B0();
    }

    return TRUE;
}

void sub_8092604(u8 newCurosrArea, u8 newCursorPosition)
{
    u16 x, y;

    sub_8092398(newCurosrArea, newCursorPosition, &x, &y);
    sPSSData->field_CD4 = newCurosrArea;
    sPSSData->field_CD5 = newCursorPosition;
    sPSSData->field_CCC = x;
    sPSSData->field_CCE = y;
}

void sub_8092660(void)
{
    int r7, r0;

    if (sPSSData->field_CD2 != 0 || sPSSData->field_CD3 != 0)
        sPSSData->field_CD0 = 12;
    else
        sPSSData->field_CD0 = 6;

    if (sPSSData->field_CD7)
        sPSSData->field_CD7 = sPSSData->field_CD0 >> 1;

    switch (sPSSData->field_CD2)
    {
    default:
        r7 = sPSSData->field_CCE - sPSSData->field_CB4->pos1.y;
        break;
    case -1:
        r7 = sPSSData->field_CCE - 0xc0 - sPSSData->field_CB4->pos1.y;
        break;
    case 1:
        r7 = sPSSData->field_CCE + 0xc0 - sPSSData->field_CB4->pos1.y;
        break;
    }

    switch (sPSSData->field_CD3)
    {
    default:
        r0 = sPSSData->field_CCC - sPSSData->field_CB4->pos1.x;
        break;
    case -1:
        r0 = sPSSData->field_CCC - 0xc0 - sPSSData->field_CB4->pos1.x;
        break;
    case 1:
        r0 = sPSSData->field_CCC + 0xc0 - sPSSData->field_CB4->pos1.x;
        break;
    }

    r7 <<= 8;
    r0 <<= 8;
    sPSSData->field_CC4 = r0 / sPSSData->field_CD0;
    sPSSData->field_CC8 = r7 / sPSSData->field_CD0;
    sPSSData->field_CBC = sPSSData->field_CB4->pos1.x << 8;
    sPSSData->field_CC0 = sPSSData->field_CB4->pos1.y << 8;
}

void sub_80927E8(u8 newCurosrArea, u8 newCursorPosition)
{
    sub_8092604(newCurosrArea, newCursorPosition);
    sub_8092660();
    if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        if (sPSSData->inBoxMovingMode == 0 && !sIsMonBeingMoved)
            StartSpriteAnim(sPSSData->field_CB4, 1);
    }
    else
    {
        if (!IsActiveItemMoving())
            StartSpriteAnim(sPSSData->field_CB4, 1);
    }

    if (sPSSData->boxOption == BOX_OPTION_MOVE_ITEMS)
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
        sPSSData->field_CD6 = newCurosrArea;
        sPSSData->field_CB8->invisible = TRUE;
    }

    switch (newCurosrArea)
    {
    case CURSOR_AREA_IN_PARTY:
    case CURSOR_AREA_BOX:
    case CURSOR_AREA_BUTTONS:
        sPSSData->field_CB4->oam.priority = 1;
        sPSSData->field_CB8->invisible = TRUE;
        sPSSData->field_CB8->oam.priority = 1;
        break;
    case CURSOR_AREA_IN_BOX:
        if (sPSSData->inBoxMovingMode != 0)
        {
            sPSSData->field_CB4->oam.priority = 0;
            sPSSData->field_CB8->invisible = TRUE;
        }
        else
        {
            sPSSData->field_CB4->oam.priority = 2;
            if (sBoxCursorArea == CURSOR_AREA_IN_BOX && sIsMonBeingMoved)
                SetMovingMonPriority(2);
        }
        break;
    }
}

void sub_80929B0(void)
{
    sBoxCursorArea = sPSSData->field_CD4;
    sBoxCursorPosition = sPSSData->field_CD5;
    if (sPSSData->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        if (sPSSData->inBoxMovingMode == 0 && !sIsMonBeingMoved)
            StartSpriteAnim(sPSSData->field_CB4, 1);
    }
    else
    {
        if (!IsActiveItemMoving())
            StartSpriteAnim(sPSSData->field_CB4, 1);
    }

    sub_8093A10();
    switch (sBoxCursorArea)
    {
    case CURSOR_AREA_BUTTONS:
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_BOX:
        sub_80920FC(TRUE);
        break;
    case CURSOR_AREA_IN_PARTY:
        sPSSData->field_CB8->subpriority = 13;
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_IN_BOX:
        if (sPSSData->inBoxMovingMode == 0)
        {
            sPSSData->field_CB4->oam.priority = 1;
            sPSSData->field_CB8->oam.priority = 2;
            sPSSData->field_CB8->subpriority = 21;
            sPSSData->field_CB8->invisible = FALSE;
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
    if (sPSSData->field_CB4->vFlip)
        sPSSData->field_CD7 = 1;
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

    sPSSData->monPlaceChangeFunc = placeChangeFuncs[a0];
    sPSSData->monPlaceChangeState = 0;
}

void sub_8092BAC(bool8 arg0)
{
    if (!arg0)
        sPSSData->monPlaceChangeFunc = sub_8092E00;
    else
        sPSSData->monPlaceChangeFunc = sub_8092E10;

    sPSSData->monPlaceChangeState = 0;
}

bool8 DoMonPlaceChange(void)
{
    return sPSSData->monPlaceChangeFunc();
}

bool8 MonPlaceChange_Move(void)
{
    switch (sPSSData->monPlaceChangeState)
    {
    case 0:
        if (sIsMonBeingMoved)
            return FALSE;
        StartSpriteAnim(sPSSData->field_CB4, 2);
        sPSSData->monPlaceChangeState++;
        break;
    case 1:
        if (!sub_8092E20())
        {
            StartSpriteAnim(sPSSData->field_CB4, 3);
            MoveMon();
            sPSSData->monPlaceChangeState++;
        }
        break;
    case 2:
        if (!sub_8092E54())
            sPSSData->monPlaceChangeState++;
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

bool8 MonPlaceChange_Place(void)
{
    switch (sPSSData->monPlaceChangeState)
    {
    case 0:
        if (!sub_8092E20())
        {
            StartSpriteAnim(sPSSData->field_CB4, 2);
            PlaceMon();
            sPSSData->monPlaceChangeState++;
        }
        break;
    case 1:
        if (!sub_8092E54())
        {
            StartSpriteAnim(sPSSData->field_CB4, 0);
            sPSSData->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

bool8 MonPlaceChange_Shift(void)
{
    switch (sPSSData->monPlaceChangeState)
    {
    case 0:
        switch (sBoxCursorArea)
        {
        case CURSOR_AREA_IN_PARTY:
            sPSSData->field_D91 = TOTAL_BOXES_COUNT;
            break;
        case CURSOR_AREA_IN_BOX:
            sPSSData->field_D91 = StorageGetCurrentBox();
            break;
        default:
            return FALSE;
        }
        StartSpriteAnim(sPSSData->field_CB4, 2);
        sub_8090E08(sPSSData->field_D91, sBoxCursorPosition);
        sPSSData->monPlaceChangeState++;
        break;
    case 1:
        if (!sub_8090E74())
        {
            StartSpriteAnim(sPSSData->field_CB4, 3);
            SetShiftedMonData(sPSSData->field_D91, sBoxCursorPosition);
            sPSSData->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8092E00(void)
{
    return sub_8092E20();
}

bool8 sub_8092E10(void)
{
    return sub_8092E54();
}

bool8 sub_8092E20(void)
{
    switch (sPSSData->field_CB4->pos2.y)
    {
    default:
        sPSSData->field_CB4->pos2.y++;
        break;
    case 0:
        sPSSData->field_CB4->pos2.y++;
        break;
    case 8:
        return FALSE;
    }

    return TRUE;
}

bool8 sub_8092E54(void)
{
    switch (sPSSData->field_CB4->pos2.y)
    {
    case 0:
        return FALSE;
    default:
        sPSSData->field_CB4->pos2.y--;
        break;
    }

    return TRUE;
}

void MoveMon(void)
{
    switch (sBoxCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        SetMovedMonData(TOTAL_BOXES_COUNT, sBoxCursorPosition);
        sub_8090CC0(MODE_PARTY, sBoxCursorPosition);
        break;
    case CURSOR_AREA_IN_BOX:
        if (sPSSData->inBoxMovingMode == 0)
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

void PlaceMon(void)
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

void SetMovedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        sPSSData->movingMon = gPlayerParty[sBoxCursorPosition];
    else
        BoxMonAtToMon(boxId, position, &sPSSData->movingMon);

    PurgeMonOrBoxMon(boxId, position);
    sMovingMonOrigBoxId = boxId;
    sMovingMonOrigBoxPos = position;
}

void SetPlacedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
    {
        gPlayerParty[position] = sPSSData->movingMon;
    }
    else
    {
        BoxMonRestorePP(&sPSSData->movingMon.box);
        SetBoxMonAt(boxId, position, &sPSSData->movingMon.box);
    }
}

void PurgeMonOrBoxMon(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        ZeroMonData(&gPlayerParty[position]);
    else
        ZeroBoxMonAt(boxId, position);
}

void SetShiftedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        sPSSData->field_2108 = gPlayerParty[position];
    else
        BoxMonAtToMon(boxId, position, &sPSSData->field_2108);

    SetPlacedMonData(boxId, position);
    sPSSData->movingMon = sPSSData->field_2108;
    SetCursorMonData(&sPSSData->movingMon, MODE_PARTY);
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

    StartSpriteAnim(sPSSData->field_CB4, 1);
    return TRUE;
}

void sub_8093174(void)
{
    StartSpriteAnim(sPSSData->field_CB4, 0);
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
    StringCopy(sPSSData->field_21E0, sPSSData->cursorMonNick);
}

bool8 sub_80931EC(void)
{
    if (!sub_8091084())
    {
        StartSpriteAnim(sPSSData->field_CB4, 0);
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
        StartSpriteAnim(sPSSData->field_CB4, 3);
}

void InitCanReleaseMonVars(void)
{
    u16 knownIdx;
    if (sIsMonBeingMoved)
    {
        sPSSData->field_2108 = sPSSData->movingMon;
        sPSSData->field_2170 = -1;
        sPSSData->field_2171 = -1;
    }
    else
    {
        if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
        {
            sPSSData->field_2108 = gPlayerParty[sBoxCursorPosition];
            sPSSData->field_2170 = TOTAL_BOXES_COUNT;
        }
        else
        {
            BoxMonAtToMon(StorageGetCurrentBox(), sBoxCursorPosition, &sPSSData->field_2108);
            sPSSData->field_2170 = StorageGetCurrentBox();
        }
        sPSSData->field_2171 = sBoxCursorPosition;
    }

    sPSSData->isSurfMon = FALSE;
    sPSSData->isDiveMon = FALSE;
    sPSSData->field_2176[0] = MOVE_SURF;
    sPSSData->field_2176[1] = MOVE_DIVE;
    sPSSData->field_2176[2] = MOVES_COUNT;
    knownIdx = GetMonData(&sPSSData->field_2108, MON_DATA_KNOWN_MOVES, (u8*)sPSSData->field_2176);
    sPSSData->isSurfMon = knownIdx & 1;
    sPSSData->isDiveMon = (knownIdx >> 1) & 1;
    if (sPSSData->isSurfMon || sPSSData->isDiveMon)
    {
        sPSSData->field_216D = 0;
    }
    else
    {
        sPSSData->field_216D = 1;
        sPSSData->field_216C = 1;
    }

    sPSSData->field_2172 = 0;
}

s8 RunCanReleaseMon(void)
{
    u16 i;
    u16 knownMoves;

    if (sPSSData->field_216D)
        return sPSSData->field_216C;

    switch (sPSSData->field_2172)
    {
    case 0:
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (sPSSData->field_2170 != TOTAL_BOXES_COUNT || sPSSData->field_2171 != i)
            {
                knownMoves = GetMonData(gPlayerParty + i, MON_DATA_KNOWN_MOVES, (u8*)sPSSData->field_2176);
                if (knownMoves & 1)
                    sPSSData->isSurfMon = FALSE;
                if (knownMoves & 2)
                    sPSSData->isDiveMon = FALSE;
            }
        }
        if (!(sPSSData->isSurfMon || sPSSData->isDiveMon))
        {
            sPSSData->field_216D = 1;
            sPSSData->field_216C = 1;
        }
        else
        {
            sPSSData->field_216E = 0;
            sPSSData->field_216F = 0;
            sPSSData->field_2172++;
        }
        break;
    case 1:
        for (i = 0; i < 5; i++)
        {
            knownMoves = GetAndCopyBoxMonDataAt(sPSSData->field_216E, sPSSData->field_216F, MON_DATA_KNOWN_MOVES, (u8*)sPSSData->field_2176);
            if (knownMoves != 0
                && !(sPSSData->field_2170 == sPSSData->field_216E && sPSSData->field_2171 == sPSSData->field_216F))
            {
                if (knownMoves & 1)
                    sPSSData->isSurfMon = FALSE;
                if (knownMoves & 2)
                    sPSSData->isDiveMon = FALSE;
            }
            if (++sPSSData->field_216F >= IN_BOX_COUNT)
            {
                sPSSData->field_216F = 0;
                if (++sPSSData->field_216E >= TOTAL_BOXES_COUNT)
                {
                    sPSSData->field_216D = 1;
                    sPSSData->field_216C = 0;
                    break;
                }
            }
        }
        if (!(sPSSData->isSurfMon || sPSSData->isDiveMon))
        {
            sPSSData->field_216D = 1;
            sPSSData->field_216C = 1;
        }
        break;
    }

    return -1;
}
