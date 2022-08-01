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
static EWRAM_DATA struct ChooseBoxMenu *sBoxSelectionPopupSpriteManager = NULL;

static void PSS_CreatePCMenu(u8 whichMenu, s16 *windowIdPtr);
static void ChooseBoxMenu_CreateSprites(u8 curBox);
static void sub_808CBA4(void);
static void UpdateBoxNameAndCountSprite_WraparoundRight(void);
static void UpdateBoxNameAndCountSprite_WraparoundLeft(void);
static void PrintBoxNameAndCountToSprite(void);
static void PrintToSpriteWithTagUnk0240(const u8 *a0, u16 x, u16 y);
static void sub_808CD64(struct Sprite *sprite);

// Forward declarations

static const u16 sBoxSelectionPopupPalette[];
static const u16 sBoxSelectionPopupCenterTiles[];
static const u16 sBoxSelectionPopupSidesTiles[];

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

void DrawTextWindowAndBufferTiles(const u8 *string, void *dst, u8 zero1, u8 zero2, u8 *buffer, s32 bytesToBuffer)
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
    AddTextPrinterParameterized4(windowId, FONT_1, 0, 2, 0, 0, txtColor, -1, string);

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

static void PrintStringToBufferCopyNow(const u8 *string, void *dst, u16 rise, u8 bgClr, u8 fgClr, u8 shClr, u8 *buffer)
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
    FillWindowPixelBuffer(windowId, PIXEL_FILL(bgClr));
    tileData1 = (u8 *)GetWindowAttribute(windowId, WINDOW_TILE_DATA);
    tileData2 = (winTemplate.width * 32) + tileData1;
    txtColor[0] = bgClr;
    txtColor[1] = fgClr;
    txtColor[2] = shClr;
    AddTextPrinterParameterized4(windowId, FONT_1, 0, 2, 0, 0, txtColor, -1, string);
    CpuCopy16(tileData1, dst, var);
    CpuCopy16(tileData2, dst + rise, var);
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
        {
            count++;
        }
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
        {
            count++;
        }
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
        {
            count++;
        }
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

static void sub_808C25C(u16 *dest, u16 dest_left, u16 dest_top, const u16 *src, u16 src_left, u16 src_top, u16 dest_width, u16 dest_height, u16 src_width)
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


//------------------------------------------------------------------------------
//  SECTION: Main menu
//
//  The below functions generally handle the PC main menu where the main
//  options can be selected (Withdraw, Deposit, etc.), as well as exiting
//  Pokémon Storage back to this menu.
//------------------------------------------------------------------------------


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
        PSS_CreatePCMenu(task->tSelectedOption, &task->tWindowId);
        LoadStdWindowFrameGfx();
        DrawDialogueFrame(0, FALSE);
        FillWindowPixelBuffer(0, PIXEL_FILL(1));
        AddTextPrinterParameterized2(0, FONT_2, sMainMenuTexts[task->tSelectedOption].desc, TEXT_SKIP_DRAW, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
        CopyWindowToVram(0, COPYWIN_FULL);
        CopyWindowToVram(task->tWindowId, COPYWIN_FULL);
        task->tState++;
        break;
    case STATE_FADE_IN:
        if (IsWeatherNotFadingIn())
        {
            task->tState++;
        }
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
                AddTextPrinterParameterized2(0, FONT_2, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            }
            break;
        case MENU_B_PRESSED:
        case OPTION_EXIT:
            ClearStdWindowAndFrame(0, TRUE);
            ClearStdWindowAndFrame(task->tWindowId, TRUE);
            ScriptContext2_Disable();
            EnableBothScriptContexts();
            DestroyTask(taskId);
            break;
        default:
            if (task->tInput == 0 && CountPartyMons() == PARTY_SIZE)
            {
                // Can't withdraw
                FillWindowPixelBuffer(0, PIXEL_FILL(1));
                AddTextPrinterParameterized2(0, FONT_2, gText_PartyFull, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
                task->tState = 3;
            }
            else if (task->tInput == 1 && CountPartyMons() == 1)
            {
                // Can't deposit
                FillWindowPixelBuffer(0, PIXEL_FILL(1));
                AddTextPrinterParameterized2(0, FONT_2, gText_JustOnePkmn, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
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
            AddTextPrinterParameterized2(0, FONT_2, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = STATE_HANDLE_INPUT;
        }
        else if (JOY_NEW(DPAD_UP))
        {
            if (--task->tSelectedOption < 0)
                task->tSelectedOption = 4;
            Menu_MoveCursor(-1);
            task->tSelectedOption = Menu_GetCursorPos();
            FillWindowPixelBuffer(0, PIXEL_FILL(1));
            AddTextPrinterParameterized2(0, FONT_2, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = STATE_HANDLE_INPUT;
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            if (++task->tSelectedOption > 3)
                task->tSelectedOption = 0;
            Menu_MoveCursor(1);
            task->tSelectedOption = Menu_GetCursorPos();
            FillWindowPixelBuffer(0, PIXEL_FILL(1));
            AddTextPrinterParameterized2(0, FONT_2, sMainMenuTexts[task->tSelectedOption].desc, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = STATE_HANDLE_INPUT;
        }
        break;
    case STATE_ENTER_PC:
        if (!gPaletteFade.active)
        {
            CleanupOverworldWindowsAndTilemaps();
            Cb2_EnterPSS(task->tInput);
            DestroyTask(taskId);
        }
        break;
    }
}

void ShowPokemonStorageSystemPC(void)
{
    u8 taskId = CreateTask(Task_PCMainMenu, 80);
    gTasks[taskId].tState = 0;
    gTasks[taskId].tSelectedOption = 0;
    ScriptContext2_Enable();
}

static void FieldTask_ReturnToPcMenu(void)
{
    u8 taskId;
    MainCallback vblankCb = gMain.vblankCallback;

    SetVBlankCallback(NULL);
    taskId = CreateTask(Task_PCMainMenu, 80);
    gTasks[taskId].tState = 0;
    gTasks[taskId].tSelectedOption = sPreviousBoxOption;
    Task_PCMainMenu(taskId);
    SetVBlankCallback(vblankCb);
    FadeInFromBlack();
}

static const struct WindowTemplate sUnknown_83CDA48 = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 17,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static void PSS_CreatePCMenu(u8 whichMenu, s16 *windowIdPtr)
{
    s16 windowId;
    windowId = AddWindow(&sUnknown_83CDA48);

    DrawStdWindowFrame(windowId, FALSE);
    PrintTextArray(windowId, FONT_2, GetMenuCursorDimensionByFont(FONT_2, 0), 2, 16, NELEMS(sMainMenuTexts), (void *)sMainMenuTexts);
    Menu_InitCursor(windowId, FONT_2, 0, 2, 16, NELEMS(sMainMenuTexts), whichMenu);
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


//------------------------------------------------------------------------------
//  SECTION: Choose Box menu
//
//  The below functions handle the popup menu that allows the player to cycle
//  through the boxes and select one. Used when storing Pokémon in Deposit mode
//  and for the Jump feature.
//------------------------------------------------------------------------------


void LoadChooseBoxMenuGfx(struct ChooseBoxMenu *a0, u16 tileTag, u16 palTag, u8 a3, bool32 loadPal)
{
    struct SpritePalette palette = {
        sBoxSelectionPopupPalette, palTag
    };
    struct SpriteSheet sheets[] = {
        {sBoxSelectionPopupCenterTiles, 0x800, tileTag},
        {sBoxSelectionPopupSidesTiles,  0x180, tileTag + 1},
        {}
    };

    if (loadPal)
        LoadSpritePalette(&palette);

    LoadSpriteSheets(sheets);
    sBoxSelectionPopupSpriteManager = a0;
    a0->tileTag = tileTag;
    a0->paletteTag = palTag;
    a0->subpriority = a3;
    a0->loadedPalette = loadPal;
}

void FreeBoxSelectionPopupSpriteGfx(void)
{
    if (sBoxSelectionPopupSpriteManager->loadedPalette)
        FreeSpritePaletteByTag(sBoxSelectionPopupSpriteManager->paletteTag);
    FreeSpriteTilesByTag(sBoxSelectionPopupSpriteManager->tileTag);
    FreeSpriteTilesByTag(sBoxSelectionPopupSpriteManager->tileTag + 1);
}

void sub_808C940(u8 curBox)
{
    ChooseBoxMenu_CreateSprites(curBox);
}

void sub_808C950(void)
{
    sub_808CBA4();
}

u8 HandleBoxChooseSelectionInput(void)
{
    if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        return 201;
    }
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        return sBoxSelectionPopupSpriteManager->curBox;
    }
    if (JOY_NEW(DPAD_LEFT))
    {
        PlaySE(SE_SELECT);
        UpdateBoxNameAndCountSprite_WraparoundLeft();
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        PlaySE(SE_SELECT);
        UpdateBoxNameAndCountSprite_WraparoundRight();
    }
    return 200;
}

static const union AnimCmd gUnknown_83CDA50[] = {
    ANIMCMD_FRAME( 0, 5),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_83CDA58[] = {
    ANIMCMD_FRAME( 4, 5),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_83CDA60[] = {
    ANIMCMD_FRAME( 6, 5),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_83CDA68[] = {
    ANIMCMD_FRAME(10, 5),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_83CDA70[] = {
    gUnknown_83CDA50,
    gUnknown_83CDA58,
    gUnknown_83CDA60,
    gUnknown_83CDA68
};

static const union AffineAnimCmd gUnknown_83CDA80[] = {
    AFFINEANIMCMD_FRAME(224, 224, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const gUnknown_83CDA90[] = {
    gUnknown_83CDA80
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
    const u8 gUnknown_83CDA94[] = _("/30");

    sBoxSelectionPopupSpriteManager->curBox = curBox;
    template.tileTag = sBoxSelectionPopupSpriteManager->tileTag;
    template.paletteTag = sBoxSelectionPopupSpriteManager->paletteTag;

    spriteId = CreateSprite(&template, 160, 96, 0);
    sBoxSelectionPopupSpriteManager->menuSprite = gSprites + spriteId;

    // Manual subsprites
    oamData.shape = SPRITE_SHAPE(8x32);
    oamData.size = SPRITE_SIZE(8x32);
    template.tileTag = sBoxSelectionPopupSpriteManager->tileTag + 1;
    template.anims = gUnknown_83CDA70;
    for (i = 0; i < 4; i++)
    {
        u16 r5;
        spriteId = CreateSprite(&template, 124, 80, sBoxSelectionPopupSpriteManager->subpriority);
        sBoxSelectionPopupSpriteManager->menuSideSprites[i] = gSprites + spriteId;
        r5 = 0;
        if (i & 2)
        {
            sBoxSelectionPopupSpriteManager->menuSideSprites[i]->x = 196;
            r5 = 2;
        }
        if (i & 1)
        {
            sBoxSelectionPopupSpriteManager->menuSideSprites[i]->y = 112;
            sBoxSelectionPopupSpriteManager->menuSideSprites[i]->oam.size = SPRITE_SIZE(8x16);
            r5++;
        }
        StartSpriteAnim(sBoxSelectionPopupSpriteManager->menuSideSprites[i], r5);
    }
    for (i = 0; i < 2; i++)
    {
        sBoxSelectionPopupSpriteManager->arrowSprites[i] = CreateChooseBoxArrows(72 * i + 0x7c, 0x58, i, 0, sBoxSelectionPopupSpriteManager->subpriority);
        if (sBoxSelectionPopupSpriteManager->arrowSprites[i])
        {
            sBoxSelectionPopupSpriteManager->arrowSprites[i]->data[0] = (i == 0 ? -1 : 1);
            sBoxSelectionPopupSpriteManager->arrowSprites[i]->callback = sub_808CD64;
        }
    }
    PrintBoxNameAndCountToSprite();
    PrintToSpriteWithTagUnk0240(gUnknown_83CDA94, 5, 3);
    }
}

static void sub_808CBA4(void)
{
    u16 i;
    if (sBoxSelectionPopupSpriteManager->menuSprite)
    {
        DestroySprite(sBoxSelectionPopupSpriteManager->menuSprite);
        sBoxSelectionPopupSpriteManager->menuSprite = NULL;
    }
    for (i = 0; i < 4; i++)
    {
        if (sBoxSelectionPopupSpriteManager->menuSideSprites[i])
        {
            DestroySprite(sBoxSelectionPopupSpriteManager->menuSideSprites[i]);
            sBoxSelectionPopupSpriteManager->menuSideSprites[i] = NULL;
        }
    }
    for (i = 0; i < 2; i++)
    {
        if (sBoxSelectionPopupSpriteManager->arrowSprites[i])
            DestroySprite(sBoxSelectionPopupSpriteManager->arrowSprites[i]);
    }
}

static void UpdateBoxNameAndCountSprite_WraparoundRight(void)
{
    if (++sBoxSelectionPopupSpriteManager->curBox >= TOTAL_BOXES_COUNT)
        sBoxSelectionPopupSpriteManager->curBox = 0;
    PrintBoxNameAndCountToSprite();
}

static void UpdateBoxNameAndCountSprite_WraparoundLeft(void)
{
    sBoxSelectionPopupSpriteManager->curBox = (sBoxSelectionPopupSpriteManager->curBox == 0 ? TOTAL_BOXES_COUNT - 1 : sBoxSelectionPopupSpriteManager->curBox - 1);
    PrintBoxNameAndCountToSprite();
}

static void PrintBoxNameAndCountToSprite(void)
{
    u8 nPokemonInBox = CountMonsInBox(sBoxSelectionPopupSpriteManager->curBox);
    u8 *boxName = StringCopy(sBoxSelectionPopupSpriteManager->strbuf, GetBoxNamePtr(sBoxSelectionPopupSpriteManager->curBox));

    while (boxName < sBoxSelectionPopupSpriteManager->strbuf + BOX_NAME_LENGTH)
        *boxName++ = CHAR_SPACE;
    *boxName = EOS;

    PrintToSpriteWithTagUnk0240(sBoxSelectionPopupSpriteManager->strbuf, 0, 1);

    ConvertIntToDecimalStringN(sBoxSelectionPopupSpriteManager->strbuf, nPokemonInBox, STR_CONV_MODE_RIGHT_ALIGN, 2);

    PrintToSpriteWithTagUnk0240(sBoxSelectionPopupSpriteManager->strbuf, 3, 3);
}

static void PrintToSpriteWithTagUnk0240(const u8 *str, u16 x, u16 y)
{
    u16 tileStart = GetSpriteTileStartByTag(sBoxSelectionPopupSpriteManager->tileTag);
    PrintStringToBufferCopyNow(str, (void *)(OBJ_VRAM0 + tileStart * 32 + 256 * y + 32 * x), 0x100, TEXT_COLOR_RED, TEXT_DYNAMIC_COLOR_6, TEXT_DYNAMIC_COLOR_5, sBoxSelectionPopupSpriteManager->buffer);
}

static void sub_808CD64(struct Sprite *sprite)
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

// Forward-declared rodata

static const u16 sBoxSelectionPopupPalette[] = INCBIN_U16("graphics/interface/pss_unk_83CDA98.gbapal");
static const u16 sBoxSelectionPopupCenterTiles[] = INCBIN_U16("graphics/interface/pss_unk_83CDAB8.4bpp");
static const u16 sBoxSelectionPopupSidesTiles[] = INCBIN_U16("graphics/interface/pss_unk_83CE2B8.4bpp");
