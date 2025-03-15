#include "global.h"
#include "battle_main.h"
#include "battle_setup.h"
#include "bg.h"
#include "data.h"
#include "daycare.h"
#include "decompress.h"
#include "dexnav.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "field_message_box.h"
#include "field_player_avatar.h"
#include "field_screen_effect.h"
#include "fieldmap.h"
#include "gpu_regs.h"
#include "graphics.h"
#include "item.h"
#include "international_string_util.h"
#include "m4a.h"
#include "map_name_popup.h"
#include "main.h"
#include "malloc.h"
#include "menu.h"
#include "menu_helpers.h"
#include "metatile_behavior.h"
#include "move.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "pokedex.h"
#include "pokemon.h"
#include "pokemon_icon.h"
#include "pokemon_summary_screen.h"
#include "random.h"
#include "region_map.h"
#include "scanline_effect.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "sound.h"
#include "sprite.h"
#include "start_menu.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "text.h"
#include "text_window.h"
#include "wild_encounter.h"
#include "window.h"
#include "constants/map_types.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/field_effects.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "constants/abilities.h"
#include "constants/rgb.h"
#include "constants/region_map_sections.h"
#include "gba/m4a_internal.h"

#if DEXNAV_ENABLED
STATIC_ASSERT(DN_FLAG_SEARCHING != 0, DNFlagSearching_Must_Not_Be_Zero);
STATIC_ASSERT(DN_FLAG_DETECTOR_MODE != 0, DNFlagDetectorMode_Must_Not_Be_Zero);
STATIC_ASSERT(DN_VAR_SPECIES != 0, DNVarSpecies_Must_Not_Be_Zero);
STATIC_ASSERT(DN_VAR_STEP_COUNTER != 0, DNVarStepCounter_Must_Not_Be_Zero);
#endif

// Defines
enum WindowIds
{
    WINDOW_INFO,
    WINDOW_REGISTERED,
    WINDOW_COUNT,
};

enum Statuses
{
    STATUS_INVALID_SEARCH,
    STATUS_CHOOSE_MON,
    STATUS_LOCKED,
    STATUS_NO_DATA,
    STATUS_INCORRECT_AREA,
};

struct DexNavSearch
{
    u16 species;
    u16 moves[MAX_MON_MOVES];
    u16 heldItem;
    u8 abilityNum;
    u8 potential;
    u8 searchLevel;
    u8 monLevel;
    u8 proximity;
    u8 environment;
    s16 tileX;
    s16 tileY;
    u8 fldEffSpriteId;
    u8 fldEffId;
    u8 movementCount;
    u8 windowId;
    u8 iconSpriteId;
    u8 eyeSpriteId;
    u8 itemSpriteId;
    u8 starSpriteIds[3];
    u8 ownedIconSpriteId;
    u8 exclamationSpriteId;
    u8 hiddenSearch:1;
    u8 isHiddenMon:1;
    u8 unk:6;
    u16 palBuffer[16];
};

struct DexNavGUI
{
    MainCallback savedCallback;
    u8 state;
    u8 cursorSpriteId;
    u16 landSpecies[LAND_WILD_COUNT];
    u16 waterSpecies[WATER_WILD_COUNT];
    u16 hiddenSpecies[HIDDEN_WILD_COUNT];
    u8 cursorRow;
    u8 cursorCol;
    u8 environment;
    u8 potential;
    u8 typeIconSpriteIds[2];
    u8 starSpriteIds[3];
};

// RAM

EWRAM_DATA static struct DexNavSearch *sDexNavSearchDataPtr = NULL;
EWRAM_DATA static struct DexNavGUI *sDexNavUiDataPtr = NULL;
EWRAM_DATA static u8 *sBg1TilemapBuffer = NULL;
EWRAM_DATA u16 gDexNavSpecies = SPECIES_NONE;

//// Function Declarations
//GUI
static void Task_DexNavWaitFadeIn(u8 taskId);
static void Task_DexNavMain(u8 taskId);
static void PrintCurrentSpeciesInfo(void);
// SEARCH
static bool8 TryStartHiddenMonFieldEffect(u8 environment, u8 xSize, u8 ySize, bool8 smallScan);
static void DexNavGenerateMoveset(u16 species, u8 searchLevel, u8 encounterLevel, u16* moveDst);
static u16 DexNavGenerateHeldItem(u16 species, u8 searchLevel);
static u8 DexNavGetAbilityNum(u16 species, u8 searchLevel);
static u8 DexNavGeneratePotential(u8 searchLevel);
static u8 DexNavTryGenerateMonLevel(u16 species, u8 environment);
static u8 GetEncounterLevelFromMapData(u16 species, u8 environment);
static void CreateDexNavWildMon(u16 species, u8 potential, u8 level, u8 abilityNum, u16 item, u16* moves);
static u8 GetPlayerDistance(s16 x, s16 y);
static u8 DexNavPickTile(u8 environment, u8 xSize, u8 ySize, bool8 smallScan);
static void DexNavProximityUpdate(void);
static void DexNavDrawIcons(void);
static void DexNavUpdateSearchWindow(u8 proximity, u8 searchLevel);
static void Task_DexNavSearch(u8 taskId);
static void EndDexNavSearchSetupScript(const u8 *script, u8 taskId);
// HIDDEN MONS
static void DexNavDrawHiddenIcons(void);
static void DrawHiddenSearchWindow(u8 width);

//// Const Data
// gui image data
static const u32 sDexNavGuiTiles[] = INCBIN_U32("graphics/dexnav/gui_tiles.4bpp.lz");
static const u32 sDexNavGuiTilemap[] = INCBIN_U32("graphics/dexnav/gui_tilemap.bin.lz");
static const u32 sDexNavGuiPal[] = INCBIN_U32("graphics/dexnav/gui.gbapal");

static const u32 sSelectionCursorGfx[] = INCBIN_U32("graphics/dexnav/cursor.4bpp.lz");
static const u16 sSelectionCursorPal[] = INCBIN_U16("graphics/dexnav/cursor.gbapal");
static const u32 sCapturedAllMonsTiles[] = INCBIN_U32("graphics/dexnav/captured_all.4bpp.lz");  //uses selection cursor pal

static const u32 sNoDataGfx[] = INCBIN_U32("graphics/dexnav/no_data.4bpp.lz");

// searching image data
static const u32 sPotentialStarGfx[] = INCBIN_U32("graphics/dexnav/star.4bpp.lz");
static const u32 sHiddenSearchIconGfx[] = INCBIN_U32("graphics/dexnav/hidden_search.4bpp.lz");
static const u32 sOwnedIconGfx[] = INCBIN_U32("graphics/dexnav/owned_icon.4bpp.lz");
static const u32 sHiddenMonIconGfx[] = INCBIN_U32("graphics/dexnav/hidden.4bpp.lz");

// strings
static const u8 sText_DexNav_NoInfo[] = _("--------");
static const u8 sText_DexNav_CaptureToSee[] = _("Capture first!");
static const u8 sText_DexNav_PressRToRegister[] = _("R TO REGISTER!");
static const u8 sText_DexNav_SearchForRegisteredSpecies[] = _("Search {STR_VAR_1}");
static const u8 sText_DexNav_NotFoundHere[] = _("This Pokémon cannot be found here!");
static const u8 sText_ThreeQmarks[] = _("???");
static const u8 sText_SearchLevel[] = _("SEARCH {LV}. {STR_VAR_1}");
static const u8 sText_MonLevel[] = _("{LV}. {STR_VAR_1}");
static const u8 sText_EggMove[] = _("MOVE: {STR_VAR_1}");
static const u8 sText_HeldItem[] = _("{STR_VAR_1}");
static const u8 sText_StartExit[] = _("{START_BUTTON} EXIT");
static const u8 sText_DexNavChain[] = _("{NO} {STR_VAR_1}");
static const u8 sText_DexNavChainLong[] = _("{NO}{STR_VAR_1}");

static const u8 sText_ArrowLeft[] = _("{LEFT_ARROW}");
static const u8 sText_ArrowRight[] = _("{RIGHT_ARROW}");
static const u8 sText_ArrowUp[] = _("{UP_ARROW}");
static const u8 sText_ArrowDown[] = _("{DOWN_ARROW}");

static const struct WindowTemplate sDexNavGuiWindowTemplates[] =
{
    [WINDOW_INFO] =
    {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 5,
        .width = 9,
        .height = 15,
        .paletteNum = 15,
        .baseBlock = 1,
    },
    [WINDOW_REGISTERED] =
    {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 0,
        .width = 26,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 200,
    },
    DUMMY_WIN_TEMPLATE
};

//gui font
static const u8 sFontColor_Black[3] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_LIGHT_GRAY};
static const u8 sFontColor_White[3] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY};
//search window font
static const u8 sSearchFontColor[3] = {0, 15, 13};

static const struct OamData sNoDataIconOam =
{
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = SPRITE_SHAPE(32x32),
    .size = SPRITE_SIZE(32x32),
    .priority = 1,
};

static const struct OamData sHeldItemOam =
{
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .priority = 0,
    .paletteNum = 13,
};

static const struct OamData sCapturedAllOam =
{
    .y = 0,
    .affineMode = 1,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 0, //Highest
    .paletteNum = 12,
    .affineParam = 0,
};

static const struct OamData sSearchIconOam =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 0, // above BG layers
    .paletteNum = 13,
    .affineParam = 0
};

static const struct OamData sSelectionCursorOam =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 0, // above BG layers
    .paletteNum = 12,
    .affineParam = 0
};

static const struct OamData sSightOam =
{
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = SPRITE_SHAPE(16x8),
    .size = SPRITE_SIZE(16x8),
    .priority = 0,
};
static const union AnimCmd sAnimCmdSight0[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};
static const union AnimCmd sAnimCmdSight1[] =
{
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_END
};
static const union AnimCmd sAnimCmdSight2[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END
};
static const union AnimCmd *const sAnimCmdTable_Sight[] =
{
    sAnimCmdSight0,
    sAnimCmdSight1,
    sAnimCmdSight2,
};

// gui sprite templates
static const struct SpriteTemplate sNoDataIconTemplate =
{
    .tileTag = ICON_GFX_TAG,
    .paletteTag = ICON_PAL_TAG,
    .oam = &sNoDataIconOam,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sCaptureAllMonsSpriteTemplate =
{
    .tileTag = CAPTURED_ALL_TAG,
    .paletteTag = 0xFFFF,
    .oam = &sCapturedAllOam,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sSelectionCursorSpriteTemplate =
{
    .tileTag = SELECTION_CURSOR_TAG,
    .paletteTag = 0xFFFF,
    .oam = &sSelectionCursorOam,
    .anims =  gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

// search window sprite templates
static const struct SpriteTemplate sHeldItemTemplate =
{
    .tileTag = HELD_ITEM_TAG,
    .paletteTag = 0xFFFF,
    .oam = &sHeldItemOam,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sPotentialStarTemplate =
{
    .tileTag = LIT_STAR_TILE_TAG,
    .paletteTag = 0xFFFF,   //held item pal
    .oam = &sHeldItemOam,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sSearchIconSpriteTemplate =
{
    .tileTag = HIDDEN_SEARCH_TAG,
    .paletteTag = 0xFFFF,   //held item pal
    .oam = &sSearchIconOam,
    .anims =  gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sOwnedIconTemplate =
{
    .tileTag = OWNED_ICON_TAG,
    .paletteTag = 0xFFFF,   //held item pal
    .oam = &sHeldItemOam,
    .anims =  gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate sHiddenMonIconTemplate =
{
    .tileTag = HIDDEN_MON_ICON_TAG,
    .paletteTag = 0xFFFF,   //held item pal
    .oam = &sHeldItemOam,
    .anims =  gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

// gui sprite sheets
static const struct CompressedSpriteSheet sNoDataIconSpriteSheet = {sNoDataGfx, (32 * 32) / 2, ICON_GFX_TAG};
static const struct CompressedSpriteSheet sCapturedAllPokemonSpriteSheet = {sCapturedAllMonsTiles, (8 * 8) / 2, CAPTURED_ALL_TAG};
// search sprite sheets
static const struct CompressedSpriteSheet sPotentialStarSpriteSheet = {sPotentialStarGfx, (8 * 8) / 2, LIT_STAR_TILE_TAG};
static const struct CompressedSpriteSheet sOwnedIconSpriteSheet = {sOwnedIconGfx, (8 * 8) / 2, OWNED_ICON_TAG};
static const struct CompressedSpriteSheet sHiddenMonIconSpriteSheet = {sHiddenMonIconGfx, (8 * 8) / 2, HIDDEN_MON_ICON_TAG};

//// functions
///////////////////////
//// DEXNAV SEARCH ////
///////////////////////
static s16 GetSearchWindowY(void)
{
    return (GetWindowAttribute(sDexNavSearchDataPtr->windowId, WINDOW_TILEMAP_TOP) * 8);
}

#define SPECIES_ICON_X 28
static void DrawDexNavSearchMonIcon(u16 species, u8 *dst, bool8 owned)
{
    u8 spriteId;

    LoadMonIconPalette(species);
    spriteId = CreateMonIcon(species, SpriteCB_MonIcon, SPECIES_ICON_X - 6, GetSearchWindowY() + 8, 0, 0xFFFFFFFF);
    gSprites[spriteId].oam.priority = 0;
    *dst = spriteId;

    if (owned)
        sDexNavSearchDataPtr->ownedIconSpriteId = CreateSprite(&sOwnedIconTemplate, SPECIES_ICON_X + 6, GetSearchWindowY() + 4, 0);
}

static void AddSearchWindow(u8 width)
{
    struct WindowTemplate template;
    u16 y = 16;

    if (sDexNavSearchDataPtr->tileY > (gSaveBlock1Ptr->pos.y + 7))
        y = 1;  //draw at top if chosen tile is below

    LoadDexNavWindowGfx(sDexNavSearchDataPtr->windowId, 0x1d5, 14 * 16);

    SetWindowTemplateFields(&template, 0, 1, y, width, 3, 14, 8);

    sDexNavSearchDataPtr->windowId = AddWindow(&template);
    FillWindowPixelBuffer(sDexNavSearchDataPtr->windowId, PIXEL_FILL(1));
    PutWindowTilemap(sDexNavSearchDataPtr->windowId);
    CopyWindowToVram(sDexNavSearchDataPtr->windowId, 3);

    DrawStdFrameWithCustomTileAndPalette(sDexNavSearchDataPtr->windowId, TRUE, 0x214, 14);
}

#define WINDOW_COL_0        (SPECIES_ICON_X + 4)
#define WINDOW_COL_1        (WINDOW_COL_0 + (GetFontAttribute(sDexNavSearchDataPtr->windowId, FONTATTR_MAX_LETTER_WIDTH) * (POKEMON_NAME_LENGTH)))
#define WINDOW_MOVE_NAME_X  (WINDOW_COL_1 + (GetFontAttribute(sDexNavSearchDataPtr->windowId, FONTATTR_MAX_LETTER_WIDTH) * 6))
#define SEARCH_ARROW_X      (WINDOW_MOVE_NAME_X + 90)
#define SEARCH_ARROW_Y      0

static void AddSearchWindowText(u16 species, u8 proximity, u8 searchLevel, bool8 hidden)
{
    u8 windowId = sDexNavSearchDataPtr->windowId;

    //species name - always present
    if (hidden)
    {
        StringCopy(gStringVar4, sText_ThreeQmarks);
        AddTextPrinterParameterized3(sDexNavSearchDataPtr->windowId, 0, WINDOW_COL_0, 0, sSearchFontColor, TEXT_SKIP_DRAW, gStringVar4);
        return;
    }
    else
    {
        StringCopy(gStringVar1, GetSpeciesName(species));
        AddTextPrinterParameterized3(sDexNavSearchDataPtr->windowId, 0, WINDOW_COL_0, 0, sSearchFontColor, TEXT_SKIP_DRAW, gStringVar1);
    }

    //level - always present
    ConvertIntToDecimalStringN(gStringVar1, sDexNavSearchDataPtr->monLevel, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringExpandPlaceholders(gStringVar4, sText_MonLevel);
    AddTextPrinterParameterized3(sDexNavSearchDataPtr->windowId, 0, WINDOW_COL_1, 0, sSearchFontColor, TEXT_SKIP_DRAW, gStringVar4);

    if (proximity <= SNEAKING_PROXIMITY)
    {
        PlaySE(SE_POKENAV_ON);
        // move
        if (searchLevel > 1 && sDexNavSearchDataPtr->moves[0])
        {
            StringCopy(gStringVar1, GetMoveName(sDexNavSearchDataPtr->moves[0]));
            StringExpandPlaceholders(gStringVar4, sText_EggMove);
            AddTextPrinterParameterized3(windowId, 0, WINDOW_MOVE_NAME_X, 0, sSearchFontColor, TEXT_SKIP_DRAW, gStringVar4);
        }

        if (searchLevel > 2)
        {
            // ability name
            StringCopy(gStringVar1, gAbilitiesInfo[GetAbilityBySpecies(species, sDexNavSearchDataPtr->abilityNum)].name);
            AddTextPrinterParameterized3(windowId, 0, WINDOW_COL_1 + 16, 12, sSearchFontColor, TEXT_SKIP_DRAW, gStringVar1);

            // item name
            if (sDexNavSearchDataPtr->heldItem)
            {
                CopyItemName(sDexNavSearchDataPtr->heldItem, gStringVar1);
                StringExpandPlaceholders(gStringVar4, sText_HeldItem);
                AddTextPrinterParameterized3(windowId, 0, WINDOW_COL_0, 12, sSearchFontColor, TEXT_SKIP_DRAW, gStringVar4);
            }
        }
    }

    //chain level - always present
    ConvertIntToDecimalStringN(gStringVar1, gSaveBlock3Ptr->dexNavChain, STR_CONV_MODE_LEFT_ALIGN, 3);
    if (gSaveBlock3Ptr->dexNavChain > 99)
        StringExpandPlaceholders(gStringVar4, sText_DexNavChainLong);
    else
        StringExpandPlaceholders(gStringVar4, sText_DexNavChain);
    AddTextPrinterParameterized3(windowId, 0, SEARCH_ARROW_X - 16, 12, sSearchFontColor, TEXT_SKIP_DRAW, gStringVar4);

    CopyWindowToVram(sDexNavSearchDataPtr->windowId, 2);
}

#define SEARCH_WINDOW_WIDTH     28

static void DrawSearchWindow(u16 species, u8 potential, bool8 hidden)
{
    u8 searchLevel = sDexNavSearchDataPtr->searchLevel;

    AddSearchWindow(SEARCH_WINDOW_WIDTH);
    AddSearchWindowText(species, sDexNavSearchDataPtr->proximity, searchLevel, hidden);
}

#undef SEARCH_WINDOW_WIDTH

static void RemoveDexNavWindowAndGfx(void)
{
    u32 i;

    // try remove sprites
    if (sDexNavSearchDataPtr->iconSpriteId != MAX_SPRITES)
        DestroySprite(&gSprites[sDexNavSearchDataPtr->iconSpriteId]);
    if (sDexNavSearchDataPtr->itemSpriteId != MAX_SPRITES)
        DestroySprite(&gSprites[sDexNavSearchDataPtr->itemSpriteId]);
    if (sDexNavSearchDataPtr->eyeSpriteId != MAX_SPRITES)
        DestroySprite(&gSprites[sDexNavSearchDataPtr->eyeSpriteId]);
    if (sDexNavSearchDataPtr->ownedIconSpriteId != MAX_SPRITES)
        DestroySprite(&gSprites[sDexNavSearchDataPtr->ownedIconSpriteId]);
    if (sDexNavSearchDataPtr->exclamationSpriteId != MAX_SPRITES)
        DestroySprite(&gSprites[sDexNavSearchDataPtr->exclamationSpriteId]);

    for (i = 0; i < NELEMS(sDexNavSearchDataPtr->starSpriteIds); i++)
    {
        if (sDexNavSearchDataPtr->starSpriteIds[i] != MAX_SPRITES)
            DestroySprite(&gSprites[sDexNavSearchDataPtr->starSpriteIds[i]]);
    }

    FreeSpriteTilesByTag(HELD_ITEM_TAG);
    FreeSpriteTilesByTag(OWNED_ICON_TAG);
    FreeSpriteTilesByTag(HIDDEN_SEARCH_TAG);
    FreeSpriteTilesByTag(HIDDEN_MON_ICON_TAG);
    FreeSpriteTilesByTag(LIT_STAR_TILE_TAG);
    FreeSpritePaletteByTag(HELD_ITEM_TAG);
    SafeFreeMonIconPalette(sDexNavSearchDataPtr->species);

    // remove window
    ClearStdWindowAndFrameToTransparent(sDexNavSearchDataPtr->windowId, FALSE);
    CopyWindowToVram(sDexNavSearchDataPtr->windowId, 3);
    RemoveWindow(sDexNavSearchDataPtr->windowId);
}


//////////////////////
////DEXNAV SEARCH/////
//////////////////////
static u8 GetPlayerDistance(s16 x, s16 y)
{
    u16 deltaX = abs(x - (gSaveBlock1Ptr->pos.x + 7));
    u16 deltaY = abs(y - (gSaveBlock1Ptr->pos.y + 7));
    return deltaX + deltaY;
}

static void DexNavProximityUpdate(void)
{
    sDexNavSearchDataPtr->proximity = GetPlayerDistance(sDexNavSearchDataPtr->tileX, sDexNavSearchDataPtr->tileY);
}

//Pick a specific tile based on environment
static bool8 DexNavPickTile(u8 environment, u8 areaX, u8 areaY, bool8 smallScan)
{
    // area of map to cover starting from camera position {-7, -7}
    s16 topX = gSaveBlock1Ptr->pos.x - SCANSTART_X + (smallScan * 5);
    s16 topY = gSaveBlock1Ptr->pos.y - SCANSTART_Y + (smallScan * 5);
    s16 botX = topX + areaX;
    s16 botY = topY + areaY;
    u8 i;
    bool8 nextIter;
    u8 scale = 0;
    u8 weight = 0;
    u8 currMapType = GetCurrentMapType();
    u32 metatileAttributes;
    u8 tileBuffer = 2;
    u8 *xPos = AllocZeroed((botX - topX) * (botY - topY) * sizeof(u8));
    u8 *yPos = AllocZeroed((botX - topX) * (botY - topY) * sizeof(u8));
    u32 iter = 0;
    bool32 ret = FALSE;

    // loop through every tile in area and evaluate
    while (topY < botY)
    {
        while (topX < botX)
        {
            metatileAttributes = MapGridGetMetatileAttributeAt(topX, topY, METATILE_ATTRIBUTES_ALL);
            //Check for objects
            nextIter = FALSE;
            if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_BIKE))
                tileBuffer = SNEAKING_PROXIMITY + 3;
            else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH))
                tileBuffer = SNEAKING_PROXIMITY + 1;

            if (GetPlayerDistance(topX, topY) <= tileBuffer)
            {
                // tile too close to player
                topX++;
                continue;
            }

            for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
            {
                if (gObjectEvents[i].currentCoords.x == topX && gObjectEvents[i].currentCoords.y == topY)
                {
                    // cannot be on a tile where an object exists
                    nextIter = TRUE;
                    break;
                }
            }

            if (nextIter)
            {
                topX++;
                continue;
            }

            weight = 0; // initiliaze weight
            switch (environment)
            {
            case ENCOUNTER_TYPE_LAND:
                if (ExtractMetatileAttribute(metatileAttributes, METATILE_ATTRIBUTE_ENCOUNTER_TYPE) == TILE_ENCOUNTER_LAND)
                {
                    if (currMapType == MAP_TYPE_UNDERGROUND)
                    {
                        // inside (cave)
                        if (IsElevationMismatchAt(gObjectEvents[gPlayerAvatar.spriteId].currentElevation, topX, topY))
                            break; //occurs at same z coord

                        scale = 440 - (smallScan * 200) - (GetPlayerDistance(topX, topY) / 2)  - (2 * (topX + topY));
                        weight = ((Random() % scale) < 1) && !MapGridGetCollisionAt(topX, topY);
                    }
                    else
                    {
                        // outdoors: grass
                        scale = 100 - (GetPlayerDistance(topX, topY) * 2);
                        weight = (Random() % scale <= 5) && !MapGridGetCollisionAt(topX, topY);
                    }
                }
                break;
            case ENCOUNTER_TYPE_WATER:
                if (ExtractMetatileAttribute(metatileAttributes, METATILE_ATTRIBUTE_ENCOUNTER_TYPE) == TILE_ENCOUNTER_WATER)
                {
                    u8 scale = 320 - (smallScan * 200) - (GetPlayerDistance(topX, topY) / 2);
                    if (IsElevationMismatchAt(gObjectEvents[gPlayerAvatar.spriteId].currentElevation, topX, topY))
                        break;

                    weight = (Random() % scale <= 1) && !MapGridGetCollisionAt(topX, topY);
                }
                break;
            default:
                break;
            }

            if (weight > 0)
            {
                xPos[iter] = topX;
                yPos[iter] = topY;
                iter++;
            }

            topX++;
        }

        topY++;
        topX = gSaveBlock1Ptr->pos.x - SCANSTART_X + (smallScan * 5);
    }

    if (iter > 0)
    {
        i = Random() % iter;
        sDexNavSearchDataPtr->tileX = xPos[i];
        sDexNavSearchDataPtr->tileY = yPos[i];
        ret = TRUE;
    }

    Free(xPos);
    Free(yPos);

    return ret;
}


static bool8 TryStartHiddenMonFieldEffect(u8 environment, u8 xSize, u8 ySize, bool8 smallScan)
{
    u8 currMapType = GetCurrentMapType();
    u8 fldEffId = 0;

    if (DexNavPickTile(environment, xSize, ySize, smallScan))
    {
        u8 metatileBehaviour = MapGridGetMetatileBehaviorAt(sDexNavSearchDataPtr->tileX, sDexNavSearchDataPtr->tileY);

        switch (environment)
        {
        case ENCOUNTER_TYPE_LAND:
            if (currMapType == MAP_TYPE_UNDERGROUND)
            {
                fldEffId = FLDEFF_CAVE_DUST;
            }
            else if (IsMapTypeIndoors(currMapType))
            {
                if (MetatileBehavior_IsTallGrass(metatileBehaviour)) //Grass in cave
                    fldEffId = FLDEFF_SHAKING_GRASS;
                else if (MetatileBehavior_IsLongGrass(metatileBehaviour)) //Really tall grass
                    fldEffId = FLDEFF_SHAKING_LONG_GRASS;
                else if (MetatileBehavior_IsSand(metatileBehaviour))
                    fldEffId = FLDEFF_SAND_HOLE;
                else
                    fldEffId = FLDEFF_CAVE_DUST;
            }
            else //outdoor, underwater
            {
                if (MetatileBehavior_IsTallGrass(metatileBehaviour)) //Regular grass
                    fldEffId = FLDEFF_SHAKING_GRASS;
                else if (MetatileBehavior_IsLongGrass(metatileBehaviour)) //Really tall grass
                    fldEffId = FLDEFF_SHAKING_LONG_GRASS;
                else if (MetatileBehavior_IsSand(metatileBehaviour)) //Desert Sand
                    fldEffId = FLDEFF_SAND_HOLE;
                else if (MetatileBehavior_IsMountain(metatileBehaviour)) //Rough Terrain
                    fldEffId = FLDEFF_CAVE_DUST;
                else
                    fldEffId = FLDEFF_BERRY_TREE_GROWTH_SPARKLE; //default
            }
            break;
        case ENCOUNTER_TYPE_WATER:
            fldEffId = FLDEFF_UNUSED_WATER_SURFACING;
            break;
        default:
            return FALSE;
        }

        if (fldEffId != 0)
        {
            gFieldEffectArguments[0] = sDexNavSearchDataPtr->tileX;
            gFieldEffectArguments[1] = sDexNavSearchDataPtr->tileY;
            gFieldEffectArguments[2] = 0xFF; // subpriority
            gFieldEffectArguments[3] = 2;   //priority
            sDexNavSearchDataPtr->fldEffSpriteId = FieldEffectStart(fldEffId);
            if (sDexNavSearchDataPtr->fldEffSpriteId == MAX_SPRITES)
                return FALSE;

            sDexNavSearchDataPtr->fldEffId = fldEffId;
            return TRUE;
        }
    }

    return FALSE;
}

static void DrawDexNavSearchHeldItem(u8* dst)
{
    *dst = CreateSprite(&sHeldItemTemplate, SPECIES_ICON_X + 6, GetSearchWindowY() + 18, 0);
    if (*dst != MAX_SPRITES)
        gSprites[*dst].invisible = TRUE;
}

static void LoadSearchIconData(void)
{
    // palettes clash with mon icon, so must load manually
    LoadSpriteSheet(&gSpriteSheet_HeldItem);
    LoadPalette(gHeldItemPalette, 0x100 + (16 * sHeldItemOam.paletteNum), 32);
    LoadCompressedSpriteSheetUsingHeap(&sPotentialStarSpriteSheet);
    //LoadCompressedSpriteSheetUsingHeap(&sSightSpriteSheet);   //eye replaced with arrow
    LoadCompressedSpriteSheetUsingHeap(&sOwnedIconSpriteSheet);
    LoadCompressedSpriteSheetUsingHeap(&sHiddenMonIconSpriteSheet);
}

static u8 GetSearchLevel(u16 dexNum)
{
    u8 searchLevel;
#if USE_DEXNAV_SEARCH_LEVELS == TRUE
    searchLevel = gSaveBlock3Ptr->dexNavSearchLevels[dexNum];
#else
    searchLevel = 0;
#endif
    return searchLevel;
}

#define tProximity          data[0]
#define tFrameCount         data[1]
#define tSpecies            data[2]
#define tEnvironment        data[3]
#define tRevealed           data[4]

static void Task_SetUpDexNavSearch(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    u16 species = sDexNavSearchDataPtr->species;
    u8 searchLevel = GetSearchLevel(species);

    // init sprites
    sDexNavSearchDataPtr->iconSpriteId = MAX_SPRITES;
    sDexNavSearchDataPtr->itemSpriteId = MAX_SPRITES;
    sDexNavSearchDataPtr->eyeSpriteId = MAX_SPRITES;
    sDexNavSearchDataPtr->starSpriteIds[0] = MAX_SPRITES;
    sDexNavSearchDataPtr->starSpriteIds[1] = MAX_SPRITES;
    sDexNavSearchDataPtr->starSpriteIds[2] = MAX_SPRITES;
    sDexNavSearchDataPtr->ownedIconSpriteId = MAX_SPRITES;
    sDexNavSearchDataPtr->exclamationSpriteId = MAX_SPRITES;
    sDexNavSearchDataPtr->searchLevel = searchLevel;

    DexNavGenerateMoveset(species, searchLevel, sDexNavSearchDataPtr->monLevel, &sDexNavSearchDataPtr->moves[0]);
    sDexNavSearchDataPtr->heldItem = DexNavGenerateHeldItem(species, searchLevel);
    sDexNavSearchDataPtr->abilityNum = DexNavGetAbilityNum(species, searchLevel);
    sDexNavSearchDataPtr->potential = DexNavGeneratePotential(searchLevel);
    DexNavProximityUpdate();

    LoadSearchIconData();
    if (sDexNavSearchDataPtr->hiddenSearch)
    {
        DexNavDrawHiddenIcons();
    }
    else
    {
        DexNavDrawIcons();
        DexNavUpdateSearchWindow(sDexNavSearchDataPtr->proximity, searchLevel);
    }

    FlagSet(DN_FLAG_SEARCHING);
    gPlayerAvatar.creeping = TRUE;  //initialize as true in case mon appears beside you
    task->tProximity = gSprites[gPlayerAvatar.spriteId].x;
    task->tFrameCount = 0;
    task->func = Task_DexNavSearch;
    IncrementGameStat(GAME_STAT_DEXNAV_SCANNED);
}

static void DexNavSearchBail(u8 taskId, const u8 *script)
{
    TRY_FREE_AND_SET_NULL(sDexNavSearchDataPtr);
    FreeMonIconPalettes();
    ScriptContext_SetupScript(script);
    DestroyTask(taskId);
}

static void Task_InitDexNavSearch(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u16 species = task->tSpecies;
    u8 environment = task->tEnvironment;

    sDexNavSearchDataPtr = AllocZeroed(sizeof(struct DexNavSearch));
    if (sDexNavSearchDataPtr == NULL)
    {
        DexNavSearchBail(taskId, EventScript_NotFoundNearby);
        return;
    }

    // assign non-objects to struct
    sDexNavSearchDataPtr->species = species;
    sDexNavSearchDataPtr->environment = environment;  //updated in DexNavTryGenerateMonLevel if hidden mon
    sDexNavSearchDataPtr->isHiddenMon = (environment == ENCOUNTER_TYPE_HIDDEN) ? TRUE : FALSE;
    sDexNavSearchDataPtr->monLevel = DexNavTryGenerateMonLevel(species, environment);

    if (GetFlashLevel() > 0)
    {
        DexNavSearchBail(taskId, EventScript_TooDark);
        return;
    }

    if (sDexNavSearchDataPtr->monLevel == MON_LEVEL_NONEXISTENT || !TryStartHiddenMonFieldEffect(sDexNavSearchDataPtr->environment, 12, 12, FALSE))
    {
        DexNavSearchBail(taskId, EventScript_NotFoundNearby);
        return;
    }

    sDexNavSearchDataPtr->hiddenSearch = FALSE;
    task->tRevealed = TRUE; //search window revealed
    task->func = Task_SetUpDexNavSearch;
}

static void DexNavDrawPotentialStars(u8 potential, u8* dst)
{
    u8 spriteId;
    u32 i;

    for (i = 0; i < NELEMS(sDexNavSearchDataPtr->starSpriteIds); i++)
    {
        spriteId = MAX_SPRITES;
        if (potential > i)
            spriteId = CreateSprite(&sPotentialStarTemplate, SPECIES_ICON_X - 20, GetSearchWindowY() + 4 + (i * 8), 0);

        dst[i] = spriteId;
        if (spriteId != MAX_SPRITES)
            gSprites[spriteId].invisible = TRUE;
    }
}

static void DexNavUpdateDirectionArrow(void)
{
    u16 tileX = sDexNavSearchDataPtr->tileX;
    u16 tileY = sDexNavSearchDataPtr->tileY;
    u16 playerX = gSaveBlock1Ptr->pos.x + 7;
    u16 playerY = gSaveBlock1Ptr->pos.y + 7;
    u16 deltaX = abs(tileX - playerX);
    u16 deltaY = abs(tileY - playerY);
    const u8 *str;
    u8 windowId = sDexNavSearchDataPtr->windowId;

    FillWindowPixelRect(windowId, PIXEL_FILL(1), SEARCH_ARROW_X, SEARCH_ARROW_Y, 12, 12);
    if (deltaX <= 1 && deltaY <= 1)
    {
        str = gText_EmptyString3;
    }
    else if (deltaX > deltaY)
    {
        if (playerX > tileX)
            str = sText_ArrowLeft;  //player to right
        else
            str = sText_ArrowRight; //player to left
    }
    else //greater Y diff
    {
        if (playerY > tileY)
            str = sText_ArrowUp;    //player below
        else
            str = sText_ArrowDown;  //player above
    }

    AddTextPrinterParameterized3(windowId, 1, SEARCH_ARROW_X, SEARCH_ARROW_Y, sSearchFontColor, TEXT_SKIP_DRAW, str);
    CopyWindowToVram(windowId, 2);
}

static void DexNavDrawIcons(void)
{
    u16 species = sDexNavSearchDataPtr->species;

    DrawSearchWindow(species, sDexNavSearchDataPtr->potential, FALSE);
    DrawDexNavSearchMonIcon(species, &sDexNavSearchDataPtr->iconSpriteId, GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT));
    DrawDexNavSearchHeldItem(&sDexNavSearchDataPtr->itemSpriteId);
    DexNavDrawPotentialStars(sDexNavSearchDataPtr->potential, &sDexNavSearchDataPtr->starSpriteIds[0]);
    DexNavUpdateDirectionArrow();
}

/////////////////////
//// SEARCH TASK ////
/////////////////////
bool8 TryStartDexNavSearch(void)
{
    u8 taskId;
    u16 val = VarGet(DN_VAR_SPECIES);

    if (FlagGet(DN_FLAG_SEARCHING) || (val & DEXNAV_MASK_SPECIES) == SPECIES_NONE)
        return FALSE;

    DismissMapNamePopup();
    ChangeBgY_ScreenOff(0, 0, 0);
    taskId = CreateTask(Task_InitDexNavSearch, 0);
    gTasks[taskId].tSpecies = val & DEXNAV_MASK_SPECIES;
    gTasks[taskId].tEnvironment = val >> 14;
    PlaySE(SE_DEX_SEARCH);
    return FALSE;   //we dont actually want to enable the script context
}

void EndDexNavSearch(u8 taskId)
{
    FlagClear(DN_FLAG_SEARCHING);
    DestroyTask(taskId);
    RemoveDexNavWindowAndGfx();
    FieldEffectStop(&gSprites[sDexNavSearchDataPtr->fldEffSpriteId], sDexNavSearchDataPtr->fldEffId);
    Free(sDexNavSearchDataPtr);
}

static void EndDexNavSearchSetupScript(const u8 *script, u8 taskId)
{
    gSaveBlock3Ptr->dexNavChain = 0;   //reset chain
    EndDexNavSearch(taskId);
    ScriptContext_SetupScript(script);
}

static u8 GetMovementProximityBySearchLevel(void)
{
    if (sDexNavSearchDataPtr->searchLevel < 20)
        return 2;
    else if (sDexNavSearchDataPtr->searchLevel < 50)
        return 3;
    else
        return 4;
}

static void Task_RevealHiddenMon(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u16 species = sDexNavSearchDataPtr->species;

    // remove owned icon if it exists
    if (sDexNavSearchDataPtr->ownedIconSpriteId != MAX_SPRITES)
    {
        DestroySprite(&gSprites[sDexNavSearchDataPtr->ownedIconSpriteId]);
        sDexNavSearchDataPtr->ownedIconSpriteId = MAX_SPRITES;
    }

    // remove exclamation if it exists
    if (sDexNavSearchDataPtr->exclamationSpriteId != MAX_SPRITES)
    {
        DestroySprite(&gSprites[sDexNavSearchDataPtr->exclamationSpriteId]);
        sDexNavSearchDataPtr->exclamationSpriteId = MAX_SPRITES;
    }


    if (!GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_SEEN))
    {
        u8 index;

        //if not seen, hide name and whiteout mon
        DrawSearchWindow(species, sDexNavSearchDataPtr->potential, TRUE);
        DrawDexNavSearchMonIcon(species, &sDexNavSearchDataPtr->iconSpriteId, FALSE);
        // whiteout icon
        index = IndexOfSpritePaletteTag(gSprites[sDexNavSearchDataPtr->iconSpriteId].template->paletteTag);
        CpuCopy16(&gPlttBufferUnfaded[0x100 + index * 16], sDexNavSearchDataPtr->palBuffer, 32);
        TintPalette_CustomTone(sDexNavSearchDataPtr->palBuffer, 16, 510, 510, 510);
        LoadPalette(sDexNavSearchDataPtr->palBuffer, 0x100 + index * 16, 32);
    }
    else
    {
        DrawSearchWindow(species, sDexNavSearchDataPtr->potential, FALSE);
        DrawDexNavSearchMonIcon(species, &sDexNavSearchDataPtr->iconSpriteId, GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT));
    }

    DexNavUpdateDirectionArrow();
    task->func = Task_DexNavSearch;
    task->tFrameCount = 0;  //restart search clock
}

static void Task_DexNavSearch(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (sDexNavSearchDataPtr->proximity > MAX_PROXIMITY)
    { // out of range
        if (sDexNavSearchDataPtr->hiddenSearch && !task->tRevealed)
            EndDexNavSearch(taskId);
        else
            EndDexNavSearchSetupScript(EventScript_LostSignal, taskId);
        return;
    }

    if (sDexNavSearchDataPtr->proximity <= CREEPING_PROXIMITY && !gPlayerAvatar.creeping && task->tFrameCount > 60)
    { //should be creeping but player walks normally
        if (sDexNavSearchDataPtr->hiddenSearch && !task->tRevealed)
            EndDexNavSearch(taskId);
        else
            EndDexNavSearchSetupScript(EventScript_MovedTooFast, taskId);
        return;
    }

    if (sDexNavSearchDataPtr->proximity <= SNEAKING_PROXIMITY && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH | PLAYER_AVATAR_FLAG_BIKE))
    { // running/biking too close
        //always do event script, even if player hasn't revealed a hidden mon. It's assumed they would be creeping towards it
        EndDexNavSearchSetupScript(EventScript_MovedTooFast, taskId);
        return;
    }

    if (ArePlayerFieldControlsLocked() == TRUE)
    { // check if script just executed
        EndDexNavSearch(taskId);
        return;
    }

    if (gTasks[taskId].tFrameCount > DEXNAV_TIMEOUT * 60)
    { // player took too long
        if (sDexNavSearchDataPtr->hiddenSearch && !task->tRevealed)
            EndDexNavSearch(taskId);
        else
            EndDexNavSearchSetupScript(EventScript_PokemonGotAway, taskId);
        return;
    }

    if (sDexNavSearchDataPtr->proximity < 1)
    {
        gDexNavSpecies = sDexNavSearchDataPtr->species;
        CreateDexNavWildMon(sDexNavSearchDataPtr->species, sDexNavSearchDataPtr->potential, sDexNavSearchDataPtr->monLevel,
                            sDexNavSearchDataPtr->abilityNum, sDexNavSearchDataPtr->heldItem, sDexNavSearchDataPtr->moves);

        FlagClear(DN_FLAG_SEARCHING);
        ScriptContext_SetupScript(EventScript_StartDexNavBattle);
        Free(sDexNavSearchDataPtr);
        DestroyTask(taskId);
        return;
    }

    if (sDexNavSearchDataPtr->hiddenSearch && !task->tRevealed &&
        (JOY_NEW(R_BUTTON) || (sDexNavSearchDataPtr->proximity < CREEPING_PROXIMITY)))
    {
        PlaySE(SE_DEX_SEARCH);
        ClearStdWindowAndFrameToTransparent(sDexNavSearchDataPtr->windowId, FALSE);
        CopyWindowToVram(sDexNavSearchDataPtr->windowId, 3);
        RemoveWindow(sDexNavSearchDataPtr->windowId);
        DestroySprite(&gSprites[sDexNavSearchDataPtr->iconSpriteId]);
        task->tRevealed = TRUE; //regular dexnav search
        //sDexNavSearchDataPtr->hiddenSearch = FALSE; //now its a regular dexnav search
        task->func = Task_RevealHiddenMon;
        return;
    }

    //Caves and water the pokemon moves around
    if ((sDexNavSearchDataPtr->environment == ENCOUNTER_TYPE_WATER || GetCurrentMapType() == MAP_TYPE_UNDERGROUND)
        && sDexNavSearchDataPtr->proximity < GetMovementProximityBySearchLevel() && sDexNavSearchDataPtr->movementCount < 2
        && task->tRevealed)
    {
        FieldEffectStop(&gSprites[sDexNavSearchDataPtr->fldEffSpriteId], sDexNavSearchDataPtr->fldEffId);

        if (!TryStartHiddenMonFieldEffect(sDexNavSearchDataPtr->environment, 10, 10, TRUE))
        {
            EndDexNavSearchSetupScript(EventScript_PokemonGotAway, taskId);
            return;
        }

        sDexNavSearchDataPtr->movementCount++;
    }

    DexNavProximityUpdate();
    if (task->tProximity != sDexNavSearchDataPtr->proximity)
    {
        //player has moved
        if (task->tRevealed)    //update search window info only if hidden mon has been revealed (always true for search mode)
            DexNavUpdateSearchWindow(sDexNavSearchDataPtr->proximity, sDexNavSearchDataPtr->searchLevel);

        task->tProximity = sDexNavSearchDataPtr->proximity;
    }

    task->tFrameCount++;
}

static void DexNavUpdateSearchWindow(u8 proximity, u8 searchLevel)
{
    bool8 hideName = FALSE;

    if (sDexNavSearchDataPtr->hiddenSearch && !GetSetPokedexFlag(SpeciesToNationalPokedexNum(sDexNavSearchDataPtr->species), FLAG_GET_SEEN))
        hideName = TRUE;    //if a detector mode hidden search and player hasn't seen the mon, hide info

    FillWindowPixelBuffer(sDexNavSearchDataPtr->windowId, PIXEL_FILL(1));   //clear window
    AddSearchWindowText(sDexNavSearchDataPtr->species, proximity, searchLevel, hideName);

    DexNavUpdateDirectionArrow();

    //init hidden sprites
    if (sDexNavSearchDataPtr->itemSpriteId != MAX_SPRITES)
        gSprites[sDexNavSearchDataPtr->itemSpriteId].invisible = TRUE;
    if (sDexNavSearchDataPtr->starSpriteIds[0] != MAX_SPRITES)
        gSprites[sDexNavSearchDataPtr->starSpriteIds[0]].invisible = TRUE;
    if (sDexNavSearchDataPtr->starSpriteIds[1] != MAX_SPRITES)
        gSprites[sDexNavSearchDataPtr->starSpriteIds[1]].invisible = TRUE;
    if (sDexNavSearchDataPtr->starSpriteIds[2] != MAX_SPRITES)
        gSprites[sDexNavSearchDataPtr->starSpriteIds[2]].invisible = TRUE;

    if (proximity <= SNEAKING_PROXIMITY)
    {
        if (searchLevel > 2 && sDexNavSearchDataPtr->heldItem)
        {
            // toggle item view
            if (sDexNavSearchDataPtr->itemSpriteId != MAX_SPRITES)
                gSprites[sDexNavSearchDataPtr->itemSpriteId].invisible = FALSE;
        }

        if (searchLevel > 4)
        {
            if (sDexNavSearchDataPtr->starSpriteIds[0] != MAX_SPRITES)
                gSprites[sDexNavSearchDataPtr->starSpriteIds[0]].invisible = FALSE;

            if (sDexNavSearchDataPtr->starSpriteIds[1] != MAX_SPRITES)
                gSprites[sDexNavSearchDataPtr->starSpriteIds[1]].invisible = FALSE;

            if (sDexNavSearchDataPtr->starSpriteIds[2] != MAX_SPRITES)
                gSprites[sDexNavSearchDataPtr->starSpriteIds[2]].invisible = FALSE;
        }
    }
}

//////////////////////////////
//// DEXNAV MON GENERATOR ////
//////////////////////////////
static void CreateDexNavWildMon(u16 species, u8 potential, u8 level, u8 abilityNum, u16 item, u16* moves)
{
    struct Pokemon* mon = &gEnemyParty[0];
    u8 iv[3] = {NUM_STATS};
    u8 i;
    u8 perfectIv = 31;

    CreateWildMon(species, level, 0);  // shiny rate bonus handled in CreateBoxMon

    // Pick random, unique IVs to set to 31. The number of perfect IVs that are assigned is equal to the potential
    iv[0] = Random() % NUM_STATS;               // choose 1st perfect stat
    do {
        iv[1] = Random() % NUM_STATS;
        iv[2] = Random() % NUM_STATS;
    } while ((iv[1] == iv[0])                   // unique 2nd perfect stat
      || (iv[2] == iv[0] || iv[2] == iv[1]));   // unique 3rd perfect stat

    if (potential > 2 && iv[2] != NUM_STATS)
        SetMonData(mon, MON_DATA_HP_IV + iv[2], &perfectIv);
    if (potential > 1 && iv[1] != NUM_STATS)
        SetMonData(mon, MON_DATA_HP_IV + iv[1], &perfectIv);
    if (potential > 0 && iv[0] != NUM_STATS)
        SetMonData(mon, MON_DATA_HP_IV + iv[0], &perfectIv);

    //Set ability
    SetMonData(mon, MON_DATA_ABILITY_NUM, &abilityNum);

    // Set Held Item
    if (item)
        SetMonData(mon, MON_DATA_HELD_ITEM, &item);

    //Set moves
    for (i = 0; i < MAX_MON_MOVES; i++)
        SetMonMoveSlot(mon, moves[i], i);

    CalculateMonStats(mon);
}

// gets a random level of the species based on map data.
//if it was a hidden encounter, updates the environment it is to be found from the wildheader encounterRate
static u8 DexNavTryGenerateMonLevel(u16 species, u8 environment)
{
    u8 levelBase = GetEncounterLevelFromMapData(species, environment);
    u8 levelBonus = gSaveBlock3Ptr->dexNavChain / 5;

    if (levelBase == MON_LEVEL_NONEXISTENT)
        return MON_LEVEL_NONEXISTENT;   //species not found in the area

    if (Random() % 100 < 4)
        levelBonus += 10; //4% chance of having a +10 level

    if (levelBase + levelBonus > MAX_LEVEL)
        return MAX_LEVEL;
    else
        return levelBase + levelBonus;
}

static void DexNavGenerateMoveset(u16 species, u8 searchLevel, u8 encounterLevel, u16* moveDst)
{
    bool8 genMove = FALSE;
    u16 randVal = Random() % 100;
    u16 i;
    u16 eggMoveBuffer[EGG_MOVES_ARRAY_COUNT];

    // see if first move slot should be an egg move
    if (searchLevel < 5)
    {
        if (SEARCHLEVEL0_MOVECHANCE != 0 && randVal < SEARCHLEVEL0_MOVECHANCE)
            genMove = TRUE;
    }
    else if (searchLevel < 10)
    {
        if (SEARCHLEVEL5_MOVECHANCE != 0 && randVal < SEARCHLEVEL5_MOVECHANCE)
            genMove = TRUE;
    }
    else if (searchLevel < 25)
    {
        if (SEARCHLEVEL10_MOVECHANCE != 0 && randVal < SEARCHLEVEL10_MOVECHANCE)
            genMove = TRUE;
    }
    else if (searchLevel < 50)
    {
        if (SEARCHLEVEL25_MOVECHANCE != 0 && randVal < SEARCHLEVEL25_MOVECHANCE)
            genMove = TRUE;
    }
    else if (searchLevel < 100)
    {
        if (SEARCHLEVEL50_MOVECHANCE != 0 && randVal < SEARCHLEVEL50_MOVECHANCE)
            genMove = TRUE;
    }
    else
    {
        if (SEARCHLEVEL100_MOVECHANCE != 0 && randVal < SEARCHLEVEL100_MOVECHANCE)
            genMove = TRUE;
    }

    // Generate a wild mon just to get the initial moveset (later overwritten by CreateDexNavWildMon)
    CreateWildMon(species, encounterLevel, 0);

    // Store generated mon moves into Dex Nav Struct
    for (i = 0; i < MAX_MON_MOVES; i++)
        moveDst[i] = GetMonData(&gEnemyParty[0], MON_DATA_MOVE1 + i, NULL);

    // set first move slot to a random egg move if search level is good enough
    if (genMove)
    {
        u8 numEggMoves = GetEggMoves(&gEnemyParty[0], eggMoveBuffer);
        if (numEggMoves != 0)
            moveDst[0] = eggMoveBuffer[Random() % numEggMoves];
    }
}

static u16 DexNavGenerateHeldItem(u16 species, u8 searchLevel)
{
    u16 randVal = Random() % 100;
    u8 searchLevelInfluence = searchLevel >> 1;
    u16 item1 = gSpeciesInfo[species].itemCommon;
    u16 item2 = gSpeciesInfo[species].itemRare;

    // if both are the same, 100% to hold
    if (item1 == item2)
        return item1;

    // if no items can be held, then yeah...no items
    if (item2 == ITEM_NONE && item1 == ITEM_NONE)
        return ITEM_NONE;

    // if only one entry, 50% chance
    if (item2 == ITEM_NONE && item1 != ITEM_NONE)
        return (randVal < 50) ? item1 : ITEM_NONE;

    // if both are distinct item1 = 50% + srclvl/2; item2 = 5% + srchlvl/2
    if (randVal < (50 + searchLevelInfluence + 5 + searchLevel))
        return (randVal > 5 + searchLevelInfluence) ? item1 : item2;
    else
        return ITEM_NONE;

    return ITEM_NONE;
}

static u8 DexNavGetAbilityNum(u16 species, u8 searchLevel)
{
    bool8 genAbility = FALSE;
    u16 randVal = Random() % 100;
    u8 abilityNum = 0;

    if (searchLevel < 5)
    {
        #if (SEARCHLEVEL0_ABILITYCHANCE != 0)
        if (randVal < SEARCHLEVEL0_ABILITYCHANCE)
            genAbility = TRUE;
        #endif
    }
    else if (searchLevel < 10)
    {
        #if (SEARCHLEVEL5_ABILITYCHANCE != 0)
        if (randVal < SEARCHLEVEL5_ABILITYCHANCE)
            genAbility = TRUE;
        #endif
    }
    else if (searchLevel < 25)
    {
        #if (SEARCHLEVEL10_ABILITYCHANCE != 0)
        if (randVal < SEARCHLEVEL10_ABILITYCHANCE)
            genAbility = TRUE;
        #endif
    }
    else if (searchLevel < 50)
    {
        #if (SEARCHLEVEL25_ABILITYCHANCE != 0)
        if (randVal < SEARCHLEVEL25_ABILITYCHANCE)
            genAbility = TRUE;
        #endif
    }
    else if (searchLevel < 100)
    {
        #if (SEARCHLEVEL50_ABILITYCHANCE != 0)
        if (randVal < SEARCHLEVEL50_ABILITYCHANCE)
            genAbility = TRUE;
        #endif
    }
    else
    {
        #if (SEARCHLEVEL100_ABILITYCHANCE != 0)
        if (randVal < SEARCHLEVEL100_ABILITYCHANCE)
            genAbility = TRUE;
        #endif
    }

    if (genAbility
            && gSpeciesInfo[species].abilities[2] != ABILITY_NONE
            && GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
    {
        //Only give hidden ability if Pokemon has been caught before
        abilityNum = 2;
    }
    else
    {
        //Pick a normal ability of that Pokemon
        if (gSpeciesInfo[species].abilities[1] != ABILITY_NONE)
            abilityNum = Random() & 1;
        else
            abilityNum = 0;
    }

    return abilityNum;
}

static u8 DexNavGeneratePotential(u8 searchLevel)
{
    u8 genChance = 0;
    int randVal = Random() % 100;

    if (searchLevel < 5)
    {
        genChance = SEARCHLEVEL0_ONESTAR + SEARCHLEVEL0_TWOSTAR + SEARCHLEVEL0_THREESTAR;
        if (randVal < genChance)
        {
            // figure out which star it is
            if (randVal < SEARCHLEVEL0_ONESTAR)
                return 1;
            else if (randVal < (SEARCHLEVEL0_ONESTAR + SEARCHLEVEL0_TWOSTAR))
                return 2;
            else
                return 3;
        }
    }
    else if (searchLevel < 10)
    {
        genChance = SEARCHLEVEL5_ONESTAR + SEARCHLEVEL5_TWOSTAR + SEARCHLEVEL5_THREESTAR;
        if (randVal < genChance)
        {
            // figure out which star it is
            if (randVal < SEARCHLEVEL5_ONESTAR)
                return 1;
            else if (randVal < (SEARCHLEVEL5_ONESTAR + SEARCHLEVEL5_TWOSTAR))
                return 2;
            else
                return 3;
        }
    }
    else if (searchLevel < 25)
    {
        genChance = SEARCHLEVEL10_ONESTAR + SEARCHLEVEL10_TWOSTAR + SEARCHLEVEL10_THREESTAR;
        if (randVal < genChance)
        {
            // figure out which star it is
            if (randVal < SEARCHLEVEL10_ONESTAR)
                return 1;
            else if (randVal < (SEARCHLEVEL10_ONESTAR + SEARCHLEVEL10_TWOSTAR))
                return 2;
            else
                return 3;
        }
    }
    else if (searchLevel < 50)
    {
        genChance = SEARCHLEVEL25_ONESTAR + SEARCHLEVEL25_TWOSTAR + SEARCHLEVEL25_THREESTAR;
        if (randVal < genChance)
        {
            // figure out which star it is
            if (randVal < SEARCHLEVEL25_ONESTAR)
                return 1;
            else if (randVal < (SEARCHLEVEL25_ONESTAR + SEARCHLEVEL25_TWOSTAR))
                return 2;
            else
                return 3;
        }
    }
    else if (searchLevel < 100)
    {
        genChance = SEARCHLEVEL50_ONESTAR + SEARCHLEVEL50_TWOSTAR + SEARCHLEVEL50_THREESTAR;
        if (randVal < genChance)
        {
            // figure out which star it is
            if (randVal < SEARCHLEVEL50_ONESTAR)
                return 1;
            else if (randVal < (SEARCHLEVEL50_ONESTAR + SEARCHLEVEL50_TWOSTAR))
                return 2;
            else
                return 3;
        }
    }
    else
    {
        genChance = SEARCHLEVEL100_ONESTAR + SEARCHLEVEL100_TWOSTAR + SEARCHLEVEL100_THREESTAR;
        if (randVal < genChance)
        {
            // figure out which star it is
            if (randVal < SEARCHLEVEL100_ONESTAR)
                return 1;
            else if (randVal < (SEARCHLEVEL100_ONESTAR + SEARCHLEVEL100_TWOSTAR))
                return 2;
            else
                return 3;
        }
    }

    return 0;   // No potential
}

static u8 GetEncounterLevelFromMapData(u16 species, u8 environment)
{
    u16 headerId = GetCurrentMapWildMonHeaderId();
    const struct WildPokemonInfo *landMonsInfo = gWildMonHeaders[headerId].landMonsInfo;
    const struct WildPokemonInfo *waterMonsInfo = gWildMonHeaders[headerId].waterMonsInfo;
    const struct WildPokemonInfo *hiddenMonsInfo = gWildMonHeaders[headerId].hiddenMonsInfo;
    u8 min = 100;
    u8 max = 0;
    u8 i;

    switch (environment)
    {
    case ENCOUNTER_TYPE_LAND:    // grass
        if (landMonsInfo == NULL)
            return MON_LEVEL_NONEXISTENT; //Hidden pokemon should only appear on walkable tiles or surf tiles

        for (i = 0; i < LAND_WILD_COUNT; i++)
        {
            if (landMonsInfo->wildPokemon[i].species == species)
            {
                min = (min < landMonsInfo->wildPokemon[i].minLevel) ? min : landMonsInfo->wildPokemon[i].minLevel;
                max = (max > landMonsInfo->wildPokemon[i].maxLevel) ? max : landMonsInfo->wildPokemon[i].maxLevel;
            }
        }
        break;
    case ENCOUNTER_TYPE_WATER:    //water
        if (waterMonsInfo == NULL)
            return MON_LEVEL_NONEXISTENT; //Hidden pokemon should only appear on walkable tiles or surf tiles

        for (i = 0; i < WATER_WILD_COUNT; i++)
        {
            if (waterMonsInfo->wildPokemon[i].species == species)
            {
                min = (min < waterMonsInfo->wildPokemon[i].minLevel) ? min : waterMonsInfo->wildPokemon[i].minLevel;
                max = (max > waterMonsInfo->wildPokemon[i].maxLevel) ? max : waterMonsInfo->wildPokemon[i].maxLevel;
            }
        }
        break;
    case ENCOUNTER_TYPE_HIDDEN:
        if (hiddenMonsInfo == NULL)
            return MON_LEVEL_NONEXISTENT;

        for (i = 0; i < HIDDEN_WILD_COUNT; i++)
        {
            if (hiddenMonsInfo->wildPokemon[i].species == species)
            {
                min = (min < hiddenMonsInfo->wildPokemon[i].minLevel) ? min : hiddenMonsInfo->wildPokemon[i].minLevel;
                max = (max > hiddenMonsInfo->wildPokemon[i].maxLevel) ? max : hiddenMonsInfo->wildPokemon[i].maxLevel;
            }
        }

        // use encounter rate to signify is hidden pokemon are on land or in water
        if (hiddenMonsInfo->encounterRate == 1)
            sDexNavSearchDataPtr->environment = ENCOUNTER_TYPE_WATER;
        else
            sDexNavSearchDataPtr->environment = ENCOUNTER_TYPE_LAND;
        break;
    default:
        return MON_LEVEL_NONEXISTENT;
    }

    if (max == 0)
        return MON_LEVEL_NONEXISTENT;

    return RandomUniform(RNG_DEXNAV_ENCOUNTER_LEVEL, min, max);
}


///////////
/// GUI ///
///////////
static const struct BgTemplate sDexNavMenuBgTemplates[2] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .priority = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .priority = 1
    }
};

static void DexNav_VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void DexNav_MainCB(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

static bool8 DexNav_InitBgs(void)
{
    ResetVramOamAndBgCntRegs();
    ResetAllBgsCoordinates();
    sBg1TilemapBuffer = Alloc(0x800);
    if (sBg1TilemapBuffer == NULL)
        return FALSE;

    memset(sBg1TilemapBuffer, 0, 0x800);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, sDexNavMenuBgTemplates, NELEMS(sDexNavMenuBgTemplates));
    SetBgTilemapBuffer(1, sBg1TilemapBuffer);
    ScheduleBgCopyTilemapToVram(1);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetGpuReg(REG_OFFSET_BLDCNT , 0);
    ShowBg(0);
    ShowBg(1);
    return TRUE;
}

static bool8 DexNav_LoadGraphics(void)
{
    switch (sDexNavUiDataPtr->state)
    {
    case 0:
        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(1, sDexNavGuiTiles, 0, 0, 0);
        sDexNavUiDataPtr->state++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LZDecompressWram(sDexNavGuiTilemap, sBg1TilemapBuffer);
            sDexNavUiDataPtr->state++;
        }
        break;
    case 2:
        LoadPalette(sDexNavGuiPal, 0, 32);
        sDexNavUiDataPtr->state++;
        break;
    default:
        sDexNavUiDataPtr->state = 0;
        return TRUE;
    }

    return FALSE;
}

static void UpdateCursorPosition(void)
{
    u16 x, y;

    switch (sDexNavUiDataPtr->cursorRow)
    {
    case ROW_WATER:
        x = ROW_WATER_ICON_X + (24 * sDexNavUiDataPtr->cursorCol);
        y = ROW_WATER_ICON_Y;
        sDexNavUiDataPtr->environment = ENCOUNTER_TYPE_WATER;
        break;
    case ROW_LAND_TOP: //land 1
        x = ROW_LAND_ICON_X + (24 * sDexNavUiDataPtr->cursorCol);
        y = ROW_LAND_TOP_ICON_Y;
        sDexNavUiDataPtr->environment = ENCOUNTER_TYPE_LAND;
        break;
    case ROW_LAND_BOT: //land 2
        x = ROW_LAND_ICON_X + (24 * sDexNavUiDataPtr->cursorCol);
        y = ROW_LAND_BOT_ICON_Y;
        sDexNavUiDataPtr->environment = ENCOUNTER_TYPE_LAND;
        break;
    case ROW_HIDDEN:
        x = ROW_HIDDEN_ICON_X + (24 * sDexNavUiDataPtr->cursorCol);
        y = ROW_HIDDEN_ICON_Y;
        sDexNavUiDataPtr->environment = ENCOUNTER_TYPE_HIDDEN;
        break;
    default:
        return;
    }

    gSprites[sDexNavUiDataPtr->cursorSpriteId].x = x;
    gSprites[sDexNavUiDataPtr->cursorSpriteId].y = y;

    PrintCurrentSpeciesInfo();
}

static void CreateSelectionCursor(void)
{
    u8 spriteId;
    struct CompressedSpriteSheet spriteSheet;

    spriteSheet.data = sSelectionCursorGfx;
    spriteSheet.size = 0x200;
    spriteSheet.tag = SELECTION_CURSOR_TAG;
    LoadCompressedSpriteSheet(&spriteSheet);

    LoadPalette(sSelectionCursorPal, (16 * sSelectionCursorOam.paletteNum) + 0x100, 32);

    spriteId = CreateSprite(&sSelectionCursorSpriteTemplate, 12, 32, 0);
    //gSprites[spriteId].data[1] = -1;

    sDexNavUiDataPtr->cursorSpriteId = spriteId;
    UpdateCursorPosition();
}

static void CreateNoDataIcon(s16 x, s16 y)
{
    CreateSprite(&sNoDataIconTemplate, x, y, 0);
}

static bool8 CapturedAllLandMons(u16 headerId)
{
    u16 i, species;
    int count = 0;
    const struct WildPokemonInfo* landMonsInfo = gWildMonHeaders[headerId].landMonsInfo;

    if (landMonsInfo != NULL)
    {
        for (i = 0; i < LAND_WILD_COUNT; ++i)
        {
            species = landMonsInfo->wildPokemon[i].species;
            if (species != SPECIES_NONE)
            {
                if (!GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
                    break;

                count++;
            }
        }

        if (i >= LAND_WILD_COUNT && count > 0) //All land mons caught
            return TRUE;
    }
    else
    {
        return TRUE;    //technically, no mon data means you caught them all
    }

    return FALSE;
}

//Checks if all Pokemon that can be encountered while surfing have been capture
static bool8 CapturedAllWaterMons(u16 headerId)
{
    u32 i;
    u16 species;
    u8 count = 0;
    const struct WildPokemonInfo* waterMonsInfo = gWildMonHeaders[headerId].waterMonsInfo;

    if (waterMonsInfo != NULL)
    {
        for (i = 0; i < WATER_WILD_COUNT; ++i)
        {
            species = waterMonsInfo->wildPokemon[i].species;
            if (species != SPECIES_NONE)
            {
                count++;
                if (!GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
                    break;
            }
        }

        if (i >= WATER_WILD_COUNT && count > 0)
            return TRUE;
    }
    else
    {
        return TRUE;    //technically, no mon data means you caught them all
    }

    return FALSE;
}

static bool8 CapturedAllHiddenMons(u16 headerId)
{
    u32 i;
    u16 species;
    u8 count = 0;
    const struct WildPokemonInfo* hiddenMonsInfo = gWildMonHeaders[headerId].hiddenMonsInfo;

    if (hiddenMonsInfo != NULL)
    {
        for (i = 0; i < HIDDEN_WILD_COUNT; ++i)
        {
            species = hiddenMonsInfo->wildPokemon[i].species;
            if (species != SPECIES_NONE)
            {
                count++;
                if (!GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
                    break;
            }
        }

        if (i >= HIDDEN_WILD_COUNT && count > 0)
            return TRUE;
    }
    else
    {
        return TRUE;    //technically, no mon data means you caught them all
    }

    return FALSE;
}

static void DexNavLoadCapturedAllSymbols(void)
{
    u16 headerId = GetCurrentMapWildMonHeaderId();

    LoadCompressedSpriteSheetUsingHeap(&sCapturedAllPokemonSpriteSheet);

    if (CapturedAllLandMons(headerId))
        CreateSprite(&sCaptureAllMonsSpriteTemplate, 152, 58, 0);

    if (CapturedAllWaterMons(headerId))
        CreateSprite(&sCaptureAllMonsSpriteTemplate, 139, 17, 0);

    if (CapturedAllHiddenMons(headerId))
        CreateSprite(&sCaptureAllMonsSpriteTemplate, 114, 123, 0);
}

//#define WIN_DETAILS_TILE        0x3a3
static void DexNav_InitWindows(void)
{
    InitWindows(sDexNavGuiWindowTemplates);
    DeactivateAllTextPrinters();
    ScheduleBgCopyTilemapToVram(0);
}

static void DexNavGuiFreeResources(void)
{
    Free(sDexNavUiDataPtr);
    Free(sBg1TilemapBuffer);
    FreeAllWindowBuffers();
}

static void CB1_InitDexNavSearch(void)
{
    u8 taskId;

    if (!gPaletteFade.active && !ArePlayerFieldControlsLocked() && gMain.callback2 == CB2_Overworld)
    {
        SetMainCallback1(CB1_Overworld);
        taskId = CreateTask(Task_InitDexNavSearch, 0);
        gTasks[taskId].tSpecies = gSpecialVar_0x8000;
        gTasks[taskId].tEnvironment = gSpecialVar_0x8001;
    }
}

static void CB1_DexNavSearchCallback(void)
{
    CB1_InitDexNavSearch();
}

static void Task_DexNavExitAndSearch(u8 taskId)
{
    DexNavGuiFreeResources();
    DestroyTask(taskId);
    SetMainCallback1(CB1_DexNavSearchCallback);
    SetMainCallback2(CB2_ReturnToField);
}

static void Task_DexNavFadeAndExit(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sDexNavUiDataPtr->savedCallback);
        DexNavGuiFreeResources();
        DestroyTask(taskId);
    }
}

static void DexNavFadeAndExit(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    CreateTask(Task_DexNavFadeAndExit, 0);
    SetVBlankCallback(DexNav_VBlankCB);
    SetMainCallback2(DexNav_MainCB);
}

static bool8 SpeciesInArray(u16 species, u8 section)
{
    u32 i;
    u16 dexNum = SpeciesToNationalPokedexNum(species);

    switch (section)
    {
    case 0: //land
        for (i = 0; i < LAND_WILD_COUNT; i++)
        {
            if (SpeciesToNationalPokedexNum(sDexNavUiDataPtr->landSpecies[i]) == dexNum)
                return TRUE;
        }
        break;
    case 1: //water
        for (i = 0; i < WATER_WILD_COUNT; i++)
        {
            if (SpeciesToNationalPokedexNum(sDexNavUiDataPtr->waterSpecies[i]) == dexNum)
                return TRUE;
        }
        break;
    case 2: //hidden
        for (i = 0; i < HIDDEN_WILD_COUNT; i++)
        {
            if (SpeciesToNationalPokedexNum(sDexNavUiDataPtr->hiddenSpecies[i]) == dexNum)
                return TRUE;
        }
        break;
    default:
        break;
    }

    return FALSE;
}

// get unique wild encounters on current map
static void DexNavLoadEncounterData(void)
{
    u8 grassIndex = 0;
    u8 waterIndex = 0;
    u8 hiddenIndex = 0;
    u16 species;
    u32 i;
    u16 headerId = GetCurrentMapWildMonHeaderId();
    const struct WildPokemonInfo* landMonsInfo = gWildMonHeaders[headerId].landMonsInfo;
    const struct WildPokemonInfo* waterMonsInfo = gWildMonHeaders[headerId].waterMonsInfo;
    const struct WildPokemonInfo* hiddenMonsInfo = gWildMonHeaders[headerId].hiddenMonsInfo;

    // nop struct data
    memset(sDexNavUiDataPtr->landSpecies, 0, sizeof(sDexNavUiDataPtr->landSpecies));
    memset(sDexNavUiDataPtr->waterSpecies, 0, sizeof(sDexNavUiDataPtr->waterSpecies));
    memset(sDexNavUiDataPtr->hiddenSpecies, 0, sizeof(sDexNavUiDataPtr->hiddenSpecies));

    // land mons
    if (landMonsInfo != NULL && landMonsInfo->encounterRate != 0)
    {
        for (i = 0; i < LAND_WILD_COUNT; i++)
        {
            species = landMonsInfo->wildPokemon[i].species;
            if (species != SPECIES_NONE && !SpeciesInArray(species, 0))
                sDexNavUiDataPtr->landSpecies[grassIndex++] = landMonsInfo->wildPokemon[i].species;
        }
    }

    // water mons
    if (waterMonsInfo != NULL && waterMonsInfo->encounterRate != 0)
    {
        for (i = 0; i < WATER_WILD_COUNT; i++)
        {
            species = waterMonsInfo->wildPokemon[i].species;
            if (species != SPECIES_NONE && !SpeciesInArray(species, 1))
                sDexNavUiDataPtr->waterSpecies[waterIndex++] = waterMonsInfo->wildPokemon[i].species;
        }
    }

    // hidden mons
    if (hiddenMonsInfo != NULL) // no encounter rate check since 0 means land, 1 means water encounters
    {
        for (i = 0; i < HIDDEN_WILD_COUNT; i++)
        {
            species = hiddenMonsInfo->wildPokemon[i].species;
            if (species != SPECIES_NONE && !SpeciesInArray(species, 2))
                sDexNavUiDataPtr->hiddenSpecies[hiddenIndex++] = hiddenMonsInfo->wildPokemon[i].species;
        }
    }
}

static void TryDrawIconInSlot(u16 species, s16 x, s16 y)
{
    if (species == SPECIES_NONE || species > NUM_SPECIES)
        CreateNoDataIcon(x, y);   //'X' in slot
    else if (!GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_SEEN))
        CreateMonIcon(SPECIES_NONE, SpriteCB_MonIcon, x, y, 0, 0xFFFFFFFF); //question mark
    else
        CreateMonIcon(species, SpriteCB_MonIcon, x, y, 0, 0xFFFFFFFF);
}

static void DrawSpeciesIcons(void)
{
    s16 x, y;
    u32 i;
    u16 species;

    LoadCompressedSpriteSheetUsingHeap(&sNoDataIconSpriteSheet);
    for (i = 0; i < LAND_WILD_COUNT; i++)
    {
        species = sDexNavUiDataPtr->landSpecies[i];
        x = ROW_LAND_ICON_X + (24 * (i % COL_LAND_COUNT));
        y = ROW_LAND_TOP_ICON_Y + (i > COL_LAND_MAX ? 28 : 0);
        TryDrawIconInSlot(species, x, y);
    }

    for (i = 0; i < WATER_WILD_COUNT; i++)
    {
        species = sDexNavUiDataPtr->waterSpecies[i];
        x = ROW_WATER_ICON_X + 24 * i;
        y = ROW_WATER_ICON_Y;
        TryDrawIconInSlot(species, x, y);
    }

    for (i = 0; i < HIDDEN_WILD_COUNT; i++)
    {
        species = sDexNavUiDataPtr->hiddenSpecies[i];
        x = ROW_HIDDEN_ICON_X + 24 * i;
        y = ROW_HIDDEN_ICON_Y;
        if (FlagGet(DN_FLAG_DETECTOR_MODE))
            TryDrawIconInSlot(species, x, y);
       else if (species == SPECIES_NONE || species > NUM_SPECIES)
            CreateNoDataIcon(x, y);
        else
            CreateMonIcon(SPECIES_NONE, SpriteCB_MonIcon, x, y, 0, 0xFFFFFFFF); //question mark if detector mode inactive
    }
}

static u16 DexNavGetSpecies(void)
{
    u16 species;

    switch (sDexNavUiDataPtr->cursorRow)
    {
    case ROW_WATER:
        species = sDexNavUiDataPtr->waterSpecies[sDexNavUiDataPtr->cursorCol];
        break;
    case ROW_LAND_TOP:
        species = sDexNavUiDataPtr->landSpecies[sDexNavUiDataPtr->cursorCol];
        break;
    case ROW_LAND_BOT:
        species = sDexNavUiDataPtr->landSpecies[sDexNavUiDataPtr->cursorCol + COL_LAND_COUNT];
        break;
    case ROW_HIDDEN:
        if (!FlagGet(DN_FLAG_DETECTOR_MODE))
            species = SPECIES_NONE;
        else
            species = sDexNavUiDataPtr->hiddenSpecies[sDexNavUiDataPtr->cursorCol];
        break;
    default:
        return SPECIES_NONE;
    }

    if (!GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_SEEN))
        return SPECIES_NONE;

    return species;
}

static void SetSpriteInvisibility(u8 spriteArrayId, bool8 invisible)
{
    gSprites[sDexNavUiDataPtr->typeIconSpriteIds[spriteArrayId]].invisible = invisible;
}

// different from pokemon_summary_screen
#define TYPE_ICON_PAL_NUM_0     13
#define TYPE_ICON_PAL_NUM_1     14
#define TYPE_ICON_PAL_NUM_2     15
static const u8 sMoveTypeToOamPaletteNum[NUMBER_OF_MON_TYPES] =
{
    [TYPE_NORMAL] = TYPE_ICON_PAL_NUM_0,
    [TYPE_FIGHTING] = TYPE_ICON_PAL_NUM_0,
    [TYPE_FLYING] = TYPE_ICON_PAL_NUM_1,
    [TYPE_POISON] = TYPE_ICON_PAL_NUM_1,
    [TYPE_GROUND] = TYPE_ICON_PAL_NUM_0,
    [TYPE_ROCK] = TYPE_ICON_PAL_NUM_0,
    [TYPE_BUG] = TYPE_ICON_PAL_NUM_2,
    [TYPE_GHOST] = TYPE_ICON_PAL_NUM_1,
    [TYPE_STEEL] = TYPE_ICON_PAL_NUM_0,
    [TYPE_MYSTERY] = TYPE_ICON_PAL_NUM_2,
    [TYPE_FIRE] = TYPE_ICON_PAL_NUM_0,
    [TYPE_WATER] = TYPE_ICON_PAL_NUM_1,
    [TYPE_GRASS] = TYPE_ICON_PAL_NUM_2,
    [TYPE_ELECTRIC] = TYPE_ICON_PAL_NUM_0,
    [TYPE_PSYCHIC] = TYPE_ICON_PAL_NUM_1,
    [TYPE_ICE] = TYPE_ICON_PAL_NUM_1,
    [TYPE_DRAGON] = TYPE_ICON_PAL_NUM_2,
    [TYPE_DARK] = TYPE_ICON_PAL_NUM_0,
    [TYPE_FAIRY] = TYPE_ICON_PAL_NUM_1,
};
static void SetTypeIconPosAndPal(u8 typeId, u8 x, u8 y, u8 spriteArrayId)
{
    struct Sprite *sprite;

    sprite = &gSprites[sDexNavUiDataPtr->typeIconSpriteIds[spriteArrayId]];
    StartSpriteAnim(sprite, typeId);
    sprite->oam.paletteNum = sMoveTypeToOamPaletteNum[typeId];
    sprite->x = x + 16;
    sprite->y = y + 8;
    SetSpriteInvisibility(spriteArrayId, FALSE);
}

static void PrintCurrentSpeciesInfo(void)
{
    u16 species = DexNavGetSpecies();
    u16 dexNum = SpeciesToNationalPokedexNum(species);
    u8 type1, type2;

    if (!GetSetPokedexFlag(dexNum, FLAG_GET_SEEN))
        species = SPECIES_NONE;

    // clear windows
    FillWindowPixelBuffer(WINDOW_INFO, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));

    //species name
    if (species == SPECIES_NONE)
        AddTextPrinterParameterized3(WINDOW_INFO, 0, 0, SPECIES_INFO_Y, sFontColor_Black, 0, sText_DexNav_NoInfo);
    else
        AddTextPrinterParameterized3(WINDOW_INFO, 0, 0, SPECIES_INFO_Y, sFontColor_Black, 0, GetSpeciesName(species));

    //type icon(s)
    type1 = gSpeciesInfo[species].types[0];
    type2 = gSpeciesInfo[species].types[1];
    if (species == SPECIES_NONE)
        type1 = type2 = TYPE_MYSTERY;

    if (type1 == type2)
    {
        SetTypeIconPosAndPal(type1, 186, 69, 0);
        SetSpriteInvisibility(1, TRUE);
    }
    else
    {
        SetTypeIconPosAndPal(type1, 168, 69, 0);
        SetTypeIconPosAndPal(type2, 168 + 33, 69, 1);
    }

    //search level
    if (species == SPECIES_NONE)
    {
        AddTextPrinterParameterized3(WINDOW_INFO, 0, 0, SEARCH_LEVEL_Y, sFontColor_Black, 0, sText_DexNav_NoInfo);
    }
    else
    {
        ConvertIntToDecimalStringN(gStringVar4, GetSearchLevel(dexNum), 0, 4);
        AddTextPrinterParameterized3(WINDOW_INFO, 0, 0, SEARCH_LEVEL_Y, sFontColor_Black, 0, gStringVar4);
    }

    //hidden ability
    if (species == SPECIES_NONE)
    {
        AddTextPrinterParameterized3(WINDOW_INFO, 0, 0, HA_INFO_Y, sFontColor_Black, 0, sText_DexNav_NoInfo);
    }
    else if (GetSetPokedexFlag(dexNum, FLAG_GET_CAUGHT))
    {
        if (gSpeciesInfo[species].abilities[2] != ABILITY_NONE)
            AddTextPrinterParameterized3(WINDOW_INFO, 0, 0, HA_INFO_Y, sFontColor_Black, 0, gAbilitiesInfo[gSpeciesInfo[species].abilities[2]].name);
        else
            AddTextPrinterParameterized3(WINDOW_INFO, 0, 0, HA_INFO_Y, sFontColor_Black, 0, gText_PokeSum_Item_None);
    }
    else
    {
        AddTextPrinterParameterized3(WINDOW_INFO, 0, 0, HA_INFO_Y, sFontColor_Black, 0, sText_DexNav_CaptureToSee);
    }

    //current chain
    ConvertIntToDecimalStringN(gStringVar1, gSaveBlock3Ptr->dexNavChain, STR_CONV_MODE_LEFT_ALIGN, 3);
    AddTextPrinterParameterized3(WINDOW_INFO, 0, 0, CHAIN_BONUS_Y, sFontColor_Black, 0, gStringVar1);

    CopyWindowToVram(WINDOW_INFO, 3);
    PutWindowTilemap(WINDOW_INFO);
}

#define MAP_NAME_LENGTH 16
static void PrintMapName(void)
{
    GetMapName(gStringVar3, GetCurrentRegionMapSectionId(), 0);
    AddTextPrinterParameterized3(WINDOW_REGISTERED, 1, 75 +
                                 GetStringRightAlignXOffset(1, gStringVar3, MAP_NAME_LENGTH * GetFontAttribute(1, FONTATTR_MAX_LETTER_WIDTH)),
                                 0, sFontColor_White, 0, gStringVar3);
    CopyWindowToVram(WINDOW_REGISTERED, 3);
}

static void PrintSearchableSpecies(u16 species)
{
    FillWindowPixelBuffer(WINDOW_REGISTERED, PIXEL_FILL(TEXT_COLOR_TRANSPARENT));
    PutWindowTilemap(WINDOW_REGISTERED);
    if (species == SPECIES_NONE)
    {
        AddTextPrinterParameterized3(WINDOW_REGISTERED, 1, 0, 0, sFontColor_White, TEXT_SKIP_DRAW, sText_DexNav_PressRToRegister);
    }
    else
    {
        StringCopy(gStringVar1, GetSpeciesName(species));
        StringExpandPlaceholders(gStringVar4, sText_DexNav_SearchForRegisteredSpecies);
        AddTextPrinterParameterized3(WINDOW_REGISTERED, 1, 0, 0, sFontColor_White, TEXT_SKIP_DRAW, gStringVar4);
    }

    PrintMapName();
}

static void CreateTypeIconSprites(void)
{
    u8 i;

    LoadCompressedSpriteSheet(&gSpriteSheet_MoveTypes);
    LoadCompressedPalette(gMoveTypes_Pal, 0x1D0, 0x60);
    for (i = 0; i < 2; i++)
    {
        if (sDexNavUiDataPtr->typeIconSpriteIds[i] == 0xFF)
            sDexNavUiDataPtr->typeIconSpriteIds[i] = CreateSprite(&gSpriteTemplate_MoveTypes, 10, 10, 2);

        SetSpriteInvisibility(i, TRUE);
    }
}

static bool8 DexNav_DoGfxSetup(void)
{
    u8 taskId;

    switch (gMain.state)
    {
    case 0:
        SetVBlankHBlankCallbacksToNull();
        ClearScheduledBgCopiesToVram();
        gMain.state++;
        break;
    case 1:
        ScanlineEffect_Stop();
        gMain.state++;
        break;
    case 2:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 3:
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        gMain.state++;
        break;
    case 4:
        if (DexNav_InitBgs())
        {
            sDexNavUiDataPtr->state = 0;
            gMain.state++;
        }
        else
        {
            DexNavFadeAndExit();
            return TRUE;
        }
        break;
    case 5:
        if (DexNav_LoadGraphics() == TRUE)
            gMain.state++;
        break;
    case 6:
        DexNav_InitWindows();
        sDexNavUiDataPtr->cursorRow = ROW_LAND_TOP;
        sDexNavUiDataPtr->cursorCol = 0;
        sDexNavUiDataPtr->environment = ENCOUNTER_TYPE_LAND;
        gMain.state++;
        break;
    case 7:
        PrintSearchableSpecies(VarGet(DN_VAR_SPECIES) & DEXNAV_MASK_SPECIES);
        DexNavLoadEncounterData();
        gMain.state++;
        break;
    case 8:
        taskId = CreateTask(Task_DexNavWaitFadeIn, 0);
        gTasks[taskId].tSpecies = 0;
        gTasks[taskId].tEnvironment = sDexNavUiDataPtr->environment;
        gMain.state++;
        break;
    case 9:
        sDexNavUiDataPtr->typeIconSpriteIds[0] = 0xFF;
        sDexNavUiDataPtr->typeIconSpriteIds[1] = 0xFF;
        CreateTypeIconSprites();
        gMain.state++;
        break;
    case 10:
        LoadMonIconPalettes();
        DrawSpeciesIcons();
        CreateSelectionCursor();
        DexNavLoadCapturedAllSymbols();
        gMain.state++;
        break;
    case 11:
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        gMain.state++;
        break;
    case 12:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    default:
        SetVBlankCallback(DexNav_VBlankCB);
        SetMainCallback2(DexNav_MainCB);
        return TRUE;
    }

    return FALSE;
}

static void DexNav_RunSetup(void)
{
    while (!DexNav_DoGfxSetup()) {}
}

// Entry point for the dexnav GUI
static void DexNavGuiInit(MainCallback callback)
{
    if ((sDexNavUiDataPtr = AllocZeroed(sizeof(struct DexNavGUI))) == NULL)
    {
        SetMainCallback2(callback);
        return;
    }

    sDexNavUiDataPtr->state = 0;
    sDexNavUiDataPtr->savedCallback = callback;
    SetMainCallback2(DexNav_RunSetup);
}

void Task_OpenDexNavFromStartMenu(u8 taskId)
{
    if (DEXNAV_ENABLED == FALSE)
    {   // must have it enabled to enter
        DebugPrintfLevel(MGBA_LOG_ERROR, "DexNav was opened when DEXNAV_ENABLED config was disabled! Check include/config/dexnav.h");
        DestroyTask(taskId);
    }
    else if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        DexNavGuiInit(CB2_ReturnToFieldWithOpenMenu);
        DestroyTask(taskId);
    }
}

static void Task_DexNavWaitFadeIn(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = Task_DexNavMain;
}

static void Task_DexNavMain(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    u16 species;

    if (IsSEPlaying())
        return;

    if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_POKENAV_OFF);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        task->func = Task_DexNavFadeAndExit;
    }
    else if (JOY_NEW(DPAD_UP))
    {
        if (sDexNavUiDataPtr->cursorRow == ROW_WATER)
        {
            sDexNavUiDataPtr->cursorRow = ROW_HIDDEN;
            if (sDexNavUiDataPtr->cursorCol >= COL_HIDDEN_COUNT)
                sDexNavUiDataPtr->cursorCol = COL_HIDDEN_MAX;
        }
        else
        {
            if (sDexNavUiDataPtr->cursorRow == ROW_LAND_TOP && sDexNavUiDataPtr->cursorCol == COL_LAND_MAX)
                sDexNavUiDataPtr->cursorCol = COL_WATER_MAX;

            sDexNavUiDataPtr->cursorRow--;
        }

        PlaySE(SE_BAG_CURSOR);
        UpdateCursorPosition();
    }
    else if (JOY_NEW(DPAD_DOWN))
    {
        if (sDexNavUiDataPtr->cursorRow == ROW_HIDDEN)
        {
            sDexNavUiDataPtr->cursorRow = ROW_WATER;
        }
        else if (sDexNavUiDataPtr->cursorRow == ROW_LAND_BOT)
        {
            if (sDexNavUiDataPtr->cursorCol >= COL_HIDDEN_COUNT)
                sDexNavUiDataPtr->cursorCol = COL_HIDDEN_MAX;

            sDexNavUiDataPtr->cursorRow++;
        }
        else
        {
            sDexNavUiDataPtr->cursorRow++;
        }

        PlaySE(SE_BAG_CURSOR);
        UpdateCursorPosition();
    }
    else if (JOY_NEW(DPAD_LEFT))
    {
        if (sDexNavUiDataPtr->cursorCol == 0)
        {
            switch (sDexNavUiDataPtr->cursorRow)
            {
            case ROW_WATER:
                sDexNavUiDataPtr->cursorCol = COL_WATER_MAX;
                break;
            case ROW_HIDDEN:
                sDexNavUiDataPtr->cursorCol = COL_HIDDEN_MAX;
                break;
            default:
                sDexNavUiDataPtr->cursorCol = COL_LAND_MAX;
                break;
            }
        }
        else
        {
            sDexNavUiDataPtr->cursorCol--;
        }

        PlaySE(SE_BAG_CURSOR);
        UpdateCursorPosition();
    }
    else if (JOY_NEW(DPAD_RIGHT))
    {
        switch (sDexNavUiDataPtr->cursorRow)
        {
        case ROW_WATER:
            if (sDexNavUiDataPtr->cursorCol == COL_WATER_MAX)
                sDexNavUiDataPtr->cursorCol = 0;
            else
                sDexNavUiDataPtr->cursorCol++;
            break;
        case ROW_HIDDEN:
            if (sDexNavUiDataPtr->cursorCol == COL_HIDDEN_MAX)
                sDexNavUiDataPtr->cursorCol = 0;
            else
                sDexNavUiDataPtr->cursorCol++;
            break;
        default:
            if (sDexNavUiDataPtr->cursorCol == COL_LAND_MAX)
                sDexNavUiDataPtr->cursorCol = 0;
            else
                sDexNavUiDataPtr->cursorCol++;
            break;
        }

        PlaySE(SE_BAG_CURSOR);
        UpdateCursorPosition();
    }
    else if (JOY_NEW(R_BUTTON))
    {
        // check selection is valid. Play sound if invalid
        species = DexNavGetSpecies();

        if (species != SPECIES_NONE)
        {
            PrintSearchableSpecies(species);
            //PlaySE(SE_DEX_SEARCH);
            PlayCry_Script(species, 0);

            // create value to store in a var
            VarSet(DN_VAR_SPECIES, ((sDexNavUiDataPtr->environment << 14) | species));
        }
        else
        {
            PlaySE(SE_FAILURE);
        }
    }
    else if (JOY_NEW(A_BUTTON))
    {
        species = DexNavGetSpecies();
        if (species == SPECIES_NONE)
        {
            PlaySE(SE_FAILURE);
        }
        else
        {
            gSpecialVar_0x8000 = species;
            gSpecialVar_0x8001 = sDexNavUiDataPtr->environment;
            gSpecialVar_0x8002 = (sDexNavUiDataPtr->cursorRow == ROW_HIDDEN) ? TRUE : FALSE;
            PlaySE(SE_DEX_SEARCH);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            task->func = Task_DexNavExitAndSearch;
        }
    }
}

/////////////////////////
//// HIDDEN POKEMON /////
/////////////////////////
bool8 TryFindHiddenPokemon(void)
{
    u16 *stepPtr = GetVarPointer(DN_VAR_STEP_COUNTER);

    if (DEXNAV_ENABLED == 0
            || !FlagGet(DN_FLAG_DETECTOR_MODE)
            || FlagGet(DN_FLAG_SEARCHING)
            || GetFlashLevel() > 0)
    {
        if (stepPtr != NULL)
            (*stepPtr) = 0;
        return FALSE;
    }

    (*stepPtr)++;
    (*stepPtr) %= HIDDEN_MON_STEP_COUNT;
    if ((*stepPtr) == 0 && (Random() % 100 < HIDDEN_MON_SEARCH_RATE))
    {
        // hidden pokemon
        u16 headerId = GetCurrentMapWildMonHeaderId();
        u8 index;
        u16 species;
        u8 environment;
        u8 taskId;
        const struct WildPokemonInfo* hiddenMonsInfo = gWildMonHeaders[headerId].hiddenMonsInfo;
        bool8 isHiddenMon = FALSE;

        // while you can still technically find hidden pokemon if there are not hidden-only pokemon on a map,
        // this prevents any potential lagging on maps you dont want hidden pokemon to appear on
        if (hiddenMonsInfo == NULL)
            return FALSE;

        // encounter rate signifies surfing (1) or land mons (0)!
        // again, for simplicity
        switch (hiddenMonsInfo->encounterRate)
        {
        case 0: // land
            // there are surely better ways to do this, but this allows greatest flexibility
            if (Random() % 100 < HIDDEN_MON_PROBABILTY)
            {
                index = ChooseHiddenMonIndex();
                if (index == 0xFF)
                    return FALSE;//no hidden info
                species = hiddenMonsInfo->wildPokemon[index].species;
                isHiddenMon = TRUE;
                environment = ENCOUNTER_TYPE_HIDDEN;
            }
            else
            {
                species = gWildMonHeaders[headerId].landMonsInfo->wildPokemon[ChooseWildMonIndex_Land()].species;
                environment = ENCOUNTER_TYPE_LAND;
            }
            break;
        case 1: // water
            if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
            {
                if (Random() % 100 < HIDDEN_MON_PROBABILTY)
                {
                    index = ChooseHiddenMonIndex();
                    if (index == 0xFF)
                        return FALSE;//no hidden info
                    species = hiddenMonsInfo->wildPokemon[index].species;
                    isHiddenMon = TRUE;
                    environment = ENCOUNTER_TYPE_HIDDEN;
                }
                else
                {
                    species = gWildMonHeaders[headerId].waterMonsInfo->wildPokemon[ChooseWildMonIndex_WaterRock()].species;
                    environment = ENCOUNTER_TYPE_WATER;

                }
            }
            else
            {
                // not surfing -> cant find hidden water mons
                return FALSE;
            }
            break;
        default:
            return FALSE;
        }

        if (species == SPECIES_NONE)
            return FALSE;

        sDexNavSearchDataPtr = AllocZeroed(sizeof(struct DexNavSearch));

        // init search data
        sDexNavSearchDataPtr->isHiddenMon = isHiddenMon;
        sDexNavSearchDataPtr->species = species;
        sDexNavSearchDataPtr->hiddenSearch = TRUE;
        sDexNavSearchDataPtr->environment = environment;    // updated in DexNavTryGenerateMonLevel if hidden mon
        sDexNavSearchDataPtr->monLevel = DexNavTryGenerateMonLevel(species, environment);
        if (sDexNavSearchDataPtr->monLevel == MON_LEVEL_NONEXISTENT)
        {
            Free(sDexNavSearchDataPtr);
            return FALSE;
        }

        // find tile for hidden mon and start effect if possible
        if (!TryStartHiddenMonFieldEffect(sDexNavSearchDataPtr->environment, 8, 8, TRUE))
            return FALSE;

        // exclamation mark over player
        gFieldEffectArguments[0] = gSaveBlock1Ptr->pos.x;
        gFieldEffectArguments[1] = gSaveBlock1Ptr->pos.y;
        gFieldEffectArguments[2] = gSprites[gPlayerAvatar.spriteId].subpriority - 1;
        gFieldEffectArguments[3] = 2;
        ObjectEventGetLocalIdAndMap(&gObjectEvents[gPlayerAvatar.objectEventId], &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
        FieldEffectStart(FLDEFF_EXCLAMATION_MARK_ICON);

        PlayCry_Script(species, 0);
        taskId = CreateTask(Task_SetUpDexNavSearch, 0);
        gTasks[taskId].tSpecies = sDexNavSearchDataPtr->species;
        gTasks[taskId].tEnvironment = sDexNavSearchDataPtr->environment;
        gTasks[taskId].tRevealed = FALSE;
        DismissMapNamePopup();
        ChangeBgY_ScreenOff(0, 0, 0);
        return FALSE;   // we dont actually want to enable the script context or the game will freeze
    }

    return FALSE;
}

static void DrawSearchIcon(void)
{
    struct CompressedSpriteSheet spriteSheet;

    spriteSheet.data = sHiddenSearchIconGfx;
    spriteSheet.size = 0x200;
    spriteSheet.tag = SELECTION_CURSOR_TAG;
    LoadCompressedSpriteSheet(&spriteSheet);
    sDexNavSearchDataPtr->iconSpriteId = CreateSprite(&sSearchIconSpriteTemplate, 18, GetSearchWindowY() + 12, 0);
}

// the initial hidden icon window ONLY shows search icon, ??? instead of name, and the search level (and pokeball icon if owned)
// if the player presses R or moves close enough, the full search window will be created
// this way, if the player is not interested in hidden pokemon it will not be too intrusive
static void DrawHiddenSearchWindow(u8 width)
{
    AddSearchWindow(width);
    AddTextPrinterParameterized3(sDexNavSearchDataPtr->windowId, 0, SPECIES_ICON_X + 4, 0, sSearchFontColor, TEXT_SKIP_DRAW, sText_ThreeQmarks);

    ConvertIntToDecimalStringN(gStringVar1, sDexNavSearchDataPtr->searchLevel, STR_CONV_MODE_LEFT_ALIGN, 2);
    StringExpandPlaceholders(gStringVar4, sText_SearchLevel);
    AddTextPrinterParameterized3(sDexNavSearchDataPtr->windowId, 0, SPECIES_ICON_X + 4, 12, sSearchFontColor, TEXT_SKIP_DRAW, gStringVar4);
    CopyWindowToVram(sDexNavSearchDataPtr->windowId, 2);
}

static void DexNavDrawHiddenIcons(void)
{
    u16 species = sDexNavSearchDataPtr->species;

    DrawHiddenSearchWindow(12);
    DrawSearchIcon();

    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
        sDexNavSearchDataPtr->ownedIconSpriteId = CreateSprite(&sOwnedIconTemplate, SPECIES_ICON_X + 6, GetSearchWindowY() + 2, 0);

    if (sDexNavSearchDataPtr->isHiddenMon)
        sDexNavSearchDataPtr->exclamationSpriteId = CreateSprite(&sHiddenMonIconTemplate, SPECIES_ICON_X + 34, GetSearchWindowY() + 8, 0);
}

/////////////////////////
//// GENERAL UTILITY ////
/////////////////////////
u32 CalculateDexNavShinyRolls(void)
{
    u32 chainBonus, rndBonus;
    u8 chain = gSaveBlock3Ptr->dexNavChain;

    chainBonus = (chain >= 100) ? 10 : (chain >= 50) ? 5 : 0;
    rndBonus = (Random() % 100 < 4) ? 4 : 0;
    return chainBonus + rndBonus;
}

void TryIncrementSpeciesSearchLevel()
{
#if USE_DEXNAV_SEARCH_LEVELS == TRUE
    if (gMapHeader.regionMapSectionId != MAPSEC_BATTLE_FRONTIER && gSaveBlock3Ptr->dexNavSearchLevels[gDexNavSpecies] < 255)
        gSaveBlock3Ptr->dexNavSearchLevels[gDexNavSpecies]++;
#endif
}

void ResetDexNavSearch(void)
{
    gSaveBlock3Ptr->dexNavChain = 0;    //reset dex nav chaining on new map
    VarSet(DN_VAR_STEP_COUNTER, 0); //reset hidden pokemon step counter
    if (FlagGet(DN_FLAG_SEARCHING))
        EndDexNavSearch(FindTaskIdByFunc(Task_DexNavSearch));   //moving to new map ends dexnav search
}

void IncrementDexNavChain(void)
{
    if (gSaveBlock3Ptr->dexNavChain < DEXNAV_CHAIN_MAX)
        gSaveBlock3Ptr->dexNavChain++;
}
