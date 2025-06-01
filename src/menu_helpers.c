#include "global.h"
#include "bg.h"
#include "field_specials.h"
#include "gpu_regs.h"
#include "graphics.h"
#include "link.h"
#include "mail.h"
#include "menu.h"
#include "menu_helpers.h"
#include "overworld.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/maps.h"

enum {
    ANIM_SWAP_LINE_START,
    ANIM_SWAP_LINE_MID,
    ANIM_SWAP_LINE_END,
};

static EWRAM_DATA const struct YesNoFuncTable *sYesNo = NULL;
static EWRAM_DATA TaskFunc sMessageNextTask = NULL;
static EWRAM_DATA u8 sMessageWindowId = {0};


static const struct OamData sOamData_SwapLine = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16),
    .priority = 1,
    .paletteNum = 1
};

static const union AnimCmd sAnim_SwapLine_Start[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_SwapLine_Mid[] = {
    ANIMCMD_FRAME(4, 0),
    ANIMCMD_END
};

static const union AnimCmd sAnim_SwapLine_End[] = {
    ANIMCMD_FRAME(0, 0, .hFlip = TRUE),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_SwapLine[] = {
    [ANIM_SWAP_LINE_START] = sAnim_SwapLine_Start,
    [ANIM_SWAP_LINE_MID]   = sAnim_SwapLine_Mid,
    [ANIM_SWAP_LINE_END]   = sAnim_SwapLine_End
};

const struct CompressedSpriteSheet gBagSwapSpriteSheet = {
    .data = gSwapLine_Gfx,
    .size = 0x100,
    .tag = TAG_SWAP_LINE
};

const struct SpritePalette gBagSwapSpritePalette = {
    .data = gSwapLine_Pal,
    .tag = TAG_SWAP_LINE
};

static const struct SpriteTemplate sSpriteTemplate_SwapLine = {
    .tileTag = TAG_SWAP_LINE,
    .paletteTag = TAG_SWAP_LINE,
    .oam = &sOamData_SwapLine,
    .anims = sAnims_SwapLine,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static void Task_ContinueTaskAfterMessagePrints(u8 taskId);

void DisplayMessageAndContinueTask(u8 taskId, u8 windowId, u16 tileNum, u8 paletteNum, u8 fontId, u8 textSpeed, const u8 *string, void *taskFunc)
{
    sMessageWindowId = windowId;
    DrawDialogFrameWithCustomTileAndPalette(windowId, TRUE, tileNum, paletteNum);

    if (string != gStringVar4)
        StringExpandPlaceholders(gStringVar4, string);

    gTextFlags.canABSpeedUpPrint = 1;
    AddTextPrinterParameterized2(windowId, fontId, gStringVar4, textSpeed, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
    sMessageNextTask = taskFunc;
    gTasks[taskId].func = Task_ContinueTaskAfterMessagePrints;
}

bool16 RunTextPrinters_CheckActive(u8 textPrinterId)
{
    RunTextPrinters();
    return IsTextPrinterActive(textPrinterId);
}

static void Task_ContinueTaskAfterMessagePrints(u8 taskId)
{
    if (!RunTextPrinters_CheckActive(sMessageWindowId))
        sMessageNextTask(taskId);
}

static void Task_CallYesOrNoCallback(u8 taskId)
{
    switch (Menu_ProcessInputNoWrapClearOnChoose())
    {
    case 0:
        PlaySE(SE_SELECT);
        gTasks[taskId].func = sYesNo->yesFunc;
        break;
    case 1:
    case MENU_B_PRESSED:
        PlaySE(SE_SELECT);
        gTasks[taskId].func = sYesNo->noFunc;
        break;
    }
}

void CreateYesNoMenuWithCallbacks(u8 taskId, const struct WindowTemplate *template, u8 fontId, u8 left, u8 top, u16 tileStart, u8 palette, const struct YesNoFuncTable *yesNo)
{
    CreateYesNoMenuAtPos(template, fontId, left, top, tileStart, palette, 0);
    sYesNo = yesNo;
    gTasks[taskId].func = Task_CallYesOrNoCallback;
}

u8 GetLRKeysPressed(void)
{
    if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
    {
        if (JOY_NEW(L_BUTTON))
            return MENU_L_PRESSED;
        if (JOY_NEW(R_BUTTON))
            return MENU_R_PRESSED;
    }
    return 0;
}

u8 GetLRKeysPressedAndHeld(void)
{
    if (gSaveBlock2Ptr->optionsButtonMode == OPTIONS_BUTTON_MODE_LR)
    {
        if (JOY_REPEAT(L_BUTTON))
            return MENU_L_PRESSED;
        if (JOY_REPEAT(R_BUTTON))
            return MENU_R_PRESSED;
    }
    return 0;
}

bool8 IsHoldingItemAllowed(u16 itemId)
{
    // Enigma Berry can't be held in link areas
    if (itemId == ITEM_ENIGMA_BERRY_E_READER
     && ((gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(MAP_TRADE_CENTER)
       && gSaveBlock1Ptr->location.mapNum == MAP_NUM(MAP_TRADE_CENTER))
       || InUnionRoom() == TRUE))
        return FALSE;
    else
        return TRUE;
}

bool8 IsWritingMailAllowed(u16 itemId)
{
    if ((IsUpdateLinkStateCBActive() == TRUE || InUnionRoom() == TRUE) && ItemIsMail(itemId) == TRUE)
        return FALSE;
    else
        return TRUE;
}

bool8 MenuHelpers_IsLinkActive(void)
{
    if (IsUpdateLinkStateCBActive() == TRUE || gReceivedRemoteLinkPlayers == 1)
        return TRUE;
    else
        return FALSE;
}

bool8 IsActiveOverworldLinkBusy(void)
{
    if (!MenuHelpers_IsLinkActive())
        return FALSE;
    else
        return (u8)Overworld_LinkRecvQueueLengthMoreThan2();
}

bool8 MenuHelpers_ShouldWaitForLinkRecv(void)
{
    if (IsActiveOverworldLinkBusy() == TRUE || IsLinkRecvQueueAtOverworldMax() == TRUE)
        return TRUE;
    else
        return FALSE;
}

void SetVBlankHBlankCallbacksToNull(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

void ResetVramOamAndBgCntRegs(void)
{
    ResetAllBgsCoordinatesAndBgCntRegs();
    CpuFill16(0, (void *) VRAM, VRAM_SIZE);
    CpuFill32(0, (void *) OAM, OAM_SIZE);
    CpuFill16(0, (void *) PLTT, PLTT_SIZE);
}

void ResetAllBgsCoordinates(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
}

void ResetAllBgsCoordinatesAndBgCntRegs(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BG3CNT, 0);
    SetGpuReg(REG_OFFSET_BG2CNT, 0);
    SetGpuReg(REG_OFFSET_BG1CNT, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    ResetAllBgsCoordinates();
}

bool8 AdjustQuantityAccordingToDPadInput(s16 *quantity_p, u16 qmax)
{
    s16 valBefore = (*quantity_p);

    if (JOY_REPEAT(DPAD_ANY) == DPAD_UP)
    {
        (*quantity_p)++;
        if ((*quantity_p) > qmax)
            (*quantity_p) = 1;

        if ((*quantity_p) == valBefore)
        {
            return FALSE;
        }
        else
        {
            PlaySE(SE_SELECT);
            return TRUE;
        }
    }
    else if (JOY_REPEAT(DPAD_ANY) == DPAD_DOWN)
    {
        (*quantity_p)--;
        if ((*quantity_p) <= 0)
            (*quantity_p) = qmax;
        if ((*quantity_p) == valBefore)
        {
            return FALSE;
        }
        else
        {
            PlaySE(SE_SELECT);
            return TRUE;
        }
    }
    else if (JOY_REPEAT(DPAD_ANY) == DPAD_RIGHT)
    {
        (*quantity_p) += 10;
        if ((*quantity_p) > qmax)
            (*quantity_p) = qmax;
        if ((*quantity_p) == valBefore)
        {
            return FALSE;
        }
        else
        {
            PlaySE(SE_SELECT);
            return TRUE;
        }
    }
    else if (JOY_REPEAT(DPAD_ANY) == DPAD_LEFT)
    {
        (*quantity_p) -= 10;
        if ((*quantity_p) <= 0)
            (*quantity_p) = 1;
        if ((*quantity_p) == valBefore)
        {
            return FALSE;
        }
        else
        {
            PlaySE(SE_SELECT);
            return TRUE;
        }
    }
    return FALSE;
}

u8 GetDialogBoxFontId(void)
{
    if (ContextNpcGetTextColor() == NPC_TEXT_COLOR_MALE)
        return FONT_MALE;
    else
        return FONT_FEMALE;
}

void CreateSwapLineSprites(u8 *spriteIds, u8 count)
{
    u8 i;

    for (i = 0; i < count; i++)
    {
        spriteIds[i] = CreateSprite(&sSpriteTemplate_SwapLine, i * 16 + 96, 7, 0);
        if (i != 0)
            StartSpriteAnim(&gSprites[spriteIds[i]], ANIM_SWAP_LINE_MID);

        gSprites[spriteIds[i]].invisible = TRUE;
    }
}

void SetSwapLineSpritesInvisibility(u8 *spriteIds, u8 count, bool8 invisible)
{
    u8 i;

    for (i = 0; i < count; i++)
        gSprites[spriteIds[i]].invisible = invisible;
}

void UpdateSwapLineSpritesPos(u8 *spriteIds, u8 count, s16 x, u16 y)
{
    u8 i;
    bool8 hasMargin = count & SWAP_LINE_HAS_MARGIN;
    count &= ~SWAP_LINE_HAS_MARGIN;

    for (i = 0; i < count; i++)
    {
        // If the list menu has a right margin, the swap line
        // shouldn't extend all the way to the edge of the screen.
        // If this is the last sprite in the line, move it a bit
        // to the left to keep it out of the margin.
        if (i == count - 1 && hasMargin)
            gSprites[spriteIds[i]].x2 = x - 8;
        else
            gSprites[spriteIds[i]].x2 = x;

        gSprites[spriteIds[i]].y = 1 + y;
    }
}
