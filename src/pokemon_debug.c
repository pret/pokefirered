//Credits: Gamer2020, AsparagusEduardo, TheXaman, ShinyDragonHunter
#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_bg.h"
#include "battle_gfx_sfx_util.h"
#include "bg.h"
#include "constants/rgb.h"
#include "constants/songs.h"
#include "data.h"
#include "event_data.h"
#include "decompress.h"
#include "field_weather.h"
#include "gpu_regs.h"
#include "graphics.h"
#include "item.h"
#include "item_menu_icons.h"
#include "list_menu.h"
#include "m4a.h"
#include "main.h"
#include "malloc.h"
#include "menu.h"
#include "overworld.h"
#include "palette.h"
#include "palette_util.h"
#include "pokedex.h"
#include "pokemon.h"
#include "pokemon_debug.h"
#include "pokemon_icon.h"
#include "scanline_effect.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "trainer_pokemon_sprites.h"
#include "constants/items.h"
#include "constants/pokemon_debug.h"

#if DEBUG_POKEMON_MENU == TRUE
extern const struct BattleBackground sBattleTerrainTable[];
extern const struct CompressedSpriteSheet gSpriteSheet_EnemyShadow;
extern const struct SpriteTemplate gSpriteTemplate_EnemyShadow;
extern const struct SpritePalette sSpritePalettes_HealthBoxHealthBar[2];
extern const struct UCoords8 sBattlerCoords[][MAX_BATTLERS_COUNT] ;
static const u16 sBgColor[] = {RGB_WHITE};

static struct PokemonDebugMenu *GetStructPtr(u8 taskId)
{
    u8 *taskDataPtr = (u8 *)(&gTasks[taskId].data[0]);

    return (struct PokemonDebugMenu*)(T1_READ_PTR(taskDataPtr));
}

//Sprites
#define PALTAG_ARROW 0x1000

static const struct OamData sOamData_Arrow =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const u8 sArrowDown_Gfx[] = INCBIN_U8("graphics/pokemon_debug/arrow_down.4bpp");
static const u8 sArrowRight_Gfx[] = INCBIN_U8("graphics/pokemon_debug/arrow_right.4bpp");
static const u16 sArrow_Pal[] = INCBIN_U16("graphics/pokemon_debug/arrow.gbapal");

static const struct SpriteFrameImage sPicTable_Arrow[] =
{
    obj_frame_tiles(sArrowDown_Gfx),
    obj_frame_tiles(sArrowRight_Gfx)
};

static const struct SpritePalette sSpritePalette_Arrow =
{
    sArrow_Pal, PALTAG_ARROW
};

static const union AnimCmd sAnim_Arrow_Down[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_Arrow_Up[] =
{
    ANIMCMD_FRAME(0, 30, .vFlip = TRUE),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_Arrow_Right[] =
{
    ANIMCMD_FRAME(1, 30),
    ANIMCMD_JUMP(0),
};

enum {
    ARROW_DOWN,
    ARROW_UP,
    ARROW_RIGHT,
};

static const union AnimCmd *const sAnims_Arrow[] =
{
    [ARROW_DOWN]  = sAnim_Arrow_Down,
    [ARROW_UP]    = sAnim_Arrow_Up,
    [ARROW_RIGHT] = sAnim_Arrow_Right,
};

const struct SpriteTemplate sSpriteTemplate_Arrow =
{
    .tileTag = TAG_NONE,
    .paletteTag = PALTAG_ARROW,
    .oam = &sOamData_Arrow,
    .anims = sAnims_Arrow,
    .images = sPicTable_Arrow,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

//BgTemplates
static const struct BgTemplate sBgTemplates[] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 24,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 28,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
   {
        .bg = 3,
        .charBaseIndex = 2,
        .mapBaseIndex = 26,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0
    },
};

//WindowTemplates
static const struct WindowTemplate sPokemonDebugWindowTemplate[] =
{
    [WIN_NAME_NUMBERS] = {
        .bg = 0,
        .tilemapLeft = 15,
        .tilemapTop = 12,
        .width = 15,
        .height = 2,
        .paletteNum = 0xF,
        .baseBlock = 1
    },
    [WIN_INSTRUCTIONS] = {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 15,
        .height = 4,
        .paletteNum = 0xF,
        .baseBlock = 1 + 30
    },
    [WIN_BOTTOM_LEFT] = {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 14,
        .width = 6,
        .height = 6,
        .paletteNum = 0xF,
        .baseBlock = 1 + 30 + 60
    },
    [WIN_BOTTOM_RIGHT] = {
        .bg = 0,
        .tilemapLeft = 7,
        .tilemapTop = 14,
        .width = 24,
        .height = 6,
        .paletteNum = 0xF,
        .baseBlock = 1 + 30 + 60 + 36
    },
    [WIN_FOOTPRINT] =
    {
        .bg = 0,
        .tilemapLeft = 27,
        .tilemapTop = 14,
        .width = 2,
        .height = 2,
        .paletteNum = 0xF,
        .baseBlock = 1 + 30 + 60 + 36 + 144,
    },
    DUMMY_WIN_TEMPLATE,
};

//Lookup tables
const u8 gBattleBackgroundNames[][30] =
{
    [MAP_BATTLE_SCENE_NORMAL]   = _("NORMAL                  "),
    [MAP_BATTLE_SCENE_LINK]     = _("LINK                    "),
    [MAP_BATTLE_SCENE_GYM]      = _("GYM                     "),
    [MAP_BATTLE_SCENE_LEADER]   = _("LEADER                  "),
    [MAP_BATTLE_SCENE_INDOOR_1] = _("INDOOR1                 "),
    [MAP_BATTLE_SCENE_INDOOR_2] = _("INDOOR2                 "),
    [MAP_BATTLE_SCENE_LORELEI]  = _("LORELEI                 "),
    [MAP_BATTLE_SCENE_BRUNO]    = _("BRUNO                   "),
    [MAP_BATTLE_SCENE_AGATHA]   = _("AGATHA                  "),
    [MAP_BATTLE_SCENE_LANCE]    = _("LANCE                   "),
    [MAP_BATTLE_SCENE_CHAMPION] = _("CHAMPION                "),
};
const u8 gBattleBackgroundTerrainNames[][26] =
{
    [BATTLE_TERRAIN_GRASS]      = _("NORMAL - GRASS           "),
    [BATTLE_TERRAIN_LONG_GRASS] = _("NORMAL - LONG GRASS      "),
    [BATTLE_TERRAIN_SAND]       = _("NORMAL - SAND            "),
    [BATTLE_TERRAIN_UNDERWATER] = _("NORMAL - UNDERWATER      "),
    [BATTLE_TERRAIN_WATER]      = _("NORMAL - WATER           "),
    [BATTLE_TERRAIN_POND]       = _("NORMAL - POND            "),
    [BATTLE_TERRAIN_MOUNTAIN]   = _("NORMAL - MOUNTAIN        "),
    [BATTLE_TERRAIN_CAVE]       = _("NORMAL - CAVE            "),
    [BATTLE_TERRAIN_BUILDING]   = _("NORMAL - BUILDING        "),
    [BATTLE_TERRAIN_PLAIN]      = _("NORMAL - PLAIN           "),
};
//Function declarations
static void PrintDigitChars(struct PokemonDebugMenu *data);
static void SetUpModifyArrows(struct PokemonDebugMenu *data);
static void UpdateBattlerValue(struct PokemonDebugMenu *data);
static void ValueToCharDigits(u8 *charDigits, u32 newValue, u8 maxDigits);
static bool32 TryMoveDigit(struct PokemonDebugModifyArrows *modArrows, bool32 moveUp);
static void CB2_Debug_Runner(void);
static void ResetBGs_Debug_Menu(u16);
static void Handle_Input_Debug_Pokemon(u8);
static void ReloadPokemonSprites(struct PokemonDebugMenu *data);
static void Exit_Debug_Pokemon(u8);

//Text handling functions
static void UNUSED PadString(const u8 *src, u8 *dst)
{
    u32 i;

    for (i = 0; i < 17 && src[i] != EOS; i++)
        dst[i] = src[i];

    for (; i < 17; i++)
        dst[i] = CHAR_SPACE;

    dst[i] = EOS;
}

static void PrintInstructionsOnWindow(struct PokemonDebugMenu *data)
{
    u8 fontId = 0;
    u8 x = 2;
    u8 textInstructions[] = _("{START_BUTTON} Shiny\n{B_BUTTON} Exit  {A_BUTTON} Submenu 1$");
    //u8 textInstructionsGender[] = _("{START_BUTTON} Shiny {SELECT_BUTTON} Gender\n{B_BUTTON} Exit  {A_BUTTON} Submenu 1$");
    u8 textInstructionsSubmenuOne[] = _("{START_BUTTON} Shiny\n{B_BUTTON} Back  {A_BUTTON} Submenu 2$");
    //u8 textInstructionsSubmenuOneGender[] = _("{START_BUTTON} Shiny {SELECT_BUTTON} Gender\n{B_BUTTON} Back  {A_BUTTON} Submenu 2$");
    u8 textInstructionsSubmenuTwo[] = _("{START_BUTTON} Shiny\n{B_BUTTON} Back$");
    //u8 textInstructionsSubmenuTwoGender[] = _("{START_BUTTON} Shiny {SELECT_BUTTON} Gender\n{B_BUTTON} Back$");


    u8 textBottom[] = _("BG:$");
    //u8 textBottomForms[] = _("BACK:\nFRONT:\nBG:\nFORMS:$");
    u8 textBottomSubmenuTwo[] = _("B coords:\nF coords:\nF elev:");
    u16 species = data->modifyArrows.currValue;

    u8 textL[] = _("{L_BUTTON}");
    u8 textR[] = _("{R_BUTTON}");

    //Instruction window
    FillWindowPixelBuffer(WIN_INSTRUCTIONS, 0x11);
    if (data->currentSubmenu == 0)
    {
        AddTextPrinterParameterized(WIN_INSTRUCTIONS, fontId, textInstructions, x, 0, 0, NULL);
    }
    else if (data->currentSubmenu == 1)
    {
        AddTextPrinterParameterized(WIN_INSTRUCTIONS, fontId, textInstructionsSubmenuOne, x, 0, 0, NULL);
    }
    else if (data->currentSubmenu == 2)
    {
        AddTextPrinterParameterized(WIN_INSTRUCTIONS, fontId, textInstructionsSubmenuTwo, x, 0, 0, NULL);
    }
    CopyWindowToVram(WIN_INSTRUCTIONS, COPYWIN_FULL);

    //Bottom left text
    FillWindowPixelBuffer(WIN_BOTTOM_LEFT, PIXEL_FILL(0));
    if (data->currentSubmenu != 2)
    {
        //AddTextPrinterParameterized(WIN_BOTTOM_LEFT, fontId, textL, 30, 0, 0, NULL);
        //AddTextPrinterParameterized(WIN_BOTTOM_LEFT, fontId, textR, 30, 12, 0, NULL);
        AddTextPrinterParameterized(WIN_BOTTOM_LEFT, fontId, textBottom, 0, 0, 0, NULL);
    }
    else
        AddTextPrinterParameterized(WIN_BOTTOM_LEFT, fontId, textBottomSubmenuTwo, 0, 0, 0, NULL);
}

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void SetStructPtr(u8 taskId, void *ptr)
{
    u32 structPtr = (u32)(ptr);
    u8 *taskDataPtr = (u8 *)(&gTasks[taskId].data[0]);

    taskDataPtr[0] = structPtr >> 0;
    taskDataPtr[1] = structPtr >> 8;
    taskDataPtr[2] = structPtr >> 16;
    taskDataPtr[3] = structPtr >> 24;
}

//Digit and arrow functions
#define VAL_U16     0
static void PrintDigitChars(struct PokemonDebugMenu *data)
{
    s32 i;
    u16 species = data->modifyArrows.currValue;
    u8 text[MODIFY_DIGITS_MAX + POKEMON_NAME_LENGTH + 8];

    for (i = 0; i < data->modifyArrows.maxDigits; i++)
        text[i] = data->modifyArrows.charDigits[i];

    text[i++] = CHAR_SPACE;
    text[i++] = CHAR_HYPHEN;
    text[i++] = CHAR_SPACE;
    GetSpeciesName(&text[i], species);

    FillWindowPixelBuffer(WIN_NAME_NUMBERS, 0x11);
    AddTextPrinterParameterized(WIN_NAME_NUMBERS, FONT_NORMAL, text, 6, 0, 0, NULL);
}

static u32 CharDigitsToValue(u8 *charDigits, u8 maxDigits)
{
    s32 i;
    u8 id = 0;
    u32 newValue = 0;
    u8 valueDigits[MODIFY_DIGITS_MAX];

    for (i = 0; i < MODIFY_DIGITS_MAX; i++)
        valueDigits[i] = charDigits[i] - CHAR_0;

    if (maxDigits >= MODIFY_DIGITS_MAX)
        newValue += valueDigits[id++] * 1000;
    if (maxDigits >= MODIFY_DIGITS_MAX - 1)
        newValue += valueDigits[id++] * 100;
    if (maxDigits >= MODIFY_DIGITS_MAX - 2)
        newValue += valueDigits[id++] * 10;
    if (maxDigits >= MODIFY_DIGITS_MAX - 3)
        newValue += valueDigits[id++];

    return newValue;
}

static void ValueToCharDigits(u8 *charDigits, u32 newValue, u8 maxDigits)
{
    s32 i;
    u8 valueDigits[MODIFY_DIGITS_MAX];
    u8 id = 0;

    if (maxDigits >= MODIFY_DIGITS_MAX)
        valueDigits[id++] = newValue / 1000;
    if (maxDigits >= MODIFY_DIGITS_MAX - 1)
        valueDigits[id++] = (newValue % 1000) / 100;
    if (maxDigits >= MODIFY_DIGITS_MAX - 2)
        valueDigits[id++] = (newValue % 100) / 10;
    if (maxDigits >= MODIFY_DIGITS_MAX - 3)
        valueDigits[id++] = newValue % 10;

    for (i = 0; i < MODIFY_DIGITS_MAX; i++)
        charDigits[i] = valueDigits[i] + CHAR_0;
}

static void SetArrowInvisibility(struct PokemonDebugMenu *data)
{
    switch (data->currentSubmenu)
    {
    case 0:
        gSprites[data->modifyArrows.arrowSpriteId[0]].invisible = FALSE;
        gSprites[data->modifyArrows.arrowSpriteId[1]].invisible = FALSE;
        gSprites[data->optionArrows.arrowSpriteId[0]].invisible = TRUE;
        gSprites[data->yPosModifyArrows.arrowSpriteId[0]].invisible = TRUE;
        break;
    case 1:
        gSprites[data->modifyArrows.arrowSpriteId[0]].invisible = TRUE;
        gSprites[data->modifyArrows.arrowSpriteId[1]].invisible = TRUE;
        gSprites[data->optionArrows.arrowSpriteId[0]].invisible = FALSE;
        gSprites[data->yPosModifyArrows.arrowSpriteId[0]].invisible = TRUE;
        break;
    case 2:
        gSprites[data->modifyArrows.arrowSpriteId[0]].invisible = TRUE;
        gSprites[data->modifyArrows.arrowSpriteId[1]].invisible = TRUE;
        gSprites[data->optionArrows.arrowSpriteId[0]].invisible = TRUE;
        gSprites[data->yPosModifyArrows.arrowSpriteId[0]].invisible = FALSE;
        break;
    }
}

static void SetUpModifyArrows(struct PokemonDebugMenu *data)
{
    LoadSpritePalette(&sSpritePalette_Arrow);
    data->modifyArrows.arrowSpriteId[0] = CreateSprite(&sSpriteTemplate_Arrow, MODIFY_DIGITS_ARROW_X, MODIFY_DIGITS_ARROW1_Y, 0);
    data->modifyArrows.arrowSpriteId[1] = CreateSprite(&sSpriteTemplate_Arrow, MODIFY_DIGITS_ARROW_X, MODIFY_DIGITS_ARROW2_Y, 0);
    gSprites[data->modifyArrows.arrowSpriteId[1]].animNum = 1;

    data->modifyArrows.minValue = 1;
    data->modifyArrows.maxValue = NUM_SPECIES - 1;
    data->modifyArrows.maxDigits = 4;
    data->modifyArrows.modifiedValPtr = &data->currentmonId;
    data->modifyArrows.typeOfVal = VAL_U16;
    data->modifyArrows.currValue = data->currentmonId;

    data->modifyArrows.currentDigit = 0;
    ValueToCharDigits(data->modifyArrows.charDigits, data->modifyArrows.currValue, data->modifyArrows.maxDigits);
}

static void SetUpOptionArrows(struct PokemonDebugMenu *data)
{
    LoadSpritePalette(&sSpritePalette_Arrow);
    data->optionArrows.arrowSpriteId[0] = CreateSprite(&sSpriteTemplate_Arrow, OPTIONS_ARROW_1_X, OPTIONS_ARROW_Y, 0);
    gSprites[data->optionArrows.arrowSpriteId[0]].animNum = 2;

    data->optionArrows.currentDigit = 0;

    gSprites[data->optionArrows.arrowSpriteId[0]].invisible = TRUE;
}

static void SetUpYPosModifyArrows(struct PokemonDebugMenu *data)
{
    LoadSpritePalette(&sSpritePalette_Arrow);
    data->yPosModifyArrows.arrowSpriteId[0] = CreateSprite(&sSpriteTemplate_Arrow, OPTIONS_ARROW_1_X, OPTIONS_ARROW_Y, 0);
    gSprites[data->yPosModifyArrows.arrowSpriteId[0]].animNum = 2;

    data->yPosModifyArrows.currentDigit = 0;

    gSprites[data->yPosModifyArrows.arrowSpriteId[0]].invisible = TRUE;
}

static bool32 TryMoveDigit(struct PokemonDebugModifyArrows *modArrows, bool32 moveUp)
{
    s32 i;
    u8 charDigits[MODIFY_DIGITS_MAX];
    u32 newValue;

    for (i = 0; i < MODIFY_DIGITS_MAX; i++)
        charDigits[i] = modArrows->charDigits[i];

    if (moveUp)
    {
        if (charDigits[modArrows->currentDigit] == CHAR_9)
        {
            charDigits[modArrows->currentDigit] = CHAR_0;
            for (i = modArrows->currentDigit - 1; i >= 0; i--)
            {
                if (charDigits[i] == CHAR_9)
                    charDigits[i] = CHAR_0;
                else
                {
                    charDigits[i]++;
                    break;
                }
            }
        }
        else
            charDigits[modArrows->currentDigit]++;
    }
    else
    {
        if (charDigits[modArrows->currentDigit] == CHAR_0)
        {
            charDigits[modArrows->currentDigit] = CHAR_9;

            for (i = modArrows->currentDigit - 1; i >= 0; i--)
            {
                if (charDigits[i] == CHAR_0)
                    charDigits[i] = CHAR_9;
                else
                {
                    charDigits[i]--;
                    break;
                }
            }
        }

        else
            charDigits[modArrows->currentDigit]--;
    }

    newValue = CharDigitsToValue(charDigits, modArrows->maxDigits);
    if (newValue > modArrows->maxValue || newValue < modArrows->minValue)
    {
        return FALSE;
    }
    else
    {
        modArrows->currValue = newValue;
        for (i = 0; i < MODIFY_DIGITS_MAX; i++)
             modArrows->charDigits[i] = charDigits[i];
        return TRUE;
    }
}

static void UpdateBattlerValue(struct PokemonDebugMenu *data)
{
    switch (data->modifyArrows.typeOfVal)
    {
    case VAL_U16:
        *(u16*)(data->modifyArrows.modifiedValPtr) = data->modifyArrows.currValue;
        break;
    }
}

//Sprite functions
static const u32 *GetMonSpritePalStructCustom(u16 species, bool8 isShiny)
{
    if (isShiny)
    {
        if (gMonShinyPaletteTable[species].data != NULL)
            return gMonShinyPaletteTable[species].data;
        else
            return gMonShinyPaletteTable[SPECIES_NONE].data;
    }
    else
    {
        if (gMonPaletteTable[species].data != NULL)
            return gMonPaletteTable[species].data;
        else
            return gMonPaletteTable[SPECIES_NONE].data;
    }
}

static void BattleLoadOpponentMonSpriteGfxCustom(u16 species, bool8 isShiny, u8 battlerId)
{
    const void *lzPaletteData;
    u16 paletteOffset = 0x100 + battlerId * 16;;

    if (isShiny)
    {
        if (gMonShinyPaletteTable[species].data != NULL)
            lzPaletteData = gMonShinyPaletteTable[species].data;
        else
            lzPaletteData = gMonShinyPaletteTable[SPECIES_NONE].data;
    }
    else
    {
        if (gMonPaletteTable[species].data != NULL)
            lzPaletteData = gMonPaletteTable[species].data;
        else
            lzPaletteData = gMonPaletteTable[SPECIES_NONE].data;
    }

    LZDecompressWram(lzPaletteData, gDecompressionBuffer);
    LoadPalette(gDecompressionBuffer, paletteOffset, 0x20);
    LoadPalette(gDecompressionBuffer, 0x80 + battlerId * 16, 0x20);
}

static void SetConstSpriteValues(struct PokemonDebugMenu *data)
{
    u16 species = data->currentmonId;
    data->constSpriteValues.frontPicCoords = gMonFrontPicCoords[species].y_offset;
    data->constSpriteValues.frontElevation = gEnemyMonElevation[species];
    data->constSpriteValues.backPicCoords = gMonBackPicCoords[species].y_offset;
}

static void ResetOffsetSpriteValues(struct PokemonDebugMenu *data)
{
    data->offsetsSpriteValues.offset_back_picCoords = 0;
    data->offsetsSpriteValues.offset_front_picCoords = 0;
    data->offsetsSpriteValues.offset_front_elevation = 0;
}

static u8 GetBattlerSpriteFinal_YCustom(u16 species, s8 offset_picCoords, s8 offset_elevation)
{
    u16 offset;
    u8 y;
    species = species > NUM_SPECIES - 1 ? SPECIES_BULBASAUR : species;

    //FrontPicCoords
    offset = gMonFrontPicCoords[species].y_offset + offset_picCoords;

    //Elevation
    offset -= gEnemyMonElevation[species] + offset_elevation;

    //Main position
    y = offset + sBattlerCoords[0][1].y;

    if (y > DISPLAY_HEIGHT - MON_PIC_HEIGHT + 8)
        y = DISPLAY_HEIGHT - MON_PIC_HEIGHT + 8;

    return y;
}

static void UpdateShadowSpriteInvisible(struct PokemonDebugMenu *data)
{
    if (data->constSpriteValues.frontElevation + data->offsetsSpriteValues.offset_front_elevation == 0)
        gSprites[data->frontShadowSpriteId].invisible = TRUE;
    else
        gSprites[data->frontShadowSpriteId].invisible = FALSE;
}

static void SpriteCB_EnemyShadowCustom(struct Sprite *shadowSprite)
{
    u8 frontSpriteId = shadowSprite->data[0];
    struct Sprite *battlerSprite = &gSprites[frontSpriteId];

    shadowSprite->x = battlerSprite->x;
    shadowSprite->x2 = battlerSprite->x2;
}

static void LoadAndCreateEnemyShadowSpriteCustom(struct PokemonDebugMenu *data, u16 species)
{
    u8 x, y;
    bool8 invisible = FALSE;
    species = species > NUM_SPECIES - 1 ? SPECIES_BULBASAUR : species;
    if (gEnemyMonElevation[species] == 0)
        invisible = TRUE;
    LoadCompressedSpriteSheet(&gSpriteSheet_EnemyShadow);
    LoadSpritePalette(&sSpritePalettes_HealthBoxHealthBar[0]);

    x = sBattlerCoords[0][1].x;
    y = sBattlerCoords[0][1].y;

    data->frontShadowSpriteId = CreateSprite(&gSpriteTemplate_EnemyShadow, x, y + 29, 0xC8);
    gSprites[data->frontShadowSpriteId].data[0] = data->frontspriteId;

    gSprites[data->frontShadowSpriteId].callback = SpriteCB_EnemyShadowCustom;
    gSprites[data->frontShadowSpriteId].oam.priority = 0;
    gSprites[data->frontShadowSpriteId].invisible = invisible;
}

//Tile functions (footprints)
static void DrawFootprintCustom(u8 windowId, u16 species)
{
    u8 footprint[32 * 4] = {0};
    const u8 *footprintGfx = gMonFootprintTable[species];
    u32 i, j, tileIdx = 0;

    if (footprintGfx != NULL)
    {
        for (i = 0; i < 32; i++)
        {
            u8 tile = footprintGfx[i];
            for (j = 0; j < 4; j++)
            {
                u8 value = ((tile >> (2 * j)) & 1 ? 2 : 0);
                if (tile & (2 << (2 * j)))
                    value |= 0x20;
                footprint[tileIdx] = value;
                tileIdx++;
            }
        }
    }
    CopyToWindowPixelBuffer(windowId, footprint, sizeof(footprint), 0);
}

//Battle background functions
static void LoadBattleBg(u8 battleBgType, u8 battleTerrain)
{
    switch (battleBgType)
    {
        default:
        case MAP_BATTLE_SCENE_NORMAL:
            LZDecompressVram(sBattleTerrainTable[battleTerrain].tileset, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(sBattleTerrainTable[battleTerrain].tilemap, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(sBattleTerrainTable[battleTerrain].palette, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_LINK:
            LZDecompressVram(gBattleTerrainTiles_Building, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Building, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Link, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_GYM:
            LZDecompressVram(gBattleTerrainTiles_Building, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Building, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Gym, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_LEADER:
            LZDecompressVram(gBattleTerrainTiles_Building, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Building, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Leader, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_INDOOR_2:
            LZDecompressVram(gBattleTerrainTiles_Indoor, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Indoor, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Indoor2, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_INDOOR_1:
            LZDecompressVram(gBattleTerrainTiles_Indoor, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Indoor, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Indoor1, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_LORELEI:
            LZDecompressVram(gBattleTerrainTiles_Indoor, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Indoor, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Lorelei, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_BRUNO:
            LZDecompressVram(gBattleTerrainTiles_Indoor, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Indoor, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Bruno, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_AGATHA:
            LZDecompressVram(gBattleTerrainTiles_Indoor, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Indoor, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Agatha, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_LANCE:
            LZDecompressVram(gBattleTerrainTiles_Indoor, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Indoor, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Lance, 0x20, 0x60);
            break;
        case MAP_BATTLE_SCENE_CHAMPION:
            LZDecompressVram(gBattleTerrainTiles_Indoor, (void*)(BG_CHAR_ADDR(2)));
            LZDecompressVram(gBattleTerrainTilemap_Indoor, (void*)(BG_SCREEN_ADDR(26)));
            LoadCompressedPalette(gBattleTerrainPalette_Champion, 0x20, 0x60);
            break;
    }
}
static void PrintBattleBgName(u8 taskId)
{
    struct PokemonDebugMenu *data = GetStructPtr(taskId);
    u8 fontId = 0;
    u8 text[30+1];

    if (data->battleBgType == 0)
        StringCopy(text, gBattleBackgroundTerrainNames[data->battleTerrain]);
    else
        StringCopy(text, gBattleBackgroundNames[data->battleBgType]);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, text, 0, 0, 0, NULL);
}
static void UpdateBattleBg(u8 taskId, bool8 increment)
{
    struct PokemonDebugMenu *data = GetStructPtr(taskId);

    if (data->battleBgType == MAP_BATTLE_SCENE_NORMAL)
    {
        if (increment)
        {
            if (data->battleTerrain == BATTLE_TERRAIN_PLAIN)
                data->battleBgType += 1;
            else
                data->battleTerrain += 1;
        }
        else
        {
            if (data->battleTerrain == BATTLE_TERRAIN_GRASS)
            {
                data->battleBgType = MAP_BATTLE_SCENE_CHAMPION;
            }
            else
                data->battleTerrain -= 1;
        }
    }
    else if (data->battleBgType == MAP_BATTLE_SCENE_LINK)
    {
        if (increment)
        {
            data->battleBgType += 1;
        }
        else
        {
            data->battleBgType = MAP_BATTLE_SCENE_NORMAL;
            data->battleTerrain = BATTLE_TERRAIN_PLAIN;
        }
    }
    else if (data->battleBgType == MAP_BATTLE_SCENE_CHAMPION)
    {
        if (increment)
        {
            data->battleBgType = MAP_BATTLE_SCENE_NORMAL;
            data->battleTerrain = BATTLE_TERRAIN_GRASS;
        }
        else
            data->battleBgType -= 1;
    }
    else
    {
        if (increment)
            data->battleBgType += 1;
        else
            data->battleBgType -= 1;
    }

    PrintBattleBgName(taskId);

    LoadBattleBg(data->battleBgType, data->battleTerrain);
}

// *******************************
// Main functions
static void UpdateYPosOffsetText(struct PokemonDebugMenu *data)
{
    u8 text[34];
    u8 fontId = 0;
    u8 textConst[] = _("const val:");
    u8 textNew[] = _("new val:");
    u8 x_const_val = 50;
    u8 x_new_text = 70;
    u8 x_new_val = 110;
    u8 y = 0;

    u8 backPicCoords    = data->constSpriteValues.backPicCoords;
    u8 frontPicCoords   = data->constSpriteValues.frontPicCoords;
    u8 frontElevation   = data->constSpriteValues.frontElevation;

    s8 offset_back_picCoords    = data->offsetsSpriteValues.offset_back_picCoords;
    s8 offset_front_picCoords   = data->offsetsSpriteValues.offset_front_picCoords;
    s8 offset_front_elevation   = data->offsetsSpriteValues.offset_front_elevation;

    u8 newBackPicCoords    = backPicCoords   +  offset_back_picCoords;
    u8 newFrontPicCoords   = frontPicCoords  +  offset_front_picCoords;
    u8 newFrontElevation   = frontElevation  +  offset_front_elevation;

    FillWindowPixelBuffer(WIN_BOTTOM_RIGHT, PIXEL_FILL(0));

    //Back
    y = 0;
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, textConst, 0, y, 0, NULL);
    ConvertIntToDecimalStringN(text, backPicCoords , STR_CONV_MODE_LEFT_ALIGN, 2);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, text, x_const_val, y, 0, NULL);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, textNew, x_new_text, y, 0, NULL);
    ConvertIntToDecimalStringN(text, newBackPicCoords , STR_CONV_MODE_LEFT_ALIGN, 2);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, text, x_new_val, y, 0, NULL);
    //Front picCoords
    y = 12;
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, textConst, 0, y, 0, NULL);
    ConvertIntToDecimalStringN(text, frontPicCoords , STR_CONV_MODE_LEFT_ALIGN, 2);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, text, x_const_val, y, 0, NULL);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, textNew, x_new_text, y, 0, NULL);
    ConvertIntToDecimalStringN(text, newFrontPicCoords , STR_CONV_MODE_LEFT_ALIGN, 2);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, text, x_new_val, y, 0, NULL);
    //Front elevation
    y = 24;
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, textConst, 0, y, 0, NULL);
    ConvertIntToDecimalStringN(text, frontElevation , STR_CONV_MODE_LEFT_ALIGN, 2);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, text, x_const_val, y, 0, NULL);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, textNew, x_new_text, y, 0, NULL);
    ConvertIntToDecimalStringN(text, newFrontElevation , STR_CONV_MODE_LEFT_ALIGN, 2);
    AddTextPrinterParameterized(WIN_BOTTOM_RIGHT, fontId, text, x_new_val, y, 0, NULL);
}

static void ResetPokemonDebugWindows(void)
{
    u8 i;

    FreeAllWindowBuffers();
    InitWindows(sPokemonDebugWindowTemplate);

    for (i = 0; i < WIN_END + 1; i++)
    {
        FillWindowPixelBuffer(i, PIXEL_FILL(0));
        PutWindowTilemap(i);
        CopyWindowToVram(i, COPYWIN_FULL);
    }
}

#define MALE_PERSONALITY 0xFE
#define FEMALE_PERSONALITY 0X0

void CB2_Debug_Pokemon(void)
{
    u8 taskId;
    const void *src;
    void *dst;
    const u32 *palette;
    struct PokemonDebugMenu *data;
    u16 species;
    s16 offset_y;
    u8 front_x = sBattlerCoords[0][1].x;
    u8 front_y;

    DebugPrintf("switch case: %d", gMain.state);

    switch (gMain.state)
    {
        case 0:
        default:
            SetVBlankCallback(NULL);
            FreeMonSpritesGfx();
            ResetBGs_Debug_Menu(0);
            DmaFillLarge16(3, 0, (u8 *)VRAM, VRAM_SIZE, 0x1000)
            DmaClear32(3, OAM, OAM_SIZE);
            DmaClear16(3, PLTT, PLTT_SIZE);
            gMain.state = 1;
            break;
        case 1:
            ScanlineEffect_Stop();
            ResetTasks();
            ResetSpriteData();
            ResetPaletteFade();
            FreeAllSpritePalettes();
            gReservedSpritePaletteCount = 8;
            ResetAllPicSprites();
            BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
            LoadPalette(GetTextWindowPalette(0), 15*16, 0x40);

            FillBgTilemapBufferRect(0, 0, 0, 0, 32, 20, 15);
            InitBgsFromTemplates(0, sBgTemplates, ARRAY_COUNT(sBgTemplates));
            LoadBattleBg(0, BATTLE_TERRAIN_GRASS);

            gMain.state++;
            break;
        case 2:
            ResetPokemonDebugWindows();
            gMain.state++;
            break;
        case 3:
            AllocateMonSpritesGfx();

            LoadPalette(sBgColor, 0, 2);
            LoadMonIconPalette(SPECIES_BULBASAUR);

            SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
            ShowBg(0);
            ShowBg(1);
            ShowBg(2);
            ShowBg(3);

            //input task handler
            taskId = CreateTask(Handle_Input_Debug_Pokemon, 0);

            data = AllocZeroed(sizeof(struct PokemonDebugMenu));
            SetStructPtr(taskId, data);

            data->currentmonId = SPECIES_BULBASAUR;
            species = data->currentmonId;

            //Print instructions
            PrintInstructionsOnWindow(data);

            //Palettes
            palette = GetMonSpritePalStructCustom(species, data->isShiny);
            LoadCompressedSpritePaletteWithTag(palette, species);
            //Front
            HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonSpritesGfxPtr->sprites[1], species, MALE_PERSONALITY);
            //additional sprite handling wiz1989
            DebugPrintf("species = %S\n", gSpeciesNames[species]);
            src = gMonSpritesGfxPtr->sprites[1];
            dst = (void *)(VRAM + 0x10000 + gSprites[gBattlerSpriteIds[1]].oam.tileNum * 32);
            DmaCopy32(3, src, dst, 0x800);
            gSprites[gBattlerSpriteIds[1]].y = GetBattlerSpriteDefault_Y(1);
            //StartSpriteAnim(&gSprites[gBattlerSpriteIds[1]], gBattleMonForms[1]);

            data->isShiny = FALSE;
            data->isFemale = FALSE;
            BattleLoadOpponentMonSpriteGfxCustom(species, data->isShiny, 1);
            SetMultiuseSpriteTemplateToPokemon(species, 1);
            gMultiuseSpriteTemplate.paletteTag = species;
            front_y = GetBattlerSpriteFinal_YCustom(species, 0, 0);
            data->frontspriteId = CreateSprite(&gMultiuseSpriteTemplate, front_x, front_y, 0);
            gSprites[data->frontspriteId].oam.paletteNum = 1;
            gSprites[data->frontspriteId].callback = SpriteCallbackDummy;
            gSprites[data->frontspriteId].oam.priority = 0;

            //Front Shadow
            LoadAndCreateEnemyShadowSpriteCustom(data, species);

            //Back
            HandleLoadSpecialPokePic(&gMonBackPicTable[species], gMonSpritesGfxPtr->sprites[0], species, (data->isFemale ? FEMALE_PERSONALITY : MALE_PERSONALITY));
            BattleLoadOpponentMonSpriteGfxCustom(species, data->isShiny, 0);
            SetMultiuseSpriteTemplateToPokemon(species, 0);
            offset_y = gMonFrontPicCoords[species].y_offset;
            data->backspriteId = CreateSprite(&gMultiuseSpriteTemplate, DEBUG_MON_BACK_X, DEBUG_MON_BACK_Y + offset_y, 0);
            gSprites[data->backspriteId].oam.paletteNum = 4;
            gSprites[data->backspriteId].callback = SpriteCallbackDummy;
            gSprites[data->backspriteId].oam.priority = 0;

            //Icon Sprite
            data->iconspriteId = CreateMonIcon(species, SpriteCB_MonIcon, DEBUG_ICON_X, DEBUG_ICON_Y, 4, (data->isFemale ? FEMALE_PERSONALITY : MALE_PERSONALITY), FALSE);
            gSprites[data->iconspriteId].oam.priority = 0;

            //Modify Arrows
            SetUpModifyArrows(data);
            PrintDigitChars(data);

            //Option Arrow
            SetUpOptionArrows(data);

            //Modify Y Pos Arrow
            SetUpYPosModifyArrows(data);

            //BattleNg Name
            PrintBattleBgName(taskId);

            //Footprint
            DrawFootprintCustom(WIN_FOOTPRINT, species);
            CopyWindowToVram(WIN_FOOTPRINT, COPYWIN_GFX);

            gMain.state++;
            break;
        case 4:
            EnableInterrupts(1);
            SetVBlankCallback(VBlankCB);
            SetMainCallback2(CB2_Debug_Runner);
            m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0x80);
            break;
    }
}

static void CB2_Debug_Runner(void)
{
    RunTasks();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void ResetBGs_Debug_Menu(u16 a)
{
    if (!(a & DISPCNT_BG0_ON))
    {
        ClearGpuRegBits(0, DISPCNT_BG0_ON);
        SetGpuReg(REG_OFFSET_BG0CNT, 0);
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    }
    if (!(a & DISPCNT_BG1_ON))
    {
        ClearGpuRegBits(0, DISPCNT_BG1_ON);
        SetGpuReg(REG_OFFSET_BG1CNT, 0);
        SetGpuReg(REG_OFFSET_BG1HOFS, 0);
        SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    }
    if (!(a & DISPCNT_BG2_ON))
    {
        ClearGpuRegBits(0, DISPCNT_BG2_ON);
        SetGpuReg(REG_OFFSET_BG2CNT, 0);
        SetGpuReg(REG_OFFSET_BG2HOFS, 0);
        SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    }
    if (!(a & DISPCNT_BG3_ON))
    {
        ClearGpuRegBits(0, DISPCNT_BG3_ON);
        SetGpuReg(REG_OFFSET_BG3CNT, 0);
        SetGpuReg(REG_OFFSET_BG3HOFS, 0);
        SetGpuReg(REG_OFFSET_BG3VOFS, 0);
    }
    if (!(a & DISPCNT_OBJ_ON))
    {
        ClearGpuRegBits(0, DISPCNT_OBJ_ON);
        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
    }
}

static void ApplyOffsetSpriteValues(struct PokemonDebugMenu *data)
{
    u16 species = data->currentmonId;
    //Back
    gSprites[data->backspriteId].y = DEBUG_MON_BACK_Y + gMonFrontPicCoords[species].y_offset + data->offsetsSpriteValues.offset_back_picCoords;
    //Front
    gSprites[data->frontspriteId].y = GetBattlerSpriteFinal_YCustom(species, data->offsetsSpriteValues.offset_front_picCoords, data->offsetsSpriteValues.offset_front_elevation);

    if (data->currentSubmenu == 2)
        UpdateShadowSpriteInvisible(data);
}

static void UpdateSubmenuOneOptionValue(u8 taskId, bool8 increment)
{
    struct PokemonDebugMenu *data = GetStructPtr(taskId);
    u8 option = data->submenuYpos[1];

    switch (option)
    {
    case 0:
        UpdateBattleBg(taskId, increment);
        break;
    default:
        break;
    }
}

static void UpdateSubmenuTwoOptionValue(u8 taskId, bool8 increment)
{
    struct PokemonDebugMenu *data = GetStructPtr(taskId);
    u16 species = data->currentmonId;
    u8 option = data->submenuYpos[2];
    s8 offset;
    u8 y;

    switch (option)
    {
    case 0: //Back picCoords
        offset = data->offsetsSpriteValues.offset_back_picCoords;
        if (increment)
        {
            if (offset == MAX_Y_OFFSET)
                offset = -data->constSpriteValues.backPicCoords;
            else
                offset += 1;
        }
        else
        {
            if (offset == -data->constSpriteValues.backPicCoords)
                offset = MAX_Y_OFFSET;
            else
                offset -= 1;
        }
        data->offsetsSpriteValues.offset_back_picCoords = offset;
        gSprites[data->backspriteId].y = DEBUG_MON_BACK_Y + gMonFrontPicCoords[species].y_offset + offset;
        break;
    case 1: //Front picCoords
        offset = data->offsetsSpriteValues.offset_front_picCoords;
        if (increment)
        {
            if (offset == MAX_Y_OFFSET)
                offset = -data->constSpriteValues.frontPicCoords;
            else
                offset += 1;
        }
        else
        {
            if (offset == -data->constSpriteValues.frontPicCoords)
                offset = MAX_Y_OFFSET;
            else
                offset -= 1;
        }
        data->offsetsSpriteValues.offset_front_picCoords = offset;
        y = GetBattlerSpriteFinal_YCustom(species, offset, data->offsetsSpriteValues.offset_front_elevation);
        gSprites[data->frontspriteId].y = y;
        break;
    case 2: //Front elevation
        offset = data->offsetsSpriteValues.offset_front_elevation;
        if (increment)
        {
            if (offset == MAX_Y_OFFSET)
                offset = -data->constSpriteValues.frontElevation;
            else
                offset += 1;
        }
        else
        {
            if (offset == -data->constSpriteValues.frontElevation)
                offset = MAX_Y_OFFSET;
            else
                offset -= 1;
        }
        data->offsetsSpriteValues.offset_front_elevation = offset;
        y = GetBattlerSpriteFinal_YCustom(species, data->offsetsSpriteValues.offset_front_picCoords, offset);
        gSprites[data->frontspriteId].y = y;
        UpdateShadowSpriteInvisible(data);
        break;
    }

    UpdateYPosOffsetText(data);
}

#define READ_PTR_FROM_TASK(taskId, dataId)                      \
    (void *)(                                                   \
    ((u16)(gTasks[taskId].data[dataId]) |                       \
    ((u16)(gTasks[taskId].data[dataId + 1]) << 16)))

#define STORE_PTR_IN_TASK(ptr, taskId, dataId)                 \
{                                                              \
    gTasks[taskId].data[dataId] = (u32)(ptr);                  \
    gTasks[taskId].data[dataId + 1] = (u32)(ptr) >> 16;        \
}

static void Handle_Input_Debug_Pokemon(u8 taskId)
{
    struct PokemonDebugMenu *data = GetStructPtr(taskId);
    struct Sprite *Frontsprite = &gSprites[data->frontspriteId];
    struct Sprite *Backsprite = &gSprites[data->backspriteId];

    if (JOY_NEW(START_BUTTON))
    {
        data->isShiny = !data->isShiny;

        if(data->isShiny)
            PlaySE(SE_SHINY);

        ReloadPokemonSprites(data);
        ApplyOffsetSpriteValues(data);
    }

    if (data->currentSubmenu == 0)
    {
        if (JOY_NEW(A_BUTTON))
        {
            data->currentSubmenu = 1;
            SetArrowInvisibility(data);
            PrintInstructionsOnWindow(data);
        }
        else if (JOY_NEW(B_BUTTON))
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
            gTasks[taskId].func = Exit_Debug_Pokemon;
            PlaySE(SE_PC_OFF);
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            if (TryMoveDigit(&data->modifyArrows, FALSE))
            {
                data->isFemale = FALSE;
                PrintDigitChars(data);
                UpdateBattlerValue(data);
                ReloadPokemonSprites(data);
                ResetOffsetSpriteValues(data);
            }
            PlaySE(SE_DEX_SCROLL);
            VBlankIntrWait();
        }
        else if (JOY_NEW(DPAD_UP))
        {
            if (TryMoveDigit(&data->modifyArrows, TRUE))
            {
                data->isFemale = FALSE;
                PrintDigitChars(data);
                UpdateBattlerValue(data);
                ReloadPokemonSprites(data);
                ResetOffsetSpriteValues(data);
            }

            PlaySE(SE_DEX_SCROLL);
        }
        else if (JOY_NEW(DPAD_LEFT))
        {
            if (data->modifyArrows.currentDigit != 0)
            {
                data->modifyArrows.currentDigit--;
                gSprites[data->modifyArrows.arrowSpriteId[0]].x2 -= 6;
                gSprites[data->modifyArrows.arrowSpriteId[1]].x2 -= 6;
            }
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            if (data->modifyArrows.currentDigit != (data->modifyArrows.maxDigits - 1))
            {
                data->modifyArrows.currentDigit++;
                gSprites[data->modifyArrows.arrowSpriteId[0]].x2 += 6;
                gSprites[data->modifyArrows.arrowSpriteId[1]].x2 += 6;
            }
        }

    }
    else if (data->currentSubmenu == 1) //Submenu 1
    {
        if (JOY_NEW(A_BUTTON))
        {
            data->currentSubmenu = 2;
            PrintInstructionsOnWindow(data);
            SetArrowInvisibility(data);
            SetConstSpriteValues(data);
            UpdateYPosOffsetText(data);
        }
        else if (JOY_NEW(B_BUTTON))
        {
            data->currentSubmenu = 0;
            //todo check on this
            if (data->submenuYpos[1] == 3)
            {
                data->submenuYpos[1] = 2;
                data->optionArrows.currentDigit = data->submenuYpos[1];
                gSprites[data->optionArrows.arrowSpriteId[0]].y = OPTIONS_ARROW_Y + data->optionArrows.currentDigit * 12;
            }
            SetArrowInvisibility(data);
            PrintInstructionsOnWindow(data);
        }
        // else if (JOY_NEW(DPAD_DOWN))
        // {
        //     data->submenuYpos[1] += 1;
        //     if (data->submenuYpos[1] >= 2)
        //     {
        //         //todo check on this
        //         data->submenuYpos[1] = 0;
        //     }
        //     data->optionArrows.currentDigit = data->submenuYpos[1];
        //     gSprites[data->optionArrows.arrowSpriteId[0]].y = OPTIONS_ARROW_Y + data->optionArrows.currentDigit * 12;
        // }
        // else if (JOY_NEW(DPAD_UP))
        // {
        //     if (data->submenuYpos[1] == 0)
        //     {
        //         data->submenuYpos[1] = 1;
        //     }
        //     else
        //         data->submenuYpos[1] -= 1;

        //     data->optionArrows.currentDigit = data->submenuYpos[1];
        //     gSprites[data->optionArrows.arrowSpriteId[0]].y = OPTIONS_ARROW_Y + data->optionArrows.currentDigit * 12;
        // }
        else if (JOY_NEW(DPAD_LEFT))
        {
            UpdateSubmenuOneOptionValue(taskId, FALSE);
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            UpdateSubmenuOneOptionValue(taskId, TRUE);
        }
    }
    else if (data->currentSubmenu == 2) //Submenu 2
    {
        if (JOY_NEW(B_BUTTON))
        {
            data->currentSubmenu = 1;

            SetArrowInvisibility(data);
            PrintInstructionsOnWindow(data);
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            data->submenuYpos[2] += 1;
            if (data->submenuYpos[2] >= 3)
                data->submenuYpos[2] = 0;

            data->yPosModifyArrows.currentDigit = data->submenuYpos[2];
            gSprites[data->yPosModifyArrows.arrowSpriteId[0]].y = OPTIONS_ARROW_Y + data->yPosModifyArrows.currentDigit * 12;
        }
        else if (JOY_NEW(DPAD_UP))
        {
            if (data->submenuYpos[2] == 0)
                    data->submenuYpos[2] = 2;
            else
                data->submenuYpos[2] -= 1;

            data->yPosModifyArrows.currentDigit = data->submenuYpos[2];
            gSprites[data->yPosModifyArrows.arrowSpriteId[0]].y = OPTIONS_ARROW_Y + data->yPosModifyArrows.currentDigit * 12;
        }
        else if (JOY_NEW(DPAD_LEFT))
        {
            UpdateSubmenuTwoOptionValue(taskId, FALSE);
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            UpdateSubmenuTwoOptionValue(taskId, TRUE);
        }
    }
}

static void ReloadPokemonSprites(struct PokemonDebugMenu *data)
{
    const u32 *palette;
    u16 species = data->currentmonId;
    s16 offset_y;
    u8 front_x = sBattlerCoords[0][1].x;
    u8 front_y;

    DestroySprite(&gSprites[data->frontspriteId]);
    DestroySprite(&gSprites[data->backspriteId]);
    DestroySprite(&gSprites[data->iconspriteId]);

    FreeMonSpritesGfx();
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetAllPicSprites();
    FreeMonIconPalettes();

    AllocateMonSpritesGfx();
    LoadMonIconPalette(species);

    //Update instructions
    PrintInstructionsOnWindow(data);

    //Palettes
    palette = GetMonSpritePalStructCustom(species, data->isShiny);
    LoadCompressedSpritePaletteWithTag(palette, species);
    //Front
    HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonSpritesGfxPtr->sprites[1], species, (data->isFemale ? FEMALE_PERSONALITY : MALE_PERSONALITY));
    BattleLoadOpponentMonSpriteGfxCustom(species, data->isShiny, 1);
    SetMultiuseSpriteTemplateToPokemon(species, 1);
    gMultiuseSpriteTemplate.paletteTag = species;
    front_y = GetBattlerSpriteFinal_YCustom(species, 0, 0);
    data->frontspriteId = CreateSprite(&gMultiuseSpriteTemplate, front_x, front_y, 0);
    gSprites[data->frontspriteId].oam.paletteNum = 1;
    gSprites[data->frontspriteId].callback = SpriteCallbackDummy;
    gSprites[data->frontspriteId].oam.priority = 0;
    //Front Shadow
    LoadAndCreateEnemyShadowSpriteCustom(data, species);

    //Back
    HandleLoadSpecialPokePic(&gMonBackPicTable[species], gMonSpritesGfxPtr->sprites[2], species, (data->isFemale ? FEMALE_PERSONALITY : MALE_PERSONALITY));
    BattleLoadOpponentMonSpriteGfxCustom(species, data->isShiny, 5);
    SetMultiuseSpriteTemplateToPokemon(species, 2);
    offset_y = gMonFrontPicCoords[species].y_offset;
    data->backspriteId = CreateSprite(&gMultiuseSpriteTemplate, DEBUG_MON_BACK_X, DEBUG_MON_BACK_Y + offset_y, 0);
    gSprites[data->backspriteId].oam.paletteNum = 5;
    gSprites[data->backspriteId].callback = SpriteCallbackDummy;
    gSprites[data->backspriteId].oam.priority = 0;

    //Icon Sprite
    data->iconspriteId = CreateMonIcon(species, SpriteCB_MonIcon, DEBUG_ICON_X, DEBUG_ICON_Y, 4, (data->isFemale ? FEMALE_PERSONALITY : MALE_PERSONALITY), FALSE);
    gSprites[data->iconspriteId].oam.priority = 0;

    //Modify Arrows
    LoadSpritePalette(&sSpritePalette_Arrow);
    data->modifyArrows.arrowSpriteId[0] = CreateSprite(&sSpriteTemplate_Arrow, MODIFY_DIGITS_ARROW_X + (data->modifyArrows.currentDigit * 6), MODIFY_DIGITS_ARROW1_Y, 0);
    data->modifyArrows.arrowSpriteId[1] = CreateSprite(&sSpriteTemplate_Arrow, MODIFY_DIGITS_ARROW_X + (data->modifyArrows.currentDigit * 6), MODIFY_DIGITS_ARROW2_Y, 0);
    gSprites[data->modifyArrows.arrowSpriteId[1]].animNum = 1;

    //Option Arrow
    LoadSpritePalette(&sSpritePalette_Arrow);
    data->optionArrows.arrowSpriteId[0] = CreateSprite(&sSpriteTemplate_Arrow, OPTIONS_ARROW_1_X, OPTIONS_ARROW_Y + data->optionArrows.currentDigit * 12, 0);
    gSprites[data->optionArrows.arrowSpriteId[0]].animNum = 2;

    //Y Pos Modify Arrow
    LoadSpritePalette(&sSpritePalette_Arrow);
    data->yPosModifyArrows.arrowSpriteId[0] = CreateSprite(&sSpriteTemplate_Arrow, OPTIONS_ARROW_1_X, OPTIONS_ARROW_Y + data->yPosModifyArrows.currentDigit * 12, 0);
    gSprites[data->yPosModifyArrows.arrowSpriteId[0]].animNum = 2;

    //Arrow invisibility
    SetArrowInvisibility(data);

    //Footprint
    DrawFootprintCustom(WIN_FOOTPRINT, species);
    CopyWindowToVram(WIN_FOOTPRINT, COPYWIN_GFX);
}

static void Exit_Debug_Pokemon(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        struct PokemonDebugMenu *data = GetStructPtr(taskId);
        Free(data);
        FreeMonSpritesGfx();
        DestroyTask(taskId);
        SetMainCallback2(CB2_ReturnToFieldWithOpenMenu);
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
    }
}

#endif
