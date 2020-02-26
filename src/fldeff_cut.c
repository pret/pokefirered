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

static EWRAM_DATA u8 *sCutGrassSpriteArrayPtr = NULL;
static EWRAM_DATA bool8 sScheduleOpenDottedHole = FALSE;

static void FieldCallback_CutGrass(void);
static void FieldCallback_CutTree(void);
static void sub_8097A20(void);
static void sub_8097B50(s16 x, s16 y);
static void objc_8097BA8(struct Sprite * sprite);
static void objc_8097BBC(struct Sprite * sprite);
static void sub_8097C18(struct Sprite * sprite);
static void sub_8097C6C(void);

static const u16 sCutGrassMetatileMapping[][2] = {
    {0x000d, 0x0001},
    {0x000a, 0x0013},
    {0x000b, 0x000e},
    {0x000c, 0x000f},
    {0x0352, 0x033e},
    {0x0300, 0x0310},
    {0x0301, 0x0311},
    {0x0302, 0x0312},
    {0x0284, 0x0281},
    {0xffff, 0xffff}
};

static const struct OamData gOamData_83D4128 = {
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
    .paletteNum = 0x1,
    .affineParam = 0
};

static const union AnimCmd gAnimCmd_83D4130[] = {
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const gSpriteAnimTable_83D4138[] = {
    gAnimCmd_83D4130
};

static const struct SpriteFrameImage gUnknown_83D413C[] = {
    {gUnknown_8398648, 0x20}
};

const struct SpritePalette gUnknown_83D4144[] = {
    gUnknown_8398688, 4096
};

static const struct SpriteTemplate sSpriteTemplate_CutGrass = {
    .tileTag = 0xFFFF,
    .paletteTag = 4096,
    .oam = &gOamData_83D4128,
    .anims = gSpriteAnimTable_83D4138,
    .images = gUnknown_83D413C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = objc_8097BA8
};

static u8 MetatileAtCoordsIsGrassTile(s16 x, s16 y)
{
    return TestMetatileAttributeBit(MapGridGetMetatileAttributeAt(x, y, 1), 1);
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
        register s32 neg1 asm("r8");
        struct MapPosition *pos;
        PlayerGetDestCoords(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);

        for (i = 0, pos = &gPlayerFacingPosition, neg1 = 0xFFFF; i < 3; i++)
        {

            y = i + neg1 + pos->y;
            for (j = 0; j < 3; j++)
            {
                x = j + neg1 + pos->x;
                if (MapGridGetZCoordAt(x, y) == pos->height)
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

bool8 sub_80979A0(void)
{
    u8 taskId = oei_task_add();
    FLDEFF_SET_FUNC_TO_DATA(sub_8097A20);
    IncrementGameStat(GAME_STAT_USED_CUT);
    return FALSE;
}

static void FieldCallback_CutTree(void)
{
    gFieldEffectArguments[0] = GetCursorSelectionMonId();
    ScriptContext1_SetupScript(EventScript_FldEffCut);
}

bool8 sub_80979F0(void)
{
    u8 taskId = oei_task_add();
    FLDEFF_SET_FUNC_TO_DATA(sub_8097C6C);
    IncrementGameStat(GAME_STAT_USED_CUT);
    return FALSE;
}

static void sub_8097A20(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_CUT_ON_GRASS);
    if (sScheduleOpenDottedHole == TRUE)
        CutMoveOpenDottedHoleDoor();
    else
        FieldEffectStart(FLDEFF_CUT_GRASS);
}

bool8 sub_8097A48(void)
{
    u8 i, j;
    s16 x, y;
    register s32 neg1 asm("r9");
    struct MapPosition *pos;

    i = 0;
    PlaySE(SE_W015);
    PlayerGetDestCoords(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);

    for (i = 0, pos = &gPlayerFacingPosition, neg1 = 0xFFFF; i < 3; i++)
    {

        y = i + neg1 + pos->y;
        for (j = 0; j < 3; j++)
        {
            x = j + neg1 + pos->x;
            if (MapGridGetZCoordAt(x, y) == pos->height)
            {
                if (MetatileAtCoordsIsGrassTile(x, y) == TRUE)
                {
                    sub_8097B50(x, y);
                    sub_805F378(x, y);
                }
            }
        }
    }
    DrawWholeMapView();
    sCutGrassSpriteArrayPtr = Alloc(8);
    for (i = 0; i < 8; i++)
    {
        sCutGrassSpriteArrayPtr[i] = CreateSprite(&sSpriteTemplate_CutGrass, gSprites[gPlayerAvatar.spriteId].oam.x + 8, gSprites[gPlayerAvatar.spriteId].oam.y + 20, 0);
        gSprites[sCutGrassSpriteArrayPtr[i]].data[2] = i * 32;
    }
    return FALSE;
}

static void sub_8097B50(s16 x, s16 y)
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

static void objc_8097BA8(struct Sprite * sprite)
{
    sprite->data[0] = 8;
    sprite->data[1] = 0;
    sprite->data[3] = 0;
    sprite->callback = objc_8097BBC;
}

static void objc_8097BBC(struct Sprite * sprite)
{
    sprite->pos2.x = Sin(sprite->data[2], sprite->data[0]);
    sprite->pos2.y = Cos(sprite->data[2], sprite->data[0]);
    sprite->data[2] += 8;
    sprite->data[2] &= 0xFF;
    sprite->data[0]++;
    sprite->data[0] += sprite->data[3] >> 2;
    sprite->data[3]++;
    if (sprite->data[1] != 28)
        sprite->data[1]++;
    else
        sprite->callback = sub_8097C18;
}

static void sub_8097C18(struct Sprite * sprite)
{
    u8 i;
    for (i = 1; i < 8; i++)
    {
        DestroySprite(&gSprites[sCutGrassSpriteArrayPtr[i]]);
    }
    FieldEffectStop(&gSprites[sCutGrassSpriteArrayPtr[0]], FLDEFF_CUT_GRASS);
    Free(sCutGrassSpriteArrayPtr);
    sub_80696C0();
    ScriptContext2_Disable();
}

static void sub_8097C6C(void)
{
    PlaySE(SE_W015);
    FieldEffectActiveListRemove(FLDEFF_USE_CUT_ON_TREE);
    EnableBothScriptContexts();
}
