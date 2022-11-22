#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "help_system.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "pokemon_storage_system_internal.h"
#include "script.h"
#include "strings.h"
#include "task.h"
#include "constants/songs.h"
#include "constants/field_weather.h"
#include "constants/help_system.h"

static EWRAM_DATA u8 sPreviousBoxOption = 0;
static EWRAM_DATA struct ChooseBoxMenu *sChooseBoxMenu = NULL;

static void CreatePCMainMenu(u8 whichMenu, s16 *windowIdPtr);
static void ChooseBoxMenu_CreateSprites(u8 curBox);
static void ChooseBoxMenu_DestroySprites(void);
static void ChooseBoxMenu_MoveRight(void);
static void ChooseBoxMenu_MoveLeft(void);
static void ChooseBoxMenu_PrintBoxNameAndCount(void);
static void ChooseBoxMenu_PrintTextToSprite(const u8 *a0, u16 x, u16 y);
static void SpriteCB_ChooseBoxArrow(struct Sprite *sprite);

static const u16 sChooseBoxMenu_Pal[];
static const u8 sChooseBoxMenuCenter_Gfx[];
static const u8 sChooseBoxMenuCorners_Gfx[];

struct {
    const u8 *text;
    const u8 *desc;
} static const sMainMenuTexts[OPTIONS_COUNT] = {
    [OPTION_WITHDRAW]   = {gText_WithdrawPokemon, gText_WithdrawMonDescription},
    [OPTION_DEPOSIT]    = {gText_DepositPokemon,  gText_DepositMonDescription},
    [OPTION_MOVE_MONS]  = {gText_MovePokemon,     gText_MoveMonDescription},
    [OPTION_MOVE_ITEMS] = {gText_MoveItems,       gText_MoveItemsDescription},
    [OPTION_EXIT]       = {gText_SeeYa,           gText_SeeYaDescription}
};

void DrawTextWindowAndBufferTiles(const u8 *string, void *dst, u8 zero1, u8 zero2, u8 *unused, s32 bytesToBuffer)
{
    s32 i, tileBytesToBuffer, remainingBytes;
    u16 windowId;
    u8 txtColor[3];
    u8 *tileData1, *tileData2;
    struct WindowTemplate winTemplate = {0};

    winTemplate.width = 24;
    winTemplate.height = 2;
    windowId = AddWindow(&winTemplate);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(zero2));
    tileData1 = (u8 *)GetWindowAttribute(windowId, WINDOW_TILE_DATA);
    tileData2 = (winTemplate.width * TILE_SIZE_4BPP) + tileData1;

    if (!zero1)
        txtColor[0] = TEXT_COLOR_TRANSPARENT;
    else
        txtColor[0] = zero2;
    txtColor[1] = TEXT_DYNAMIC_COLOR_6;
    txtColor[2] = TEXT_DYNAMIC_COLOR_5;
    AddTextPrinterParameterized4(windowId, FONT_NORMAL_COPY_1, 0, 2, 0, 0, txtColor, -1, string);

    tileBytesToBuffer = bytesToBuffer;
    if (tileBytesToBuffer > 6)
        tileBytesToBuffer = 6;
    remainingBytes = bytesToBuffer - 6;
    if (tileBytesToBuffer > 0)
    {
        for (i = tileBytesToBuffer; i != 0; i--)
        {
            CpuCopy16(tileData1, dst, 0x80);
            CpuCopy16(tileData2, dst + 0x80, 0x80);
            tileData1 += 0x80;
            tileData2 += 0x80;
            dst += 0x100;
        }
    }

    // Never used. bytesToBuffer is always passed <= 6, so remainingBytes is always <= 0 here
    if (remainingBytes > 0)
        CpuFill16((zero2 << 4) | zero2, dst, (u32)(remainingBytes) * 0x100);

    RemoveWindow(windowId);
}

static void PrintStringToBufferCopyNow(const u8 *string, void *dst, u16 offset, u8 bgColor, u8 fgColor, u8 shadowColor, u8 *unused)
{
    u32 var;
    u8 windowId;
    u8 txtColor[3];
    u8 *tileData1, *tileData2;
    struct WindowTemplate winTemplate = {0};

    winTemplate.width = StringLength_Multibyte(string);
    winTemplate.height = 2;
    var = winTemplate.width * 32;
    windowId = AddWindow(&winTemplate);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(bgColor));
    tileData1 = (u8 *)GetWindowAttribute(windowId, WINDOW_TILE_DATA);
    tileData2 = (winTemplate.width * 32) + tileData1;
    txtColor[0] = bgColor;
    txtColor[1] = fgColor;
    txtColor[2] = shadowColor;
    AddTextPrinterParameterized4(windowId, FONT_NORMAL_COPY_1, 0, 2, 0, 0, txtColor, -1, string);
    CpuCopy16(tileData1, dst, var);
    CpuCopy16(tileData2, dst + offset, var);
    RemoveWindow(windowId);
}

static u8 CountMonsInBox(u8 boxId)
{
    u16 i, count;

    for (i = 0, count = 0; i < IN_BOX_COUNT; i++)
    {
        if (GetBoxMonDataAt(boxId, i, MON_DATA_SPECIES) != SPECIES_NONE)
            count++;
    }

    return count;
}

s16 GetFirstFreeBoxSpot(u8 boxId)
{
    u16 i;

    for (i = 0; i < IN_BOX_COUNT; i++)
    {
        if (GetBoxMonDataAt(boxId, i, MON_DATA_SPECIES) == SPECIES_NONE)
            return i;
    }

    return -1; // all spots are taken
}

u8 CountPartyNonEggMons(void)
{
    u16 i, count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != SPECIES_NONE
                && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
            count++;
    }

    return count;
}

u8 CountPartyAliveNonEggMonsExcept(u8 slotToIgnore)
{
    u16 i, count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (i != slotToIgnore
                && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != SPECIES_NONE
                && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG)
                && GetMonData(&gPlayerParty[i], MON_DATA_HP) != 0)
            count++;
    }

    return count;
}

u16 CountPartyAliveNonEggMons_IgnoreVar0x8004Slot(void)
{
    return CountPartyAliveNonEggMonsExcept(gSpecialVar_0x8004);
}

u8 CountPartyMons(void)
{
    u16 i, count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) != SPECIES_NONE)
            count++;
    }

    return count;
}

static u8 *StringCopyAndFillWithSpaces(u8 *dst, const u8 *src, u16 n)
{
    u8 *str;

    for (str = StringCopy(dst, src); str < dst + n; str++)
        *str = CHAR_SPACE;

    *str = EOS;
    return str;
}

// Unused
static void UnusedWriteRectCpu(u16 *dest, u16 dest_left, u16 dest_top, const u16 *src, u16 src_left, u16 src_top, u16 dest_width, u16 dest_height, u16 src_width)
{
    u16 i;

    dest_width *= 2;
    dest += dest_top * 0x20 + dest_left;
    src += src_top * src_width + src_left;
    for (i = 0; i < dest_height; i++)
    {
        CpuCopy16(src, dest, dest_width);
        dest += 0x20;
        src += src_width;
    }
}

// Unused
static void UnusedWriteRectDma(u16 *dest, u16 dest_left, u16 dest_top, u16 width, u16 height)
{
    u16 i;

    dest += dest_top * 0x20 + dest_left;
    width *= 2;
    for (i = 0; i < height; dest += 0x20, i++)
        Dma3FillLarge16_(0, dest, width);
}

enum {
    STATE_LOAD,
    STATE_FADE_IN,
    STATE_HANDLE_INPUT,
    STATE_ERROR_MSG,
    STATE_ENTER_PC,
};

#define tState          data[0]
#define tSelectedOption data[1]
#define tInput          data[2]
#define tNextOption     data[3]
#define tWindowId       data[15]

static void Task_PCMainMenu(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case STATE_LOAD:
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        CreatePCMainMenu(task->tSelectedOption, &task->tWindowId);
        LoadStdWindowFrameGfx();
        DrawDialogueFrame(0, FALSE);
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, TEXT_SKIP_DRAW, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
        CopyWindowToVram(0, COPYWIN_FULL);
        CopyWindowToVram(task->tWindowId, COPYWIN_FULL);
        task->tState++;
        break;
    case STATE_FADE_IN:
        if (IsWeatherNotFadingIn())
            task->tState++;

        break;
    case STATE_HANDLE_INPUT:
        task->tInput = Menu_ProcessInput();
        switch(task->tInput)
        {
        case MENU_NOTHING_CHOSEN:
            task->tNextOption = task->tSelectedOption;
            if (JOY_NEW(DPAD_UP) && --task->tNextOption < 0)
                task->tNextOption = OPTIONS_COUNT - 1;
            if (JOY_NEW(DPAD_DOWN) && ++task->tNextOption > OPTIONS_COUNT - 1)
                task->tNextOption = 0;

            if (task->tSelectedOption != task->tNextOption)
            {
                task->tSelectedOption = task->tNextOption;
                FillWindowPixelBuffer(0, PIXEL_FILL(1));
                AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            }
            break;
        case MENU_B_PRESSED:
        case OPTION_EXIT:
            ClearStdWindowAndFrame(0, TRUE);
            ClearStdWindowAndFrame(task->tWindowId, TRUE);
            UnlockPlayerFieldControls();
            ScriptContext_Enable();
            DestroyTask(taskId);
            break;
        default:
            if (task->tInput == OPTION_WITHDRAW && CountPartyMons() == PARTY_SIZE)
            {
                // Can't withdraw
                FillWindowPixelBuffer(0, PIXEL_FILL(1));
                AddTextPrinterParameterized2(0, FONT_NORMAL, gText_PartyFull, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
                task->tState = STATE_ERROR_MSG;
            }
            else if (task->tInput == OPTION_DEPOSIT && CountPartyMons() == 1)
            {
                // Can't deposit
                FillWindowPixelBuffer(0, PIXEL_FILL(1));
                AddTextPrinterParameterized2(0, FONT_NORMAL, gText_JustOnePkmn, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
                task->tState = STATE_ERROR_MSG;
            }
            else
            {
                // Enter PC
                FadeScreen(FADE_TO_BLACK, 0);
                task->tState = STATE_ENTER_PC;
            }
            break;
        }
        break;
    case STATE_ERROR_MSG:
        // Printed "can't do PC option message"
        // Wait for new input after message
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            FillWindowPixelBuffer(0, PIXEL_FILL(1));
            AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = STATE_HANDLE_INPUT;
        }
        else if (JOY_NEW(DPAD_UP))
        {
            if (--task->tSelectedOption < 0)
                task->tSelectedOption = 4;
            Menu_MoveCursor(-1);
            task->tSelectedOption = Menu_GetCursorPos();
            FillWindowPixelBuffer(0, PIXEL_FILL(1));
            AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = STATE_HANDLE_INPUT;
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            if (++task->tSelectedOption > 3)
                task->tSelectedOption = 0;
            Menu_MoveCursor(1);
            task->tSelectedOption = Menu_GetCursorPos();
            FillWindowPixelBuffer(0, PIXEL_FILL(1));
            AddTextPrinterParameterized2(0, FONT_NORMAL, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = STATE_HANDLE_INPUT;
        }
        break;
    case STATE_ENTER_PC:
        if (!gPaletteFade.active)
        {
            CleanupOverworldWindowsAndTilemaps();
            EnterPokeStorage(task->tInput);
            DestroyTask(taskId);
        }
        break;
    }
}

void ShowPokemonStorageSystemPC(void)
{
    u8 taskId = CreateTask(Task_PCMainMenu, 80);
    gTasks[taskId].tState = STATE_LOAD;
    gTasks[taskId].tSelectedOption = 0;
    LockPlayerFieldControls();
}

static void FieldTask_ReturnToPcMenu(void)
{
    u8 taskId;
    MainCallback vblankCb = gMain.vblankCallback;

    SetVBlankCallback(NULL);
    taskId = CreateTask(Task_PCMainMenu, 80);
    gTasks[taskId].tState = STATE_LOAD;
    gTasks[taskId].tSelectedOption = sPreviousBoxOption;
    Task_PCMainMenu(taskId);
    SetVBlankCallback(vblankCb);
    FadeInFromBlack();
}

static const struct WindowTemplate sWindowTemplate_MainMenu = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 17,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static void CreatePCMainMenu(u8 whichMenu, s16 *windowIdPtr)
{
    s16 windowId = AddWindow(&sWindowTemplate_MainMenu);

    DrawStdWindowFrame(windowId, FALSE);
    PrintTextArray(windowId, FONT_NORMAL, GetMenuCursorDimensionByFont(FONT_NORMAL, 0), 2, 16, ARRAY_COUNT(sMainMenuTexts), (void *)sMainMenuTexts);
    Menu_InitCursor(windowId, FONT_NORMAL, 0, 2, 16, ARRAY_COUNT(sMainMenuTexts), whichMenu);
    *windowIdPtr = windowId;
}

void CB2_ExitPokeStorage(void)
{
    sPreviousBoxOption = GetCurrentBoxOption();
    gFieldCallback = FieldTask_ReturnToPcMenu;
    SetMainCallback2(CB2_ReturnToField);
}

void ResetPokemonStorageSystem(void)
{
    u16 boxId, boxPosition;

    SetCurrentBox(0);
    for (boxId = 0; boxId < TOTAL_BOXES_COUNT; boxId++)
    {
        for (boxPosition = 0; boxPosition < IN_BOX_COUNT; boxPosition++)
            ZeroBoxMonAt(boxId, boxPosition);
    }
    for (boxId = 0; boxId < TOTAL_BOXES_COUNT; boxId++)
    {
        u8 *dest = StringCopy(GetBoxNamePtr(boxId), gText_Box);
        ConvertIntToDecimalStringN(dest, boxId + 1, STR_CONV_MODE_LEFT_ALIGN, 2);
    }

    for (boxId = 0; boxId < TOTAL_BOXES_COUNT; boxId++)
        SetBoxWallpaper(boxId, boxId % (MAX_DEFAULT_WALLPAPER + 1));
}

void LoadChooseBoxMenuGfx(struct ChooseBoxMenu *menu, u16 tileTag, u16 palTag, u8 subpriority, bool32 loadPal)
{
    struct SpritePalette palette = {
        sChooseBoxMenu_Pal, palTag
    };
    struct SpriteSheet sheets[] = {
        {sChooseBoxMenuCenter_Gfx, 0x800, tileTag},
        {sChooseBoxMenuCorners_Gfx,  0x180, tileTag + 1},
        {}
    };

    if (loadPal) // Always false
        LoadSpritePalette(&palette);

    LoadSpriteSheets(sheets);
    sChooseBoxMenu = menu;
    menu->tileTag = tileTag;
    menu->paletteTag = palTag;
    menu->subpriority = subpriority;
    menu->loadedPalette = loadPal;
}

void FreeBoxSelectionPopupSpriteGfx(void)
{
    if (sChooseBoxMenu->loadedPalette)
        FreeSpritePaletteByTag(sChooseBoxMenu->paletteTag);
    FreeSpriteTilesByTag(sChooseBoxMenu->tileTag);
    FreeSpriteTilesByTag(sChooseBoxMenu->tileTag + 1);
}

void CreateChooseBoxMenuSprites(u8 curBox)
{
    ChooseBoxMenu_CreateSprites(curBox);
}

void DestroyChooseBoxMenuSprites(void)
{
    ChooseBoxMenu_DestroySprites();
}

u8 HandleBoxChooseSelectionInput(void)
{
    if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        return BOXID_CANCELED;
    }
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        return sChooseBoxMenu->curBox;
    }
    if (JOY_NEW(DPAD_LEFT))
    {
        PlaySE(SE_SELECT);
        ChooseBoxMenu_MoveLeft();
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        PlaySE(SE_SELECT);
        ChooseBoxMenu_MoveRight();
    }
    return BOXID_NONE_CHOSEN;
}

static const union AnimCmd sAnim_ChooseBoxMenu_TopLeft[] = {
    ANIMCMD_FRAME( 0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_ChooseBoxMenu_BottomLeft[] = {
    ANIMCMD_FRAME( 4, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_ChooseBoxMenu_TopRight[] = {
    ANIMCMD_FRAME( 6, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_ChooseBoxMenu_BottomRight[] = {
    ANIMCMD_FRAME(10, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_ChooseBoxMenu[] = {
    sAnim_ChooseBoxMenu_TopLeft,
    sAnim_ChooseBoxMenu_BottomLeft,
    sAnim_ChooseBoxMenu_TopRight,
    sAnim_ChooseBoxMenu_BottomRight,
};

static const union AffineAnimCmd sAffineAnim_ChooseBoxMenu[] = {
    AFFINEANIMCMD_FRAME(224, 224, 0, 0),
    AFFINEANIMCMD_END
};

// Unused
static const union AffineAnimCmd *const sAffineAnims_ChooseBoxMenu[] = {
    sAffineAnim_ChooseBoxMenu
};

static void ChooseBoxMenu_CreateSprites(u8 curBox)
{
    u16 i;
    u8 spriteId;
    struct SpriteTemplate template;
    struct OamData oamData = {};
    oamData.size = SPRITE_SIZE(64x64);
    oamData.paletteNum = 1;
    template = (struct SpriteTemplate){
        0, 0, &oamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    };
    {
    const u8 sText_OutOf30[] = _("/30");

    sChooseBoxMenu->curBox = curBox;
    template.tileTag = sChooseBoxMenu->tileTag;
    template.paletteTag = sChooseBoxMenu->paletteTag;

    spriteId = CreateSprite(&template, 160, 96, 0);
    sChooseBoxMenu->menuSprite = gSprites + spriteId;

    oamData.shape = SPRITE_SHAPE(8x32);
    oamData.size = SPRITE_SIZE(8x32);
    template.tileTag = sChooseBoxMenu->tileTag + 1;
    template.anims = sAnims_ChooseBoxMenu;
    for (i = 0; i < ARRAY_COUNT(sChooseBoxMenu->menuCornerSprites); i++)
    {
        // corner sprites are created in order of top left, bottom left, top right, bottom right
        u16 animNum;
        spriteId = CreateSprite(&template, 124, 80, sChooseBoxMenu->subpriority); // place at top left
        sChooseBoxMenu->menuCornerSprites[i] = &gSprites[spriteId];
        animNum = 0;
        if (i & 2)
        {
            sChooseBoxMenu->menuCornerSprites[i]->x = 196; // move to bottom
            animNum = 2;
        }
        if (i & 1)
        {
            sChooseBoxMenu->menuCornerSprites[i]->y = 112; // move to right
            sChooseBoxMenu->menuCornerSprites[i]->oam.size = SPRITE_SIZE(8x16);
            animNum++;
        }
        StartSpriteAnim(sChooseBoxMenu->menuCornerSprites[i], animNum);
    }
    for (i = 0; i < ARRAY_COUNT(sChooseBoxMenu->arrowSprites); i++)
    {
        sChooseBoxMenu->arrowSprites[i] = CreateChooseBoxArrows(72 * i + 124, 88, i, 0, sChooseBoxMenu->subpriority);
        if (sChooseBoxMenu->arrowSprites[i])
        {
            sChooseBoxMenu->arrowSprites[i]->data[0] = (i == 0 ? -1 : 1);
            sChooseBoxMenu->arrowSprites[i]->callback = SpriteCB_ChooseBoxArrow;
        }
    }
    ChooseBoxMenu_PrintBoxNameAndCount();
    ChooseBoxMenu_PrintTextToSprite(sText_OutOf30, 5, 3);
    }
}

static void ChooseBoxMenu_DestroySprites(void)
{
    u16 i;
    if (sChooseBoxMenu->menuSprite)
    {
        DestroySprite(sChooseBoxMenu->menuSprite);
        sChooseBoxMenu->menuSprite = NULL;
    }
    for (i = 0; i < ARRAY_COUNT(sChooseBoxMenu->menuCornerSprites); i++)
    {
        if (sChooseBoxMenu->menuCornerSprites[i])
        {
            DestroySprite(sChooseBoxMenu->menuCornerSprites[i]);
            sChooseBoxMenu->menuCornerSprites[i] = NULL;
        }
    }
    for (i = 0; i < ARRAY_COUNT(sChooseBoxMenu->arrowSprites); i++)
    {
        if (sChooseBoxMenu->arrowSprites[i])
            DestroySprite(sChooseBoxMenu->arrowSprites[i]);
    }
}

static void ChooseBoxMenu_MoveRight(void)
{
    if (++sChooseBoxMenu->curBox >= TOTAL_BOXES_COUNT)
        sChooseBoxMenu->curBox = 0;
    ChooseBoxMenu_PrintBoxNameAndCount();
}

static void ChooseBoxMenu_MoveLeft(void)
{
    sChooseBoxMenu->curBox = (sChooseBoxMenu->curBox == 0 ? TOTAL_BOXES_COUNT - 1 : sChooseBoxMenu->curBox - 1);
    ChooseBoxMenu_PrintBoxNameAndCount();
}

static void ChooseBoxMenu_PrintBoxNameAndCount(void)
{
    u8 numMonInBox = CountMonsInBox(sChooseBoxMenu->curBox);
    u8 *boxName = StringCopy(sChooseBoxMenu->strbuf, GetBoxNamePtr(sChooseBoxMenu->curBox));

    while (boxName < sChooseBoxMenu->strbuf + BOX_NAME_LENGTH)
        *boxName++ = CHAR_SPACE;
    *boxName = EOS;

    ChooseBoxMenu_PrintTextToSprite(sChooseBoxMenu->strbuf, 0, 1);

    ConvertIntToDecimalStringN(sChooseBoxMenu->strbuf, numMonInBox, STR_CONV_MODE_RIGHT_ALIGN, 2);

    ChooseBoxMenu_PrintTextToSprite(sChooseBoxMenu->strbuf, 3, 3);
}

static void ChooseBoxMenu_PrintTextToSprite(const u8 *str, u16 x, u16 y)
{
    void *dst = (void *)(OBJ_VRAM0 + GetSpriteTileStartByTag(sChooseBoxMenu->tileTag) * 32 + 256 * y + 32 * x);
    PrintStringToBufferCopyNow(str, dst, 0x100, TEXT_COLOR_RED, TEXT_DYNAMIC_COLOR_6, TEXT_DYNAMIC_COLOR_5, sChooseBoxMenu->buffer);
}

static void SpriteCB_ChooseBoxArrow(struct Sprite *sprite)
{
    if (++sprite->data[1] > 3)
    {
        sprite->data[1] = 0;
        sprite->x2 += sprite->data[0];
        if (++sprite->data[2] > 5)
        {
            sprite->data[2] = 0;
            sprite->x2 = 0;
        }
    }
}

// Unused, since LoadChooseBoxMenuGfx is always called with `loadPal` as false
static const u16 sChooseBoxMenu_Pal[] = INCBIN_U16("graphics/pokemon_storage/unused_choose_box_menu.gbapal");

static const u8 sChooseBoxMenuCenter_Gfx[] = INCBIN_U8("graphics/pokemon_storage/choose_box_menu_center.4bpp");
static const u8 sChooseBoxMenuCorners_Gfx[] = INCBIN_U8("graphics/pokemon_storage/choose_box_menu_corners.4bpp");
