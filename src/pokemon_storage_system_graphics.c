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

static void SpriteCB_BoxMonIconScrollOut(struct Sprite *sprite);
static void SetBoxSpeciesAndPersonalities(u8 boxId);
static void MovePartySpriteToNextSlot(struct Sprite *sprite, u16 idx);
static void SpriteCB_MovePartySpriteToNextSlot(struct Sprite *sprite);
static void DestroyBoxMonIcon(struct Sprite *sprite);
static void SpriteCB_HeldMon(struct Sprite *sprite);
static void Task_InitBox(u8 taskId);
static s8 DetermineBoxScrollDirection(u8 boxId);
static void LoadWallpaperGfx(u8 wallpaperId, s8 direction);
static bool32 WaitForWallpaperGfxLoad(void);
static void DrawWallpaper(void *unused, const void *tilemap, s8 direction, u8 offset);
static void TrimOldWallpaper(void *buffer);
static void InitBoxTitle(u8 wallpaperId);
static void CreateIncomingBoxTitle(u8 wallpaperId, s8 direction);
static void SpriteCB_IncomingBoxTitle(struct Sprite *sprite);
static void SpriteCB_OutgoingBoxTitle(struct Sprite *sprite);
static s16 GetBoxTitleBaseX(const u8 *boxName);
static void CycleBoxTitleSprites(void);
static void CycleBoxTitleColor(void);
static void CreateBoxScrollArrows(void);
static void StartBoxScrollArrowsSlide(s8 direction);
static void StopBoxScrollArrowsSlide(void);
static void SpriteCB_BoxScrollArrow(struct Sprite *sprite);

static const struct OamData sOamData_MonIcon;

static const struct SpriteTemplate sSpriteTemplate_MonIcon = {
    .tileTag = GFXTAG_MON_ICON,
    .paletteTag = PALTAG_MON_ICON_0,
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

static const union AffineAnimCmd sAffineAnim_ReleaseMon_Release[] = {
    AFFINEANIMCMD_FRAME(-2, -2, 0, 120),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_ReleaseMon_ComeBack[] = {
    AFFINEANIMCMD_FRAME(16, 16, 0,  0),
    AFFINEANIMCMD_FRAME(16, 16, 0, 15),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnims_ReleaseMon[] = {
    [RELEASE_ANIM_RELEASE]   = sAffineAnim_ReleaseMon_Release,
    [RELEASE_ANIM_COME_BACK] = sAffineAnim_ReleaseMon_ComeBack,
};

static const u16 sWallpaperPalettes_Forest[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/forest/tiles.gbapal");
static const u32 sWallpaperTiles_Forest[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/forest/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Forest[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/forest/tilemap.bin.lz");

static const u16 sWallpaperPalettes_City[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/city/tiles.gbapal");
static const u32 sWallpaperTiles_City[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/city/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_City[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/city/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Desert[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/desert/tiles.gbapal");
static const u32 sWallpaperTiles_Desert[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/desert/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Desert[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/desert/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Savanna[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/savanna/tiles.gbapal");
static const u32 sWallpaperTiles_Savanna[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/savanna/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Savanna[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/savanna/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Crag[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/crag/tiles.gbapal");
static const u32 sWallpaperTiles_Crag[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/crag/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Crag[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/crag/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Volcano[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/volcano/tiles.gbapal");
static const u32 sWallpaperTiles_Volcano[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/volcano/tiles.4bpp.lz");
static const u8 sUnusedSpace1[4] = {};
static const u32 sWallpaperTilemap_Volcano[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/volcano/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Snow[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/snow/tiles.gbapal");
static const u32 sWallpaperTiles_Snow[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/snow/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Snow[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/snow/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Cave[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/cave/tiles.gbapal");
static const u32 sWallpaperTiles_Cave[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/cave/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Cave[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/cave/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Beach[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/beach/tiles.gbapal");
static const u32 sWallpaperTiles_Beach[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/beach/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Beach[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/beach/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Seafloor[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/seafloor/tiles.gbapal");
static const u32 sWallpaperTiles_Seafloor[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/seafloor/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Seafloor[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/seafloor/tilemap.bin.lz");

static const u16 sWallpaperPalettes_River[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/river/tiles.gbapal");
static const u32 sWallpaperTiles_River[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/river/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_River[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/river/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Sky[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/sky/tiles.gbapal");
static const u32 sWallpaperTiles_Sky[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/sky/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Sky[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/sky/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Stars[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/stars/tiles.gbapal");
static const u8 sUnusedSpace2[32] = {};
static const u32 sWallpaperTiles_Stars[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/stars/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Stars[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/stars/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Pokecenter[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/pokecenter/tiles.gbapal");
static const u32 sWallpaperTiles_Pokecenter[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/pokecenter/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Pokecenter[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/pokecenter/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Tiles[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/tiles/tiles.gbapal");
static const u32 sWallpaperTiles_Tiles[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/tiles/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Tiles[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/tiles/tilemap.bin.lz");

static const u16 sWallpaperPalettes_Simple[][16] = INCBIN_U16("graphics/pokemon_storage/wallpapers/simple/tiles.gbapal");
static const u32 sWallpaperTiles_Simple[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/simple/tiles.4bpp.lz");
static const u32 sWallpaperTilemap_Simple[] = INCBIN_U32("graphics/pokemon_storage/wallpapers/simple/tilemap.bin.lz");

// Unused
static const u16 sWallpaperTilemap_Unused[] = INCBIN_U16("graphics/pokemon_storage/wallpapers/unused.bin");

// Shadow color, text color
static const u16 sBoxTitleColors[][2] = {
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE},
    {RGB( 7,  7,  7), RGB_WHITE}
};

static const struct Wallpaper sWallpapers[] = {
    {sWallpaperTiles_Forest,     sWallpaperTilemap_Forest,     *sWallpaperPalettes_Forest    },
    {sWallpaperTiles_City,       sWallpaperTilemap_City,       *sWallpaperPalettes_City      },
    {sWallpaperTiles_Desert,     sWallpaperTilemap_Desert,     *sWallpaperPalettes_Desert    },
    {sWallpaperTiles_Savanna,    sWallpaperTilemap_Savanna,    *sWallpaperPalettes_Savanna   },
    {sWallpaperTiles_Crag,       sWallpaperTilemap_Crag,       *sWallpaperPalettes_Crag      },
    {sWallpaperTiles_Volcano,    sWallpaperTilemap_Volcano,    *sWallpaperPalettes_Volcano   },
    {sWallpaperTiles_Snow,       sWallpaperTilemap_Snow,       *sWallpaperPalettes_Snow      },
    {sWallpaperTiles_Cave,       sWallpaperTilemap_Cave,       *sWallpaperPalettes_Cave      },
    {sWallpaperTiles_Beach,      sWallpaperTilemap_Beach,      *sWallpaperPalettes_Beach     },
    {sWallpaperTiles_Seafloor,   sWallpaperTilemap_Seafloor,   *sWallpaperPalettes_Seafloor  },
    {sWallpaperTiles_River,      sWallpaperTilemap_River,      *sWallpaperPalettes_River     },
    {sWallpaperTiles_Sky,        sWallpaperTilemap_Sky,        *sWallpaperPalettes_Sky       },
    {sWallpaperTiles_Stars,      sWallpaperTilemap_Stars,      *sWallpaperPalettes_Stars     },
    {sWallpaperTiles_Pokecenter, sWallpaperTilemap_Pokecenter, *sWallpaperPalettes_Pokecenter},
    {sWallpaperTiles_Tiles,      sWallpaperTilemap_Tiles,      *sWallpaperPalettes_Tiles     },
    {sWallpaperTiles_Simple,     sWallpaperTilemap_Simple,     *sWallpaperPalettes_Simple    },
};

static const u16 sBoxScrollArrow_Gfx[] = INCBIN_U16("graphics/pokemon_storage/box_scroll_arrow.4bpp");

static const u16 sUnusedColor = RGB(26, 29, 8);

static const struct SpriteSheet sSpriteSheet_BoxScrollArrow = {
    sBoxScrollArrow_Gfx, 0x0080, GFXTAG_BOX_SCROLL_ARROW
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

static const union AnimCmd sAnim_BoxTitle_Left[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_BoxTitle_Right[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_BoxTitle[] = {
    sAnim_BoxTitle_Left,
    sAnim_BoxTitle_Right,
};

static const struct SpriteTemplate sSpriteTemplate_BoxTitle = {
    .tileTag = GFXTAG_BOX_TITLE,
    .paletteTag = PALTAG_BOX_TITLE,
    .oam = &sOamData_BoxTitle,
    .anims = sAnims_BoxTitle,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_BoxScrollArrow = {
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

static const union AnimCmd sAnim_BoxScrollArrow_Left[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnim_BoxScrollArrow_Right[] = {
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_BoxScrollArrow[] = {
    sAnim_BoxScrollArrow_Left,
    sAnim_BoxScrollArrow_Right,
};

static const struct SpriteTemplate sSpriteTemplate_BoxScrollArrow = {
    .tileTag = GFXTAG_BOX_SCROLL_ARROW,
    .paletteTag = PALTAG_MISC_2,
    .oam = &sOamData_BoxScrollArrow,
    .anims = sAnims_BoxScrollArrow,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_BoxScrollArrow,
};

void InitMonIconFields(void)
{
    u16 i;

    LoadMonIconPalettes();
    for (i = 0; i < MAX_MON_ICONS; i++)
        gStorage->numIconsPerSpecies[i] = 0;
    for (i = 0; i < MAX_MON_ICONS; i++)
        gStorage->iconSpeciesList[i] = SPECIES_NONE;
    for (i = 0; i < PARTY_SIZE; i++)
        gStorage->partySprites[i] = NULL;
    for (i = 0; i < IN_BOX_COUNT; i++)
        gStorage->boxMonsSprites[i] = NULL;

    gStorage->movingMonSprite = NULL;
    gStorage->unusedField1 = 0;
}

static u8 GetMonIconPriorityByCursorArea(void)
{
    return (IsCursorInBox() ? 2 : 1);
}

void CreateMovingMonIcon(void)
{
    u32 personality = GetMonData(&gStorage->movingMon, MON_DATA_PERSONALITY);
    u16 species = GetMonData(&gStorage->movingMon, MON_DATA_SPECIES_OR_EGG);
    u8 priority = GetMonIconPriorityByCursorArea();

    gStorage->movingMonSprite = CreateMonIconSprite(species, personality, 0, 0, priority, 7);
    gStorage->movingMonSprite->callback = SpriteCB_HeldMon;
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
            species = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_SPECIES_OR_EGG);
            if (species != SPECIES_NONE)
            {
                personality = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_PERSONALITY);
                gStorage->boxMonsSprites[count] = CreateMonIconSprite(species, personality, 8 * (3 * j) + 100, 8 * (3 * i) + 44, 2, 19 - j);
            }
            else
                gStorage->boxMonsSprites[count] = NULL;

            boxPosition++;
            count++;
        }
    }

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        for (boxPosition = 0; boxPosition < IN_BOX_COUNT; boxPosition++)
        {
            if (GetBoxMonDataAt(boxId, boxPosition, MON_DATA_HELD_ITEM) == 0)
                gStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
        }
    }
}

void CreateBoxMonIconAtPos(u8 boxPosition)
{
    u16 species = GetCurrentBoxMonData(boxPosition, MON_DATA_SPECIES_OR_EGG);

    if (species != SPECIES_NONE)
    {
        s16 x = 8 * (3 * (boxPosition % IN_BOX_COLUMNS)) + 100;
        s16 y = 8 * (3 * (boxPosition / IN_BOX_COLUMNS)) + 44;
        u32 personality = GetCurrentBoxMonData(boxPosition, MON_DATA_PERSONALITY);

        gStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(species, personality, x, y, 2, 19 - (boxPosition % IN_BOX_COLUMNS));
        if (gStorage->boxOption == OPTION_MOVE_ITEMS)
            gStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
    }
}

#define sDistance data[1]
#define sSpeed    data[2]
#define sDestX    data[3]
#define sDelay    data[4]
#define sPosX     data[5]

static void StartBoxMonIconsScrollOut(s16 speed)
{
    u16 i;

    for (i = 0; i < IN_BOX_COUNT; i++)
    {
        if (gStorage->boxMonsSprites[i] != NULL)
        {
            gStorage->boxMonsSprites[i]->sSpeed = speed;
            gStorage->boxMonsSprites[i]->sDelay = 1;
            gStorage->boxMonsSprites[i]->callback = SpriteCB_BoxMonIconScrollOut;
        }
    }
}

static void SpriteCB_BoxMonIconScrollIn(struct Sprite *sprite)
{
    if (sprite->sDistance != 0)
    {
        sprite->sDistance--;
        sprite->x += sprite->sSpeed;
    }
    else
    {
        gStorage->iconScrollNumIncoming--;
        sprite->x = sprite->sDestX;
        sprite->callback = SpriteCallbackDummy;
    }
}

static void SpriteCB_BoxMonIconScrollOut(struct Sprite *sprite)
{
    if (sprite->sDelay != 0)
        sprite->sDelay--;
    else
    {
        sprite->x += sprite->sSpeed;
        sprite->sPosX = sprite->x + sprite->x2;

        // Check if mon icon has scrolled out of view of the box area
        if (sprite->sPosX <= 68 || sprite->sPosX >= 252)
            sprite->callback = SpriteCallbackDummy;
    }
}

static void DestroyAllIconsInColumn(u8 column)
{
    u16 row;
    u8 boxPosition = column;

    for (row = 0; row < IN_BOX_ROWS; row++)
    {
        if (gStorage->boxMonsSprites[boxPosition] != NULL)
        {
            DestroyBoxMonIcon(gStorage->boxMonsSprites[boxPosition]);
            gStorage->boxMonsSprites[boxPosition] = NULL;
        }
        boxPosition += IN_BOX_COLUMNS;
    }
}

static u8 CreateBoxMonIconsInColumn(u8 column, u16 distance, s16 speed)
{
    s32 i;
    u16 y = 44;
    s16 xDest = 8 * (3 * column) + 100;
    u16 x = xDest - ((distance + 1) * speed);
    u8 subpriority = 19 - column;
    u8 count = 0;
    u8 boxPosition = column;

    if (gStorage->boxOption != OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < IN_BOX_ROWS; i++)
        {
            if (gStorage->boxSpecies[boxPosition] != SPECIES_NONE)
            {
                gStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(gStorage->boxSpecies[boxPosition],
                                                                            gStorage->boxPersonalities[boxPosition],
                                                                            x, y, 2, subpriority);
                if (gStorage->boxMonsSprites[boxPosition] != NULL)
                {
                    gStorage->boxMonsSprites[boxPosition]->sDistance = distance;
                    gStorage->boxMonsSprites[boxPosition]->sSpeed = speed;
                    gStorage->boxMonsSprites[boxPosition]->sDestX = xDest;
                    gStorage->boxMonsSprites[boxPosition]->callback = SpriteCB_BoxMonIconScrollIn;
                    count++;
                }
            }
            boxPosition += IN_BOX_COLUMNS;
            y += 24;
        }
    }
    else
    {
        for (i = 0; i < IN_BOX_ROWS; i++)
        {
            if (gStorage->boxSpecies[boxPosition] != SPECIES_NONE)
            {
                gStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(gStorage->boxSpecies[boxPosition],
                                                                            gStorage->boxPersonalities[boxPosition],
                                                                            x, y, 2, subpriority);
                if (gStorage->boxMonsSprites[boxPosition] != NULL)
                {
                    gStorage->boxMonsSprites[boxPosition]->sDistance = distance;
                    gStorage->boxMonsSprites[boxPosition]->sSpeed = speed;
                    gStorage->boxMonsSprites[boxPosition]->sDestX = xDest;
                    gStorage->boxMonsSprites[boxPosition]->callback = SpriteCB_BoxMonIconScrollIn;
                    if (GetBoxMonDataAt(gStorage->incomingBoxId, boxPosition, MON_DATA_HELD_ITEM) == 0)
                        gStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
                    count++;
                }
            }
            boxPosition += IN_BOX_COLUMNS;
            y += 24;
        }
    }

    return count;
}

#undef sDistance
#undef sSpeed
#undef sDestX
#undef sDelay
#undef sPosX

static void InitBoxMonIconScroll(u8 boxId, s8 direction)
{
    gStorage->iconScrollState = 0;
    gStorage->iconScrollToBoxId = boxId;
    gStorage->iconScrollDirection = direction;
    gStorage->iconScrollDistance = 32;
    gStorage->iconScrollSpeed = -(6 * direction);
    gStorage->iconScrollNumIncoming = 0;
    SetBoxSpeciesAndPersonalities(boxId);
    if (direction > 0)
        gStorage->iconScrollCurColumn = 0;
    else
        gStorage->iconScrollCurColumn = IN_BOX_COLUMNS - 1;

    gStorage->iconScrollPos = (24 * gStorage->iconScrollCurColumn) + 100;
    StartBoxMonIconsScrollOut(gStorage->iconScrollSpeed);
}

static bool8 UpdateBoxMonIconScroll(void)
{
    if (gStorage->iconScrollDistance != 0)
        gStorage->iconScrollDistance--;

    switch (gStorage->iconScrollState)
    {
    case 0:
        gStorage->iconScrollPos += gStorage->iconScrollSpeed;
        if (gStorage->iconScrollPos <= 64 || gStorage->iconScrollPos >= 252)
        {
            // A column of icons has gone offscreen, destroy them
            DestroyAllIconsInColumn(gStorage->iconScrollCurColumn);
            gStorage->iconScrollPos += gStorage->iconScrollDirection * 24;
            gStorage->iconScrollState++;
        }
        break;
    case 1:
        // Create the new incoming column of icons
        gStorage->iconScrollPos += gStorage->iconScrollSpeed;
        gStorage->iconScrollNumIncoming += CreateBoxMonIconsInColumn(gStorage->iconScrollCurColumn, gStorage->iconScrollDistance, gStorage->iconScrollSpeed);
        if ((gStorage->iconScrollDirection > 0 && gStorage->iconScrollCurColumn == IN_BOX_COLUMNS - 1)
            || (gStorage->iconScrollDirection < 0 && gStorage->iconScrollCurColumn == 0))
        {
            // Scroll has reached final column
            gStorage->iconScrollState++;
        }
        else
        {
            // Continue scrolling
            gStorage->iconScrollCurColumn += gStorage->iconScrollDirection;
            gStorage->iconScrollState = 0;
        }
        break;
    case 2:
        // Wait to make sure all icons have arrived
        if (gStorage->iconScrollNumIncoming == 0)
        {
            gStorage->iconScrollDistance++;
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
            gStorage->boxSpecies[boxPosition] = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_SPECIES_OR_EGG);
            if (gStorage->boxSpecies[boxPosition] != SPECIES_NONE)
                gStorage->boxPersonalities[boxPosition] = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_PERSONALITY);
            boxPosition++;
        }
    }

    gStorage->incomingBoxId = boxId;
}

void DestroyBoxMonIconAtPosition(u8 boxPosition)
{
    if (gStorage->boxMonsSprites[boxPosition] != NULL)
    {
        DestroyBoxMonIcon(gStorage->boxMonsSprites[boxPosition]);
        gStorage->boxMonsSprites[boxPosition] = NULL;
    }
}

void SetBoxMonIconObjMode(u8 boxPosition, u8 objMode)
{
    if (gStorage->boxMonsSprites[boxPosition] != NULL)
    {
        gStorage->boxMonsSprites[boxPosition]->oam.objMode = objMode;
    }
}

void CreatePartyMonsSprites(bool8 visible)
{
    u16 i, count;
    u16 species = GetMonData(&gPlayerParty[0], MON_DATA_SPECIES_OR_EGG);
    u32 personality = GetMonData(&gPlayerParty[0], MON_DATA_PERSONALITY);

    gStorage->partySprites[0] = CreateMonIconSprite(species, personality, 104, 64, 1, 12);
    count = 1;
    for (i = 1; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG);
        if (species != SPECIES_NONE)
        {
            personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
            gStorage->partySprites[i] = CreateMonIconSprite(species, personality, 152,  8 * (3 * (i - 1)) + 16, 1, 12);
            count++;
        }
        else
            gStorage->partySprites[i] = NULL;
    }

    if (!visible)
    {
        for (i = 0; i < count; i++)
        {
            gStorage->partySprites[i]->y -= 160;
            gStorage->partySprites[i]->invisible = TRUE;
        }
    }

    if (gStorage->boxOption == OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (gStorage->partySprites[i] != NULL && GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM) == 0)
                gStorage->partySprites[i]->oam.objMode = ST_OAM_OBJ_BLEND;
        }
    }
}

void CompactPartySprites(void)
{
    u16 i, targetPartyId;

    gStorage->numPartySpritesToCompact = 0;
    for (i = 0, targetPartyId = 0; i < PARTY_SIZE; i++)
    {
        if (gStorage->partySprites[i] != NULL)
        {
            if (i != targetPartyId)
            {
                MovePartySpriteToNextSlot(gStorage->partySprites[i], targetPartyId);
                gStorage->partySprites[i] = NULL;
                gStorage->numPartySpritesToCompact++;
            }
            targetPartyId++;
        }
    }
}

u8 GetNumPartySpritesCompacting(void)
{
    return gStorage->numPartySpritesToCompact;
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

    sprite->sMonX = (u16)(sprite->x) * 8;
    sprite->sMonY = (u16)(sprite->y) * 8;
    sprite->sSpeedX = ((x * 8) - sprite->sMonX) / 8;
    sprite->sSpeedY = ((y * 8) - sprite->sMonY) / 8;
    sprite->sMoveSteps = 8;
    sprite->callback = SpriteCB_MovePartySpriteToNextSlot;
}

static void SpriteCB_MovePartySpriteToNextSlot(struct Sprite *sprite)
{
    if (sprite->sMoveSteps != 0)
    {
        s16 x = sprite->sMonX += sprite->sSpeedX;
        s16 y = sprite->sMonY += sprite->sSpeedY;
        sprite->x = x / 8u;
        sprite->y = y / 8u;
        sprite->sMoveSteps--;
    }
    else
    {
        if (sprite->sPartyId == 0)
        {
            sprite->x = 104;
            sprite->y = 64;
        }
        else
        {
            sprite->x = 152;
            sprite->y = 8 * (3 * (sprite->sPartyId - 1)) + 16;
        }
        sprite->callback = SpriteCallbackDummy;
        gStorage->partySprites[sprite->sPartyId] = sprite;
        gStorage->numPartySpritesToCompact--;
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
    if (gStorage->movingMonSprite != NULL)
    {
        DestroyBoxMonIcon(gStorage->movingMonSprite);
        gStorage->movingMonSprite = NULL;
    }
}

void MovePartySprites(s16 yDelta)
{
    u16 i, posY;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (gStorage->partySprites[i] != NULL)
        {
            gStorage->partySprites[i]->y += yDelta;
            posY = gStorage->partySprites[i]->y + gStorage->partySprites[i]->y2 + gStorage->partySprites[i]->centerToCornerVecY;
            posY += 16;
            if (posY > 192)
                gStorage->partySprites[i]->invisible = TRUE;
            else
                gStorage->partySprites[i]->invisible = FALSE;
        }
    }
}

void DestroyPartyMonIcon(u8 partyId)
{
    if (gStorage->partySprites[partyId] != NULL)
    {
        DestroyBoxMonIcon(gStorage->partySprites[partyId]);
        gStorage->partySprites[partyId] = NULL;
    }
}

void DestroyAllPartyMonIcons(void)
{
    u16 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (gStorage->partySprites[i] != NULL)
        {
            DestroyBoxMonIcon(gStorage->partySprites[i]);
            gStorage->partySprites[i] = NULL;
        }
    }
}

void SetPartyMonIconObjMode(u8 partyId, u8 objMode)
{
    if (gStorage->partySprites[partyId] != NULL)
        gStorage->partySprites[partyId]->oam.objMode = objMode;
}

void SetMovingMonSprite(u8 mode, u8 id)
{
    if (mode == MODE_PARTY)
    {
        gStorage->movingMonSprite = gStorage->partySprites[id];
        gStorage->partySprites[id] = NULL;
    }
    else if (mode == MODE_BOX)
    {
        gStorage->movingMonSprite = gStorage->boxMonsSprites[id];
        gStorage->boxMonsSprites[id] = NULL;
    }
    else
        return;

    gStorage->movingMonSprite->callback = SpriteCB_HeldMon;
    gStorage->movingMonSprite->oam.priority = GetMonIconPriorityByCursorArea();
    gStorage->movingMonSprite->subpriority = 7;
}

void SetPlacedMonSprite(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT) // party mon
    {
        gStorage->partySprites[position] = gStorage->movingMonSprite;
        gStorage->partySprites[position]->oam.priority = 1;
        gStorage->partySprites[position]->subpriority = 12;
    }
    else
    {
        gStorage->boxMonsSprites[position] = gStorage->movingMonSprite;
        gStorage->boxMonsSprites[position]->oam.priority = 2;
        gStorage->boxMonsSprites[position]->subpriority = 19 - (position % IN_BOX_COLUMNS);
    }
    gStorage->movingMonSprite->callback = SpriteCallbackDummy;
    gStorage->movingMonSprite = NULL;
}

void SetShiftMonSpritePtr(u8 boxId, u8 position)
{
    if (boxId == TOTAL_BOXES_COUNT) // party mon
        gStorage->shiftMonSpritePtr = &gStorage->partySprites[position];
    else
        gStorage->shiftMonSpritePtr = &gStorage->boxMonsSprites[position];

    gStorage->movingMonSprite->callback = SpriteCallbackDummy;
    gStorage->shiftTimer = 0;
}

bool8 ShiftMons(void)
{
    if (gStorage->shiftTimer == 16)
        return FALSE;

    gStorage->shiftTimer++;
    if (gStorage->shiftTimer & 1)
    {
        (*gStorage->shiftMonSpritePtr)->y--;
        gStorage->movingMonSprite->y++;
    }

    (*gStorage->shiftMonSpritePtr)->x2 = gSineTable[gStorage->shiftTimer * 8] / 16;
    gStorage->movingMonSprite->x2 = -(gSineTable[gStorage->shiftTimer * 8] / 16);
    if (gStorage->shiftTimer == 8)
    {
        gStorage->movingMonSprite->oam.priority = (*gStorage->shiftMonSpritePtr)->oam.priority;
        gStorage->movingMonSprite->subpriority = (*gStorage->shiftMonSpritePtr)->subpriority;
        (*gStorage->shiftMonSpritePtr)->oam.priority = GetMonIconPriorityByCursorArea();
        (*gStorage->shiftMonSpritePtr)->subpriority = 7;
    }

    if (gStorage->shiftTimer == 16)
    {
        struct Sprite *sprite = gStorage->movingMonSprite;
        gStorage->movingMonSprite = (*gStorage->shiftMonSpritePtr);
        *gStorage->shiftMonSpritePtr = sprite;

        gStorage->movingMonSprite->callback = SpriteCB_HeldMon;
        (*gStorage->shiftMonSpritePtr)->callback = SpriteCallbackDummy;
    }

    return TRUE;
}

void DoReleaseMonAnim(u8 mode, u8 position)
{
    switch (mode)
    {
    case MODE_PARTY:
        gStorage->releaseMonSpritePtr = &gStorage->partySprites[position];
        break;
    case MODE_BOX:
        gStorage->releaseMonSpritePtr = &gStorage->boxMonsSprites[position];
        break;
    case MODE_MOVE:
        gStorage->releaseMonSpritePtr = &gStorage->movingMonSprite;
        break;
    default:
        return;
    }

    if (*gStorage->releaseMonSpritePtr != NULL)
    {
        InitSpriteAffineAnim(*gStorage->releaseMonSpritePtr);
        (*gStorage->releaseMonSpritePtr)->oam.affineMode = ST_OAM_AFFINE_NORMAL;
        (*gStorage->releaseMonSpritePtr)->affineAnims = sAffineAnims_ReleaseMon;
        StartSpriteAffineAnim(*gStorage->releaseMonSpritePtr, RELEASE_ANIM_RELEASE);
    }
}

bool8 TryHideReleaseMonSprite(void)
{
    if (*gStorage->releaseMonSpritePtr == NULL || (*gStorage->releaseMonSpritePtr)->invisible)
        return FALSE;

    if ((*gStorage->releaseMonSpritePtr)->affineAnimEnded)
        (*gStorage->releaseMonSpritePtr)->invisible = TRUE;

    return TRUE;
}

void DestroyReleaseMonIcon(void)
{
    if (*gStorage->releaseMonSpritePtr != NULL)
    {
        FreeOamMatrix((*gStorage->releaseMonSpritePtr)->oam.matrixNum);
        DestroyBoxMonIcon(*gStorage->releaseMonSpritePtr);
        *gStorage->releaseMonSpritePtr = NULL;
    }
}

void DoReleaseMonComeBackAnim(void)
{
    if (*gStorage->releaseMonSpritePtr != NULL)
    {
        (*gStorage->releaseMonSpritePtr)->invisible = FALSE;
        StartSpriteAffineAnim(*gStorage->releaseMonSpritePtr, RELEASE_ANIM_COME_BACK);
    }
}

bool8 ResetReleaseMonSpritePtr(void)
{
    if (gStorage->releaseMonSpritePtr == NULL)
        return FALSE;

    if ((*gStorage->releaseMonSpritePtr)->affineAnimEnded)
        gStorage->releaseMonSpritePtr = NULL;

    return TRUE;
}

void SetMovingMonPriority(u8 priority)
{
    gStorage->movingMonSprite->oam.priority = priority;
}

static void SpriteCB_HeldMon(struct Sprite *sprite)
{
    sprite->x = gStorage->cursorSprite->x;
    sprite->y = gStorage->cursorSprite->y + gStorage->cursorSprite->y2 + 4;
}

static u16 TryLoadMonIconTiles(u16 species)
{
    u16 i, offset;

    // Find the currently-allocated slot
    for (i = 0; i < MAX_MON_ICONS; i++)
    {
        if (gStorage->iconSpeciesList[i] == species)
            break;
    }

    if (i == MAX_MON_ICONS)
    {
        // Find the first empty slot
        for (i = 0; i < MAX_MON_ICONS; i++)
        {
            if (gStorage->iconSpeciesList[i] == SPECIES_NONE)
                break;
        }
        if (i == MAX_MON_ICONS)
            return 0xFFFF;
    }

    gStorage->iconSpeciesList[i] = species;
    gStorage->numIconsPerSpecies[i]++;
    offset = 16 * i;
    CpuCopy32(GetMonIconTiles(species, TRUE), (void *)(OBJ_VRAM0) + offset * 32, 0x200);

    return offset;
}

static void RemoveSpeciesFromIconList(u16 species)
{
    u16 i;

    for (i = 0; i < MAX_MON_ICONS; i++)
    {
        if (gStorage->iconSpeciesList[i] == species)
        {
            if (--gStorage->numIconsPerSpecies[i] == 0)
                gStorage->iconSpeciesList[i] = SPECIES_NONE;
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
    template.paletteTag = PALTAG_MON_ICON_0 + gMonIconPaletteIndices[species];
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

#define tState  data[0]
#define tDmaIdx data[1]
#define tBoxId  data[2]

void CreateInitBoxTask(u8 boxId)
{
    u8 taskId = CreateTask(Task_InitBox, 2);

    gTasks[taskId].tBoxId = boxId;
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
        gStorage->wallpaperOffset = 0;
        gStorage->bg2_X = 0;
        task->tDmaIdx = RequestDma3Fill(0, gStorage->wallpaperBgTilemapBuffer, sizeof(gStorage->wallpaperBgTilemapBuffer), DMA3_32BIT);
        break;
    case 1:
        if (WaitDma3Request(task->tDmaIdx) == -1)
            return;

        SetBgTilemapBuffer(2, gStorage->wallpaperBgTilemapBuffer);
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
        task->tState = 0;
        return;
    }

    task->tState++;
}

#undef tState
#undef tDmaIdx
#undef tBoxId

void SetUpScrollToBox(u8 boxId)
{
    s8 direction = DetermineBoxScrollDirection(boxId);

    gStorage->scrollSpeed = (direction > 0) ? 6 : -6;
    gStorage->scrollUnused1 = (direction > 0) ? 1 : 2;
    gStorage->scrollTimer = 32;
    gStorage->scrollToBoxIdUnused = boxId;
    gStorage->scrollUnused2 = (direction <= 0) ? 5 : 0;
    gStorage->scrollDirectionUnused = direction;
    gStorage->scrollUnused3 = (direction > 0) ? 264 : 56;
    gStorage->scrollUnused4 = (direction <= 0) ? 5 : 0;
    gStorage->scrollUnused5 = 0;
    gStorage->scrollUnused6 = 2;
    gStorage->scrollToBoxId = boxId;
    gStorage->scrollDirection = direction;
    gStorage->scrollState = 0;
}

bool8 ScrollToBox(void)
{
    bool8 isStillScrolling;

    switch (gStorage->scrollState)
    {
    case 0:
        LoadWallpaperGfx(gStorage->scrollToBoxId, gStorage->scrollDirection);
        gStorage->scrollState++;
    case 1:
        if (!WaitForWallpaperGfxLoad())
            return TRUE;

        InitBoxMonIconScroll(gStorage->scrollToBoxId, gStorage->scrollDirection);
        CreateIncomingBoxTitle(gStorage->scrollToBoxId, gStorage->scrollDirection);
        StartBoxScrollArrowsSlide(gStorage->scrollDirection);
        break;
    case 2:
        isStillScrolling = UpdateBoxMonIconScroll();
        if (gStorage->scrollTimer != 0)
        {
            gStorage->bg2_X += gStorage->scrollSpeed;
            if (--gStorage->scrollTimer != 0)
                return TRUE;
            CycleBoxTitleSprites();
            StopBoxScrollArrowsSlide();
        }
        return isStillScrolling;
    }

    gStorage->scrollState++;
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

void SetWallpaperForCurrentBox(u8 wallpaperId)
{
    SetBoxWallpaper(StorageGetCurrentBox(), wallpaperId);
    gStorage->wallpaperChangeState = 0;
}

bool8 DoWallpaperGfxChange(void)
{
    switch (gStorage->wallpaperChangeState)
    {
    case 0:
        BeginNormalPaletteFade(gStorage->wallpaperPalBits, 1, 0, 16, RGB_WHITEALPHA);
        gStorage->wallpaperChangeState++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            u8 curBox = StorageGetCurrentBox();
            LoadWallpaperGfx(curBox, 0);
            gStorage->wallpaperChangeState++;
        }
        break;
    case 2:
        if (WaitForWallpaperGfxLoad() == TRUE)
        {
            CycleBoxTitleColor();
            BeginNormalPaletteFade(gStorage->wallpaperPalBits, 1, 16, 0, RGB_WHITEALPHA);
            gStorage->wallpaperChangeState++;
        }
        break;
    case 3:
        if (!UpdatePaletteFade())
            gStorage->wallpaperChangeState++;
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

static void LoadWallpaperGfx(u8 boxId, s8 direction)
{
    u8 wallpaperId;
    const struct Wallpaper *wallpaper;

    gStorage->wallpaperLoadState = 0;
    gStorage->wallpaperLoadBoxId = boxId;
    gStorage->wallpaperLoadDir = direction;
    if (gStorage->wallpaperLoadDir != 0)
    {
        gStorage->wallpaperOffset = !gStorage->wallpaperOffset;
        TrimOldWallpaper(gStorage->wallpaperBgTilemapBuffer);
    }

    wallpaperId = GetBoxWallpaper(gStorage->wallpaperLoadBoxId);
    wallpaper = &sWallpapers[wallpaperId];
    LZ77UnCompWram(wallpaper->tileMap, gStorage->wallpaperTilemap);
    DrawWallpaper(gStorage->wallpaperBgTilemapBuffer, gStorage->wallpaperTilemap, gStorage->wallpaperLoadDir, gStorage->wallpaperOffset);

    if (gStorage->wallpaperLoadDir != 0)
        LoadPalette(wallpaper->palettes, BG_PLTT_ID(4) + BG_PLTT_ID(gStorage->wallpaperOffset * 2), 2 * PLTT_SIZE_4BPP);
    else
        CpuCopy16(wallpaper->palettes, &gPlttBufferUnfaded[BG_PLTT_ID(4) + BG_PLTT_ID(gStorage->wallpaperOffset * 2)], 2 * PLTT_SIZE_4BPP);

    DecompressAndLoadBgGfxUsingHeap(2, wallpaper->tiles, 0, 256 * gStorage->wallpaperOffset, 0);

    CopyBgTilemapBufferToVram(2);
}

static bool32 WaitForWallpaperGfxLoad(void)
{
    if (IsDma3ManagerBusyWithBgCopy() == TRUE)
        return FALSE;

    return TRUE;
}

static void DrawWallpaper(void *unused, const void *tilemap, s8 direction, u8 offset)
{
    s16 paletteNum = (offset * 2) + 3;
    s16 x = ((gStorage->bg2_X / 8 + 10) + (direction * 24)) & 0x3F;

    CopyRectToBgTilemapBufferRect(2, tilemap, 0, 0, 20, 18, x, 2, 20, 18, 17, offset << 8, paletteNum);

    if (direction == 0)
        return;
    else if (direction > 0)
        x *= 1, x += 20; // x * 1 is needed to match
    else
        x -= 4;

    FillBgTilemapBufferRect(2, 0, x, 2, 4, 18, 17);
}

static void TrimOldWallpaper(void *tilemapBuffer)
{
    u16 i;
    u16 *dest = tilemapBuffer;
    s16 right = ((gStorage->bg2_X / 8 + 10) + 20) & 0x3F;

    if (right < 32)
        dest += right + 0x260;
    else
        dest += right + 0x640;

    for (i = 0; i < 44; i++)
    {
        *dest++ = 0;
        right = (right + 1) & 0x3F;
        if (right == 0)
            dest -= 0x420;
        if (right == 32)
            dest += 0x3e0;
    }
}

static void InitBoxTitle(u8 boxId)
{
    u8 tagIndex;
    s16 x;
    u16 i;

    struct SpriteSheet spriteSheet = {gStorage->boxTitleTiles, 0x200, GFXTAG_BOX_TITLE};
    struct SpritePalette palettes[] = {
        {gStorage->boxTitlePal, PALTAG_BOX_TITLE},
        {}
    };

    u16 wallpaperId = GetBoxWallpaper(boxId);

    gStorage->boxTitlePal[14] = sBoxTitleColors[wallpaperId][0];
    gStorage->boxTitlePal[15] = sBoxTitleColors[wallpaperId][1];
    LoadSpritePalettes(palettes);
    gStorage->wallpaperPalBits = 0x3F0;

    tagIndex = IndexOfSpritePaletteTag(PALTAG_BOX_TITLE);
    gStorage->boxTitlePalOffset = OBJ_PLTT_ID(tagIndex) + 14;
    gStorage->wallpaperPalBits |= (1 << 16) << tagIndex;

    tagIndex = IndexOfSpritePaletteTag(PALTAG_BOX_TITLE);
    gStorage->boxTitleAltPalOffset = OBJ_PLTT_ID(tagIndex) + 14;
    gStorage->wallpaperPalBits |= (1 << 16) << tagIndex;

    StringCopyPadded(gStorage->boxTitleText, GetBoxNamePtr(boxId), 0, 8);
    DrawTextWindowAndBufferTiles(gStorage->boxTitleText, gStorage->boxTitleTiles, 0, 0, gStorage->boxTitleUnused, 2);
    LoadSpriteSheet(&spriteSheet);
    x = GetBoxTitleBaseX(GetBoxNamePtr(boxId));

    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&sSpriteTemplate_BoxTitle, x + i * 32, 28, 24);
        gStorage->curBoxTitleSprites[i] = &gSprites[spriteId];
        StartSpriteAnim(gStorage->curBoxTitleSprites[i], i);
    }
    gStorage->boxTitleCycleId = 0;
}

static void CreateIncomingBoxTitle(u8 boxId, s8 direction)
{
    u16 palOffset;
    s16 x, adjustedX;
    u16 i;
    struct SpriteSheet spriteSheet = {gStorage->boxTitleTiles, 0x200, GFXTAG_BOX_TITLE};
    struct SpriteTemplate template = sSpriteTemplate_BoxTitle;

    gStorage->boxTitleCycleId = !gStorage->boxTitleCycleId;
    if (gStorage->boxTitleCycleId == 0)
    {
        spriteSheet.tag = GFXTAG_BOX_TITLE;
        palOffset = gStorage->boxTitlePalOffset;
    }
    else
    {
        spriteSheet.tag = GFXTAG_BOX_TITLE_ALT;
        palOffset = gStorage->boxTitlePalOffset;
        template.tileTag = GFXTAG_BOX_TITLE_ALT;
        template.paletteTag = PALTAG_BOX_TITLE;
    }

    StringCopyPadded(gStorage->boxTitleText, GetBoxNamePtr(boxId), 0, BOX_NAME_LENGTH);
    DrawTextWindowAndBufferTiles(gStorage->boxTitleText, gStorage->boxTitleTiles, 0, 0, gStorage->boxTitleUnused, 2);
    LoadSpriteSheet(&spriteSheet);
    LoadPalette(sBoxTitleColors[GetBoxWallpaper(boxId)], palOffset, sizeof(sBoxTitleColors[0]));
    x = GetBoxTitleBaseX(GetBoxNamePtr(boxId));
    adjustedX = x;
    adjustedX += direction * 192;

    // Title is split across two sprites
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&template, i * 32 + adjustedX, 28, 24);

        gStorage->nextBoxTitleSprites[i] = &gSprites[spriteId];
        gStorage->nextBoxTitleSprites[i]->data[0] = (-direction) * 6;
        gStorage->nextBoxTitleSprites[i]->data[1] = i * 32 + x;
        gStorage->nextBoxTitleSprites[i]->data[2] = 0;
        gStorage->nextBoxTitleSprites[i]->callback = SpriteCB_IncomingBoxTitle;
        StartSpriteAnim(gStorage->nextBoxTitleSprites[i], i);

        gStorage->curBoxTitleSprites[i]->data[0] = (-direction) * 6;
        gStorage->curBoxTitleSprites[i]->data[1] = 1;
        gStorage->curBoxTitleSprites[i]->callback = SpriteCB_OutgoingBoxTitle;
    }
}

static void CycleBoxTitleSprites(void)
{
    if (gStorage->boxTitleCycleId == 0)
        FreeSpriteTilesByTag(GFXTAG_BOX_TITLE_ALT);
    else
        FreeSpriteTilesByTag(GFXTAG_BOX_TITLE);

    gStorage->curBoxTitleSprites[0] = gStorage->nextBoxTitleSprites[0];
    gStorage->curBoxTitleSprites[1] = gStorage->nextBoxTitleSprites[1];
}

static void SpriteCB_IncomingBoxTitle(struct Sprite *sprite)
{
    if (sprite->data[2] != 0)
        sprite->data[2]--;
    else if ((sprite->x += sprite->data[0]) == sprite->data[1])
        sprite->callback = SpriteCallbackDummy;
}

static void SpriteCB_OutgoingBoxTitle(struct Sprite *sprite)
{
    if (sprite->data[1] != 0)
        sprite->data[1]--;
    else
    {
        sprite->x += sprite->data[0];
        sprite->data[2] = sprite->x + sprite->x2;
        if (sprite->data[2] < 0x40 || sprite->data[2] > 0x100)
            DestroySprite(sprite);
    }
}

static void CycleBoxTitleColor(void)
{
    u8 boxId = StorageGetCurrentBox();
    u8 wallpaperId = GetBoxWallpaper(boxId);
    if (gStorage->boxTitleCycleId == 0)
        CpuCopy16(sBoxTitleColors[wallpaperId], &gPlttBufferUnfaded[gStorage->boxTitlePalOffset], PLTT_SIZEOF(2));
    else
        CpuCopy16(sBoxTitleColors[wallpaperId], &gPlttBufferUnfaded[gStorage->boxTitleAltPalOffset], PLTT_SIZEOF(2));
}

static s16 GetBoxTitleBaseX(const u8 *string)
{
    return DISPLAY_WIDTH - 64 - GetStringWidth(FONT_NORMAL_COPY_1, string, 0) / 2;
}

// Sprite data for box scroll arrows
#define sState data[0]
#define sTimer data[1]
#define sSpeed data[3]

static void CreateBoxScrollArrows(void)
{
    u16 i;

    LoadSpriteSheet(&sSpriteSheet_BoxScrollArrow);
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&sSpriteTemplate_BoxScrollArrow, 92 + i * 136, 28, 22);
        if (spriteId != MAX_SPRITES)
        {
            struct Sprite *sprite = &gSprites[spriteId];
            StartSpriteAnim(sprite, i);
            sprite->sSpeed = (i == 0) ? -1 : 1;
            gStorage->arrowSprites[i] = sprite;
        }
    }
    if (IsCursorOnBoxTitle())
        AnimateBoxScrollArrows(TRUE);
}

// Slide box scroll arrows horizontally for box change
static void StartBoxScrollArrowsSlide(s8 direction)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        gStorage->arrowSprites[i]->x2 = 0;
        gStorage->arrowSprites[i]->sState = 2;
    }
    if (direction < 0)
    {
        gStorage->arrowSprites[0]->sTimer = 29;
        gStorage->arrowSprites[1]->sTimer = 5;
        gStorage->arrowSprites[0]->data[2] = 72;
        gStorage->arrowSprites[1]->data[2] = 72;
    }
    else
    {
        gStorage->arrowSprites[0]->sTimer = 5;
        gStorage->arrowSprites[1]->sTimer = 29;
        gStorage->arrowSprites[0]->data[2] = DISPLAY_WIDTH + 8;
        gStorage->arrowSprites[1]->data[2] = DISPLAY_WIDTH + 8;
    }
    gStorage->arrowSprites[0]->data[7] = 0;
    gStorage->arrowSprites[1]->data[7] = 1;
}

// New box's scroll arrows have entered, stop sliding and set their position
static void StopBoxScrollArrowsSlide(void)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        gStorage->arrowSprites[i]->x = 136 * i + 92;
        gStorage->arrowSprites[i]->x2 = 0;
        gStorage->arrowSprites[i]->invisible = FALSE;
    }
    AnimateBoxScrollArrows(TRUE);
}

// Bounce scroll arrows while title is selected
void AnimateBoxScrollArrows(bool8 animate)
{
    u16 i;

    if (animate)
    {
        // Start arrows moving
        for (i = 0; i < 2; i++)
        {
            gStorage->arrowSprites[i]->sState = 1;
            gStorage->arrowSprites[i]->sTimer = 0;
            gStorage->arrowSprites[i]->data[2] = 0;
            gStorage->arrowSprites[i]->data[4] = 0;
        }
    }
    else
    {
        // Stop arrows moving
        for (i = 0; i < 2; i++)
            gStorage->arrowSprites[i]->sState = 0;
    }
}

static void SpriteCB_BoxScrollArrow(struct Sprite *sprite)
{
    switch (sprite->sState)
    {
    case 0:
        sprite->x2 = 0;
        break;
    case 1:
        if (++sprite->sTimer > 3)
        {
            sprite->sTimer = 0;
            sprite->x2 += sprite->sSpeed;
            if (++sprite->data[2] > 5)
            {
                sprite->data[2] = 0;
                sprite->x2 = 0;
            }
        }
        break;
    case 2:
        sprite->sState = 3;
        break;
    case 3:
        sprite->x -= gStorage->scrollSpeed;
        if (sprite->x <= 72 || sprite->x >= DISPLAY_WIDTH + 8)
            sprite->invisible = TRUE;
        if (--sprite->sTimer == 0)
        {
            sprite->x = sprite->data[2];
            sprite->invisible = FALSE;
            sprite->sState = 4;
        }
        break;
    case 4:
        sprite->x -= gStorage->scrollSpeed;
        break;
    }
}

#undef sState
#undef sTimer
#undef sSpeed

// Arrows for Deposit/Jump Box selection
struct Sprite *CreateChooseBoxArrows(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_BoxScrollArrow, x, y, subpriority);
    if (spriteId == MAX_SPRITES)
        return NULL;

    animId %= 2;
    StartSpriteAnim(&gSprites[spriteId], animId);
    gSprites[spriteId].oam.priority = priority;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    return &gSprites[spriteId];
}
