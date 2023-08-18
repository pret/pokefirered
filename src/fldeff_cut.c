#include "global.h"
#include "gflib.h"
#include "event_object_lock.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "fieldmap.h"
#include "field_camera.h"
#include "field_specials.h"
#include "fldeff.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "party_menu.h"
#include "script.h"
#include "trig.h"
#include "constants/event_objects.h"
#include "constants/songs.h"
#include "constants/metatile_labels.h"

#define CUT_GRASS_SPRITE_COUNT 8
#define CUT_SIDE 3

static EWRAM_DATA u8 *sCutGrassSpriteArrayPtr = NULL;
static EWRAM_DATA bool8 sScheduleOpenDottedHole = FALSE;

static void FieldCallback_CutGrass(void);
static void FieldCallback_CutTree(void);
static void FieldMoveCallback_CutGrass(void);
static void SetCutGrassMetatileAt(s16 x, s16 y);
static void SpriteCallback_CutGrass_Init(struct Sprite *sprite);
static void SpriteCallback_CutGrass_Run(struct Sprite *sprite);
static void SpriteCallback_CutGrass_Cleanup(struct Sprite *sprite);
static void FieldMoveCallback_CutTree(void);

static const u16 sCutGrassMetatileMapping[][2] = {
    {
        METATILE_ID(General, Plain_Grass),
        METATILE_ID(General, Plain_Mowed)
    }, {
        METATILE_ID(General, ThinTreeTop_Grass),
        METATILE_ID(General, ThinTreeTop_Mowed)
    }, {
        METATILE_ID(General, WideTreeTopLeft_Grass),
        METATILE_ID(General, WideTreeTopLeft_Mowed)
    }, {
        METATILE_ID(General, WideTreeTopRight_Grass),
        METATILE_ID(General, WideTreeTopRight_Mowed)
    }, {
        METATILE_ID(CeladonCity, CyclingRoad_Grass),
        METATILE_ID(CeladonCity, CyclingRoad_Mowed)
    }, {
        METATILE_ID(FuchsiaCity, SafariZoneTreeTopLeft_Grass),
        METATILE_ID(FuchsiaCity, SafariZoneTreeTopLeft_Mowed)
    }, {
        METATILE_ID(FuchsiaCity, SafariZoneTreeTopMiddle_Grass),
        METATILE_ID(FuchsiaCity, SafariZoneTreeTopMiddle_Mowed)
    }, {
        METATILE_ID(FuchsiaCity, SafariZoneTreeTopRight_Grass),
        METATILE_ID(FuchsiaCity, SafariZoneTreeTopRight_Mowed)
    }, {
        METATILE_ID(ViridianForest, HugeTreeTopMiddle_Grass),
        METATILE_ID(ViridianForest, HugeTreeTopMiddle_Mowed)
    }, {
        0xffff,
        0xffff
    }
};

static const struct OamData sOamData_FldEff_CutGrass = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0x001,
    .priority = 1,
    .paletteNum = 1,
    .affineParam = 0
};

static const union AnimCmd sSpriteAnim_Fldeff_CutGrass_0[] = {
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAnimTable_FldEff_CutGrass[] = {
    sSpriteAnim_Fldeff_CutGrass_0
};

static const struct SpriteFrameImage sSpriteFrameImages_FldEff_CutGrass[] = {
    {gFieldEffectObjectPic_CutGrass, 0x20}
};

const struct SpritePalette gFldEffPalette_CutGrass[] = {
    gFieldEffectPal_CutGrass, 4096
};

static const struct SpriteTemplate sSpriteTemplate_FldEff_CutGrass = {
    .tileTag = 0xFFFF,
    .paletteTag = 4096,
    .oam = &sOamData_FldEff_CutGrass,
    .anims = sSpriteAnimTable_FldEff_CutGrass,
    .images = sSpriteFrameImages_FldEff_CutGrass,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_CutGrass_Init
};

static u8 MetatileAtCoordsIsGrassTile(s16 x, s16 y)
{
    return TestMetatileAttributeBit(MapGridGetMetatileAttributeAt(x, y, METATILE_ATTRIBUTE_TERRAIN), TILE_TERRAIN_GRASS);
}

bool8 SetUpFieldMove_Cut(void)
{
    s16 x, y;
    u8 i, j;
    sScheduleOpenDottedHole = FALSE;
    if (CutMoveRuinValleyCheck() == TRUE)
    {
        sScheduleOpenDottedHole = TRUE;
        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_CutGrass;
        return TRUE;
    }

    if (CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_CUT_TREE) == TRUE)
    {
        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_CutTree;
        return TRUE;
    }
    
    else
    {
        PlayerGetDestCoords(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    
        for (i = 0; i < CUT_SIDE; i++)
        {
            y = gPlayerFacingPosition.y - 1 + i;
            for (j = 0; j < CUT_SIDE; j++)
            {
                x = gPlayerFacingPosition.x - 1 + j;
                if (MapGridGetElevationAt(x, y) == gPlayerFacingPosition.elevation)
                {
                    if (MetatileAtCoordsIsGrassTile(x, y) == TRUE)
                    {
                        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
                        gPostMenuFieldCallback = FieldCallback_CutGrass;
                        return TRUE;
                    }
                }
            }
        }
        return FALSE;
    }
}

static void FieldCallback_CutGrass(void)
{
    FieldEffectStart(FLDEFF_USE_CUT_ON_GRASS);
    gFieldEffectArguments[0] = GetCursorSelectionMonId();
}

bool8 FldEff_UseCutOnGrass(void)
{
    u8 taskId = CreateFieldEffectShowMon();
    FLDEFF_SET_FUNC_TO_DATA(FieldMoveCallback_CutGrass);
    IncrementGameStat(GAME_STAT_USED_CUT);
    return FALSE;
}

static void FieldCallback_CutTree(void)
{
    gFieldEffectArguments[0] = GetCursorSelectionMonId();
    ScriptContext_SetupScript(EventScript_FldEffCut);
}

bool8 FldEff_UseCutOnTree(void)
{
    u8 taskId = CreateFieldEffectShowMon();
    FLDEFF_SET_FUNC_TO_DATA(FieldMoveCallback_CutTree);
    IncrementGameStat(GAME_STAT_USED_CUT);
    return FALSE;
}

static void FieldMoveCallback_CutGrass(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_CUT_ON_GRASS);
    if (sScheduleOpenDottedHole == TRUE)
        CutMoveOpenDottedHoleDoor();
    else
        FieldEffectStart(FLDEFF_CUT_GRASS);
}

bool8 FldEff_CutGrass(void)
{
    u8 i, j;
    s16 x, y;
    u8 pos;

    i = 0;
    PlaySE(SE_M_CUT);
    pos = gFieldEffectArguments[1] - 1;
    PlayerGetDestCoords(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);

    for (i = 0; i < CUT_SIDE; i++)
    {
        y = gPlayerFacingPosition.y - 1 + i;
        for (j = 0; j < CUT_SIDE; j++)
        {
            x = gPlayerFacingPosition.x - 1 + j;
            if (MapGridGetElevationAt(x, y) == gPlayerFacingPosition.elevation)
            {
                if (MetatileAtCoordsIsGrassTile(x, y) == TRUE)
                {
                    SetCutGrassMetatileAt(x, y);
                    EnableObjectGroundEffectsByXY(x, y);
                }
            }
        }
    }
    DrawWholeMapView();
    sCutGrassSpriteArrayPtr = Alloc(CUT_GRASS_SPRITE_COUNT);
    for (i = 0; i < 8; i++)
    {
        sCutGrassSpriteArrayPtr[i] = CreateSprite(&sSpriteTemplate_FldEff_CutGrass, gSprites[gPlayerAvatar.spriteId].oam.x + 8, gSprites[gPlayerAvatar.spriteId].oam.y + 20, 0);
        gSprites[sCutGrassSpriteArrayPtr[i]].data[2] = i * (0x100 / CUT_GRASS_SPRITE_COUNT);
    }
    return FALSE;
}

static void SetCutGrassMetatileAt(s16 x, s16 y)
{
    u16 i = 0;
    u16 metatileId = MapGridGetMetatileIdAt(x, y);
    while (1)
    {
        if (sCutGrassMetatileMapping[i][0] == 0xFFFF)
            return;
        if (sCutGrassMetatileMapping[i][0] == metatileId)
        {
            MapGridSetMetatileIdAt(x, y, sCutGrassMetatileMapping[i][1]);
            break;
        }
        i++;
    }
}

static void SpriteCallback_CutGrass_Init(struct Sprite *sprite)
{
    sprite->data[0] = 8;
    sprite->data[1] = 0;
    sprite->data[3] = 0;
    sprite->callback = SpriteCallback_CutGrass_Run;
}

static void SpriteCallback_CutGrass_Run(struct Sprite *sprite)
{
    sprite->x2 = Sin(sprite->data[2], sprite->data[0]);
    sprite->y2 = Cos(sprite->data[2], sprite->data[0]);
    sprite->data[2] += 8;
    sprite->data[2] &= 0xFF;
    sprite->data[0]++;
    sprite->data[0] += sprite->data[3] >> 2;
    sprite->data[3]++;
    if (sprite->data[1] != 28)
        sprite->data[1]++;
    else
        sprite->callback = SpriteCallback_CutGrass_Cleanup;
}

static void SpriteCallback_CutGrass_Cleanup(struct Sprite *sprite)
{
    u8 i;
    for (i = 1; i < CUT_GRASS_SPRITE_COUNT; i++)
    {
        DestroySprite(&gSprites[sCutGrassSpriteArrayPtr[i]]);
    }
    FieldEffectStop(&gSprites[sCutGrassSpriteArrayPtr[0]], FLDEFF_CUT_GRASS);
    Free(sCutGrassSpriteArrayPtr);
    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
}

static void FieldMoveCallback_CutTree(void)
{
    PlaySE(SE_M_CUT);
    FieldEffectActiveListRemove(FLDEFF_USE_CUT_ON_TREE);
    ScriptContext_Enable();
}
