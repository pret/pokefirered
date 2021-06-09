#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "graphics.h"
#include "new_menu_helpers.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system_internal.h"
#include "strings.h"
#include "task.h"
#include "trig.h"

static void SpriteCB_BoxMonIconScrollOut(struct Sprite * sprite);
static void SetBoxSpeciesAndPersonalities(u8 boxId);
static void MovePartySpriteToNextSlot(struct Sprite * sprite, u16 partyId);
static void SpriteCB_MovePartyMonToNextSlot(struct Sprite * sprite);
static void DestroyBoxMonIcon(struct Sprite * sprite);
static void SpriteCB_HeldMon(struct Sprite * sprite);
static void Task_InitBox(u8 taskId);
static s8 DetermineBoxScrollDirection(u8 boxId);
static void LoadWallpaperGfx(u8 wallpaperId, s8 direction);
static bool32 WaitForWallpaperGfxLoad(void);
static void DrawWallpaper(void *buffer, const void *tilemap, s8 direction, u8 offset);
static void TrimOldWallpaper(void *tilemap);
static void InitBoxTitle(u8 boxId);
static void CreateIncomingBoxTitle(u8 boxId, s8 direction);
static void SpriteCB_IncomingBoxTitle(struct Sprite * sprite);
static void SpriteCB_OutgoingBoxTitle(struct Sprite * sprite);
static s16 GetBoxTitleBaseX(const u8 *string);
static void CycleBoxTitleSprites(void);
static void CycleBoxTitleColor(void);
static void CreateBoxScrollArrows(void);
static void StartBoxScrollArrowsSlide(s8 direction);
static void StopBoxScrollArrowsSlide(void);
static void SpriteCB_Arrow(struct Sprite * sprite);

static const struct OamData sOamData_MonIcon;

static const struct SpriteTemplate sSpriteTemplate_MonIcon = {
    .tileTag = TAG_TILE_MON_ICON,
    .paletteTag = TAG_PAL_MON_ICON_0,
    .oam = &sOamData_MonIcon,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_MonIcon = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0
};

static const union AffineAnimCmd sAffineAnims_ReleaseMon_0[] = {
    AFFINEANIMCMD_FRAME(-2, -2, 0, 120),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnims_ReleaseMon_1[] = {
    AFFINEANIMCMD_FRAME(16, 16, 0,  0),
    AFFINEANIMCMD_FRAME(16, 16, 0, 15),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnimTable_ReleaseMon[] = {
    sAffineAnims_ReleaseMon_0,
    sAffineAnims_ReleaseMon_1
};

static const u16 sWallpaperPals_Forest[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_forest.gbapal");
static const u32 sWallpaperTiles_Forest[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_forest.4bpp.lz");
static const u32 sWallpaperMap_Forest[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_forest.bin.lz");
static const u16 sWallpaperPals_City[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_city.gbapal");
static const u32 sWallpaperTiles_City[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_city.4bpp.lz");
static const u32 sWallpaperMap_City[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_city.bin.lz");
static const u16 sWallpaperPals_Desert[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_desert.gbapal");
static const u32 sWallpaperTiles_Desert[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_desert.4bpp.lz");
static const u32 sWallpaperMap_Desert[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_desert.bin.lz");
static const u16 sWallpaperPals_Savanna[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_savanna.gbapal");
static const u32 sWallpaperTiles_Savanna[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_savanna.4bpp.lz");
static const u32 sWallpaperMap_Savanna[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_savanna.bin.lz");
static const u16 sWallpaperPals_Crag[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_crag.gbapal");
static const u32 sWallpaperTiles_Crag[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_crag.4bpp.lz");
static const u32 sWallpaperMap_Crag[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_crag.bin.lz");
static const u16 sWallpaperPals_Volcano[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_volcano.gbapal");
static const u32 sWallpaperTiles_Volcano[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_volcano.4bpp.lz");
static const u8 sSpace_83D0338[4] = {};
static const u32 sWallpaperMap_Volcano[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_volcano.bin.lz");
static const u16 sWallpaperPals_Snow[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_snow.gbapal");
static const u32 sWallpaperTiles_Snow[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_snow.4bpp.lz");
static const u32 sWallpaperMap_Snow[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_snow.bin.lz");
static const u16 sWallpaperPals_Cave[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_cave.gbapal");
static const u32 sWallpaperTiles_Cave[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_cave.4bpp.lz");
static const u32 sWallpaperMap_Cave[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_cave.bin.lz");
static const u16 sWallpaperPals_Beach[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_beach.gbapal");
static const u32 sWallpaperTiles_Beach[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_beach.4bpp.lz");
static const u32 sWallpaperMap_Beach[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_beach.bin.lz");
static const u16 sWallpaperPals_Seafloor[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_seafloor.gbapal");
static const u32 sWallpaperTiles_Seafloor[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_seafloor.4bpp.lz");
static const u32 sWallpaperMap_Seafloor[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_seafloor.bin.lz");
static const u16 sWallpaperPals_River[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_river.gbapal");
static const u32 sWallpaperTiles_River[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_river.4bpp.lz");
static const u32 sWallpaperMap_River[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_river.bin.lz");
static const u16 sWallpaperPals_Sky[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_sky.gbapal");
static const u32 sWallpaperTiles_Sky[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_sky.4bpp.lz");
static const u32 sWallpaperMap_Sky[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_sky.bin.lz");
static const u16 sWallpaperPals_Polkadot[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_polkadot.gbapal");
static const u8 sSpace_83D1C6C[32] = {};
static const u32 sWallpaperTiles_Polkadot[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_polkadot.4bpp.lz");
static const u32 sWallpaperMap_Polkadot[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_polkadot.bin.lz");
static const u16 sWallpaperPals_Pokecenter[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_pokecenter.gbapal");
static const u32 sWallpaperTiles_Pokecenter[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_pokecenter.4bpp.lz");
static const u32 sWallpaperMap_Pokecenter[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_pokecenter.bin.lz");
static const u16 sWallpaperPals_Machine[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_machine.gbapal");
static const u32 sWallpaperTiles_Machine[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_machine.4bpp.lz");
static const u32 sWallpaperMap_Machine[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_machine.bin.lz");
static const u16 sWallpaperPals_Simple[] = INCBIN_U16("graphics/pokemon_storage/wallpaper_simple.gbapal");
static const u32 sWallpaperTiles_Simple[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_simple.4bpp.lz");
static const u32 sWallpaperMap_Simple[] = INCBIN_U32("graphics/pokemon_storage/wallpaper_simple.bin.lz");
static const u16 sWallpaperTilemap_Unused[] = INCBIN_U16("graphics/pokemon_storage/unk_83D2820.bin");

static const u16 sBoxTitleColors[][2] = {
    // They're all the same, idk why GameFreak even bothered here
    [MENU_FOREST     - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_CITY       - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_DESERT     - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_SAVANNA    - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_CRAG       - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_VOLCANO    - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_SNOW       - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_CAVE       - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_BEACH      - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_SEAFLOOR   - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_RIVER      - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_SKY        - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_POLKADOT   - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_POKECENTER - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_MACHINE    - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)},
    [MENU_SIMPLE     - MENU_WALLPAPERS_START] = {RGB( 7,  7,  7), RGB(31, 31, 31)}
};

static const struct WallpaperTable sWallpaperTable[] = {
    [MENU_FOREST     - MENU_WALLPAPERS_START] = {sWallpaperTiles_Forest, sWallpaperMap_Forest, sWallpaperPals_Forest},
    [MENU_CITY       - MENU_WALLPAPERS_START] = {sWallpaperTiles_City, sWallpaperMap_City, sWallpaperPals_City},
    [MENU_DESERT     - MENU_WALLPAPERS_START] = {sWallpaperTiles_Desert, sWallpaperMap_Desert, sWallpaperPals_Desert},
    [MENU_SAVANNA    - MENU_WALLPAPERS_START] = {sWallpaperTiles_Savanna, sWallpaperMap_Savanna, sWallpaperPals_Savanna},
    [MENU_CRAG       - MENU_WALLPAPERS_START] = {sWallpaperTiles_Crag, sWallpaperMap_Crag, sWallpaperPals_Crag},
    [MENU_VOLCANO    - MENU_WALLPAPERS_START] = {sWallpaperTiles_Volcano, sWallpaperMap_Volcano, sWallpaperPals_Volcano},
    [MENU_SNOW       - MENU_WALLPAPERS_START] = {sWallpaperTiles_Snow, sWallpaperMap_Snow, sWallpaperPals_Snow},
    [MENU_CAVE       - MENU_WALLPAPERS_START] = {sWallpaperTiles_Cave, sWallpaperMap_Cave, sWallpaperPals_Cave},
    [MENU_BEACH      - MENU_WALLPAPERS_START] = {sWallpaperTiles_Beach, sWallpaperMap_Beach, sWallpaperPals_Beach},
    [MENU_SEAFLOOR   - MENU_WALLPAPERS_START] = {sWallpaperTiles_Seafloor, sWallpaperMap_Seafloor, sWallpaperPals_Seafloor},
    [MENU_RIVER      - MENU_WALLPAPERS_START] = {sWallpaperTiles_River, sWallpaperMap_River, sWallpaperPals_River},
    [MENU_SKY        - MENU_WALLPAPERS_START] = {sWallpaperTiles_Sky, sWallpaperMap_Sky, sWallpaperPals_Sky},
    [MENU_POLKADOT   - MENU_WALLPAPERS_START] = {sWallpaperTiles_Polkadot, sWallpaperMap_Polkadot, sWallpaperPals_Polkadot},
    [MENU_POKECENTER - MENU_WALLPAPERS_START] = {sWallpaperTiles_Pokecenter, sWallpaperMap_Pokecenter, sWallpaperPals_Pokecenter},
    [MENU_MACHINE    - MENU_WALLPAPERS_START] = {sWallpaperTiles_Machine, sWallpaperMap_Machine, sWallpaperPals_Machine},
    [MENU_SIMPLE     - MENU_WALLPAPERS_START] = {sWallpaperTiles_Simple, sWallpaperMap_Simple, sWallpaperPals_Simple},
};

static const u16 sArrow_Gfx[] = INCBIN_U16("graphics/pokemon_storage/arrow.4bpp");
static const u8 sUnref_83D2B50[] = {0xba, 0x23};

static const struct SpriteSheet sSpriteSheet_Arrow = {
    sArrow_Gfx, 0x0080, TAG_TILE_6
};

static const struct OamData sOamData_BoxTitle = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0
};

static const union AnimCmd sAnim_BoxTitle_0[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_BoxTitle_1[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_BoxTitle[] = {
    sAnim_BoxTitle_0,
    sAnim_BoxTitle_1
};

static const struct SpriteTemplate sSpriteTemplate_BoxTitle = {
    .tileTag = TAG_TILE_BOX_TITLE,
    .paletteTag = TAG_PAL_BOX_TITLE,
    .oam = &sOamData_BoxTitle,
    .anims = sAnimTable_BoxTitle,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_Arrow = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x16),
    .tileNum = 0x000,
    .priority = 2,
    .paletteNum = 0
};

static const union AnimCmd sAnim_Arrow_0[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_Arrow_1[] = {
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_Arrow[] = {
    sAnim_Arrow_0,
    sAnim_Arrow_1
};

static const struct SpriteTemplate sSpriteTemplate_Arrow = {
    .tileTag = TAG_TILE_6,
    .paletteTag = TAG_PAL_WAVEFORM,
    .oam = &sOamData_Arrow,
    .anims = sAnimTable_Arrow,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_Arrow
};

void InitMonIconFields(void)
{
    u16 i;

    LoadMonIconPalettes();
    for (i = 0; i < MAX_MON_ICONS; i++)
        sStorage->numIconsPerSpecies[i] = 0;
    for (i = 0; i < MAX_MON_ICONS; i++)
        sStorage->iconSpeciesList[i] = 0;
    for (i = 0; i < PARTY_SIZE; i++)
        sStorage->partySprites[i] = NULL;
    for (i = 0; i < IN_BOX_COUNT; i++)
        sStorage->boxMonsSprites[i] = NULL;

    sStorage->movingMonSprite = NULL;
    sStorage->unkUnused1 = 0;
}

static u8 GetMonIconPriorityByCursorPos(void)
{
    return (IsCursorInBox() ? 2 : 1);
}

void CreateMovingMonIcon(void)
{
    u32 personality = GetMonData(&sStorage->movingMon, MON_DATA_PERSONALITY);
    u16 species = GetMonData(&sStorage->movingMon, MON_DATA_SPECIES2);
    u8 priority = GetMonIconPriorityByCursorPos();

    sStorage->movingMonSprite = CreateMonIconSprite(species, personality, 0, 0, priority, 7);
    sStorage->movingMonSprite->callback = SpriteCB_HeldMon;
}

static void InitBoxMonSprites(u8 boxId)
{
    u8 boxPosition;
    u16 i, j, count;
    u16 species;
    u32 personality;

    count = 0;
    boxPosition = 0;
    for (i = 0; i < IN_BOX_ROWS; i++)
    {
        for (j = 0; j < IN_BOX_COLUMNS; j++)
        {
            species = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_SPECIES2);
            if (species != SPECIES_NONE)
            {
                personality = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_PERSONALITY);
                sStorage->boxMonsSprites[count] = CreateMonIconSprite(species, personality, 8 * (3 * j) + 100, 8 * (3 * i) + 44, 2, 19 - j);
            }
            else
            {
                sStorage->boxMonsSprites[count] = NULL;
            }
            boxPosition++;
            count++;
        }
    }

    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        for (boxPosition = 0; boxPosition < IN_BOX_COUNT; boxPosition++)
        {
            if (GetBoxMonDataAt(boxId, boxPosition, MON_DATA_HELD_ITEM) == 0)
                sStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
        }
    }
}

void CreateBoxMonIconAtPos(u8 boxPosition)
{
    u16 species = GetCurrentBoxMonData(boxPosition, MON_DATA_SPECIES2);

    if (species != SPECIES_NONE)
    {
        s16 x = 8 * (3 * (boxPosition % IN_BOX_COLUMNS)) + 100;
        s16 y = 8 * (3 * (boxPosition / IN_BOX_COLUMNS)) + 44;
        u32 personality = GetCurrentBoxMonData(boxPosition, MON_DATA_PERSONALITY);

        sStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(species, personality, x, y, 2, 19 - (boxPosition % IN_BOX_COLUMNS));
        if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
            sStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
    }
}

#define sDistance      data[1]
#define sSpeed         data[2]
#define sScrollInDestX data[3]
#define sDelay         data[4]
#define sScrollOutX    data[5]

static void StartBoxMonIconsScrollOut(s16 speed)
{
    u16 i;

    for (i = 0; i < IN_BOX_COUNT; i++)
    {
        if (sStorage->boxMonsSprites[i] != NULL)
        {
            sStorage->boxMonsSprites[i]->sSpeed = speed;
            sStorage->boxMonsSprites[i]->sDelay = 1;
            sStorage->boxMonsSprites[i]->callback = SpriteCB_BoxMonIconScrollOut;
        }
    }
}

static void SpriteCB_BoxMonIconScrollIn(struct Sprite *sprite)
{
    if (sprite->sDistance != 0)
    {
        sprite->sDistance--;
        sprite->pos1.x += sprite->sSpeed;
    }
    else
    {
        // Icon arrived
        sStorage->iconScrollNumIncoming--;
        sprite->pos1.x = sprite->sScrollInDestX;
        sprite->callback = SpriteCallbackDummy;
    }
}

static void SpriteCB_BoxMonIconScrollOut(struct Sprite *sprite)
{
    if (sprite->sDelay != 0)
    {
        sprite->sDelay--;
    }
    else
    {
        // Icon moving
        sprite->pos1.x += sprite->sSpeed;
        sprite->sScrollOutX = sprite->pos1.x + sprite->pos2.x;

        // Check if icon offscreen
        if (sprite->sScrollOutX <= 68 || sprite->sScrollOutX >= 252)
            sprite->callback = SpriteCallbackDummy;
    }
}

// Sprites for Pokémon icons are destroyed during
// the box scroll once they've gone offscreen
static void DestroyBoxMonIconsInColumn(u8 column)
{
    u16 row;
    u8 boxPosition = column;

    for (row = 0; row < IN_BOX_ROWS; row++)
    {
        if (sStorage->boxMonsSprites[boxPosition] != NULL)
        {
            DestroyBoxMonIcon(sStorage->boxMonsSprites[boxPosition]);
            sStorage->boxMonsSprites[boxPosition] = NULL;
        }
        boxPosition += IN_BOX_COLUMNS;
    }
}


// Create the appearing icons for the incoming scrolling box
static u8 CreateBoxMonIconsInColumn(u8 column, u16 distance, s16 speed)
{
    s32 i;
    u16 y = 44;
    s16 xDest = 8 * (3 * column) + 100;
    u16 x = xDest - ((distance + 1) * speed);
    u8 subpriority = 19 - column;
    u8 iconsCreated = 0;
    u8 boxPosition = column;

    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < IN_BOX_ROWS; i++)
        {
            if (sStorage->boxSpecies[boxPosition] != SPECIES_NONE)
            {
                sStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(sStorage->boxSpecies[boxPosition],
                                                                            sStorage->boxPersonalities[boxPosition],
                                                                            x, y, 2, subpriority);
                if (sStorage->boxMonsSprites[boxPosition] != NULL)
                {
                    sStorage->boxMonsSprites[boxPosition]->sDistance = distance;
                    sStorage->boxMonsSprites[boxPosition]->sSpeed = speed;
                    sStorage->boxMonsSprites[boxPosition]->sScrollInDestX = xDest;
                    sStorage->boxMonsSprites[boxPosition]->callback = SpriteCB_BoxMonIconScrollIn;
                    iconsCreated++;
                }
            }
            boxPosition += IN_BOX_COLUMNS;
            y += 24;
        }
    }
    else
    {
        // Separate case for Move Items mode is used
        // to create the icons with the proper blend
        for (i = 0; i < IN_BOX_ROWS; i++)
        {
            if (sStorage->boxSpecies[boxPosition] != SPECIES_NONE)
            {
                sStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(sStorage->boxSpecies[boxPosition],
                                                                            sStorage->boxPersonalities[boxPosition],
                                                                            x, y, 2, subpriority);
                if (sStorage->boxMonsSprites[boxPosition] != NULL)
                {
                    sStorage->boxMonsSprites[boxPosition]->sDistance = distance;
                    sStorage->boxMonsSprites[boxPosition]->sSpeed = speed;
                    sStorage->boxMonsSprites[boxPosition]->sScrollInDestX = xDest;
                    sStorage->boxMonsSprites[boxPosition]->callback = SpriteCB_BoxMonIconScrollIn;
                    if (GetBoxMonDataAt(sStorage->incomingBoxId, boxPosition, MON_DATA_HELD_ITEM) == 0)
                        sStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
                    iconsCreated++;
                }
            }
            boxPosition += IN_BOX_COLUMNS;
            y += 24;
        }
    }

    return iconsCreated;
}

#undef sDistance
#undef sSpeed
#undef sScrollInDestX
#undef sDelay
#undef sScrollOutX

static void InitBoxMonIconScroll(u8 boxId, s8 direction)
{
    sStorage->iconScrollState = 0;
    sStorage->iconScrollToBoxId = boxId;
    sStorage->iconScrollDirection = direction;
    sStorage->iconScrollDistance = 32;
    sStorage->iconScrollSpeed = -(6 * direction);
    sStorage->iconScrollNumIncoming = 0;
    SetBoxSpeciesAndPersonalities(boxId);
    if (direction > 0)
        sStorage->iconScrollCurColumn = 0;
    else
        sStorage->iconScrollCurColumn = IN_BOX_COLUMNS - 1;

    sStorage->iconScrollPos = (24 * sStorage->iconScrollCurColumn) + 100;
    StartBoxMonIconsScrollOut(sStorage->iconScrollSpeed);
}

static bool8 UpdateBoxMonIconScroll(void)
{
    if (sStorage->iconScrollDistance != 0)
        sStorage->iconScrollDistance--;

    switch (sStorage->iconScrollState)
    {
    case 0:
        sStorage->iconScrollPos += sStorage->iconScrollSpeed;
        if (sStorage->iconScrollPos <= 64 || sStorage->iconScrollPos >= 252)
        {
            // A column of icons has gone offscreen, destroy them
            DestroyBoxMonIconsInColumn(sStorage->iconScrollCurColumn);
            sStorage->iconScrollPos += sStorage->iconScrollDirection * 24;
            sStorage->iconScrollState++;
        }
        break;
    case 1:
        // Create the new incoming column of icons
        sStorage->iconScrollPos += sStorage->iconScrollSpeed;
        sStorage->iconScrollNumIncoming += CreateBoxMonIconsInColumn(sStorage->iconScrollCurColumn,
                                                                     sStorage->iconScrollDistance,
                                                                     sStorage->iconScrollSpeed);
        if ((sStorage->iconScrollDirection > 0 && sStorage->iconScrollCurColumn == IN_BOX_COLUMNS - 1)
            || (sStorage->iconScrollDirection < 0 && sStorage->iconScrollCurColumn == 0))
        {
            // Scroll has reached final column
            sStorage->iconScrollState++;
        }
        else
        {
            // Continue scrolling
            sStorage->iconScrollCurColumn += sStorage->iconScrollDirection;
            sStorage->iconScrollState = 0;
        }
        break;
    case 2:
        // Wait to make sure all icons have arrived
        if (sStorage->iconScrollNumIncoming == 0)
        {
            sStorage->iconScrollDistance++;
            return FALSE;
        }
        break;
    default:
        return FALSE;
    }

    return TRUE;
}

static void SetBoxSpeciesAndPersonalities(u8 boxId)
{
    s32 i, j, boxPosition;

    boxPosition = 0;
    for (i = 0; i < IN_BOX_ROWS; i++)
    {
        for (j = 0; j < IN_BOX_COLUMNS; j++)
        {
            sStorage->boxSpecies[boxPosition] = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_SPECIES2);
            if (sStorage->boxSpecies[boxPosition] != SPECIES_NONE)
                sStorage->boxPersonalities[boxPosition] = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_PERSONALITY);
            boxPosition++;
        }
    }

    sStorage->incomingBoxId = boxId;
}

void DestroyBoxMonIconAtPosition(u8 boxPosition)
{
    if (sStorage->boxMonsSprites[boxPosition] != NULL)
    {
        DestroyBoxMonIcon(sStorage->boxMonsSprites[boxPosition]);
        sStorage->boxMonsSprites[boxPosition] = NULL;
    }
}

void SetBoxMonIconObjMode(u8 boxPosition, u8 objMode)
{
    if (sStorage->boxMonsSprites[boxPosition] != NULL)
    {
        sStorage->boxMonsSprites[boxPosition]->oam.objMode = objMode;
    }
}

void CreatePartyMonsSprites(bool8 visible)
{
    u16 i, count;
    u16 species = GetMonData(&gPlayerParty[0], MON_DATA_SPECIES2);
    u32 personality = GetMonData(&gPlayerParty[0], MON_DATA_PERSONALITY);

    sStorage->partySprites[0] = CreateMonIconSprite(species, personality, 104, 64, 1, 12);
    count = 1;
    for (i = 1; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        if (species != SPECIES_NONE)
        {
            personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
            sStorage->partySprites[i] = CreateMonIconSprite(species, personality, 152, 8 * (3 * (i - 1)) + 16, 1, 12);
            count++;
        }
        else
        {
            sStorage->partySprites[i] = NULL;
        }
    }

    if (!visible)
    {
        for (i = 0; i < count; i++)
        {
            sStorage->partySprites[i]->pos1.y -= 160;
            sStorage->partySprites[i]->invisible = TRUE;
        }
    }

    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (sStorage->partySprites[i] != NULL && GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM) == 0)
                sStorage->partySprites[i]->oam.objMode = ST_OAM_OBJ_BLEND;
        }
    }
}

void CompactPartySprites(void)
{
    u16 i, count;

    sStorage->numPartyToCompact = 0;
    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (sStorage->partySprites[i] != NULL)
        {
            if (i != count)
            {
                MovePartySpriteToNextSlot(sStorage->partySprites[i], count);
                sStorage->partySprites[i] = NULL;
                sStorage->numPartyToCompact++;
            }
            count++;
        }
    }
}

u8 GetNumPartySpritesCompacting(void)
{
    return sStorage->numPartyToCompact;
}

#define sPartyId   data[1]
#define sMonX      data[2]
#define sMonY      data[3]
#define sSpeedX    data[4]
#define sSpeedY    data[5]
#define sMoveSteps data[6]

static void MovePartySpriteToNextSlot(struct Sprite *sprite, u16 partyId)
{
    s16 x, y;

    sprite->sPartyId = partyId;
    if (partyId == 0)
        x = 104, y = 64;
    else
        x = 152, y = 8 * (3 * (partyId - 1)) + 16;

    sprite->sMonX = (u16)(sprite->pos1.x) * 8;
    sprite->sMonY = (u16)(sprite->pos1.y) * 8;
    sprite->sSpeedX = ((x * 8) - sprite->sMonX) / 8;
    sprite->sSpeedY = ((y * 8) - sprite->sMonY) / 8;
    sprite->sMoveSteps = 8;
    sprite->callback = SpriteCB_MovePartyMonToNextSlot;
}

static void SpriteCB_MovePartyMonToNextSlot(struct Sprite *sprite)
{
    if (sprite->data[6] != 0)
    {
        s16 x = sprite->sMonX += sprite->sSpeedX;
        s16 y = sprite->sMonY += sprite->sSpeedY;
        sprite->pos1.x = x / 8u;
        sprite->pos1.y = y / 8u;
        sprite->sMoveSteps--;
    }
    else
    {
        if (sprite->sPartyId == 0)
        {
            sprite->pos1.x = 104;
            sprite->pos1.y = 64;
        }
        else
        {
            sprite->pos1.x = 152;
            sprite->pos1.y = 8 * (3 * (sprite->sPartyId - 1)) + 16;
        }
        sprite->callback = SpriteCallbackDummy;
        sStorage->partySprites[sprite->sPartyId] = sprite;
        sStorage->numPartyToCompact--;
    }
}

#undef sPartyId
#undef sMonX
#undef sMonY
#undef sSpeedX
#undef sSpeedY
#undef sMoveSteps

void DestroyMovingMonIcon(void)
{
    if (sStorage->movingMonSprite != NULL)
    {
        DestroyBoxMonIcon(sStorage->movingMonSprite);
        sStorage->movingMonSprite = NULL;
    }
}

void MovePartySprites(s16 yDelta)
{
    u16 i, posY;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (sStorage->partySprites[i] != NULL)
        {
            sStorage->partySprites[i]->pos1.y += yDelta;
            posY = sStorage->partySprites[i]->pos1.y + sStorage->partySprites[i]->pos2.y + sStorage->partySprites[i]->centerToCornerVecY;
            posY += 16;
            if (posY > 192)
                sStorage->partySprites[i]->invisible = TRUE;
            else
                sStorage->partySprites[i]->invisible = FALSE;
        }
    }
}

void DestroyPartyMonIcon(u8 partyId)
{
    if (sStorage->partySprites[partyId] != NULL)
    {
        DestroyBoxMonIcon(sStorage->partySprites[partyId]);
        sStorage->partySprites[partyId] = NULL;
    }
}

void DestroyAllPartyMonIcons(void)
{
    u16 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (sStorage->partySprites[i] != NULL)
        {
            DestroyBoxMonIcon(sStorage->partySprites[i]);
            sStorage->partySprites[i] = NULL;
        }
    }
}

void SetPartyMonIconObjMode(u8 partyId, u8 objMode)
{
    if (sStorage->partySprites[partyId] != NULL)
    {
        sStorage->partySprites[partyId]->oam.objMode = objMode;
    }
}

void SetMovingMonSprite(u8 cursorArea, u8 cursorPos)
{
    if (cursorArea == MODE_PARTY)
    {
        sStorage->movingMonSprite = sStorage->partySprites[cursorPos];
        sStorage->partySprites[cursorPos] = NULL;
    }
    else if (cursorArea == MODE_BOX)
    {
        sStorage->movingMonSprite = sStorage->boxMonsSprites[cursorPos];
        sStorage->boxMonsSprites[cursorPos] = NULL;
    }
    else
    {
        return;
    }

    sStorage->movingMonSprite->callback = SpriteCB_HeldMon;
    sStorage->movingMonSprite->oam.priority = GetMonIconPriorityByCursorPos();
    sStorage->movingMonSprite->subpriority = 7;
}

void SetPlacedMonSprite(u8 cursorArea, u8 cursorPos)
{
    if (cursorArea == TOTAL_BOXES_COUNT) // party mon
    {
        sStorage->partySprites[cursorPos] = sStorage->movingMonSprite;
        sStorage->partySprites[cursorPos]->oam.priority = 1;
        sStorage->partySprites[cursorPos]->subpriority = 12;
    }
    else
    {
        sStorage->boxMonsSprites[cursorPos] = sStorage->movingMonSprite;
        sStorage->boxMonsSprites[cursorPos]->oam.priority = 2;
        sStorage->boxMonsSprites[cursorPos]->subpriority = 19 - (cursorPos % IN_BOX_COLUMNS);
    }
    sStorage->movingMonSprite->callback = SpriteCallbackDummy;
    sStorage->movingMonSprite = NULL;
}

void SaveMonSpriteAtPos(u8 boxId, u8 cursorPos)
{
    if (boxId == TOTAL_BOXES_COUNT) // party mon
        sStorage->shiftMonSpritePtr = &sStorage->partySprites[cursorPos];
    else
        sStorage->shiftMonSpritePtr = &sStorage->boxMonsSprites[cursorPos];

    sStorage->movingMonSprite->callback = SpriteCallbackDummy;
    sStorage->shiftTimer = 0;
}

bool8 MoveShiftingMons(void)
{
    if (sStorage->shiftTimer == 16)
        return FALSE;

    sStorage->shiftTimer++;
    if (sStorage->shiftTimer & 1)
    {
        (*sStorage->shiftMonSpritePtr)->pos1.y--;
        sStorage->movingMonSprite->pos1.y++;
    }

    (*sStorage->shiftMonSpritePtr)->pos2.x = gSineTable[sStorage->shiftTimer * 8] / 16;
    sStorage->movingMonSprite->pos2.x = -(gSineTable[sStorage->shiftTimer * 8] / 16);
    if (sStorage->shiftTimer == 8)
    {
        sStorage->movingMonSprite->oam.priority = (*sStorage->shiftMonSpritePtr)->oam.priority;
        sStorage->movingMonSprite->subpriority = (*sStorage->shiftMonSpritePtr)->subpriority;
        (*sStorage->shiftMonSpritePtr)->oam.priority = GetMonIconPriorityByCursorPos();
        (*sStorage->shiftMonSpritePtr)->subpriority = 7;
    }

    if (sStorage->shiftTimer == 16)
    {
        struct Sprite *sprite = sStorage->movingMonSprite;
        sStorage->movingMonSprite = (*sStorage->shiftMonSpritePtr);
        *sStorage->shiftMonSpritePtr = sprite;

        sStorage->movingMonSprite->callback = SpriteCB_HeldMon;
        (*sStorage->shiftMonSpritePtr)->callback = SpriteCallbackDummy;
    }

    return TRUE;
}

void SetReleaseMon(u8 mode, u8 position)
{
    switch (mode)
    {
    case MODE_PARTY:
        sStorage->releaseMonSpritePtr = &sStorage->partySprites[position];
        break;
    case MODE_BOX:
        sStorage->releaseMonSpritePtr = &sStorage->boxMonsSprites[position];
        break;
    case MODE_MOVE:
        sStorage->releaseMonSpritePtr = &sStorage->movingMonSprite;
        break;
    default:
        return;
    }

    if (*sStorage->releaseMonSpritePtr != NULL)
    {
        InitSpriteAffineAnim(*sStorage->releaseMonSpritePtr);
        (*sStorage->releaseMonSpritePtr)->oam.affineMode = ST_OAM_AFFINE_NORMAL;
        (*sStorage->releaseMonSpritePtr)->affineAnims = sAffineAnimTable_ReleaseMon;
        StartSpriteAffineAnim(*sStorage->releaseMonSpritePtr, 0);
    }
}

bool8 TryHideReleaseMonSprite(void)
{
    if (*sStorage->releaseMonSpritePtr == NULL || (*sStorage->releaseMonSpritePtr)->invisible)
        return FALSE;

    if ((*sStorage->releaseMonSpritePtr)->affineAnimEnded)
        (*sStorage->releaseMonSpritePtr)->invisible = TRUE;

    return TRUE;
}

void DestroyReleaseMonIcon(void)
{
    if (*sStorage->releaseMonSpritePtr != NULL)
    {
        FreeOamMatrix((*sStorage->releaseMonSpritePtr)->oam.matrixNum);
        DestroyBoxMonIcon(*sStorage->releaseMonSpritePtr);
        *sStorage->releaseMonSpritePtr = NULL;
    }
}

void ReshowReleaseMon(void)
{
    if (*sStorage->releaseMonSpritePtr != NULL)
    {
        (*sStorage->releaseMonSpritePtr)->invisible = FALSE;
        StartSpriteAffineAnim(*sStorage->releaseMonSpritePtr, 1);
    }
}

bool8 ResetReleaseMonSpritePtr(void)
{
    if (sStorage->releaseMonSpritePtr == NULL)
        return FALSE;

    if ((*sStorage->releaseMonSpritePtr)->affineAnimEnded)
        sStorage->releaseMonSpritePtr = NULL;

    return TRUE;
}

void SetMovingMonPriority(u8 priority)
{
    sStorage->movingMonSprite->oam.priority = priority;
}

static void SpriteCB_HeldMon(struct Sprite *sprite)
{
    sprite->pos1.x = sStorage->cursorSprite->pos1.x;
    sprite->pos1.y = sStorage->cursorSprite->pos1.y + sStorage->cursorSprite->pos2.y + 4;
}

static u16 TryLoadMonIconTiles(u16 species)
{
    u16 i, offset;

    // Find the currently-allocated slot
    for (i = 0; i < MAX_MON_ICONS; i++)
    {
        if (sStorage->iconSpeciesList[i] == species)
            break;
    }

    if (i == MAX_MON_ICONS)
    {
        // Find the first empty slot
        for (i = 0; i < MAX_MON_ICONS; i++)
        {
            if (sStorage->iconSpeciesList[i] == SPECIES_NONE)
                break;
        }
        if (i == MAX_MON_ICONS)
            return 0xFFFF;
    }

    sStorage->iconSpeciesList[i] = species;
    sStorage->numIconsPerSpecies[i]++;
    offset = 16 * i;
    CpuCopy32(GetMonIconTiles(species, TRUE), (void*)(OBJ_VRAM0) + offset * 32, 0x200);

    return offset;
}

static void RemoveSpeciesFromIconList(u16 species)
{
    u16 i;

    for (i = 0; i < MAX_MON_ICONS; i++)
    {
        if (sStorage->iconSpeciesList[i] == species)
        {
            if (--sStorage->numIconsPerSpecies[i] == 0)
                sStorage->iconSpeciesList[i] = 0;
            break;
        }
    }
}

struct Sprite *CreateMonIconSprite(u16 species, u32 personality, s16 x, s16 y, u8 oamPriority, u8 subpriority)
{
    u16 tileNum;
    u8 spriteId;
    struct SpriteTemplate template = sSpriteTemplate_MonIcon;

    species = GetIconSpecies(species, personality);
    template.paletteTag = TAG_PAL_MON_ICON_0 + gMonIconPaletteIndices[species];
    tileNum = TryLoadMonIconTiles(species);
    if (tileNum == 0xFFFF)
        return NULL;

    spriteId = CreateSprite(&template, x, y, subpriority);
    if (spriteId == MAX_SPRITES)
    {
        RemoveSpeciesFromIconList(species);
        return NULL;
    }

    gSprites[spriteId].oam.tileNum = tileNum;
    gSprites[spriteId].oam.priority = oamPriority;
    gSprites[spriteId].data[0] = species;
    return &gSprites[spriteId];
}

static void DestroyBoxMonIcon(struct Sprite *sprite)
{
    RemoveSpeciesFromIconList(sprite->data[0]);
    DestroySprite(sprite);
}

//------------------------------------------------------------------------------
//  SECTION: General box
//
//  Some basic box functions, including initializing the box and scrolling.
//------------------------------------------------------------------------------


#define tState  data[0]
#define tDmaIdx data[1]
#define tBoxId  data[2]

void CreateInitBoxTask(u8 box)
{
    u8 taskId = CreateTask(Task_InitBox, 2);

    gTasks[taskId].tBoxId = box;
}

bool8 IsInitBoxActive(void)
{
    return FuncIsActiveTask(Task_InitBox);
}

static void Task_InitBox(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        sStorage->wallpaperOffset = 0;
        sStorage->bg2_X = 0;
        task->tDmaIdx = RequestDma3Fill(0, sStorage->wallpaperBgTilemapBuffer, 0x1000, DMA3_32BIT);
        break;
    case 1:
        if (WaitDma3Request(task->tDmaIdx) == -1)
            return;

        SetBgTilemapBuffer(2, sStorage->wallpaperBgTilemapBuffer);
        ShowBg(2);
        break;
    case 2:
        LoadWallpaperGfx(task->tBoxId, 0);
        break;
    case 3:
        if (!WaitForWallpaperGfxLoad())
            return;

        InitBoxTitle(task->tBoxId);
        CreateBoxScrollArrows();
        InitBoxMonSprites(task->tBoxId);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(27) | BGCNT_TXT512x256);
        break;
    case 4:
        DestroyTask(taskId);
        break;
    default:
        task->data[0] = 0;
        return;
    }

    task->data[0]++;
}

void SetUpScrollToBox(u8 boxId)
{
    s8 direction = DetermineBoxScrollDirection(boxId);

    sStorage->scrollSpeed = (direction > 0) ? 6 : -6;
    sStorage->scrollUnused1 = (direction > 0) ? 1 : 2;
    sStorage->scrollTimer = 32;
    sStorage->scrollToBoxIdUnused = boxId;
    sStorage->scrollUnused2 = (direction <= 0) ? 5 : 0;
    sStorage->scrollDirectionUnused = direction;
    sStorage->scrollUnused3 = (direction > 0) ? 264 : 56;
    sStorage->scrollUnused4 = (direction <= 0) ? 5 : 0;
    sStorage->scrollUnused5 = 0;
    sStorage->scrollUnused6 = 2;
    sStorage->scrollToBoxId = boxId;
    sStorage->scrollDirection = direction;
    sStorage->scrollState = 0;
}

bool8 ScrollToBox(void)
{
    bool8 iconsScrolling;

    switch (sStorage->scrollState)
    {
    case 0:
        LoadWallpaperGfx(sStorage->scrollToBoxId, sStorage->scrollDirection);
        sStorage->scrollState++;
    case 1:
        if (!WaitForWallpaperGfxLoad())
            return TRUE;

        InitBoxMonIconScroll(sStorage->scrollToBoxId, sStorage->scrollDirection);
        CreateIncomingBoxTitle(sStorage->scrollToBoxId, sStorage->scrollDirection);
        StartBoxScrollArrowsSlide(sStorage->scrollDirection);
        break;
    case 2:
        iconsScrolling = UpdateBoxMonIconScroll();
        if (sStorage->scrollTimer != 0)
        {
            sStorage->bg2_X += sStorage->scrollSpeed;
            if (--sStorage->scrollTimer != 0)
                return TRUE;
            CycleBoxTitleSprites();
            StopBoxScrollArrowsSlide();
        }
        return iconsScrolling;
    }

    sStorage->scrollState++;
    return TRUE;
}

static s8 DetermineBoxScrollDirection(u8 boxId)
{
    u8 i;
    u8 currentBox = StorageGetCurrentBox();

    for (i = 0; currentBox != boxId; i++)
    {
        currentBox++;
        if (currentBox >= TOTAL_BOXES_COUNT)
            currentBox = 0;
    }

    return (i < TOTAL_BOXES_COUNT / 2) ? 1 : -1;
}

//------------------------------------------------------------------------------
//  SECTION: Wallpaper gfx
//------------------------------------------------------------------------------

void SetWallpaperForCurrentBox(u8 wallpaperId)
{
    u8 boxId = StorageGetCurrentBox();
    SetBoxWallpaper(boxId, wallpaperId);
    sStorage->wallpaperChangeState = 0;
}

bool8 DoWallpaperGfxChange(void)
{
    switch (sStorage->wallpaperChangeState)
    {
    case 0:
        BeginNormalPaletteFade(sStorage->wallpaperPalBits, 1, 0, 16, RGB_WHITEALPHA);
        sStorage->wallpaperChangeState++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            u8 curBox = StorageGetCurrentBox();
            LoadWallpaperGfx(curBox, 0);
            sStorage->wallpaperChangeState++;
        }
        break;
    case 2:
        if (WaitForWallpaperGfxLoad() == TRUE)
        {
            CycleBoxTitleColor();
            BeginNormalPaletteFade(sStorage->wallpaperPalBits, 1, 16, 0, RGB_WHITEALPHA);
            sStorage->wallpaperChangeState++;
        }
        break;
    case 3:
        if (!UpdatePaletteFade())
            sStorage->wallpaperChangeState++;
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

static void LoadWallpaperGfx(u8 boxId, s8 direction)
{
    u8 wallpaperId;
    const struct WallpaperTable *wallpaperGfx;
    void *iconGfx;
    u32 size1, size2;

    sStorage->wallpaperLoadState = 0;
    sStorage->wallpaperLoadBoxId = boxId;
    sStorage->wallpaperLoadDir = direction;
    if (sStorage->wallpaperLoadDir != 0)
    {
        sStorage->wallpaperOffset = (sStorage->wallpaperOffset == 0);
        TrimOldWallpaper(sStorage->wallpaperBgTilemapBuffer);
    }

    wallpaperId = GetBoxWallpaper(sStorage->wallpaperLoadBoxId);
    wallpaperGfx = &sWallpaperTable[wallpaperId];
    LZ77UnCompWram(wallpaperGfx->tileMap, sStorage->wallpaperTilemap);
    DrawWallpaper(sStorage->wallpaperBgTilemapBuffer, sStorage->wallpaperTilemap, sStorage->wallpaperLoadDir,
                  sStorage->wallpaperOffset);

    if (sStorage->wallpaperLoadDir != 0)
        LoadPalette(wallpaperGfx->palettes, (sStorage->wallpaperOffset * 32) + 0x40, 0x40);
    else
        CpuCopy16(wallpaperGfx->palettes, &gPlttBufferUnfaded[(sStorage->wallpaperOffset * 32) + 0x40], 0x40);

    DecompressAndLoadBgGfxUsingHeap(2, wallpaperGfx->tiles, 0, 256 * sStorage->wallpaperOffset, 0);

    CopyBgTilemapBufferToVram(2);
}

static bool32 WaitForWallpaperGfxLoad(void)
{
    if (IsDma3ManagerBusyWithBgCopy() == TRUE)
        return FALSE;

    return TRUE;
}

static void DrawWallpaper(void *buffer, const void *tilemap, s8 direction, u8 offset)
{
    s16 tileOffset = offset * 256;
    s16 palette2 = (offset * 2) + 3;
    s16 x = ((sStorage->bg2_X / 8 + 10) + (direction * 24)) & 0x3F;

    CopyRectToBgTilemapBufferRect(2, tilemap, 0, 0, 0x14, 0x12, x, 2, 0x14, 0x12, 0x11, tileOffset, palette2);

    if (direction == 0)
        return;
    else if (direction > 0)
        x += 0x14;
    else
        x -= 4;

    FillBgTilemapBufferRect(2, 0, x, 2, 4, 0x12, 0x11);
}

static void TrimOldWallpaper(void *tilemap)
{
    u16 i;
    u16 *dest = tilemap;
    s16 r3 = ((sStorage->bg2_X / 8) + 30) & 0x3F;

    if (r3 <= 31)
        dest += r3 + 0x260;
    else
        dest += r3 + 0x640;

    for (i = 0; i < 0x2C; i++)
    {
        *dest++ = 0;
        r3 = (r3 + 1) & 0x3F;
        if (r3 == 0)
            dest -= 0x420;
        if (r3 == 0x20)
            dest += 0x3e0;
    }
}

//------------------------------------------------------------------------------
//  SECTION: Box Title
//------------------------------------------------------------------------------

static void InitBoxTitle(u8 boxId)
{
    u8 tagIndex;
    s16 x;
    u16 i;

    struct SpriteSheet spriteSheet = {sStorage->boxTitleTiles, 0x200, TAG_TILE_BOX_TITLE};
    struct SpritePalette palettes[] = {
        {sStorage->boxTitlePal, TAG_PAL_BOX_TITLE},
        {}
    };

    u16 wallpaperId = GetBoxWallpaper(boxId);

    sStorage->boxTitlePal[14] = sBoxTitleColors[wallpaperId][0]; // Shadow color
    sStorage->boxTitlePal[15] = sBoxTitleColors[wallpaperId][1]; // Text color
    LoadSpritePalettes(palettes);
    sStorage->wallpaperPalBits = 0x3f0;

    tagIndex = IndexOfSpritePaletteTag(TAG_PAL_BOX_TITLE);
    sStorage->boxTitlePalOffset = 0x10e + 16 * tagIndex;
    sStorage->wallpaperPalBits |= 0x10000 << tagIndex;

    // The below seems intended to have separately tracked
    // the incoming wallpaper title's palette, but as they now
    // share a palette tag, all colors (and fields in some cases)
    // this is redundant along with the use of boxTitleAltPalOffset
    tagIndex = IndexOfSpritePaletteTag(TAG_PAL_BOX_TITLE);
    sStorage->boxTitleAltPalOffset = 0x10e + 16 * tagIndex;
    sStorage->wallpaperPalBits |= 0x10000 << tagIndex;

    StringCopyPadded(sStorage->boxTitleText, GetBoxNamePtr(boxId), 0, 8);
    DrawTextWindowAndBufferTiles(sStorage->boxTitleText, sStorage->boxTitleTiles, 0, 0, sStorage->boxTitleTileBuffer, 2);
    LoadSpriteSheet(&spriteSheet);
    x = GetBoxTitleBaseX(GetBoxNamePtr(boxId));

    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&sSpriteTemplate_BoxTitle, x + i * 32, 28, 24);
        sStorage->curBoxTitleSprites[i] = &gSprites[spriteId];
        StartSpriteAnim(sStorage->curBoxTitleSprites[i], i);
    }
    sStorage->boxTitleCycleId = 0;
}

// Sprite data for moving title text
#define sSpeed data[0]
// Flipped between incoming/outgoing for some reason
#define sIncomingX     data[1]
#define sIncomingDelay data[2]
#define sOutgoingDelay data[1]
#define sOutgoingX     data[2]

static void CreateIncomingBoxTitle(u8 boxId, s8 direction)
{
    u16 palOffset;
    s16 x, adjustedX;
    u16 i;
    struct SpriteSheet spriteSheet = {sStorage->boxTitleTiles, 0x200, TAG_TILE_BOX_TITLE};
    struct SpriteTemplate template = sSpriteTemplate_BoxTitle;

    sStorage->boxTitleCycleId = (sStorage->boxTitleCycleId == 0);
    if (sStorage->boxTitleCycleId == 0)
    {
        spriteSheet.tag = TAG_TILE_BOX_TITLE;
        palOffset = sStorage->boxTitlePalOffset;
    }
    else
    {
        spriteSheet.tag = TAG_TILE_BOX_TITLE_ALT;
        palOffset = sStorage->boxTitlePalOffset;
        template.tileTag = TAG_TILE_BOX_TITLE_ALT;
        template.paletteTag = TAG_PAL_BOX_TITLE;
    }

    StringCopyPadded(sStorage->boxTitleText, GetBoxNamePtr(boxId), 0, 8);
    DrawTextWindowAndBufferTiles(sStorage->boxTitleText, sStorage->boxTitleTiles, 0, 0, sStorage->boxTitleTileBuffer, 2);
    LoadSpriteSheet(&spriteSheet);
    LoadPalette(sBoxTitleColors[GetBoxWallpaper(boxId)], palOffset, 4);
    x = GetBoxTitleBaseX(GetBoxNamePtr(boxId));
    adjustedX = x;
    adjustedX += direction * 192;

    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&template, i * 32 + adjustedX, 28, 24);

        sStorage->nextBoxTitleSprites[i] = &gSprites[spriteId];
        sStorage->nextBoxTitleSprites[i]->sSpeed = (-direction) * 6;
        sStorage->nextBoxTitleSprites[i]->sIncomingX = i * 32 + x;
        sStorage->nextBoxTitleSprites[i]->sIncomingDelay = 0;
        sStorage->nextBoxTitleSprites[i]->callback = SpriteCB_IncomingBoxTitle;
        StartSpriteAnim(sStorage->nextBoxTitleSprites[i], i);

        sStorage->curBoxTitleSprites[i]->sSpeed = (-direction) * 6;
        sStorage->curBoxTitleSprites[i]->sOutgoingDelay = 1;
        sStorage->curBoxTitleSprites[i]->callback = SpriteCB_OutgoingBoxTitle;
    }
}

static void CycleBoxTitleSprites(void)
{
    if (sStorage->boxTitleCycleId == 0)
        FreeSpriteTilesByTag(TAG_TILE_BOX_TITLE_ALT);
    else
        FreeSpriteTilesByTag(TAG_TILE_BOX_TITLE);

    sStorage->curBoxTitleSprites[0] = sStorage->nextBoxTitleSprites[0];
    sStorage->curBoxTitleSprites[1] = sStorage->nextBoxTitleSprites[1];
}

static void SpriteCB_IncomingBoxTitle(struct Sprite *sprite)
{
    if (sprite->sIncomingDelay != 0)
        sprite->sIncomingDelay--;
    else if ((sprite->pos1.x += sprite->sSpeed) == sprite->sIncomingX)
        sprite->callback = SpriteCallbackDummy;
}

static void SpriteCB_OutgoingBoxTitle(struct Sprite *sprite)
{
    if (sprite->sOutgoingDelay != 0)
    {
        sprite->sOutgoingDelay--;
    }
    else
    {
        sprite->pos1.x += sprite->sSpeed;
        sprite->sOutgoingX = sprite->pos1.x + sprite->pos2.x;
        if (sprite->sOutgoingX < 0x40 || sprite->sOutgoingX > 0x100)
            DestroySprite(sprite);
    }
}
#undef sSpeed
#undef sIncomingX
#undef sIncomingDelay
#undef sOutgoingDelay
#undef sOutgoingX

static void CycleBoxTitleColor(void)
{
    u8 boxId = StorageGetCurrentBox();
    u8 wallpaperId = GetBoxWallpaper(boxId);
    if (sStorage->boxTitleCycleId == 0)
        CpuCopy16(sBoxTitleColors[wallpaperId], gPlttBufferUnfaded + sStorage->boxTitlePalOffset, 4);
    else
        CpuCopy16(sBoxTitleColors[wallpaperId], gPlttBufferUnfaded + sStorage->boxTitleAltPalOffset, 4);
}

static s16 GetBoxTitleBaseX(const u8 *string)
{
    return 0xB0 - GetStringWidth(1, string, 0) / 2;
}

//------------------------------------------------------------------------------
//  SECTION: Scroll arrows
//------------------------------------------------------------------------------

// Sprite data for box scroll arrows
#define sState data[0]
#define sTimer data[1]
#define sCount data[2]
#define sDestX data[2]
#define sSpeed data[3]
#define sUnk_4 data[4] // Never read
#define sWhich data[7] // Never read

static void CreateBoxScrollArrows(void)
{
    u16 i;

    LoadSpriteSheet(&sSpriteSheet_Arrow);
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&sSpriteTemplate_Arrow, 0x5c + i * 0x88, 28, 22);
        if (spriteId != MAX_SPRITES)
        {
            struct Sprite *sprite = &gSprites[spriteId];
            StartSpriteAnim(sprite, i);
            sprite->data[3] = (i == 0) ? -1 : 1;
            sStorage->arrowSprites[i] = sprite;
        }
    }
    if (IsCursorOnBox())
        AnimateBoxScrollArrows(TRUE);
}

static void StartBoxScrollArrowsSlide(s8 direction)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        sStorage->arrowSprites[i]->pos2.x = 0;
        sStorage->arrowSprites[i]->sState = 2;
    }
    if (direction < 0)
    {
        sStorage->arrowSprites[0]->sTimer = 29;
        sStorage->arrowSprites[1]->sTimer = 5;
        sStorage->arrowSprites[0]->sDestX = 0x48;
        sStorage->arrowSprites[1]->sDestX = 0x48;
    }
    else
    {
        sStorage->arrowSprites[0]->sTimer = 5;
        sStorage->arrowSprites[1]->sTimer = 29;
        sStorage->arrowSprites[0]->sDestX = 0xF8;
        sStorage->arrowSprites[1]->sDestX = 0xF8;
    }
    sStorage->arrowSprites[0]->sWhich = 0;
    sStorage->arrowSprites[1]->sWhich = 1;
}

static void StopBoxScrollArrowsSlide(void)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        sStorage->arrowSprites[i]->pos1.x = 0x88 * i + 0x5c;
        sStorage->arrowSprites[i]->pos2.x = 0;
        sStorage->arrowSprites[i]->invisible = FALSE;
    }
    AnimateBoxScrollArrows(TRUE);
}

void AnimateBoxScrollArrows(bool8 animate)
{
    u16 i;

    if (animate)
    {
        for (i = 0; i < 2; i++)
        {
            sStorage->arrowSprites[i]->sState = 1;
            sStorage->arrowSprites[i]->sTimer = 0;
            sStorage->arrowSprites[i]->sCount = 0;
            sStorage->arrowSprites[i]->sUnk_4 = 0;
        }
    }
    else
    {
        for (i = 0; i < 2; i++)
        {
            sStorage->arrowSprites[i]->sState = 0;
        }
    }
}

static void SpriteCB_Arrow(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->pos2.x = 0;
        break;
    case 1:
        if (++sprite->sTimer > 3)
        {
            sprite->sTimer = 0;
            sprite->pos2.x += sprite->sSpeed;
            if (++sprite->sCount > 5)
            {
                sprite->sCount = 0;
                sprite->pos2.x = 0;
            }
        }
        break;
    case 2:
        sprite->sState = 3;
        break;
    case 3:
        sprite->pos1.x -= sStorage->scrollSpeed;
        if (sprite->pos1.x <= 72 || sprite->pos1.x >= 248)
            sprite->invisible = TRUE;
        if (--sprite->sTimer == 0)
        {
            sprite->pos1.x = sprite->sDestX;
            sprite->invisible = FALSE;
            sprite->sState = 4;
        }
        break;
    case 4:
        sprite->pos1.x -= sStorage->scrollSpeed;
        break;
    }
}

#undef sState
#undef sTimer
#undef sCount
#undef sDestX
#undef sSpeed
#undef sWhich

struct Sprite *CreateChooseBoxArrows(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_Arrow, x, y, subpriority);
    if (spriteId == MAX_SPRITES)
        return NULL;

    animId %= 2;
    StartSpriteAnim(&gSprites[spriteId], animId);
    gSprites[spriteId].oam.priority = priority;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    return &gSprites[spriteId];
}
