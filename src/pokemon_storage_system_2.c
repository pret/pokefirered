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

struct PSS_MenuStringPtrs
{
    const u8 *text;
    const u8 *desc;
};

static EWRAM_DATA u8 sPreviousBoxOption = 0;
static EWRAM_DATA struct ChooseBoxMenu *sChooseBoxMenu = NULL;

static void CreateMainMenu(u8 whichMenu, s16 *windowIdPtr);
static void ChooseBoxMenu_CreateSprites(u8 curBox);
static void ChooseBoxMenu_DestroySprites(void);
static void UpdateBoxNameAndCountSprite_WraparoundRight(void);
static void UpdateBoxNameAndCountSprite_WraparoundLeft(void);
static void PrintBoxNameAndCountToSprite(void);
static void PrintToSpriteWithTagUnk0240(const u8 *a0, u16 x, u16 y);
static void SpriteCB_ChooseBoxArrow(struct Sprite * sprite);

// Forward declarations

static const u16 sBoxSelectionPopupPalette[];
static const u16 sBoxSelectionPopupCenterTiles[];
static const u16 sBoxSelectionPopupSidesTiles[];

static const struct PSS_MenuStringPtrs sMainMenuTexts[] = {
    {gText_WithdrawPokemon, gText_WithdrawMonDescription},
    {gText_DepositPokemon,  gText_DepositMonDescription },
    {gText_MovePokemon,     gText_MoveMonDescription    },
    {gText_MoveItems,       gText_MoveItemsDescription  },
    {gText_SeeYa,           gText_SeeYaDescription      }
};

//------------------------------------------------------------------------------
//  SECTION: Misc utility
//------------------------------------------------------------------------------

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
    tileData1 = (u8*)GetWindowAttribute(windowId, WINDOW_TILE_DATA);
    tileData2 = (winTemplate.width * 32) + tileData1;

    if (!zero1)
        txtColor[0] = TEXT_COLOR_TRANSPARENT;
    else
        txtColor[0] = zero2;
    txtColor[1] = TEXT_DYNAMIC_COLOR_6;
    txtColor[2] = TEXT_DYNAMIC_COLOR_5;
    AddTextPrinterParameterized4(windowId, 1, 0, 2, 0, 0, txtColor, -1, string);

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
    tileData1 = (u8*)GetWindowAttribute(windowId, WINDOW_TILE_DATA);
    tileData2 = (winTemplate.width * 32) + tileData1;
    txtColor[0] = bgClr;
    txtColor[1] = fgClr;
    txtColor[2] = shClr;
    AddTextPrinterParameterized4(windowId, 1, 0, 2, 0, 0, txtColor, -1, string);
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

//------------------------------------------------------------------------------
//  SECTION: Main menu
//
//  The below functions generally handle the PC main menu where the main
//  options can be selected (Withdraw, Deposit, etc.), as well as exiting
//  Pokémon Storage back to this menu.
//------------------------------------------------------------------------------

#define tState          data[0]
#define tSelectedOption data[1]
#define tInput          data[2]
#define tNextOption     data[3]
#define tWindowId       data[15]

static void Task_PokemonStorageSystemPC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        SetHelpContext(HELPCONTEXT_BILLS_PC);
        CreateMainMenu(task->tSelectedOption, &task->tWindowId);
        LoadStdWindowFrameGfx();
        DrawDialogueFrame(DLG_WINDOW_ID, FALSE);
        FillWindowPixelBuffer(DLG_WINDOW_ID, PIXEL_FILL(1));
        AddTextPrinterParameterized2(DLG_WINDOW_ID, 2, sMainMenuTexts[task->tSelectedOption].desc, TEXT_SPEED_FF, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
        CopyWindowToVram(DLG_WINDOW_ID, COPYWIN_BOTH);
        CopyWindowToVram(task->tWindowId, COPYWIN_BOTH);
        task->tState++;
        break;
    case 1:
        if (IsWeatherNotFadingIn())
        {
            task->tState++;
        }
        break;
    case 2:
        task->tInput = Menu_ProcessInput();
        switch(task->tInput)
        {
        case MENU_NOTHING_CHOSEN:
            task->tNextOption = task->tSelectedOption;
            if (JOY_NEW(DPAD_UP) && --task->tNextOption < 0)
                task->tNextOption = BOX_OPTION_COUNT - 1;

            if (JOY_NEW(DPAD_DOWN) && ++task->tNextOption >= BOX_OPTION_COUNT)
                task->tNextOption = BOX_OPTION_WITHDRAW;
            if (task->tSelectedOption != task->tNextOption)
            {
                task->tSelectedOption = task->tNextOption;
                FillWindowPixelBuffer(DLG_WINDOW_ID, PIXEL_FILL(1));
                AddTextPrinterParameterized2(DLG_WINDOW_ID, 2, sMainMenuTexts[task->tSelectedOption].desc, TEXT_SPEED_INSTANT, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            }
            break;
        case MENU_B_PRESSED:
        case BOX_OPTION_EXIT:
            ClearStdWindowAndFrame(DLG_WINDOW_ID, TRUE);
            ClearStdWindowAndFrame(task->tWindowId, TRUE);
            ScriptContext2_Disable();
            EnableBothScriptContexts();
            DestroyTask(taskId);
            break;
        default:
            if (task->tInput == BOX_OPTION_WITHDRAW && CountPartyMons() == PARTY_SIZE)
            {
                FillWindowPixelBuffer(DLG_WINDOW_ID, PIXEL_FILL(1));
                AddTextPrinterParameterized2(DLG_WINDOW_ID, 2, gText_PartyFull, TEXT_SPEED_INSTANT, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
                task->tState = 3;
            }
            else if (task->tInput == BOX_OPTION_DEPOSIT && CountPartyMons() == 1)
            {
                FillWindowPixelBuffer(DLG_WINDOW_ID, PIXEL_FILL(1));
                AddTextPrinterParameterized2(DLG_WINDOW_ID, 2, gText_JustOnePkmn, TEXT_SPEED_INSTANT, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
                task->tState = 3;
            }
            else
            {
                FadeScreen(FADE_TO_BLACK, 0);
                task->tState = 4;
            }
            break;
        }
        break;
    case 3:
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            FillWindowPixelBuffer(DLG_WINDOW_ID, PIXEL_FILL(1));
            AddTextPrinterParameterized2(DLG_WINDOW_ID, 2, sMainMenuTexts[task->tSelectedOption].desc, TEXT_SPEED_INSTANT, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = 2;
        }
        else if (JOY_NEW(DPAD_UP))
        {
            if (--task->tSelectedOption < 0)
                task->tSelectedOption = BOX_OPTION_EXIT;
            Menu_MoveCursor(-1);
            task->tSelectedOption = Menu_GetCursorPos();
            FillWindowPixelBuffer(DLG_WINDOW_ID, PIXEL_FILL(1));
            AddTextPrinterParameterized2(DLG_WINDOW_ID, 2, sMainMenuTexts[task->tSelectedOption].desc, TEXT_SPEED_INSTANT, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = 2;
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            if (++task->tSelectedOption >= BOX_OPTION_EXIT)
                task->tSelectedOption = 0;
            Menu_MoveCursor(1);
            task->tSelectedOption = Menu_GetCursorPos();
            FillWindowPixelBuffer(DLG_WINDOW_ID, PIXEL_FILL(1));
            AddTextPrinterParameterized2(DLG_WINDOW_ID, 2, sMainMenuTexts[task->tSelectedOption].desc, TEXT_SPEED_INSTANT, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
            task->tState = 2;
        }
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            CleanupOverworldWindowsAndTilemaps();
            CB2_EnterPokeStorage(task->tInput);
            DestroyTask(taskId);
        }
        break;
    }
}

void ShowPokemonStorageSystemPC(void)
{
    u8 taskId = CreateTask(Task_PokemonStorageSystemPC, 80);
    gTasks[taskId].tState = 0;
    gTasks[taskId].tSelectedOption = BOX_OPTION_WITHDRAW;
    ScriptContext2_Enable();
}

static void FieldCb_ReturnToPcMenu(void)
{
    u8 taskId;
    MainCallback vblankCb = gMain.vblankCallback;

    SetVBlankCallback(NULL);
    taskId = CreateTask(Task_PokemonStorageSystemPC, 80);
    gTasks[taskId].tState = 0;
    gTasks[taskId].tSelectedOption = sPreviousBoxOption;
    Task_PokemonStorageSystemPC(taskId);
    SetVBlankCallback(vblankCb);
    FadeInFromBlack();
}

#undef tState
#undef tSelectedOption
#undef tInput
#undef tNextOption
#undef tWindowId

static const struct WindowTemplate sWindowTemplate_MainMenu = {
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 17,
    .height = 10,
    .paletteNum = 15,
    .baseBlock = 0x001
};

static void CreateMainMenu(u8 whichMenu, s16 *windowIdPtr)
{
    s16 windowId;
    windowId = AddWindow(&sWindowTemplate_MainMenu);

    DrawStdWindowFrame(windowId, FALSE);
    PrintMenuTable(windowId, 2, GetMenuCursorDimensionByFont(2, 0), 2, 16, NELEMS(sMainMenuTexts),
                   (void *) sMainMenuTexts);
    InitMenuInUpperLeftCornerPlaySoundWhenAPressed(windowId, 2, 0, 2, 16, NELEMS(sMainMenuTexts), whichMenu);
    *windowIdPtr = windowId;
}

void CB2_ExitPokeStorage(void)
{
    sPreviousBoxOption = GetCurrentBoxOption();
    gFieldCallback = FieldCb_ReturnToPcMenu;
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
    {
        SetBoxWallpaper(boxId, boxId % 4);
    }
}

//------------------------------------------------------------------------------
//  SECTION: Choose Box menu
//
//  The below functions handle the popup menu that allows the player to cycle
//  through the boxes and select one. Used when storing Pokémon in Deposit mode
//  and for the Jump feature.
//------------------------------------------------------------------------------

void LoadBoxSelectionPopupSpriteGfx(struct ChooseBoxMenu *menu, u16 tileTag, u16 palTag, u8 subpriority, bool32 loadPal)
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
    sChooseBoxMenu = menu;
    menu->tilesTag = tileTag;
    menu->paletteTag = palTag;
    menu->subpriority = subpriority;
    menu->loadedPalette = loadPal;
}

void FreeBoxSelectionPopupSpriteGfx(void)
{
    if (sChooseBoxMenu->loadedPalette)
        FreeSpritePaletteByTag(sChooseBoxMenu->paletteTag);
    FreeSpriteTilesByTag(sChooseBoxMenu->tilesTag);
    FreeSpriteTilesByTag(sChooseBoxMenu->tilesTag + 1);
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
        UpdateBoxNameAndCountSprite_WraparoundLeft();
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        PlaySE(SE_SELECT);
        UpdateBoxNameAndCountSprite_WraparoundRight();
    }
    return BOXID_NONE_CHOSEN;
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
    const u8 _slash30[] = _("/30");

        sChooseBoxMenu->curBox = curBox;
    template.tileTag = sChooseBoxMenu->tilesTag;
    template.paletteTag = sChooseBoxMenu->paletteTag;

    spriteId = CreateSprite(&template, 160, 96, 0);
        sChooseBoxMenu->menuSprite = gSprites + spriteId;

    // Manual subsprites
    oamData.shape = SPRITE_SHAPE(8x32);
    oamData.size = SPRITE_SIZE(8x32);
    template.tileTag = sChooseBoxMenu->tilesTag + 1;
    template.anims = gUnknown_83CDA70;
    for (i = 0; i < 4; i++)
    {
        u16 anim;
        spriteId = CreateSprite(&template, 124, 80, sChooseBoxMenu->subpriority);
        sChooseBoxMenu->menuSideSprites[i] = gSprites + spriteId;
        anim = 0;
        if (i & 2)
        {
            sChooseBoxMenu->menuSideSprites[i]->pos1.x = 196;
            anim = 2;
        }
        if (i & 1)
        {
            sChooseBoxMenu->menuSideSprites[i]->pos1.y = 112;
            sChooseBoxMenu->menuSideSprites[i]->oam.size = SPRITE_SIZE(8x16);
            anim++;
        }
        StartSpriteAnim(sChooseBoxMenu->menuSideSprites[i], anim);
    }
    for (i = 0; i < 2; i++)
    {
        sChooseBoxMenu->arrowSprites[i] = CreateChooseBoxArrows(72 * i + 0x7c, 0x58, i, 0, sChooseBoxMenu->subpriority);
        if (sChooseBoxMenu->arrowSprites[i])
        {
            sChooseBoxMenu->arrowSprites[i]->data[0] = (i == 0 ? -1 : 1);
            sChooseBoxMenu->arrowSprites[i]->callback = SpriteCB_ChooseBoxArrow;
        }
    }
    PrintBoxNameAndCountToSprite();
    PrintToSpriteWithTagUnk0240(_slash30, 5, 3);
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
    for (i = 0; i < 4; i++)
    {
        if (sChooseBoxMenu->menuSideSprites[i])
        {
            DestroySprite(sChooseBoxMenu->menuSideSprites[i]);
            sChooseBoxMenu->menuSideSprites[i] = NULL;
        }
    }
    for (i = 0; i < 2; i++)
    {
        if (sChooseBoxMenu->arrowSprites[i])
            DestroySprite(sChooseBoxMenu->arrowSprites[i]);
    }
}

static void UpdateBoxNameAndCountSprite_WraparoundRight(void)
{
    if (++sChooseBoxMenu->curBox >= TOTAL_BOXES_COUNT)
        sChooseBoxMenu->curBox = 0;
    PrintBoxNameAndCountToSprite();
}

static void UpdateBoxNameAndCountSprite_WraparoundLeft(void)
{
    sChooseBoxMenu->curBox = (sChooseBoxMenu->curBox == 0 ? TOTAL_BOXES_COUNT - 1 : sChooseBoxMenu->curBox - 1);
    PrintBoxNameAndCountToSprite();
}

static void PrintBoxNameAndCountToSprite(void)
{
    u8 nPokemonInBox = CountMonsInBox(sChooseBoxMenu->curBox);
    u8 *boxName = StringCopy(sChooseBoxMenu->strbuf, GetBoxNamePtr(sChooseBoxMenu->curBox));

    while (boxName < sChooseBoxMenu->strbuf + BOX_NAME_LENGTH)
        *boxName++ = CHAR_SPACE;
    *boxName = EOS;

    PrintToSpriteWithTagUnk0240(sChooseBoxMenu->strbuf, 0, 1);

    ConvertIntToDecimalStringN(sChooseBoxMenu->strbuf, nPokemonInBox, STR_CONV_MODE_RIGHT_ALIGN, 2);

    PrintToSpriteWithTagUnk0240(sChooseBoxMenu->strbuf, 3, 3);
}

static void PrintToSpriteWithTagUnk0240(const u8 *str, u16 x, u16 y)
{
    u16 tileStart = GetSpriteTileStartByTag(sChooseBoxMenu->tilesTag);
    PrintStringToBufferCopyNow(str, (void *)(OBJ_VRAM0 + tileStart * 32 + 256 * y + 32 * x), 0x100, TEXT_COLOR_RED, TEXT_DYNAMIC_COLOR_6, TEXT_DYNAMIC_COLOR_5, sChooseBoxMenu->buffer);
}

static void SpriteCB_ChooseBoxArrow(struct Sprite *sprite)
{
    if (++sprite->data[1] > 3)
    {
        sprite->data[1] = 0;
        sprite->pos2.x += sprite->data[0];
        if (++sprite->data[2] > 5)
        {
            sprite->data[2] = 0;
            sprite->pos2.x = 0;
        }
    }
}

// Forward-declared rodata

static const u16 sBoxSelectionPopupPalette[] = INCBIN_U16("graphics/pokemon_storage/unk_83CDA98.gbapal");
static const u16 sBoxSelectionPopupCenterTiles[] = INCBIN_U16("graphics/pokemon_storage/unk_83CDAB8.4bpp");
static const u16 sBoxSelectionPopupSidesTiles[] = INCBIN_U16("graphics/pokemon_storage/unk_83CE2B8.4bpp");
