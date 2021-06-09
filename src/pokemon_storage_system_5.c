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
static EWRAM_DATA u8 sSavedCursorPosition = 0;

static void DoCursorNewPosUpdate(void);
static bool8 MonPlaceChange_Move(void);
static bool8 MonPlaceChange_Place(void);
static bool8 MonPlaceChange_Shift(void);
static bool8 MultiMonPlaceChange_Down(void);
static bool8 MultiMonPlaceChange_Up(void);
static bool8 MonPlaceChange_CursorDown(void);
static bool8 MonPlaceChange_CursorUp(void);
static void MoveMon(void);
static void PlaceMon(void);
static void SetMovingMonData(u8 boxId, u8 position);
static void SetPlacedMonData(u8 boxId, u8 cursorPos);
static void PurgeMonOrBoxMon(u8 boxId, u8 cursorPos);
static void SetShiftedMonData(u8 boxId, u8 cursorPos);
static void TryRefreshDisplayMon(void);
static void SetCursorMonData(void * cursorMon, u8 mode);
static void ReshowDisplayMon(void);
static u8 InBoxInput_Normal(void);
static u8 InBoxInput_GrabbingMultiple(void);
static u8 InBoxInput_MovingMultiple(void);
static void AddBoxMenu(void);
static bool8 SetSelectionMenuTexts(void);
static bool8 SetMenuTexts_Mon(void);
static bool8 SetMenuTexts_Item(void);
static void CreateCursorSprites(void);
static void ToggleCursorAutoAction(void);

static const u16 sHandCursorPalette[] = INCBIN_U16("graphics/interface/pss_unk_83D2BCC.gbapal");
static const u16 sHandCursorTiles[] = INCBIN_U16("graphics/interface/pss_unk_83D2BEC.4bpp");
static const u16 sHandCursorShadowTiles[] = INCBIN_U16("graphics/interface/pss_unk_83D33EC.4bpp");

//------------------------------------------------------------------------------
//  SECTION: Cursor movement
//
//  The functions below generally handle the cursor's movement, including
//  moving around the box and picking up/putting down Pokémon.
//------------------------------------------------------------------------------

void InitCursor(void)
{
    if (sStorage->boxOption != BOX_OPTION_DEPOSIT)
        sBoxCursorArea = CURSOR_AREA_IN_BOX;
    else
        sBoxCursorArea = CURSOR_AREA_IN_PARTY;

    sBoxCursorPosition = 0;
    sIsMonBeingMoved = FALSE;
    sMovingMonOrigBoxId = 0;
    sMovingMonOrigBoxPos = 0;
    sCanOnlyMove = FALSE;
    ClearSavedCursorPos();
    CreateCursorSprites();
    sStorage->cursorPrevHorizPos = 1;
    sStorage->inBoxMovingMode = 0;
    TryRefreshDisplayMon();
}

void InitCursorOnReopen(void)
{
    CreateCursorSprites();
    ReshowDisplayMon();
    sStorage->cursorPrevHorizPos = 1;
    sStorage->inBoxMovingMode = 0;
    if (sIsMonBeingMoved)
    {
        sStorage->movingMon = sMonBeingCarried;
        CreateMovingMonIcon();
    }
}

static void GetCursorCoordsByPos(u8 cursorArea, u8 cursorPosition, u16 *x, u16 *y)
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

static u16 GetSpeciesAtCursorPosition(void)
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

bool8 UpdateCursorPos(void)
{
    s16 tmp;

    if (sStorage->cursorMoveSteps == 0)
    {
        if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
            return FALSE;
        else
            return IsItemIconAnimActive();
    }
    else if (--sStorage->cursorMoveSteps != 0)
    {
        sStorage->cursorNewX += sStorage->cursorSpeedX;
        sStorage->cursorNewY += sStorage->cursorSpeedY;
        sStorage->cursorSprite->pos1.x = sStorage->cursorNewX >> 8;
        sStorage->cursorSprite->pos1.y = sStorage->cursorNewY >> 8;
        if (sStorage->cursorSprite->pos1.x > 0x100)
        {
            tmp = sStorage->cursorSprite->pos1.x - 0x100;
            sStorage->cursorSprite->pos1.x = tmp + 0x40;
        }
        if (sStorage->cursorSprite->pos1.x < 0x40)
        {
            tmp = 0x40 - sStorage->cursorSprite->pos1.x;
            sStorage->cursorSprite->pos1.x = 0x100 - tmp;
        }
        if (sStorage->cursorSprite->pos1.y > 0xb0)
        {
            tmp = sStorage->cursorSprite->pos1.y - 0xb0;
            sStorage->cursorSprite->pos1.y = tmp - 0x10;
        }
        if (sStorage->cursorSprite->pos1.y < -0x10)
        {
            tmp = -0x10 - sStorage->cursorSprite->pos1.y;
            sStorage->cursorSprite->pos1.y = 0xb0 - tmp;
        }
        if (sStorage->cursorFlipTimer && --sStorage->cursorFlipTimer == 0)
            sStorage->cursorSprite->vFlip = (sStorage->cursorSprite->vFlip == FALSE);
    }
    else
    {
        sStorage->cursorSprite->pos1.x = sStorage->cursorTargetX;
        sStorage->cursorSprite->pos1.y = sStorage->cursorTargetY;
        DoCursorNewPosUpdate();
    }

    return TRUE;
}

static void InitNewCursorPos(u8 newCurosrArea, u8 newCursorPosition)
{
    u16 x, y;

    GetCursorCoordsByPos(newCurosrArea, newCursorPosition, &x, &y);
    sStorage->newCursorArea = newCurosrArea;
    sStorage->newCursorPosition = newCursorPosition;
    sStorage->cursorTargetX = x;
    sStorage->cursorTargetY = y;
}

static void InitCursorMove(void)
{
    int yDistance, xDistance;

    if (sStorage->cursorVerticalWrap != 0 || sStorage->cursorHorizontalWrap != 0)
        sStorage->cursorMoveSteps = 12;
    else
        sStorage->cursorMoveSteps = 6;

    if (sStorage->cursorFlipTimer)
        sStorage->cursorFlipTimer = sStorage->cursorMoveSteps >> 1;

    switch (sStorage->cursorVerticalWrap)
    {
    default:
        yDistance = sStorage->cursorTargetY - sStorage->cursorSprite->pos1.y;
        break;
    case -1:
        yDistance = sStorage->cursorTargetY - 0xc0 - sStorage->cursorSprite->pos1.y;
        break;
    case 1:
        yDistance = sStorage->cursorTargetY + 0xc0 - sStorage->cursorSprite->pos1.y;
        break;
    }

    switch (sStorage->cursorHorizontalWrap)
    {
    default:
        xDistance = sStorage->cursorTargetX - sStorage->cursorSprite->pos1.x;
        break;
    case -1:
        xDistance = sStorage->cursorTargetX - 0xc0 - sStorage->cursorSprite->pos1.x;
        break;
    case 1:
        xDistance = sStorage->cursorTargetX + 0xc0 - sStorage->cursorSprite->pos1.x;
        break;
    }

    yDistance = Q_24_8(yDistance);
    xDistance = Q_24_8(xDistance);
    sStorage->cursorSpeedX = xDistance / sStorage->cursorMoveSteps;
    sStorage->cursorSpeedY = yDistance / sStorage->cursorMoveSteps;
    sStorage->cursorNewX = Q_24_8(sStorage->cursorSprite->pos1.x);
    sStorage->cursorNewY = Q_24_8(sStorage->cursorSprite->pos1.y);
}

static void SetCursorPosition(u8 newCurosrArea, u8 newCursorPosition)
{
    InitNewCursorPos(newCurosrArea, newCursorPosition);
    InitCursorMove();
    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        if (sStorage->inBoxMovingMode == 0 && !sIsMonBeingMoved)
            StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_STILL);
    }
    else
    {
        if (!IsActiveItemMoving())
            StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_STILL);
    }

    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        if (sBoxCursorArea == CURSOR_AREA_IN_BOX)
            TryHideItemIconAtPos(CURSOR_AREA_IN_BOX, sBoxCursorPosition);
        else if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
            TryHideItemIconAtPos(CURSOR_AREA_IN_PARTY, sBoxCursorPosition);

        if (newCurosrArea == CURSOR_AREA_IN_BOX)
            TryLoadItemIconAtPos(newCurosrArea, newCursorPosition);
        else if (newCurosrArea == CURSOR_AREA_IN_PARTY)
            TryLoadItemIconAtPos(newCurosrArea, newCursorPosition);
    }

    if (newCurosrArea == CURSOR_AREA_IN_PARTY && sBoxCursorArea != CURSOR_AREA_IN_PARTY)
    {
        sStorage->cursorPrevHorizPos = newCurosrArea;
        sStorage->cursorShadowSprite->invisible = TRUE;
    }

    switch (newCurosrArea)
    {
    case CURSOR_AREA_IN_PARTY:
    case CURSOR_AREA_BOX:
    case CURSOR_AREA_BUTTONS:
        sStorage->cursorSprite->oam.priority = 1;
        sStorage->cursorShadowSprite->invisible = TRUE;
        sStorage->cursorShadowSprite->oam.priority = 1;
        break;
    case CURSOR_AREA_IN_BOX:
        if (sStorage->inBoxMovingMode != 0)
        {
            sStorage->cursorSprite->oam.priority = 0;
            sStorage->cursorShadowSprite->invisible = TRUE;
        }
        else
        {
            sStorage->cursorSprite->oam.priority = 2;
            if (sBoxCursorArea == CURSOR_AREA_IN_BOX && sIsMonBeingMoved)
                SetMovingMonPriority(2);
        }
        break;
    }
}

static void DoCursorNewPosUpdate(void)
{
    sBoxCursorArea = sStorage->newCursorArea;
    sBoxCursorPosition = sStorage->newCursorPosition;
    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        if (sStorage->inBoxMovingMode == 0 && !sIsMonBeingMoved)
            StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_STILL);
    }
    else
    {
        if (!IsActiveItemMoving())
            StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_STILL);
    }

    TryRefreshDisplayMon();
    switch (sBoxCursorArea)
    {
    case CURSOR_AREA_BUTTONS:
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_BOX:
        AnimateBoxScrollArrows(TRUE);
        break;
    case CURSOR_AREA_IN_PARTY:
        sStorage->cursorShadowSprite->subpriority = 13;
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_IN_BOX:
        if (sStorage->inBoxMovingMode == 0)
        {
            sStorage->cursorSprite->oam.priority = 1;
            sStorage->cursorShadowSprite->oam.priority = 2;
            sStorage->cursorShadowSprite->subpriority = 21;
            sStorage->cursorShadowSprite->invisible = FALSE;
            SetMovingMonPriority(2);
        }
        break;
    }
}

void SetCursorInParty(void)
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
    if (sStorage->cursorSprite->vFlip)
        sStorage->cursorFlipTimer = 1;
    SetCursorPosition(CURSOR_AREA_IN_PARTY, partyCount);
}

void SetCursorBoxPosition(u8 cursorBoxPosition)
{
    SetCursorPosition(CURSOR_AREA_IN_BOX, cursorBoxPosition);
}

void ClearSavedCursorPos(void)
{
    sSavedCursorPosition = 0;
}

void SaveCursorPos(void)
{
    sSavedCursorPosition = sBoxCursorPosition;
}

u8 GetSavedCursorPos(void)
{
    return sSavedCursorPosition;
}

void InitMonPlaceChange(u8 a0)
{
    static bool8 (*const placeChangeFuncs[])(void) = {
        MonPlaceChange_Move,
        MonPlaceChange_Place,
        MonPlaceChange_Shift,
    };

    sStorage->monPlaceChangeFunc = placeChangeFuncs[a0];
    sStorage->monPlaceChangeState = 0;
}

void InitMultiMonPlaceChange(bool8 up)
{
    if (!up)
        sStorage->monPlaceChangeFunc = MultiMonPlaceChange_Down;
    else
        sStorage->monPlaceChangeFunc = MultiMonPlaceChange_Up;

    sStorage->monPlaceChangeState = 0;
}

bool8 DoMonPlaceChange(void)
{
    return sStorage->monPlaceChangeFunc();
}

static bool8 MonPlaceChange_Move(void)
{
    switch (sStorage->monPlaceChangeState)
    {
    case 0:
        if (sIsMonBeingMoved)
            return FALSE;
        StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_OPEN);
        sStorage->monPlaceChangeState++;
        break;
    case 1:
        if (!MonPlaceChange_CursorDown())
        {
            StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_FIST);
            MoveMon();
            sStorage->monPlaceChangeState++;
        }
        break;
    case 2:
        if (!MonPlaceChange_CursorUp())
            sStorage->monPlaceChangeState++;
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_Place(void)
{
    switch (sStorage->monPlaceChangeState)
    {
    case 0:
        if (!MonPlaceChange_CursorDown())
        {
            StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_OPEN);
            PlaceMon();
            sStorage->monPlaceChangeState++;
        }
        break;
    case 1:
        if (!MonPlaceChange_CursorUp())
        {
            StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_BOUNCE);
            sStorage->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_Shift(void)
{
    switch (sStorage->monPlaceChangeState)
    {
    case 0:
        switch (sBoxCursorArea)
        {
        case CURSOR_AREA_IN_PARTY:
            sStorage->shiftBoxId = TOTAL_BOXES_COUNT;
            break;
        case CURSOR_AREA_IN_BOX:
            sStorage->shiftBoxId = StorageGetCurrentBox();
            break;
        default:
            return FALSE;
        }
        StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_OPEN);
        SaveMonSpriteAtPos(sStorage->shiftBoxId, sBoxCursorPosition);
        sStorage->monPlaceChangeState++;
        break;
    case 1:
        if (!MoveShiftingMons())
        {
            StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_FIST);
            SetShiftedMonData(sStorage->shiftBoxId, sBoxCursorPosition);
            sStorage->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 MultiMonPlaceChange_Down(void)
{
    return MonPlaceChange_CursorDown();
}

static bool8 MultiMonPlaceChange_Up(void)
{
    return MonPlaceChange_CursorUp();
}

static bool8 MonPlaceChange_CursorDown(void)
{
    switch (sStorage->cursorSprite->pos2.y)
    {
    default:
        sStorage->cursorSprite->pos2.y++;
        break;
    case 0:
        sStorage->cursorSprite->pos2.y++;
        break;
    case 8: // Cursor has reched the bottom
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_CursorUp(void)
{
    switch (sStorage->cursorSprite->pos2.y)
    {
    case 0: // Cursor has reached the top
        return FALSE;
    default:
        sStorage->cursorSprite->pos2.y--;
        break;
    }

    return TRUE;
}

//------------------------------------------------------------------------------
//  SECTION: Pokémon data
//
//  The functions below handle moving Pokémon data around while using the PC,
//  including changing the positions of Pokémon, releasing Pokémon, viewing the
//  summary screen, and updating the display of the currently selected Pokémon.
//------------------------------------------------------------------------------

static void MoveMon(void)
{
    switch (sBoxCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        SetMovingMonData(TOTAL_BOXES_COUNT, sBoxCursorPosition);
        SetMovingMonSprite(MODE_PARTY, sBoxCursorPosition);
        break;
    case CURSOR_AREA_IN_BOX:
        if (sStorage->inBoxMovingMode == 0)
        {
            SetMovingMonData(StorageGetCurrentBox(), sBoxCursorPosition);
            SetMovingMonSprite(MODE_BOX, sBoxCursorPosition);
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
        SetPlacedMonSprite(TOTAL_BOXES_COUNT, sBoxCursorPosition);
        break;
    case CURSOR_AREA_IN_BOX:
        boxId = StorageGetCurrentBox();
        SetPlacedMonData(boxId, sBoxCursorPosition);
        SetPlacedMonSprite(boxId, sBoxCursorPosition);
        break;
    default:
        return;
    }

    sIsMonBeingMoved = FALSE;
}

void RefreshDisplayMon(void)
{
    TryRefreshDisplayMon();
}

static void SetMovingMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        sStorage->movingMon = gPlayerParty[sBoxCursorPosition];
    else
        BoxMonAtToMon(boxId, position, &sStorage->movingMon);

    PurgeMonOrBoxMon(boxId, position);
    sMovingMonOrigBoxId = boxId;
    sMovingMonOrigBoxPos = position;
}

static void SetPlacedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
    {
        gPlayerParty[position] = sStorage->movingMon;
    }
    else
    {
        BoxMonRestorePP(&sStorage->movingMon.box);
        SetBoxMonAt(boxId, position, &sStorage->movingMon.box);
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
        sStorage->tempMon = gPlayerParty[position];
    else
        BoxMonAtToMon(boxId, position, &sStorage->tempMon);

    SetPlacedMonData(boxId, position);
    sStorage->movingMon = sStorage->tempMon;
    SetCursorMonData(&sStorage->movingMon, MODE_PARTY);
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
        SetMovingMonData(TOTAL_BOXES_COUNT, sBoxCursorPosition);
        SetPlacedMonData(boxId, boxPosition);
        DestroyPartyMonIcon(sBoxCursorPosition);
    }

    if (boxId == StorageGetCurrentBox())
        CreateBoxMonIconAtPos(boxPosition);

    StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_STILL);
    return TRUE;
}

void ResetSelectionAfterDeposit(void)
{
    StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_BOUNCE);
    TryRefreshDisplayMon();
}

void InitReleaseMon(void)
{
    u8 mode;

    if (sIsMonBeingMoved)
        mode = MODE_MOVE;
    else if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
        mode = MODE_PARTY;
    else
        mode = MODE_BOX;

    SetReleaseMon(mode, sBoxCursorPosition);
    StringCopy(sStorage->releaseMonName, sStorage->cursorMonNick);
}

bool8 TryHideReleaseMon(void)
{
    if (!TryHideReleaseMonSprite())
    {
        StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_BOUNCE);
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

    DestroyReleaseMonIcon();
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
    TryRefreshDisplayMon();
}

void TrySetCursorFistAnim(void)
{
    if (sIsMonBeingMoved)
        StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_FIST);
}

void InitCanReleaseMonVars(void)
{
    u16 knownIdx;
    if (sIsMonBeingMoved)
    {
        sStorage->tempMon = sStorage->movingMon;
        sStorage->releaseBoxId = -1;
        sStorage->releaseBoxPos = -1;
    }
    else
    {
        if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
        {
            sStorage->tempMon = gPlayerParty[sBoxCursorPosition];
            sStorage->releaseBoxId = TOTAL_BOXES_COUNT;
        }
        else
        {
            BoxMonAtToMon(StorageGetCurrentBox(), sBoxCursorPosition, &sStorage->tempMon);
            sStorage->releaseBoxId = StorageGetCurrentBox();
        }
        sStorage->releaseBoxPos = sBoxCursorPosition;
    }

    sStorage->isSurfMon = FALSE;
    sStorage->isDiveMon = FALSE;
    sStorage->restrictedMoveList[0] = MOVE_SURF;
    sStorage->restrictedMoveList[1] = MOVE_DIVE;
    sStorage->restrictedMoveList[2] = MOVES_COUNT;
    knownIdx = GetMonData(&sStorage->tempMon, MON_DATA_KNOWN_MOVES, (u8*)sStorage->restrictedMoveList);
    sStorage->isSurfMon = knownIdx & 1;
    sStorage->isDiveMon = (knownIdx >> 1) & 1;
    if (sStorage->isSurfMon || sStorage->isDiveMon)
    {
        sStorage->releaseStatusResolved = FALSE;
    }
    else
    {
        sStorage->releaseStatusResolved = TRUE;
        sStorage->canReleaseMon = TRUE;
    }

    sStorage->releaseCheckState = 0;
}

s8 RunCanReleaseMon(void)
{
    u16 i;
    u16 knownMoves;

    if (sStorage->releaseStatusResolved)
        return sStorage->canReleaseMon;

    switch (sStorage->releaseCheckState)
    {
    case 0:
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (sStorage->releaseBoxId != TOTAL_BOXES_COUNT || sStorage->releaseBoxPos != i)
            {
                knownMoves = GetMonData(gPlayerParty + i, MON_DATA_KNOWN_MOVES, (u8*)sStorage->restrictedMoveList);
                if (knownMoves & 1)
                    sStorage->isSurfMon = FALSE;
                if (knownMoves & 2)
                    sStorage->isDiveMon = FALSE;
            }
        }
        if (!(sStorage->isSurfMon || sStorage->isDiveMon))
        {
            sStorage->releaseStatusResolved = TRUE;
            sStorage->canReleaseMon = TRUE;
        }
        else
        {
            sStorage->releaseCheckBoxId = 0;
            sStorage->releaseCheckBoxPos = 0;
            sStorage->releaseCheckState++;
        }
        break;
    case 1:
        for (i = 0; i < 5; i++)
        {
            knownMoves = GetAndCopyBoxMonDataAt(sStorage->releaseCheckBoxId, sStorage->releaseCheckBoxPos, MON_DATA_KNOWN_MOVES, (u8*)sStorage->restrictedMoveList);
            if (knownMoves != 0
                && !(sStorage->releaseBoxId == sStorage->releaseCheckBoxId && sStorage->releaseBoxPos == sStorage->releaseCheckBoxPos))
            {
                if (knownMoves & 1)
                    sStorage->isSurfMon = FALSE;
                if (knownMoves & 2)
                    sStorage->isDiveMon = FALSE;
            }
            if (++sStorage->releaseCheckBoxPos >= IN_BOX_COUNT)
            {
                sStorage->releaseCheckBoxPos = 0;
                if (++sStorage->releaseCheckBoxId >= TOTAL_BOXES_COUNT)
                {
                    sStorage->releaseStatusResolved = TRUE;
                    sStorage->canReleaseMon = FALSE;
                    break;
                }
            }
        }
        if (!(sStorage->isSurfMon || sStorage->isDiveMon))
        {
            sStorage->releaseStatusResolved = TRUE;
            sStorage->canReleaseMon = TRUE;
        }
        break;
    }

    return -1;
}

void SaveMovingMon(void)
{
    if (sIsMonBeingMoved)
        sMonBeingCarried = sStorage->movingMon;
}

void LoadSavedMovingMon(void)
{
    if (sIsMonBeingMoved)
    {
        if (sMovingMonOrigBoxId == TOTAL_BOXES_COUNT)
            sStorage->movingMon = sMonBeingCarried;
        else
            sStorage->movingMon.box = sMonBeingCarried.box;
    }
}

void InitSummaryScreenData(void)
{
    if (sIsMonBeingMoved)
    {
        SaveMovingMon();
        sStorage->summaryMon.mon = &sMonBeingCarried;
        sStorage->summaryStartPos = 0;
        sStorage->summaryMaxPos = 0;
        sStorage->summaryScreenMode = PSS_MODE_NORMAL;
    }
    else if (sBoxCursorArea == CURSOR_AREA_IN_PARTY)
    {
        sStorage->summaryMon.mon = gPlayerParty;
        sStorage->summaryStartPos = sBoxCursorPosition;
        sStorage->summaryMaxPos = CountPartyMons() - 1;
        sStorage->summaryScreenMode = PSS_MODE_NORMAL;
    }
    else
    {
        sStorage->summaryMon.box = GetBoxedMonPtr(StorageGetCurrentBox(), 0);
        sStorage->summaryStartPos = sBoxCursorPosition;
        sStorage->summaryMaxPos = IN_BOX_COUNT - 1;
        sStorage->summaryScreenMode = PSS_MODE_BOX;
    }
}

void SetSelectionAfterSummaryScreen(void)
{
    if (sIsMonBeingMoved)
        LoadSavedMovingMon();
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
    sStorage->cursorMonMarkings = markings;
    if (sIsMonBeingMoved)
    {
        SetMonData(&sStorage->movingMon, MON_DATA_MARKINGS, &markings);
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
            if (sStorage->cursorMonIsEgg || GetMonData(&sStorage->movingMon, MON_DATA_HP) == 0)
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

bool8 IsCursorOnBox(void)
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

static void TryRefreshDisplayMon(void)
{
    sStorage->setMosaic = (sIsMonBeingMoved == FALSE);
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
            SetCursorMonData(NULL, MODE_MOVE);
            break;
        case CURSOR_AREA_IN_BOX:
            SetCursorMonData(GetBoxedMonPtr(StorageGetCurrentBox(), sBoxCursorPosition), MODE_BOX);
            break;
        }
    }
}

static void ReshowDisplayMon(void)
{
    if (sIsMonBeingMoved)
        SetCursorMonData(&sMonBeingCarried, MODE_PARTY);
    else
        TryRefreshDisplayMon();
}

static void SetCursorMonData(void *pokemon, u8 mode)
{
    u8 *txtPtr;
    u16 gender;
    bool8 sanityIsBagEgg;

    sStorage->displayMonItemId = 0;
    gender = MON_MALE;
    sanityIsBagEgg = FALSE;
    if (mode == MODE_PARTY)
    {
        struct Pokemon *mon = (struct Pokemon *)pokemon;

        sStorage->displayMonSpecies = GetMonData(mon, MON_DATA_SPECIES2);
        if (sStorage->displayMonSpecies != SPECIES_NONE)
        {
            sanityIsBagEgg = GetMonData(mon, MON_DATA_SANITY_IS_BAD_EGG);
            if (sanityIsBagEgg)
                sStorage->cursorMonIsEgg = TRUE;
            else
                sStorage->cursorMonIsEgg = GetMonData(mon, MON_DATA_IS_EGG);

            GetMonData(mon, MON_DATA_NICKNAME, sStorage->cursorMonNick);
            StringGetEnd10(sStorage->cursorMonNick);
            sStorage->cursorMonLevel = GetMonData(mon, MON_DATA_LEVEL);
            sStorage->cursorMonMarkings = GetMonData(mon, MON_DATA_MARKINGS);
            sStorage->displayMonPersonality = GetMonData(mon, MON_DATA_PERSONALITY);
            sStorage->displayMonPalette = GetMonFrontSpritePal(mon);
            gender = GetMonGender(mon);
            sStorage->displayMonItemId = GetMonData(mon, MON_DATA_HELD_ITEM);
        }
    }
    else if (mode == MODE_BOX)
    {
        struct BoxPokemon *boxMon = (struct BoxPokemon *)pokemon;

        sStorage->displayMonSpecies = GetBoxMonData(pokemon, MON_DATA_SPECIES2);
        if (sStorage->displayMonSpecies != SPECIES_NONE)
        {
            u32 otId = GetBoxMonData(boxMon, MON_DATA_OT_ID);
            sanityIsBagEgg = GetBoxMonData(boxMon, MON_DATA_SANITY_IS_BAD_EGG);
            if (sanityIsBagEgg)
                sStorage->cursorMonIsEgg = TRUE;
            else
                sStorage->cursorMonIsEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG);


            GetBoxMonData(boxMon, MON_DATA_NICKNAME, sStorage->cursorMonNick);
            StringGetEnd10(sStorage->cursorMonNick);
            sStorage->cursorMonLevel = GetLevelFromBoxMonExp(boxMon);
            sStorage->cursorMonMarkings = GetBoxMonData(boxMon, MON_DATA_MARKINGS);
            sStorage->displayMonPersonality = GetBoxMonData(boxMon, MON_DATA_PERSONALITY);
            sStorage->displayMonPalette = GetMonSpritePalFromSpeciesAndPersonality(sStorage->displayMonSpecies, otId, sStorage->displayMonPersonality);
            gender = GetGenderFromSpeciesAndPersonality(sStorage->displayMonSpecies, sStorage->displayMonPersonality);
            sStorage->displayMonItemId = GetBoxMonData(boxMon, MON_DATA_HELD_ITEM);
        }
    }
    else
    {
        sStorage->displayMonSpecies = SPECIES_NONE;
        sStorage->displayMonItemId = 0;
    }

    if (sStorage->displayMonSpecies == SPECIES_NONE)
    {
        StringFill(sStorage->cursorMonNick, CHAR_SPACE, 5);
        StringFill(sStorage->cursorMonTexts[0], CHAR_SPACE, 8);
        StringFill(sStorage->cursorMonTexts[1], CHAR_SPACE, 8);
        StringFill(sStorage->cursorMonTexts[2], CHAR_SPACE, 8);
        StringFill(sStorage->cursorMonTexts[3], CHAR_SPACE, 8);
    }
    else if (sStorage->cursorMonIsEgg)
    {
        if (sanityIsBagEgg)
            StringCopyPadded(sStorage->cursorMonTexts[0], sStorage->cursorMonNick, CHAR_SPACE, 5);
        else
            StringCopyPadded(sStorage->cursorMonTexts[0], gText_EggNickname, CHAR_SPACE, 8);

        StringFill(sStorage->cursorMonTexts[1], CHAR_SPACE, 8);
        StringFill(sStorage->cursorMonTexts[2], CHAR_SPACE, 8);
        StringFill(sStorage->cursorMonTexts[3], CHAR_SPACE, 8);
    }
    else
    {
        if (sStorage->displayMonSpecies == SPECIES_NIDORAN_F || sStorage->displayMonSpecies == SPECIES_NIDORAN_M)
            gender = MON_GENDERLESS;

        StringCopyPadded(sStorage->cursorMonTexts[0], sStorage->cursorMonNick, CHAR_SPACE, 5);

        txtPtr = sStorage->cursorMonTexts[1];
        *(txtPtr)++ = CHAR_SLASH;
        StringCopyPadded(txtPtr, gSpeciesNames[sStorage->displayMonSpecies], CHAR_SPACE, 5);

        txtPtr = sStorage->cursorMonTexts[2];
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
        *(txtPtr++) = CHAR_EXTRA_EMOJI;
        *(txtPtr++) = 5; // LV_2

        txtPtr = ConvertIntToDecimalStringN(txtPtr, sStorage->cursorMonLevel, STR_CONV_MODE_LEFT_ALIGN, 3);
        txtPtr[0] = CHAR_SPACE;
        txtPtr[1] = EOS;

        if (sStorage->displayMonItemId != 0)
            StringCopyPadded(sStorage->cursorMonTexts[3], ItemId_GetName(sStorage->displayMonItemId), CHAR_SPACE, 8);
        else
            StringFill(sStorage->cursorMonTexts[3], CHAR_SPACE, 8);
    }
}

static u8 HandleInput_InBox(void)
{
    switch (sStorage->inBoxMovingMode)
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
        sStorage->cursorVerticalWrap = 0;
        sStorage->cursorHorizontalWrap = 0;
        sStorage->cursorFlipTimer = 0;
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
                sStorage->cursorVerticalWrap = 1;
                sStorage->cursorFlipTimer = 1;
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
                sStorage->cursorHorizontalWrap = -1;
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
                sStorage->cursorHorizontalWrap = 1;
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

        if ((JOY_NEW(A_BUTTON)) && SetSelectionMenuTexts())
        {
            if (!sCanOnlyMove)
                return 8;

            if (sStorage->boxOption != BOX_OPTION_MOVE_MONS || sIsMonBeingMoved == TRUE)
            {
                switch (GetMenuItemTextId(0))
                {
                case MENU_STORE:
                    return 11;
                case MENU_WITHDRAW:
                    return 12;
                case MENU_MOVE:
                    return 13;
                case MENU_SHIFT:
                    return 14;
                case MENU_PLACE:
                    return 15;
                case MENU_TAKE:
                    return 16;
                case MENU_GIVE:
                    return 17;
                case MENU_SWITCH:
                    return 18;
                }
            }
            else
            {
                sStorage->inBoxMovingMode = 1;
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
            ToggleCursorAutoAction();
            return 0;
        }

        retVal = 0;

    } while (0);

    if (retVal)
        SetCursorPosition(cursorArea, cursorPosition);

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
                SetCursorPosition(CURSOR_AREA_IN_BOX, sBoxCursorPosition - IN_BOX_ROWS);
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
                SetCursorPosition(CURSOR_AREA_IN_BOX, sBoxCursorPosition + IN_BOX_ROWS);
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
                SetCursorPosition(CURSOR_AREA_IN_BOX, sBoxCursorPosition - 1);
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
                SetCursorPosition(CURSOR_AREA_IN_BOX, sBoxCursorPosition + 1);
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
        if (MultiMove_GetOrigin() == sBoxCursorPosition)
        {
            sStorage->inBoxMovingMode = 0;
            sStorage->cursorShadowSprite->invisible = FALSE;
            return 22;
        }
        else
        {
            sIsMonBeingMoved = (sStorage->displayMonSpecies != SPECIES_NONE);
            sStorage->inBoxMovingMode = 2;
            sMovingMonOrigBoxId = StorageGetCurrentBox();
            return 23;
        }
    }
}

static u8 InBoxInput_MovingMultiple(void)
{
    if (JOY_REPT(DPAD_UP))
    {
        if (MultiMove_TryMoveGroup(0))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sBoxCursorPosition - IN_BOX_ROWS);
            return 25;
        }
        else
        {
            return 24;
        }
    }
    else if (JOY_REPT(DPAD_DOWN))
    {
        if (MultiMove_TryMoveGroup(1))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sBoxCursorPosition + IN_BOX_ROWS);
            return 25;
        }
        else
        {
            return 24;
        }
    }
    else if (JOY_REPT(DPAD_LEFT))
    {
        if (MultiMove_TryMoveGroup(2))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sBoxCursorPosition - 1);
            return 25;
        }
        else
        {
            return 10;
        }
    }
    else if (JOY_REPT(DPAD_RIGHT))
    {
        if (MultiMove_TryMoveGroup(3))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sBoxCursorPosition + 1);
            return 25;
        }
        else
        {
            return 9;
        }
    }
    else if (JOY_NEW(A_BUTTON))
    {
        if (MultiMove_CanPlaceSelection())
        {
            sIsMonBeingMoved = FALSE;
            sStorage->inBoxMovingMode = 0;
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
        sStorage->cursorHorizontalWrap = 0;
        sStorage->cursorVerticalWrap = 0;
        sStorage->cursorFlipTimer = 0;
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
            sStorage->cursorPrevHorizPos = sBoxCursorPosition;
            cursorPosition = 0;
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            if (sBoxCursorPosition == 0)
            {
                retVal = 1;
                cursorPosition = sStorage->cursorPrevHorizPos;
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
                if (sStorage->boxOption == BOX_OPTION_DEPOSIT)
                    return 4;

                gotoBox = TRUE;
            }
            else if (SetSelectionMenuTexts())
            {
                if (!sCanOnlyMove)
                    return 8;

                switch (GetMenuItemTextId(0))
                {
                case MENU_STORE:
                    return 11;
                case MENU_WITHDRAW:
                    return 12;
                case MENU_MOVE:
                    return 13;
                case MENU_SHIFT:
                    return 14;
                case MENU_PLACE:
                    return 15;
                case MENU_TAKE:
                    return 16;
                case MENU_GIVE:
                    return 17;
                case MENU_SWITCH:
                    return 18;
                }
            }
        }

        if (JOY_NEW(B_BUTTON))
        {
            if (sStorage->boxOption == BOX_OPTION_DEPOSIT)
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
            ToggleCursorAutoAction();
            return 0;
        }

    } while (0);

    if (retVal != 0)
    {
        if (retVal != 6)
            SetCursorPosition(cursorArea, cursorPosition);
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
        sStorage->cursorHorizontalWrap = 0;
        sStorage->cursorVerticalWrap = 0;
        sStorage->cursorFlipTimer = 0;

        if (JOY_REPT(DPAD_UP))
        {
            retVal = 1;
            cursorArea = CURSOR_AREA_BUTTONS;
            cursorPosition = 0;
            sStorage->cursorFlipTimer = 1;
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
            ToggleCursorAutoAction();
            return 0;
        }

        retVal = 0;

    } while (0);

    if (retVal)
    {
        if (cursorArea != CURSOR_AREA_BOX)
            AnimateBoxScrollArrows(FALSE);
        SetCursorPosition(cursorArea, cursorPosition);
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
        sStorage->cursorHorizontalWrap = 0;
        sStorage->cursorVerticalWrap = 0;
        sStorage->cursorFlipTimer = 0;

        if (JOY_REPT(DPAD_UP))
        {
            retVal = 1;
            cursorArea = CURSOR_AREA_IN_BOX;
            sStorage->cursorVerticalWrap = -1;
            if (sBoxCursorPosition == 0)
                cursorPosition = IN_BOX_COUNT - 1 - 5;
            else
                cursorPosition = IN_BOX_COUNT - 1;
            sStorage->cursorFlipTimer = 1;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN | START_BUTTON))
        {
            retVal = 1;
            cursorArea = CURSOR_AREA_BOX;
            cursorPosition = 0;
            sStorage->cursorFlipTimer = 1;
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
            ToggleCursorAutoAction();
            return 0;
        }

        retVal = 0;
    } while (0);

    if (retVal != 0)
        SetCursorPosition(cursorArea, cursorPosition);

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
    SetMenuText(MENU_JUMP);
    SetMenuText(MENU_WALLPAPER);
    SetMenuText(MENU_NAME);
    SetMenuText(MENU_CANCEL);
}

static bool8 SetSelectionMenuTexts(void)
{
    InitMenu();
    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
        return SetMenuTexts_Mon();
    else
        return SetMenuTexts_Item();
}

static bool8 SetMenuTexts_Mon(void)
{
    u16 var0 = GetSpeciesAtCursorPosition();

    switch (sStorage->boxOption)
    {
    case BOX_OPTION_DEPOSIT:
        if (var0)
            SetMenuText(MENU_STORE);
        else
            return FALSE;
        break;
    case BOX_OPTION_WITHDRAW:
        if (var0)
            SetMenuText(MENU_WITHDRAW);
        else
            return FALSE;
        break;
    case BOX_OPTION_MOVE_MONS:
        if (sIsMonBeingMoved)
        {
            if (var0)
                SetMenuText(MENU_SHIFT);
            else
                SetMenuText(MENU_PLACE);
        }
        else
        {
            if (var0)
                SetMenuText(MENU_MOVE);
            else
                return FALSE;
        }
        break;
    case BOX_OPTION_MOVE_ITEMS:
    default:
        return FALSE;
    }

    SetMenuText(MENU_SUMMARY);
    if (sStorage->boxOption == BOX_OPTION_MOVE_MONS)
    {
        if (!sBoxCursorArea)
            SetMenuText(MENU_WITHDRAW);
        else
            SetMenuText(MENU_STORE);
    }

    SetMenuText(MENU_MARK);
    SetMenuText(MENU_RELEASE);
    SetMenuText(MENU_CANCEL);
    return TRUE;
}

static bool8 SetMenuTexts_Item(void)
{
    if (sStorage->displayMonSpecies == SPECIES_EGG)
        return FALSE;

    if (!IsActiveItemMoving())
    {
        if (sStorage->displayMonItemId == ITEM_NONE)
        {
            if (sStorage->displayMonSpecies == SPECIES_NONE)
                return FALSE;

            SetMenuText(MENU_GIVE_2);
        }
        else
        {
            if (!ItemIsMail(sStorage->displayMonItemId))
            {
                SetMenuText(MENU_TAKE);
                SetMenuText(MENU_BAG);
            }
            SetMenuText(MENU_INFO);
        }
    }
    else
    {
        if (sStorage->displayMonItemId == ITEM_NONE)
        {
            if (sStorage->displayMonSpecies == SPECIES_NONE)
                return FALSE;

            SetMenuText(MENU_GIVE);
        }
        else
        {
            if (ItemIsMail(sStorage->displayMonItemId) == TRUE)
                return FALSE;

            SetMenuText(MENU_SWITCH);
        }
    }

    SetMenuText(MENU_CANCEL);
    return TRUE;
}

//------------------------------------------------------------------------------
//  SECTION: Cursor
//
//  The functions below handle a few of the generic cursor features.
//------------------------------------------------------------------------------

static void SpriteCB_CursorShadow(struct Sprite *sprite)
{
    sprite->pos1.x = sStorage->cursorSprite->pos1.x;
    sprite->pos1.y = sStorage->cursorSprite->pos1.y + 20;
}

static void CreateCursorSprites(void)
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
        .callback = SpriteCB_CursorShadow,
    };

    LoadSpriteSheets(spriteSheets);
    LoadSpritePalettes(spritePalettes);
    sStorage->cursorPalNums[0] = IndexOfSpritePaletteTag(TAG_PAL_WAVEFORM);
    sStorage->cursorPalNums[1] = IndexOfSpritePaletteTag(TAG_PAL_DAC7);

    GetCursorCoordsByPos(sBoxCursorArea, sBoxCursorPosition, &x, &y);
    spriteId = CreateSprite(&gSpriteTemplate_857BA50, x, y, 6);
    if (spriteId != MAX_SPRITES)
    {
        sStorage->cursorSprite = &gSprites[spriteId];
        sStorage->cursorSprite->oam.paletteNum = sStorage->cursorPalNums[sCanOnlyMove];
        sStorage->cursorSprite->oam.priority = 1;
        if (sIsMonBeingMoved)
            StartSpriteAnim(sStorage->cursorSprite, CURSOR_ANIM_FIST);
    }
    else
    {
        sStorage->cursorSprite = NULL;
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
        sStorage->cursorShadowSprite = &gSprites[spriteId];
        sStorage->cursorShadowSprite->oam.priority = priority;
        if (sBoxCursorArea)
            sStorage->cursorShadowSprite->invisible = 1;
    }
    else
    {
        sStorage->cursorShadowSprite = NULL;
    }
}

static void ToggleCursorAutoAction(void)
{
    sCanOnlyMove = !sCanOnlyMove;
    sStorage->cursorSprite->oam.paletteNum = sStorage->cursorPalNums[sCanOnlyMove];
}

u8 GetBoxCursorPosition(void)
{
    return sBoxCursorPosition;
}

void GetCursorBoxColumnAndRow(u8 *col_p, u8 *row_p)
{
    if (sBoxCursorArea == CURSOR_AREA_IN_BOX)
    {
        *col_p = sBoxCursorPosition % IN_BOX_ROWS;
        *row_p = sBoxCursorPosition / IN_BOX_ROWS;
    }
    else
    {
        *col_p = 0;
        *row_p = 0;
    }
}

void StartCursorAnim(u8 animNum)
{
    StartSpriteAnim(sStorage->cursorSprite, animNum);
}

u8 PSS_GetMovingMonOrigBoxId(void)
{
    return sMovingMonOrigBoxId;
}

void SetCursorPriorityTo1(void)
{
    sStorage->cursorSprite->oam.priority = 1;
}

void TryHideItemAtCursor(void)
{
    if (sBoxCursorArea == CURSOR_AREA_IN_BOX)
        TryHideItemIconAtPos(CURSOR_AREA_IN_BOX, sBoxCursorPosition);
}

void TryShowItemAtCursor(void)
{
    if (sBoxCursorArea == CURSOR_AREA_IN_BOX)
        TryLoadItemIconAtPos(CURSOR_AREA_IN_BOX, sBoxCursorPosition);
}
