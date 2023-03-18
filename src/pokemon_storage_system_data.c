#include "global.h"
#include "gflib.h"
#include "data.h"
#include "item.h"
#include "mail_data.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "pokemon_storage_system_internal.h"
#include "pokemon_summary_screen.h"
#include "strings.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/songs.h"

static EWRAM_DATA struct Pokemon sMonBeingCarried = {};
static EWRAM_DATA s8 sCursorArea = 0;
static EWRAM_DATA s8 sCursorPosition = 0;
static EWRAM_DATA bool8 sIsMonBeingMoved = FALSE;
static EWRAM_DATA u8 sMovingMonOrigBoxId = 0;
static EWRAM_DATA u8 sMovingMonOrigBoxPos = 0;
static EWRAM_DATA bool8 sInMultiMoveMode = FALSE;
static EWRAM_DATA u8 sSavedCursorPosition = 0;

static void DoCursorNewPosUpdate(void);
static bool8 MonPlaceChange_Grab(void);
static bool8 MonPlaceChange_Place(void);
static bool8 MonPlaceChange_Shift(void);
static bool8 MonPlaceChange_DoMoveCursorDown(void);
static bool8 MonPlaceChange_DoMoveCursorUp(void);
static bool8 MonPlaceChange_MoveCursorDown(void);
static bool8 MonPlaceChange_MoveCursorUp(void);
static void MoveMon(void);
static void PlaceMon(void);
static void SetMovedMonData(u8 boxId, u8 cursorPos);
static void SetPlacedMonData(u8 boxId, u8 cursorPos);
static void PurgeMonOrBoxMon(u8 boxId, u8 cursorPos);
static void SetShiftedMonData(u8 boxId, u8 cursorPos);
static void TrySetDisplayMonData(void);
static void SetDisplayMonData(void *pokemon, u8 mode);
static void ReshowDisplayMon(void);
static u8 HandleInput_InBox_Normal(void);
static u8 HandleInput_InBox_GrabbingMultiple(void);
static u8 HandleInput_InBox_MovingMultiple(void);
static void AddBoxMenu(void);
static bool8 SetSelectionMenuTexts(void);
static bool8 SetMenuTextsForMon(void);
static bool8 SetMenuTextsForItem(void);
static void CreateCursorSprites(void);
static void ToggleCursorMultiMoveMode(void);

static const u16 sPokeStorageMisc1Pal[] = INCBIN_U16("graphics/pokemon_storage/misc1.gbapal");
static const u16 sHandCursorTiles[] = INCBIN_U16("graphics/pokemon_storage/cursor.4bpp");
static const u16 sHandCursorShadowTiles[] = INCBIN_U16("graphics/pokemon_storage/cursor_shadow.4bpp");

// Modes for selecting and moving Pokémon in the box. Multiple Pokémon can be
// selected by pressing the Select button to change the cursor, then holding
// down the A button while moving the cursor around. This is
// MOVE_MODE_MULTIPLE_SELECTING. After releasing the A button, those Pokémon
// will be picked up and can be moved around as a single unit. This is
// MOVE_MODE_MULTIPLE_MOVING.
enum
{
    MOVE_MODE_NORMAL,
    MOVE_MODE_MULTIPLE_SELECTING,
    MOVE_MODE_MULTIPLE_MOVING,
};

void InitCursor(void)
{
    if (gStorage->boxOption != OPTION_DEPOSIT)
        sCursorArea = CURSOR_AREA_IN_BOX;
    else
        sCursorArea = CURSOR_AREA_IN_PARTY;

    sCursorPosition = 0;
    sIsMonBeingMoved = FALSE;
    sMovingMonOrigBoxId = 0;
    sMovingMonOrigBoxPos = 0;
    sInMultiMoveMode = FALSE;
    ClearSavedCursorPos();
    CreateCursorSprites();
    gStorage->cursorPrevPartyPos = 1;
    gStorage->inBoxMovingMode = MOVE_MODE_NORMAL;
    TrySetDisplayMonData();
}

void InitCursorOnReopen(void)
{
    CreateCursorSprites();
    ReshowDisplayMon();
    gStorage->cursorPrevPartyPos = 1;
    gStorage->inBoxMovingMode = MOVE_MODE_NORMAL;
    if (sIsMonBeingMoved)
    {
        gStorage->movingMon = sMonBeingCarried;
        CreateMovingMonIcon();
    }
}

static void GetCursorCoordsByPos(u8 cursorArea, u8 cursorPosition, u16 *x, u16 *y)
{
    switch (cursorArea)
    {
    case CURSOR_AREA_IN_BOX:
        *x = (cursorPosition % IN_BOX_COLUMNS) * 24 + 100;
        *y = (cursorPosition / IN_BOX_COLUMNS) * 24 +  32;
        break;
    case CURSOR_AREA_IN_PARTY:
        if (cursorPosition == 0)
        {
            *x = 104;
            *y = 52;
        }
        else if (cursorPosition == PARTY_SIZE)
        {
            *x = 152;
            *y = 132;
        }
        else
        {
            *x = 152;
            *y = (cursorPosition - 1) * 24 + 4;
        }
        break;
    case CURSOR_AREA_BOX_TITLE:
        *x = 162;
        *y = 12;
        break;
    case CURSOR_AREA_BUTTONS:
        *y = sIsMonBeingMoved ? 8 : 14;
        *x = cursorPosition * 88 + 120;
        break;
    case 4:
        *x = 160;
        *y = 96;
        break;
    }
}

static u16 GetSpeciesAtCursorPosition(void)
{
    switch (sCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        return GetMonData(&gPlayerParty[sCursorPosition], MON_DATA_SPECIES);
    case CURSOR_AREA_IN_BOX:
        return GetCurrentBoxMonData(sCursorPosition, MON_DATA_SPECIES);
    default:
        return SPECIES_NONE;
    }
}

bool8 UpdateCursorPos(void)
{
    s16 tmp;

    if (gStorage->cursorMoveSteps == 0)
    {
        if (gStorage->boxOption != OPTION_MOVE_ITEMS)
            return FALSE;
        else
            return IsItemIconAnimActive();
    }
    else if (--gStorage->cursorMoveSteps != 0)
    {
        // Update position toward target
        gStorage->cursorNewX += gStorage->cursorSpeedX;
        gStorage->cursorNewY += gStorage->cursorSpeedY;
        gStorage->cursorSprite->x = gStorage->cursorNewX >> 8;
        gStorage->cursorSprite->y = gStorage->cursorNewY >> 8;

        // Limit cursor on right
        if (gStorage->cursorSprite->x > DISPLAY_WIDTH + 16)
        {
            tmp = gStorage->cursorSprite->x - (DISPLAY_WIDTH + 16);
            gStorage->cursorSprite->x = tmp + 64;
        }

        // Limit cursor on left
        if (gStorage->cursorSprite->x < 64)
        {
            tmp = 64 - gStorage->cursorSprite->x;
            gStorage->cursorSprite->x = DISPLAY_WIDTH + 16 - tmp;
        }

        // Limit cursor on bottom
        if (gStorage->cursorSprite->y > DISPLAY_HEIGHT + 16)
        {
            tmp = gStorage->cursorSprite->y - (DISPLAY_HEIGHT + 16);
            gStorage->cursorSprite->y = tmp - 16;
        }

        // Limit cursor on top
        if (gStorage->cursorSprite->y < -16)
        {
            tmp = -16 - gStorage->cursorSprite->y;
            gStorage->cursorSprite->y = DISPLAY_HEIGHT + 16 - tmp;
        }

        // Cursor flips vertically when moving on/off the top buttons
        if (gStorage->cursorFlipTimer && --gStorage->cursorFlipTimer == 0)
            gStorage->cursorSprite->vFlip = (gStorage->cursorSprite->vFlip == FALSE);
    }
    else
    {
        // Time is up for cursor movement, make sure it's exactly at target
        gStorage->cursorSprite->x = gStorage->cursorTargetX;
        gStorage->cursorSprite->y = gStorage->cursorTargetY;
        DoCursorNewPosUpdate();
    }

    return TRUE;
}

static void InitNewCursorPos(u8 newCursorArea, u8 newCursorPosition)
{
    u16 x, y;

    GetCursorCoordsByPos(newCursorArea, newCursorPosition, &x, &y);
    gStorage->newCursorArea = newCursorArea;
    gStorage->newCursorPosition = newCursorPosition;
    gStorage->cursorTargetX = x;
    gStorage->cursorTargetY = y;
}

static void InitCursorMove(void)
{
    int yDistance, xDistance;

    if (gStorage->cursorVerticalWrap != 0 || gStorage->cursorHorizontalWrap != 0)
        gStorage->cursorMoveSteps = 12;
    else
        gStorage->cursorMoveSteps = 6;

    if (gStorage->cursorFlipTimer)
        gStorage->cursorFlipTimer = gStorage->cursorMoveSteps / 2;

    switch (gStorage->cursorVerticalWrap)
    {
    default:
        yDistance = gStorage->cursorTargetY - gStorage->cursorSprite->y;
        break;
    case -1:
        yDistance = gStorage->cursorTargetY - 192 - gStorage->cursorSprite->y;
        break;
    case 1:
        yDistance = gStorage->cursorTargetY + 192 - gStorage->cursorSprite->y;
        break;
    }

    switch (gStorage->cursorHorizontalWrap)
    {
    default:
        xDistance = gStorage->cursorTargetX - gStorage->cursorSprite->x;
        break;
    case -1:
        xDistance = gStorage->cursorTargetX - 192 - gStorage->cursorSprite->x;
        break;
    case 1:
        xDistance = gStorage->cursorTargetX + 192 - gStorage->cursorSprite->x;
        break;
    }

    yDistance <<= 8;
    xDistance <<= 8;
    gStorage->cursorSpeedX = xDistance / gStorage->cursorMoveSteps;
    gStorage->cursorSpeedY = yDistance / gStorage->cursorMoveSteps;
    gStorage->cursorNewX = gStorage->cursorSprite->x << 8;
    gStorage->cursorNewY = gStorage->cursorSprite->y << 8;
}

static void SetCursorPosition(u8 newCursorArea, u8 newCursorPosition)
{
    InitNewCursorPos(newCursorArea, newCursorPosition);
    InitCursorMove();
    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
    {
        if (gStorage->inBoxMovingMode == MOVE_MODE_NORMAL && !sIsMonBeingMoved)
            StartSpriteAnim(gStorage->cursorSprite, 1);
    }
    else
    {
        if (!IsActiveItemMoving())
            StartSpriteAnim(gStorage->cursorSprite, 1);
    }

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        if (sCursorArea == CURSOR_AREA_IN_BOX)
            TryHideItemIconAtPos(CURSOR_AREA_IN_BOX, sCursorPosition);
        else if (sCursorArea == CURSOR_AREA_IN_PARTY)
            TryHideItemIconAtPos(CURSOR_AREA_IN_PARTY, sCursorPosition);

        if (newCursorArea == CURSOR_AREA_IN_BOX)
            TryLoadItemIconAtPos(newCursorArea, newCursorPosition);
        else if (newCursorArea == CURSOR_AREA_IN_PARTY)
            TryLoadItemIconAtPos(newCursorArea, newCursorPosition);
    }

    if (newCursorArea == CURSOR_AREA_IN_PARTY && sCursorArea != CURSOR_AREA_IN_PARTY)
    {
        gStorage->cursorPrevPartyPos = 1;
        gStorage->cursorShadowSprite->invisible = TRUE;
    }

    switch (newCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
    case CURSOR_AREA_BOX_TITLE:
    case CURSOR_AREA_BUTTONS:
        gStorage->cursorSprite->oam.priority = 1;
        gStorage->cursorShadowSprite->invisible = TRUE;
        gStorage->cursorShadowSprite->oam.priority = 1;
        break;
    case CURSOR_AREA_IN_BOX:
        if (gStorage->inBoxMovingMode != MOVE_MODE_NORMAL)
        {
            gStorage->cursorSprite->oam.priority = 0;
            gStorage->cursorShadowSprite->invisible = TRUE;
        }
        else
        {
            gStorage->cursorSprite->oam.priority = 2;
            if (sCursorArea == CURSOR_AREA_IN_BOX && sIsMonBeingMoved)
                SetMovingMonPriority(2);
        }
        break;
    }
}

static void DoCursorNewPosUpdate(void)
{
    sCursorArea = gStorage->newCursorArea;
    sCursorPosition = gStorage->newCursorPosition;
    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
    {
        if (gStorage->inBoxMovingMode == MOVE_MODE_NORMAL && !sIsMonBeingMoved)
            StartSpriteAnim(gStorage->cursorSprite, 1);
    }
    else if (!IsActiveItemMoving())
        StartSpriteAnim(gStorage->cursorSprite, 1);

    TrySetDisplayMonData();
    switch (sCursorArea)
    {
    case CURSOR_AREA_BUTTONS:
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_BOX_TITLE:
        AnimateBoxScrollArrows(TRUE);
        break;
    case CURSOR_AREA_IN_PARTY:
        gStorage->cursorShadowSprite->subpriority = 13;
        SetMovingMonPriority(1);
        break;
    case CURSOR_AREA_IN_BOX:
        if (gStorage->inBoxMovingMode == MOVE_MODE_NORMAL)
        {
            gStorage->cursorSprite->oam.priority = 1;
            gStorage->cursorShadowSprite->oam.priority = 2;
            gStorage->cursorShadowSprite->subpriority = 21;
            gStorage->cursorShadowSprite->invisible = FALSE;
            SetMovingMonPriority(2);
        }
        break;
    }
}

void SetCursorInParty(void)
{
    u8 partyCount;

    if (!sIsMonBeingMoved)
        partyCount = 0;
    else
    {
        partyCount = CalculatePlayerPartyCount();
        if (partyCount >= PARTY_SIZE)
            partyCount = PARTY_SIZE - 1;
    }
    if (gStorage->cursorSprite->vFlip)
        gStorage->cursorFlipTimer = 1;
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
    sSavedCursorPosition = sCursorPosition;
}

u8 GetSavedCursorPos(void)
{
    return sSavedCursorPosition;
}

void InitMonPlaceChange(u8 type)
{
    static bool8 (*const placeChangeFuncs[])(void) = {
        [CHANGE_GRAB]  = MonPlaceChange_Grab,
        [CHANGE_PLACE] = MonPlaceChange_Place,
        [CHANGE_SHIFT] = MonPlaceChange_Shift,
    };

    gStorage->monPlaceChangeFunc = placeChangeFuncs[type];
    gStorage->monPlaceChangeState = 0;
}

void InitMultiMonPlaceChange(bool8 moveCursorUp)
{
    if (!moveCursorUp)
        gStorage->monPlaceChangeFunc = MonPlaceChange_DoMoveCursorDown;
    else
        gStorage->monPlaceChangeFunc = MonPlaceChange_DoMoveCursorUp;

    gStorage->monPlaceChangeState = 0;
}

bool8 DoMonPlaceChange(void)
{
    return gStorage->monPlaceChangeFunc();
}

static bool8 MonPlaceChange_Grab(void)
{
    switch (gStorage->monPlaceChangeState)
    {
    case 0:
        if (sIsMonBeingMoved)
            return FALSE;
        StartSpriteAnim(gStorage->cursorSprite, 2);
        gStorage->monPlaceChangeState++;
        break;
    case 1:
        if (!MonPlaceChange_MoveCursorDown())
        {
            StartSpriteAnim(gStorage->cursorSprite, 3);
            MoveMon();
            gStorage->monPlaceChangeState++;
        }
        break;
    case 2:
        if (!MonPlaceChange_MoveCursorUp())
            gStorage->monPlaceChangeState++;
        break;
    case 3:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_Place(void)
{
    switch (gStorage->monPlaceChangeState)
    {
    case 0:
        if (!MonPlaceChange_MoveCursorDown())
        {
            StartSpriteAnim(gStorage->cursorSprite, 2);
            PlaceMon();
            gStorage->monPlaceChangeState++;
        }
        break;
    case 1:
        if (!MonPlaceChange_MoveCursorUp())
        {
            StartSpriteAnim(gStorage->cursorSprite, 0);
            gStorage->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_Shift(void)
{
    switch (gStorage->monPlaceChangeState)
    {
    case 0:
        switch (sCursorArea)
        {
        case CURSOR_AREA_IN_PARTY:
            gStorage->shiftBoxId = TOTAL_BOXES_COUNT;
            break;
        case CURSOR_AREA_IN_BOX:
            gStorage->shiftBoxId = StorageGetCurrentBox();
            break;
        default:
            return FALSE;
        }
        StartSpriteAnim(gStorage->cursorSprite, 2);
        SetShiftMonSpritePtr(gStorage->shiftBoxId, sCursorPosition);
        gStorage->monPlaceChangeState++;
        break;
    case 1:
        if (!ShiftMons())
        {
            StartSpriteAnim(gStorage->cursorSprite, 3);
            SetShiftedMonData(gStorage->shiftBoxId, sCursorPosition);
            gStorage->monPlaceChangeState++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_DoMoveCursorDown(void)
{
    return MonPlaceChange_MoveCursorDown();
}

static bool8 MonPlaceChange_DoMoveCursorUp(void)
{
    return MonPlaceChange_MoveCursorUp();
}

static bool8 MonPlaceChange_MoveCursorDown(void)
{
    switch (gStorage->cursorSprite->y2)
    {
    default:
        gStorage->cursorSprite->y2++;
        break;
    case 0:
        gStorage->cursorSprite->y2++;
        break;
    case 8: // Cursor has reached bottom
        return FALSE;
    }

    return TRUE;
}

static bool8 MonPlaceChange_MoveCursorUp(void)
{
    switch (gStorage->cursorSprite->y2)
    {
    case 0: // Cursor has reached top
        return FALSE;
    default:
        gStorage->cursorSprite->y2--;
        break;
    }

    return TRUE;
}

static void MoveMon(void)
{
    switch (sCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        SetMovedMonData(TOTAL_BOXES_COUNT, sCursorPosition);
        SetMovingMonSprite(MODE_PARTY, sCursorPosition);
        break;
    case CURSOR_AREA_IN_BOX:
        if (gStorage->inBoxMovingMode == MOVE_MODE_NORMAL)
        {
            SetMovedMonData(StorageGetCurrentBox(), sCursorPosition);
            SetMovingMonSprite(MODE_BOX, sCursorPosition);
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

    switch (sCursorArea)
    {
    case CURSOR_AREA_IN_PARTY:
        SetPlacedMonData(TOTAL_BOXES_COUNT, sCursorPosition);
        SetPlacedMonSprite(TOTAL_BOXES_COUNT, sCursorPosition);
        break;
    case CURSOR_AREA_IN_BOX:
        boxId = StorageGetCurrentBox();
        SetPlacedMonData(boxId, sCursorPosition);
        SetPlacedMonSprite(boxId, sCursorPosition);
        break;
    default:
        return;
    }

    sIsMonBeingMoved = FALSE;
}

void DoTrySetDisplayMonData(void)
{
    TrySetDisplayMonData();
}

static void SetMovedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        gStorage->movingMon = gPlayerParty[sCursorPosition];
    else
        BoxMonAtToMon(boxId, position, &gStorage->movingMon);

    PurgeMonOrBoxMon(boxId, position);
    sMovingMonOrigBoxId = boxId;
    sMovingMonOrigBoxPos = position;
}

static void SetPlacedMonData(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT)
        gPlayerParty[position] = gStorage->movingMon;
    else
    {
        BoxMonRestorePP(&gStorage->movingMon.box);
        SetBoxMonAt(boxId, position, &gStorage->movingMon.box);
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
        gStorage->tempMon = gPlayerParty[position];
    else
        BoxMonAtToMon(boxId, position, &gStorage->tempMon);

    SetPlacedMonData(boxId, position);
    gStorage->movingMon = gStorage->tempMon;
    SetDisplayMonData(&gStorage->movingMon, MODE_PARTY);
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
        SetMovedMonData(TOTAL_BOXES_COUNT, sCursorPosition);
        SetPlacedMonData(boxId, boxPosition);
        DestroyPartyMonIcon(sCursorPosition);
    }

    if (boxId == StorageGetCurrentBox())
        CreateBoxMonIconAtPos(boxPosition);

    StartSpriteAnim(gStorage->cursorSprite, 1);
    return TRUE;
}

void ResetSelectionAfterDeposit(void)
{
    StartSpriteAnim(gStorage->cursorSprite, 0);
    TrySetDisplayMonData();
}

void InitReleaseMon(void)
{
    u8 mode;

    if (sIsMonBeingMoved)
        mode = MODE_MOVE;
    else if (sCursorArea == CURSOR_AREA_IN_PARTY)
        mode = MODE_PARTY;
    else
        mode = MODE_BOX;

    DoReleaseMonAnim(mode, sCursorPosition);
    StringCopy(gStorage->releaseMonName, gStorage->displayMonNickname);
}

bool8 TryHideReleaseMon(void)
{
    if (!TryHideReleaseMonSprite())
    {
        StartSpriteAnim(gStorage->cursorSprite, 0);
        return FALSE;
    }
    else
        return TRUE;
}

void ReleaseMon(void)
{
    u8 boxId;

    DestroyReleaseMonIcon();
    if (sIsMonBeingMoved)
        sIsMonBeingMoved = FALSE;
    else
    {
        if (sCursorArea == CURSOR_AREA_IN_PARTY)
            boxId = TOTAL_BOXES_COUNT;
        else
            boxId = StorageGetCurrentBox();

        PurgeMonOrBoxMon(boxId, sCursorPosition);
    }
    TrySetDisplayMonData();
}

void TrySetCursorFistAnim(void)
{
    if (sIsMonBeingMoved)
        StartSpriteAnim(gStorage->cursorSprite, 3);
}

void InitCanReleaseMonVars(void)
{
    u16 knownMoveFlags;
    if (sIsMonBeingMoved)
    {
        gStorage->tempMon = gStorage->movingMon;
        gStorage->releaseBoxId = -1;
        gStorage->releaseBoxPos = -1;
    }
    else
    {
        if (sCursorArea == CURSOR_AREA_IN_PARTY)
        {
            gStorage->tempMon = gPlayerParty[sCursorPosition];
            gStorage->releaseBoxId = TOTAL_BOXES_COUNT;
        }
        else
        {
            BoxMonAtToMon(StorageGetCurrentBox(), sCursorPosition, &gStorage->tempMon);
            gStorage->releaseBoxId = StorageGetCurrentBox();
        }
        gStorage->releaseBoxPos = sCursorPosition;
    }

    gStorage->isSurfMon = FALSE;
    gStorage->isDiveMon = FALSE;
    gStorage->restrictedMoveList[0] = MOVE_SURF;
    gStorage->restrictedMoveList[1] = MOVE_DIVE;
    gStorage->restrictedMoveList[2] = MOVES_COUNT;
    knownMoveFlags = GetMonData(&gStorage->tempMon, MON_DATA_KNOWN_MOVES, (u8 *)gStorage->restrictedMoveList);
    gStorage->isSurfMon = knownMoveFlags & 1;
    gStorage->isDiveMon = (knownMoveFlags >> 1) & 1;
    if (gStorage->isSurfMon || gStorage->isDiveMon)
        gStorage->releaseMonStatusResolved = FALSE;
    else
    {
        gStorage->releaseMonStatusResolved = TRUE;
        gStorage->releaseMonStatus = RELEASE_MON_ALLOWED;
    }

    gStorage->releaseCheckState = 0;
}

s8 RunCanReleaseMon(void)
{
    u16 i;
    u16 knownMoveFlags;

    if (gStorage->releaseMonStatusResolved)
        return gStorage->releaseMonStatus;

    switch (gStorage->releaseCheckState)
    {
    case 0:
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (gStorage->releaseBoxId != TOTAL_BOXES_COUNT || gStorage->releaseBoxPos != i)
            {
                knownMoveFlags = GetMonData(&gPlayerParty[i], MON_DATA_KNOWN_MOVES, (u8 *)gStorage->restrictedMoveList);
                if (knownMoveFlags & 1)
                    gStorage->isSurfMon = FALSE;
                if (knownMoveFlags & 2)
                    gStorage->isDiveMon = FALSE;
            }
        }
        if (!(gStorage->isSurfMon || gStorage->isDiveMon))
        {
            gStorage->releaseMonStatusResolved = TRUE;
            gStorage->releaseMonStatus = RELEASE_MON_ALLOWED;
        }
        else
        {
            gStorage->releaseCheckBoxId = 0;
            gStorage->releaseCheckBoxPos = 0;
            gStorage->releaseCheckState++;
        }
        break;
    case 1:
        // for some reason, check only 5 mons in box each time this function is called
        for (i = 0; i < 5; i++)
        {
            knownMoveFlags = GetAndCopyBoxMonDataAt(gStorage->releaseCheckBoxId, gStorage->releaseCheckBoxPos, MON_DATA_KNOWN_MOVES, (u8 *)gStorage->restrictedMoveList);
            if (knownMoveFlags != 0
                && !(gStorage->releaseBoxId == gStorage->releaseCheckBoxId && gStorage->releaseBoxPos == gStorage->releaseCheckBoxPos))
            {
                if (knownMoveFlags & 1)
                    gStorage->isSurfMon = FALSE;
                if (knownMoveFlags & 2)
                    gStorage->isDiveMon = FALSE;
            }
            if (++gStorage->releaseCheckBoxPos >= IN_BOX_COUNT)
            {
                gStorage->releaseCheckBoxPos = 0;
                if (++gStorage->releaseCheckBoxId >= TOTAL_BOXES_COUNT)
                {
                    gStorage->releaseMonStatusResolved = TRUE;
                    gStorage->releaseMonStatus = RELEASE_MON_NOT_ALLOWED;
                    break;
                }
            }
        }
        if (!(gStorage->isSurfMon || gStorage->isDiveMon))
        {
            gStorage->releaseMonStatusResolved = TRUE;
            gStorage->releaseMonStatus = RELEASE_MON_ALLOWED;
        }
        break;
    }

    return RELEASE_MON_UNDETERMINED;
}

void SaveMovingMon(void)
{
    if (sIsMonBeingMoved)
        sMonBeingCarried = gStorage->movingMon;
}

void LoadSavedMovingMon(void)
{
    if (sIsMonBeingMoved)
    {
        if (sMovingMonOrigBoxId == TOTAL_BOXES_COUNT)
            gStorage->movingMon = sMonBeingCarried;
        else
            gStorage->movingMon.box = sMonBeingCarried.box;
    }
}

void InitSummaryScreenData(void)
{
    if (sIsMonBeingMoved)
    {
        SaveMovingMon();
        gStorage->summaryMonPtr.mon = &sMonBeingCarried;
        gStorage->summaryCursorPos = 0;
        gStorage->summaryLastIndex = 0;
        gStorage->summaryScreenMode = PSS_MODE_NORMAL;
    }
    else if (sCursorArea == CURSOR_AREA_IN_PARTY)
    {
        gStorage->summaryMonPtr.mon = gPlayerParty;
        gStorage->summaryCursorPos = sCursorPosition;
        gStorage->summaryLastIndex = CountPartyMons() - 1;
        gStorage->summaryScreenMode = PSS_MODE_NORMAL;
    }
    else
    {
        gStorage->summaryMonPtr.box = GetBoxedMonPtr(StorageGetCurrentBox(), 0);
        gStorage->summaryCursorPos = sCursorPosition;
        gStorage->summaryLastIndex = IN_BOX_COUNT - 1;
        gStorage->summaryScreenMode = PSS_MODE_BOX;
    }
}

void SetSelectionAfterSummaryScreen(void)
{
    if (sIsMonBeingMoved)
        LoadSavedMovingMon();
    else
        sCursorPosition = GetLastViewedMonIndex();
}

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
            retVal = i;
    }
    for (; last < PARTY_SIZE; last++)
        ZeroMonData(gPlayerParty + last);

    return retVal;
}

void SetMonMarkings(u8 markings)
{
    gStorage->displayMonMarkings = markings;
    if (sIsMonBeingMoved)
        SetMonData(&gStorage->movingMon, MON_DATA_MARKINGS, &markings);
    else
    {
        if (sCursorArea == CURSOR_AREA_IN_PARTY)
            SetMonData(gPlayerParty + sCursorPosition, MON_DATA_MARKINGS, &markings);
        if (sCursorArea == CURSOR_AREA_IN_BOX)
            SetCurrentBoxMonData(sCursorPosition, MON_DATA_MARKINGS, &markings);
    }
}

bool8 CanMovePartyMon(void)
{
    if (sCursorArea == CURSOR_AREA_IN_PARTY && !sIsMonBeingMoved && CountPartyAliveNonEggMonsExcept(sCursorPosition) == 0)
        return TRUE;
    else
        return FALSE;
}

bool8 CanShiftMon(void)
{
    if (sIsMonBeingMoved)
    {
        if (sCursorArea == CURSOR_AREA_IN_PARTY && CountPartyAliveNonEggMonsExcept(sCursorPosition) == 0)
        {
            if (gStorage->displayMonIsEgg || GetMonData(&gStorage->movingMon, MON_DATA_HP) == 0)
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
    return (sCursorArea == CURSOR_AREA_BOX_TITLE);
}

bool8 IsCursorOnCloseBox(void)
{
    return (sCursorArea == CURSOR_AREA_BUTTONS && sCursorPosition == 1);
}

bool8 IsCursorInBox(void)
{
    return (sCursorArea == CURSOR_AREA_IN_BOX);
}

static void TrySetDisplayMonData(void)
{
    gStorage->setMosaic = (sIsMonBeingMoved == FALSE);
    if (!sIsMonBeingMoved)
    {
        switch (sCursorArea)
        {
        case CURSOR_AREA_IN_PARTY:
            if (sCursorPosition < PARTY_SIZE)
            {
                SetDisplayMonData(&gPlayerParty[sCursorPosition], MODE_PARTY);
                break;
            }
            // fallthrough
        case CURSOR_AREA_BUTTONS:
        case CURSOR_AREA_BOX_TITLE:
            SetDisplayMonData(NULL, MODE_MOVE);
            break;
        case CURSOR_AREA_IN_BOX:
            SetDisplayMonData(GetBoxedMonPtr(StorageGetCurrentBox(), sCursorPosition), MODE_BOX);
            break;
        }
    }
}

static void ReshowDisplayMon(void)
{
    if (sIsMonBeingMoved)
        SetDisplayMonData(&sMonBeingCarried, MODE_PARTY);
    else
        TrySetDisplayMonData();
}

#define displayMonNicknameText        displayMonTexts[0]
#define displayMonSpeciesNameText     displayMonTexts[1]
#define displayMonGenderAndLevelText  displayMonTexts[2]
#define displayMonItemNameText        displayMonTexts[3]

static void SetDisplayMonData(void *pokemon, u8 mode)
{
    u8 *txtPtr;
    u16 gender;
    bool8 sanityIsBagEgg;

    gStorage->displayMonItemId = ITEM_NONE;
    gender = MON_MALE;
    sanityIsBagEgg = FALSE;
    if (mode == MODE_PARTY)
    {
        struct Pokemon *mon = (struct Pokemon *)pokemon;

        gStorage->displayMonSpecies = GetMonData(mon, MON_DATA_SPECIES_OR_EGG);
        if (gStorage->displayMonSpecies != SPECIES_NONE)
        {
            sanityIsBagEgg = GetMonData(mon, MON_DATA_SANITY_IS_BAD_EGG);
            if (sanityIsBagEgg)
                gStorage->displayMonIsEgg = TRUE;
            else
                gStorage->displayMonIsEgg = GetMonData(mon, MON_DATA_IS_EGG);

            GetMonData(mon, MON_DATA_NICKNAME, gStorage->displayMonNickname);
            StringGet_Nickname(gStorage->displayMonNickname);
            gStorage->displayMonLevel = GetMonData(mon, MON_DATA_LEVEL);
            gStorage->displayMonMarkings = GetMonData(mon, MON_DATA_MARKINGS);
            gStorage->displayMonPersonality = GetMonData(mon, MON_DATA_PERSONALITY);
            gStorage->displayMonPalette = GetMonFrontSpritePal(mon);
            gender = GetMonGender(mon);
            gStorage->displayMonItemId = GetMonData(mon, MON_DATA_HELD_ITEM);
        }
    }
    else if (mode == MODE_BOX)
    {
        struct BoxPokemon *boxMon = (struct BoxPokemon *)pokemon;

        gStorage->displayMonSpecies = GetBoxMonData(pokemon, MON_DATA_SPECIES_OR_EGG);
        if (gStorage->displayMonSpecies != SPECIES_NONE)
        {
            u32 otId = GetBoxMonData(boxMon, MON_DATA_OT_ID);
            sanityIsBagEgg = GetBoxMonData(boxMon, MON_DATA_SANITY_IS_BAD_EGG);
            if (sanityIsBagEgg)
                gStorage->displayMonIsEgg = TRUE;
            else
                gStorage->displayMonIsEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG);

            GetBoxMonData(boxMon, MON_DATA_NICKNAME, gStorage->displayMonNickname);
            StringGet_Nickname(gStorage->displayMonNickname);
            gStorage->displayMonLevel = GetLevelFromBoxMonExp(boxMon);
            gStorage->displayMonMarkings = GetBoxMonData(boxMon, MON_DATA_MARKINGS);
            gStorage->displayMonPersonality = GetBoxMonData(boxMon, MON_DATA_PERSONALITY);
            gStorage->displayMonPalette = GetMonSpritePalFromSpeciesAndPersonality(gStorage->displayMonSpecies, otId, gStorage->displayMonPersonality);
            gender = GetGenderFromSpeciesAndPersonality(gStorage->displayMonSpecies, gStorage->displayMonPersonality);
            gStorage->displayMonItemId = GetBoxMonData(boxMon, MON_DATA_HELD_ITEM);
        }
    }
    else
    {
        gStorage->displayMonSpecies = SPECIES_NONE;
        gStorage->displayMonItemId = ITEM_NONE;
    }

    if (gStorage->displayMonSpecies == SPECIES_NONE)
    {
        StringFill(gStorage->displayMonNickname, CHAR_SPACE, 5);
        StringFill(gStorage->displayMonNicknameText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonSpeciesNameText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonGenderAndLevelText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonItemNameText, CHAR_SPACE, 8);
    }
    else if (gStorage->displayMonIsEgg)
    {
        if (sanityIsBagEgg)
            StringCopyPadded(gStorage->displayMonNicknameText, gStorage->displayMonNickname, CHAR_SPACE, 5);
        else
            StringCopyPadded(gStorage->displayMonNicknameText, gText_EggNickname, CHAR_SPACE, 8);

        StringFill(gStorage->displayMonSpeciesNameText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonGenderAndLevelText, CHAR_SPACE, 8);
        StringFill(gStorage->displayMonItemNameText, CHAR_SPACE, 8);
    }
    else
    {
        if (gStorage->displayMonSpecies == SPECIES_NIDORAN_F || gStorage->displayMonSpecies == SPECIES_NIDORAN_M)
            gender = MON_GENDERLESS;

        // Buffer nickname
        StringCopyPadded(gStorage->displayMonNicknameText, gStorage->displayMonNickname, CHAR_SPACE, 5);

        // Buffer species name
        txtPtr = gStorage->displayMonSpeciesNameText;
        *(txtPtr)++ = CHAR_SLASH;
        StringCopyPadded(txtPtr, gSpeciesNames[gStorage->displayMonSpecies], CHAR_SPACE, 5);

        // Buffer gender and level
        txtPtr = gStorage->displayMonGenderAndLevelText;
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
        *(txtPtr++) = CHAR_LV_2;

        txtPtr = ConvertIntToDecimalStringN(txtPtr, gStorage->displayMonLevel, STR_CONV_MODE_LEFT_ALIGN, 3);
        txtPtr[0] = CHAR_SPACE;
        txtPtr[1] = EOS;

        // Buffer item name
        if (gStorage->displayMonItemId != ITEM_NONE)
            StringCopyPadded(gStorage->displayMonItemNameText, ItemId_GetName(gStorage->displayMonItemId), CHAR_SPACE, 8);
        else
            StringFill(gStorage->displayMonItemNameText, CHAR_SPACE, 8);
    }
}

#undef displayMonNicknameText
#undef displayMonSpeciesNameText
#undef displayMonGenderAndLevelText
#undef displayMonItemNameText

static u8 HandleInput_InBox(void)
{
    switch (gStorage->inBoxMovingMode)
    {
    case MOVE_MODE_NORMAL:
    default:
        return HandleInput_InBox_Normal();
    case MOVE_MODE_MULTIPLE_SELECTING:
        return HandleInput_InBox_GrabbingMultiple();
    case MOVE_MODE_MULTIPLE_MOVING:
        return HandleInput_InBox_MovingMultiple();
    }
}

static u8 HandleInput_InBox_Normal(void)
{
    u8 input;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        cursorArea = sCursorArea;
        cursorPosition = sCursorPosition;
        gStorage->cursorVerticalWrap = 0;
        gStorage->cursorHorizontalWrap = 0;
        gStorage->cursorFlipTimer = 0;
        if (JOY_REPT(DPAD_UP))
        {
            input = INPUT_MOVE_CURSOR;
            if (sCursorPosition >= IN_BOX_COLUMNS)
                cursorPosition -= IN_BOX_COLUMNS;
            else
            {
                cursorArea = CURSOR_AREA_BOX_TITLE;
                cursorPosition = 0;
            }
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            input = INPUT_MOVE_CURSOR;
            cursorPosition += IN_BOX_COLUMNS;
            if (cursorPosition >= IN_BOX_COUNT)
            {
                cursorArea = CURSOR_AREA_BUTTONS;
                cursorPosition -= IN_BOX_COUNT;
                cursorPosition /= 3;
                gStorage->cursorVerticalWrap = 1;
                gStorage->cursorFlipTimer = 1;
            }
            break;
        }
        else if (JOY_REPT(DPAD_LEFT))
        {
            input = INPUT_MOVE_CURSOR;
            if (sCursorPosition % IN_BOX_COLUMNS != 0)
                cursorPosition--;
            else
            {
                gStorage->cursorHorizontalWrap = -1;
                cursorPosition += (IN_BOX_COLUMNS - 1);
            }
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            input = INPUT_MOVE_CURSOR;
            if ((sCursorPosition + 1) % IN_BOX_COLUMNS != 0)
                cursorPosition++;
            else
            {
                gStorage->cursorHorizontalWrap = 1;
                cursorPosition -= (IN_BOX_COLUMNS - 1);
            }
            break;
        }
        else if (JOY_NEW(START_BUTTON))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_BOX_TITLE;
            cursorPosition = 0;
            break;
        }

        if ((JOY_NEW(A_BUTTON)) && SetSelectionMenuTexts())
        {
            if (!sInMultiMoveMode)
                return INPUT_IN_MENU;

            if (gStorage->boxOption != OPTION_MOVE_MONS || sIsMonBeingMoved == TRUE)
            {
                switch (GetMenuItemTextId(0))
                {
                case MENU_TEXT_STORE:
                    return INPUT_DEPOSIT;
                case MENU_TEXT_WITHDRAW:
                    return INPUT_WITHDRAW;
                case MENU_TEXT_MOVE:
                    return INPUT_MOVE_MON;
                case MENU_TEXT_SHIFT:
                    return INPUT_SHIFT_MON;
                case MENU_TEXT_PLACE:
                    return INPUT_PLACE_MON;
                case MENU_TEXT_TAKE:
                    return INPUT_TAKE_ITEM;
                case MENU_TEXT_GIVE:
                    return INPUT_GIVE_ITEM;
                case MENU_TEXT_SWITCH:
                    return INPUT_SWITCH_ITEMS;
                }
            }
            else
            {
                gStorage->inBoxMovingMode = MOVE_MODE_MULTIPLE_SELECTING;
                return INPUT_MULTIMOVE_START;
            }
        }

        if (JOY_NEW(B_BUTTON))
            return INPUT_PRESSED_B;

        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return INPUT_SCROLL_LEFT;
            if (JOY_HELD(R_BUTTON))
                return INPUT_SCROLL_RIGHT;
        }

        if (JOY_NEW(SELECT_BUTTON))
        {
            ToggleCursorMultiMoveMode();
            return INPUT_NONE;
        }

        input = INPUT_NONE;

    } while (FALSE);

    if (input != INPUT_NONE)
        SetCursorPosition(cursorArea, cursorPosition);

    return input;
}

static u8 HandleInput_InBox_GrabbingMultiple(void)
{
    if (JOY_HELD(A_BUTTON))
    {
        if (JOY_REPT(DPAD_UP))
        {
            if (sCursorPosition / IN_BOX_COLUMNS != 0)
            {
                SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition - IN_BOX_COLUMNS);
                return INPUT_MULTIMOVE_CHANGE_SELECTION;
            }
            else
                return INPUT_MULTIMOVE_UNABLE;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            if (sCursorPosition + IN_BOX_COLUMNS < IN_BOX_COUNT)
            {
                SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition + IN_BOX_COLUMNS);
                return INPUT_MULTIMOVE_CHANGE_SELECTION;
            }
            else
                return INPUT_MULTIMOVE_UNABLE;
        }
        else if (JOY_REPT(DPAD_LEFT))
        {
            if (sCursorPosition % IN_BOX_COLUMNS != 0)
            {
                SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition - 1);
                return INPUT_MULTIMOVE_CHANGE_SELECTION;
            }
            else
                return INPUT_MULTIMOVE_UNABLE;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            if ((sCursorPosition + 1) % IN_BOX_COLUMNS != 0)
            {
                SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition + 1);
                return INPUT_MULTIMOVE_CHANGE_SELECTION;
            }
            else
                return INPUT_MULTIMOVE_UNABLE;
        }
        else
            return INPUT_NONE;
    }
    else
    {
        if (MultiMove_GetOriginPosition() == sCursorPosition)
        {
            gStorage->inBoxMovingMode = MOVE_MODE_NORMAL;
            gStorage->cursorShadowSprite->invisible = FALSE;
            return INPUT_MULTIMOVE_SINGLE;
        }
        else
        {
            sIsMonBeingMoved = (gStorage->displayMonSpecies != SPECIES_NONE);
            gStorage->inBoxMovingMode = MOVE_MODE_MULTIPLE_MOVING;
            sMovingMonOrigBoxId = StorageGetCurrentBox();
            return INPUT_MULTIMOVE_GRAB_SELECTION;
        }
    }
}

static u8 HandleInput_InBox_MovingMultiple(void)
{
    if (JOY_REPT(DPAD_UP))
    {
        if (MultiMove_TryMoveGroup(0))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition - IN_BOX_COLUMNS);
            return INPUT_MULTIMOVE_MOVE_MONS;
        }
        else
            return INPUT_MULTIMOVE_UNABLE;
    }
    else if (JOY_REPT(DPAD_DOWN))
    {
        if (MultiMove_TryMoveGroup(1))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition + IN_BOX_COLUMNS);
            return INPUT_MULTIMOVE_MOVE_MONS;
        }
        else
            return INPUT_MULTIMOVE_UNABLE;
    }
    else if (JOY_REPT(DPAD_LEFT))
    {
        if (MultiMove_TryMoveGroup(2))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition - 1);
            return INPUT_MULTIMOVE_MOVE_MONS;
        }
        else
            return INPUT_SCROLL_LEFT;
    }
    else if (JOY_REPT(DPAD_RIGHT))
    {
        if (MultiMove_TryMoveGroup(3))
        {
            SetCursorPosition(CURSOR_AREA_IN_BOX, sCursorPosition + 1);
            return INPUT_MULTIMOVE_MOVE_MONS;
        }
        else
            return INPUT_SCROLL_RIGHT;
    }
    else if (JOY_NEW(A_BUTTON))
    {
        if (MultiMove_CanPlaceSelection())
        {
            sIsMonBeingMoved = FALSE;
            gStorage->inBoxMovingMode = MOVE_MODE_NORMAL;
            return INPUT_MULTIMOVE_PLACE_MONS;
        }
        else
            return INPUT_MULTIMOVE_UNABLE;
    }
    else if (JOY_NEW(B_BUTTON))
        return INPUT_MULTIMOVE_UNABLE;

    else
    {
        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return INPUT_SCROLL_LEFT;
            if (JOY_HELD(R_BUTTON))
                return INPUT_SCROLL_RIGHT;
        }

        return INPUT_NONE;
    }
}

static u8 HandleInput_InParty(void)
{
    u8 input;
    bool8 gotoBox;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        cursorArea = sCursorArea;
        cursorPosition = sCursorPosition;
        gStorage->cursorHorizontalWrap = 0;
        gStorage->cursorVerticalWrap = 0;
        gStorage->cursorFlipTimer = 0;
        gotoBox = FALSE;
        input = INPUT_NONE;

        if (JOY_REPT(DPAD_UP))
        {
            if (--cursorPosition < 0)
                cursorPosition = PARTY_SIZE;
            if (cursorPosition != sCursorPosition)
                input = INPUT_MOVE_CURSOR;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            if (++cursorPosition > PARTY_SIZE)
                cursorPosition = 0;
            if (cursorPosition != sCursorPosition)
                input = INPUT_MOVE_CURSOR;
            break;
        }
        else if (JOY_REPT(DPAD_LEFT) && sCursorPosition != 0)
        {
            input = INPUT_MOVE_CURSOR;
            gStorage->cursorPrevPartyPos = sCursorPosition;
            cursorPosition = 0;
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            if (sCursorPosition == 0)
            {
                input = INPUT_MOVE_CURSOR;
                cursorPosition = gStorage->cursorPrevPartyPos;
            }
            else
            {
                input = INPUT_HIDE_PARTY;
                cursorArea = CURSOR_AREA_IN_BOX;
                cursorPosition = 0;
            }
            break;
        }

        if (JOY_NEW(A_BUTTON))
        {
            if (sCursorPosition == PARTY_SIZE)
            {
                if (gStorage->boxOption == OPTION_DEPOSIT)
                    return INPUT_CLOSE_BOX;

                gotoBox = TRUE;
            }
            else if (SetSelectionMenuTexts())
            {
                if (!sInMultiMoveMode)
                    return INPUT_IN_MENU;

                switch (GetMenuItemTextId(0))
                {
                case MENU_TEXT_STORE:
                    return INPUT_DEPOSIT;
                case MENU_TEXT_WITHDRAW:
                    return INPUT_WITHDRAW;
                case MENU_TEXT_MOVE:
                    return INPUT_MOVE_MON;
                case MENU_TEXT_SHIFT:
                    return INPUT_SHIFT_MON;
                case MENU_TEXT_PLACE:
                    return INPUT_PLACE_MON;
                case MENU_TEXT_TAKE:
                    return INPUT_TAKE_ITEM;
                case MENU_TEXT_GIVE:
                    return INPUT_GIVE_ITEM;
                case MENU_TEXT_SWITCH:
                    return INPUT_SWITCH_ITEMS;
                }
            }
        }

        if (JOY_NEW(B_BUTTON))
        {
            if (gStorage->boxOption == OPTION_DEPOSIT)
                return INPUT_PRESSED_B;

            gotoBox = TRUE;
        }

        if (gotoBox)
        {
            input = INPUT_HIDE_PARTY;
            cursorArea = CURSOR_AREA_IN_BOX;
            cursorPosition = 0;
        }
        else if (JOY_NEW(SELECT_BUTTON))
        {
            ToggleCursorMultiMoveMode();
            return INPUT_NONE;
        }

    } while (FALSE);

    if (input != INPUT_NONE && input != INPUT_HIDE_PARTY)
        SetCursorPosition(cursorArea, cursorPosition);

    return input;
}

static u8 HandleInput_BoxTitle(void)
{
    u8 input;
    s8 cursorArea;
    s8 cursorPosition;

    do
    {
        gStorage->cursorHorizontalWrap = 0;
        gStorage->cursorVerticalWrap = 0;
        gStorage->cursorFlipTimer = 0;

        if (JOY_REPT(DPAD_UP))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_BUTTONS;
            cursorPosition = 0;
            gStorage->cursorFlipTimer = 1;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_IN_BOX;
            cursorPosition = 2;
            break;
        }

        if (JOY_HELD(DPAD_LEFT))
            return INPUT_SCROLL_LEFT;
        if (JOY_HELD(DPAD_RIGHT))
            return INPUT_SCROLL_RIGHT;

        if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
        {
            if (JOY_HELD(L_BUTTON))
                return INPUT_SCROLL_LEFT;
            if (JOY_HELD(R_BUTTON))
                return INPUT_SCROLL_RIGHT;
        }

        if (JOY_NEW(A_BUTTON))
        {
            AnimateBoxScrollArrows(FALSE);
            AddBoxMenu();
            return INPUT_BOX_OPTIONS;
        }

        if (JOY_NEW(B_BUTTON))
            return INPUT_PRESSED_B;

        if (JOY_NEW(SELECT_BUTTON))
        {
            ToggleCursorMultiMoveMode();
            return INPUT_NONE;
        }

        input = INPUT_NONE;

    } while (FALSE);

    if (input != INPUT_NONE)
    {
        if (cursorArea != CURSOR_AREA_BOX_TITLE)
            AnimateBoxScrollArrows(FALSE);
        SetCursorPosition(cursorArea, cursorPosition);
    }

    return input;
}

static u8 HandleInput_OnButtons(void)
{
    u8 input;
    s8 cursorArea;
    s8 cursorPosition;
    s8 prevPos;

    do
    {
        cursorArea = sCursorArea;
        cursorPosition = sCursorPosition;
        gStorage->cursorHorizontalWrap = 0;
        gStorage->cursorVerticalWrap = 0;
        gStorage->cursorFlipTimer = 0;

        if (JOY_REPT(DPAD_UP))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_IN_BOX;
            gStorage->cursorVerticalWrap = -1;
            if (sCursorPosition == 0)
                cursorPosition = IN_BOX_COUNT - 1 - 5;
            else
                cursorPosition = IN_BOX_COUNT - 1;
            gStorage->cursorFlipTimer = 1;
            break;
        }
        else if (JOY_REPT(DPAD_DOWN | START_BUTTON))
        {
            input = INPUT_MOVE_CURSOR;
            cursorArea = CURSOR_AREA_BOX_TITLE;
            cursorPosition = 0;
            gStorage->cursorFlipTimer = 1;
            break;
        }

        if (JOY_REPT(DPAD_LEFT))
        {
            input = INPUT_MOVE_CURSOR;
            if (--cursorPosition < 0)
                cursorPosition = 1;
            break;
        }
        else if (JOY_REPT(DPAD_RIGHT))
        {
            input = INPUT_MOVE_CURSOR;
            if (++cursorPosition > 1)
                cursorPosition = 0;
            break;
        }

        if (JOY_NEW(A_BUTTON))
            return cursorPosition == 0 ? INPUT_SHOW_PARTY : INPUT_CLOSE_BOX;

        if (JOY_NEW(B_BUTTON))
            return INPUT_PRESSED_B;

        if (JOY_NEW(SELECT_BUTTON))
        {
            ToggleCursorMultiMoveMode();
            return INPUT_NONE;
        }

        input = INPUT_NONE;
    } while (FALSE);

    if (input != INPUT_NONE)
        SetCursorPosition(cursorArea, cursorPosition);

    return input;
}

u8 HandleInput(void)
{
    struct
    {
        u8 (*func)(void);
        s8 area;
    }
    static const inputFuncs[] = {
        {HandleInput_InBox,     CURSOR_AREA_IN_BOX},
        {HandleInput_InParty,   CURSOR_AREA_IN_PARTY},
        {HandleInput_BoxTitle,  CURSOR_AREA_BOX_TITLE},
        {HandleInput_OnButtons, CURSOR_AREA_BUTTONS},
        {NULL, 0},
    };

    u16 i = 0;
    while (inputFuncs[i].func != NULL)
    {
        if (inputFuncs[i].area == sCursorArea)
            return inputFuncs[i].func();
        i++;
    }

    return INPUT_NONE;
}

static void AddBoxMenu(void)
{
    InitMenu();
    SetMenuText(MENU_TEXT_JUMP);
    SetMenuText(MENU_TEXT_WALLPAPER);
    SetMenuText(MENU_TEXT_NAME);
    SetMenuText(MENU_TEXT_CANCEL);
}

static bool8 SetSelectionMenuTexts(void)
{
    InitMenu();
    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
        return SetMenuTextsForMon();
    else
        return SetMenuTextsForItem();
}

static bool8 SetMenuTextsForMon(void)
{
    u16 species = GetSpeciesAtCursorPosition();

    switch (gStorage->boxOption)
    {
    case OPTION_DEPOSIT:
        if (species != SPECIES_NONE)
            SetMenuText(MENU_TEXT_STORE);
        else
            return FALSE;
        break;
    case OPTION_WITHDRAW:
        if (species != SPECIES_NONE)
            SetMenuText(MENU_TEXT_WITHDRAW);
        else
            return FALSE;
        break;
    case OPTION_MOVE_MONS:
        if (sIsMonBeingMoved)
        {
            if (species != SPECIES_NONE)
                SetMenuText(MENU_TEXT_SHIFT);
            else
                SetMenuText(MENU_TEXT_PLACE);
        }
        else
        {
            if (species != SPECIES_NONE)
                SetMenuText(MENU_TEXT_MOVE);
            else
                return FALSE;
        }
        break;
    case OPTION_MOVE_ITEMS:
    default:
        return FALSE;
    }

    SetMenuText(MENU_TEXT_SUMMARY);
    if (gStorage->boxOption == OPTION_MOVE_MONS)
    {
        if (!sCursorArea)
            SetMenuText(MENU_TEXT_WITHDRAW);
        else
            SetMenuText(MENU_TEXT_STORE);
    }

    SetMenuText(MENU_TEXT_MARK);
    SetMenuText(MENU_TEXT_RELEASE);
    SetMenuText(MENU_TEXT_CANCEL);
    return TRUE;
}

static bool8 SetMenuTextsForItem(void)
{
    if (gStorage->displayMonSpecies == SPECIES_EGG)
        return FALSE;

    if (!IsActiveItemMoving())
    {
        if (gStorage->displayMonItemId == ITEM_NONE)
        {
            if (gStorage->displayMonSpecies == SPECIES_NONE)
                return FALSE;

            SetMenuText(MENU_TEXT_GIVE2);
        }
        else
        {
            if (!ItemIsMail(gStorage->displayMonItemId))
            {
                SetMenuText(MENU_TEXT_TAKE);
                SetMenuText(MENU_TEXT_BAG);
            }
            SetMenuText(MENU_TEXT_INFO);
        }
    }
    else
    {
        if (gStorage->displayMonItemId == ITEM_NONE)
        {
            if (gStorage->displayMonSpecies == SPECIES_NONE)
                return FALSE;

            SetMenuText(MENU_TEXT_GIVE);
        }
        else
        {
            if (ItemIsMail(gStorage->displayMonItemId) == TRUE)
                return FALSE;

            SetMenuText(MENU_TEXT_SWITCH);
        }
    }

    SetMenuText(MENU_TEXT_CANCEL);
    return TRUE;
}

static void SpriteCB_CursorShadow(struct Sprite *sprite)
{
    sprite->x = gStorage->cursorSprite->x;
    sprite->y = gStorage->cursorSprite->y + 20;
}

static void CreateCursorSprites(void)
{
    u16 x, y;
    u8 spriteId;
    u8 priority, subpriority;
    struct SpriteSheet spriteSheets[] = {
        {sHandCursorTiles, 0x800, GFXTAG_CURSOR},
        {sHandCursorShadowTiles, 0x80, GFXTAG_CURSOR_SHADOW},
        {}
    };

    struct SpritePalette spritePalettes[] = {
        {sPokeStorageMisc1Pal, PALTAG_MISC_1},
        {}
    };

    static const struct OamData sOamData_Cursor = {
        .shape = SPRITE_SHAPE(32x32),
        .size = SPRITE_SIZE(32x32),
        .priority = 1,
    };
    static const struct OamData sOamData_CursorShadow = {
        .shape = SPRITE_SHAPE(16x16),
        .size = SPRITE_SIZE(16x16),
        .priority = 1,
    };

    static const union AnimCmd sAnim_Cursor_Bouncing[] = {
        ANIMCMD_FRAME(0, 30),
        ANIMCMD_FRAME(16, 30),
        ANIMCMD_JUMP(0)
    };
    static const union AnimCmd sAnim_Cursor_Still[] = {
        ANIMCMD_FRAME(0, 5),
        ANIMCMD_END
    };
    static const union AnimCmd sAnim_Cursor_Open[] = {
        ANIMCMD_FRAME(32, 5),
        ANIMCMD_END
    };
    static const union AnimCmd sAnim_Cursor_Fist[] = {
        ANIMCMD_FRAME(48, 5),
        ANIMCMD_END
    };

    static const union AnimCmd *const sAnims_Cursor[] = {
        [CURSOR_ANIM_BOUNCE] = sAnim_Cursor_Bouncing,
        [CURSOR_ANIM_STILL]  = sAnim_Cursor_Still,
        [CURSOR_ANIM_OPEN]   = sAnim_Cursor_Open,
        [CURSOR_ANIM_FIST]   = sAnim_Cursor_Fist,
    };

    static const struct SpriteTemplate sSpriteTemplate_Cursor = {
        .tileTag = GFXTAG_CURSOR,
        .paletteTag = PALTAG_MISC_2,
        .oam = &sOamData_Cursor,
        .anims = sAnims_Cursor,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };

    static const struct SpriteTemplate sSpriteTemplate_CursorShadow = {
        .tileTag = GFXTAG_CURSOR_SHADOW,
        .paletteTag = PALTAG_MISC_2,
        .oam = &sOamData_CursorShadow,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_CursorShadow,
    };

    LoadSpriteSheets(spriteSheets);
    LoadSpritePalettes(spritePalettes);
    gStorage->cursorPalNums[0] = IndexOfSpritePaletteTag(PALTAG_MISC_2);
    gStorage->cursorPalNums[1] = IndexOfSpritePaletteTag(PALTAG_MISC_1);

    GetCursorCoordsByPos(sCursorArea, sCursorPosition, &x, &y);
    spriteId = CreateSprite(&sSpriteTemplate_Cursor, x, y, 6);
    if (spriteId != MAX_SPRITES)
    {
        gStorage->cursorSprite = &gSprites[spriteId];
        gStorage->cursorSprite->oam.paletteNum = gStorage->cursorPalNums[sInMultiMoveMode];
        gStorage->cursorSprite->oam.priority = 1;
        if (sIsMonBeingMoved)
            StartSpriteAnim(gStorage->cursorSprite, 3);
    }
    else
        gStorage->cursorSprite = NULL;


    if (sCursorArea == CURSOR_AREA_IN_PARTY)
    {
        subpriority = 13;
        priority = 1;
    }
    else
    {
        subpriority = 21;
        priority = 2;
    }

    spriteId = CreateSprite(&sSpriteTemplate_CursorShadow, 0, 0, subpriority);
    if (spriteId != MAX_SPRITES)
    {
        gStorage->cursorShadowSprite = &gSprites[spriteId];
        gStorage->cursorShadowSprite->oam.priority = priority;
        if (sCursorArea)
            gStorage->cursorShadowSprite->invisible = 1;
    }
    else
        gStorage->cursorShadowSprite = NULL;
}

static void ToggleCursorMultiMoveMode(void)
{
    sInMultiMoveMode = !sInMultiMoveMode;
    gStorage->cursorSprite->oam.paletteNum = gStorage->cursorPalNums[sInMultiMoveMode];
}

u8 GetBoxCursorPosition(void)
{
    return sCursorPosition;
}

void GetCursorBoxColumnAndRow(u8 *column, u8 *row)
{
    if (sCursorArea == CURSOR_AREA_IN_BOX)
    {
        *column = sCursorPosition % IN_BOX_COLUMNS;
        *row = sCursorPosition / IN_BOX_COLUMNS;
    }
    else
    {
        *column = 0;
        *row = 0;
    }
}

void StartCursorAnim(u8 animNum)
{
    StartSpriteAnim(gStorage->cursorSprite, animNum);
}

u8 GetMovingMonOriginalBoxId(void)
{
    return sMovingMonOrigBoxId;
}

void SetCursorPriorityTo1(void)
{
    gStorage->cursorSprite->oam.priority = 1;
}

void TryHideItemAtCursor(void)
{
    if (sCursorArea == CURSOR_AREA_IN_BOX)
        TryHideItemIconAtPos(CURSOR_AREA_IN_BOX, sCursorPosition);
}

void TryShowItemAtCursor(void)
{
    if (sCursorArea == CURSOR_AREA_IN_BOX)
        TryLoadItemIconAtPos(CURSOR_AREA_IN_BOX, sCursorPosition);
}

static const u8 *const sMenuTexts[] = {
    [MENU_TEXT_CANCEL]     = gPCText_Cancel,
    [MENU_TEXT_STORE]      = gPCText_Store,
    [MENU_TEXT_WITHDRAW]   = gPCText_Withdraw,
    [MENU_TEXT_MOVE]       = gPCText_Move,
    [MENU_TEXT_SHIFT]      = gPCText_Shift,
    [MENU_TEXT_PLACE]      = gPCText_Place,
    [MENU_TEXT_SUMMARY]    = gPCText_Summary,
    [MENU_TEXT_RELEASE]    = gPCText_Release,
    [MENU_TEXT_MARK]       = gPCText_Mark,
    [MENU_TEXT_JUMP]       = gPCText_Jump,
    [MENU_TEXT_WALLPAPER]  = gPCText_Wallpaper,
    [MENU_TEXT_NAME]       = gPCText_Name,
    [MENU_TEXT_TAKE]       = gPCText_Take,
    [MENU_TEXT_GIVE]       = gPCText_Give,
    [MENU_TEXT_GIVE2]      = gPCText_Give,
    [MENU_TEXT_SWITCH]     = gPCText_Switch,
    [MENU_TEXT_BAG]        = gPCText_Bag,
    [MENU_TEXT_INFO]       = gPCText_Info,
    [MENU_TEXT_SCENERY_1]  = gPCText_Scenery1,
    [MENU_TEXT_SCENERY_2]  = gPCText_Scenery2,
    [MENU_TEXT_SCENERY_3]  = gPCText_Scenery3,
    [MENU_TEXT_ETCETERA]   = gPCText_Etcetera,
    [MENU_TEXT_FOREST]     = gPCText_Forest,
    [MENU_TEXT_CITY]       = gPCText_City,
    [MENU_TEXT_DESERT]     = gPCText_Desert,
    [MENU_TEXT_SAVANNA]    = gPCText_Savanna,
    [MENU_TEXT_CRAG]       = gPCText_Crag,
    [MENU_TEXT_VOLCANO]    = gPCText_Volcano,
    [MENU_TEXT_SNOW]       = gPCText_Snow,
    [MENU_TEXT_CAVE]       = gPCText_Cave,
    [MENU_TEXT_BEACH]      = gPCText_Beach,
    [MENU_TEXT_SEAFLOOR]   = gPCText_Seafloor,
    [MENU_TEXT_RIVER]      = gPCText_River,
    [MENU_TEXT_SKY]        = gPCText_Sky,
    [MENU_TEXT_POLKADOT]   = gPCText_PolkaDot,
    [MENU_TEXT_POKECENTER] = gPCText_Pokecenter,
    [MENU_TEXT_MACHINE]    = gPCText_Machine,
    [MENU_TEXT_SIMPLE]     = gPCText_Simple,
};

void InitMenu(void)
{
    gStorage->menuItemsCount = 0;
    gStorage->menuWidth = 0;
    gStorage->menuWindow.bg = 0;
    gStorage->menuWindow.paletteNum = 15;
    gStorage->menuWindow.baseBlock = 92;
}

void SetMenuText(u8 textId)
{
    if (gStorage->menuItemsCount < ARRAY_COUNT(gStorage->menuItems))
    {
        u8 len;
        struct StorageMenu *menu = &gStorage->menuItems[gStorage->menuItemsCount];

        menu->text = sMenuTexts[textId];
        menu->textId = textId;
        len = StringLength(menu->text);
        if (len > gStorage->menuWidth)
            gStorage->menuWidth = len;

        gStorage->menuItemsCount++;
    }
}

s8 GetMenuItemTextId(u8 menuIndex)
{
    if (menuIndex >= gStorage->menuItemsCount)
        return MENU_B_PRESSED;
    else
        return gStorage->menuItems[menuIndex].textId;
}

void AddMenu(void)
{
    gStorage->menuWindow.width = gStorage->menuWidth + 2;
    gStorage->menuWindow.height = 2 * gStorage->menuItemsCount;
    gStorage->menuWindow.tilemapLeft = 29 - gStorage->menuWindow.width;
    gStorage->menuWindow.tilemapTop = 15 - gStorage->menuWindow.height;
    gStorage->menuWindowId = AddWindow(&gStorage->menuWindow);
    ClearWindowTilemap(gStorage->menuWindowId);
    DrawStdFrameWithCustomTileAndPalette(gStorage->menuWindowId, FALSE, 11, 14);
    PrintTextArray(gStorage->menuWindowId, FONT_NORMAL_COPY_1, 8, 2, 16, gStorage->menuItemsCount, (void *)gStorage->menuItems);
    Menu_InitCursor(gStorage->menuWindowId, FONT_NORMAL_COPY_1, 0, 2, 16, gStorage->menuItemsCount, 0);
    ScheduleBgCopyTilemapToVram(0);
    gStorage->menuUnusedField = 0;
}

bool8 IsMenuLoading(void)
{
    // Possibly stubbed out debug code?
    return FALSE;
}

s16 HandleMenuInput(void)
{
    s32 input = MENU_NOTHING_CHOSEN;

    do
    {
        if (JOY_NEW(A_BUTTON))
        {
            input = Menu_GetCursorPos();
            break;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            input = MENU_B_PRESSED;
        }

        if (JOY_NEW(DPAD_UP))
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(-1);
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            PlaySE(SE_SELECT);
            Menu_MoveCursor(1);
        }
    } while (FALSE);

    if (input != MENU_NOTHING_CHOSEN)
        RemoveMenu();

    if (input >= 0)
        input = gStorage->menuItems[input].textId;

    return input;
}

void RemoveMenu(void)
{
    ClearStdWindowAndFrameToTransparent(gStorage->menuWindowId, TRUE);
    RemoveWindow(gStorage->menuWindowId);
}
