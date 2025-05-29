#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_gimmick.h"
#include "decompress.h"
#include "graphics.h"
#include "pokedex.h"
#include "sprite.h"
#include "type_icons.h"

static void LoadTypeSpritesAndPalettes(void);
static void LoadTypeIconsPerBattler(u32, u32);

static bool32 UseDoubleBattleCoords(u32);

static u32 GetMonPublicType(u32, u32);
static bool32 ShouldHideUncaughtType(u32 species);
static bool32 ShouldHideUnseenType(u32 species);
static u32 GetMonDefensiveTeraType(struct Pokemon *, struct Pokemon*, u32, u32, u32, u32);
static u32 IsIllusionActiveAndTypeUnchanged(struct Pokemon*, u32, u32);

static void CreateSpriteFromType(u32, bool32, u32[], u32, u32);
static bool32 ShouldSkipSecondType(u32[], u32);
static void SetTypeIconXY(s32*, s32*, u32, bool32, u32);

static void CreateSpriteAndSetTypeSpriteAttributes(u32, u32 x, u32 y, u32, u32, bool32);
static bool32 ShouldFlipTypeIcon(bool32, u32, u32);

static void SpriteCB_TypeIcon(struct Sprite*);
static void DestroyTypeIcon(struct Sprite*);
static void FreeAllTypeIconResources(void);
static bool32 ShouldHideTypeIcon(u32);
static s32 GetTypeIconHideMovement(bool32, u32);
static s32 GetTypeIconSlideMovement(bool32, u32, s32);
static s32 GetTypeIconBounceMovement(s32, u32);

const struct Coords16 sTypeIconPositions[][2] =
{
    [B_POSITION_PLAYER_LEFT] =
    {
        [FALSE] = {221, 86},
        [TRUE] = {144, 71},
    },
    [B_POSITION_OPPONENT_LEFT] =
    {
        [FALSE] = {20, 26},
        [TRUE] = {97, 14},
    },
    [B_POSITION_PLAYER_RIGHT] =
    {
        [TRUE] = {156, 96},
    },
    [B_POSITION_OPPONENT_RIGHT] =
    {
        [TRUE] = {85, 39},
    },
};

const union AnimCmd sSpriteAnim_TypeIcon_Normal[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_NORMAL), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Fighting[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_FIGHTING), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Flying[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_FLYING), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Poison[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_POISON), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Ground[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_GROUND), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Rock[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_ROCK), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Bug[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_BUG), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Ghost[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_GHOST), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Steel[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_STEEL), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Mystery[] =
{
    ANIMCMD_FRAME(TYPE_ICON_1_FRAME(TYPE_MYSTERY), 0),
    ANIMCMD_END
};

const union AnimCmd sSpriteAnim_TypeIcon_Fire[] =
{
    ANIMCMD_FRAME(TYPE_ICON_2_FRAME(TYPE_FIRE), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Water[] =
{
    ANIMCMD_FRAME(TYPE_ICON_2_FRAME(TYPE_WATER), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Grass[] =
{
    ANIMCMD_FRAME(TYPE_ICON_2_FRAME(TYPE_GRASS), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Electric[] =
{
    ANIMCMD_FRAME(TYPE_ICON_2_FRAME(TYPE_ELECTRIC), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Psychic[] =
{
    ANIMCMD_FRAME(TYPE_ICON_2_FRAME(TYPE_PSYCHIC), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Ice[] =
{
    ANIMCMD_FRAME(TYPE_ICON_2_FRAME(TYPE_ICE), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Dragon[] =
{
    ANIMCMD_FRAME(TYPE_ICON_2_FRAME(TYPE_DRAGON), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Dark[] =
{
    ANIMCMD_FRAME(TYPE_ICON_2_FRAME(TYPE_DARK), 0),
    ANIMCMD_END
};
const union AnimCmd sSpriteAnim_TypeIcon_Fairy[] =
{
    ANIMCMD_FRAME(TYPE_ICON_2_FRAME(TYPE_FAIRY), 0),
    ANIMCMD_END
};

const union AnimCmd *const sSpriteAnimTable_TypeIcons[] =
{
    [TYPE_NONE] =       sSpriteAnim_TypeIcon_Mystery,
    [TYPE_NORMAL] =     sSpriteAnim_TypeIcon_Normal,
    [TYPE_FIGHTING] =   sSpriteAnim_TypeIcon_Fighting,
    [TYPE_FLYING] =     sSpriteAnim_TypeIcon_Flying,
    [TYPE_POISON] =     sSpriteAnim_TypeIcon_Poison,
    [TYPE_GROUND] =     sSpriteAnim_TypeIcon_Ground,
    [TYPE_ROCK] =       sSpriteAnim_TypeIcon_Rock,
    [TYPE_BUG] =        sSpriteAnim_TypeIcon_Bug,
    [TYPE_GHOST] =      sSpriteAnim_TypeIcon_Ghost,
    [TYPE_STEEL] =      sSpriteAnim_TypeIcon_Steel,
    [TYPE_MYSTERY] =    sSpriteAnim_TypeIcon_Mystery,
    [TYPE_FIRE] =       sSpriteAnim_TypeIcon_Fire,
    [TYPE_WATER] =      sSpriteAnim_TypeIcon_Water,
    [TYPE_GRASS] =      sSpriteAnim_TypeIcon_Grass,
    [TYPE_ELECTRIC] =   sSpriteAnim_TypeIcon_Electric,
    [TYPE_PSYCHIC] =    sSpriteAnim_TypeIcon_Psychic,
    [TYPE_ICE] =        sSpriteAnim_TypeIcon_Ice,
    [TYPE_DRAGON] =     sSpriteAnim_TypeIcon_Dragon,
    [TYPE_DARK] =       sSpriteAnim_TypeIcon_Dark,
    [TYPE_FAIRY] =      sSpriteAnim_TypeIcon_Fairy,
    [TYPE_STELLAR] =    sSpriteAnim_TypeIcon_Mystery,
};

const struct SpritePalette sTypeIconPal1 =
{
    .data = gBattleIcons_Pal1,
    .tag = TYPE_ICON_TAG
};

const struct SpritePalette sTypeIconPal2 =
{
    .data = gBattleIcons_Pal2,
    .tag = TYPE_ICON_TAG_2
};

const struct OamData sOamData_TypeIcons =
{
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = SPRITE_SHAPE(8x16),
    .size = SPRITE_SIZE(8x16),
    .priority = 1,
};

const struct CompressedSpriteSheet sSpriteSheet_TypeIcons2 =
{
    .data = gBattleIcons_Gfx2,
    .size = (8*16) * 9,
    .tag = TYPE_ICON_TAG_2,
};

const struct CompressedSpriteSheet sSpriteSheet_TypeIcons1 =
{
    .data = gBattleIcons_Gfx1,
    .size = (8*16) * 10,
    .tag = TYPE_ICON_TAG,
};

const struct SpriteTemplate sSpriteTemplate_TypeIcons1 =
{
    .tileTag = TYPE_ICON_TAG,
    .paletteTag = TYPE_ICON_TAG,
    .oam = &sOamData_TypeIcons,
    .anims = sSpriteAnimTable_TypeIcons,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TypeIcon
};

const struct SpriteTemplate sSpriteTemplate_TypeIcons2 =
{
    .tileTag = TYPE_ICON_TAG_2,
    .paletteTag = TYPE_ICON_TAG_2,
    .oam = &sOamData_TypeIcons,
    .anims = sSpriteAnimTable_TypeIcons,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TypeIcon
};

void LoadTypeIcons(u32 battler)
{
    u32 position;

    struct Pokemon* mon = GetBattlerMon(battler);
    u32 species = GetMonData(mon, MON_DATA_SPECIES, NULL);

    if (B_SHOW_TYPES == SHOW_TYPES_NEVER 
        || (B_SHOW_TYPES == SHOW_TYPES_SEEN && !GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_SEEN)))
        return;

    LoadTypeSpritesAndPalettes();

    for (position = 0; position < gBattlersCount; ++position)
        LoadTypeIconsPerBattler(battler, position);
}

static void LoadTypeSpritesAndPalettes(void)
{
    if (IndexOfSpritePaletteTag(TYPE_ICON_TAG) != UCHAR_MAX)
        return;

    LoadCompressedSpriteSheet(&sSpriteSheet_TypeIcons1);
    LoadCompressedSpriteSheet(&sSpriteSheet_TypeIcons2);
    LoadSpritePalette(&sTypeIconPal1);
    LoadSpritePalette(&sTypeIconPal2);
}

static void LoadTypeIconsPerBattler(u32 battler, u32 position)
{
    u32 typeNum, types[2];
    u32 battlerId = GetBattlerAtPosition(position);
    bool32 useDoubleBattleCoords = UseDoubleBattleCoords(battlerId);

    if (!IsBattlerAlive(battlerId))
        return;

    for (typeNum = 0; typeNum < 2; ++typeNum)
        types[typeNum] = GetMonPublicType(battlerId, typeNum);

    for (typeNum = 0; typeNum < 2; ++typeNum)
        CreateSpriteFromType(position, useDoubleBattleCoords, types, typeNum, battler);
}

static bool32 UseDoubleBattleCoords(u32 position)
{
    if (!IsDoubleBattle())
        return FALSE;

    if ((position == B_POSITION_PLAYER_LEFT) && (gBattleMons[B_POSITION_PLAYER_RIGHT].species == SPECIES_NONE))
        return FALSE;

    if ((position == B_POSITION_OPPONENT_LEFT) && (gBattleMons[B_POSITION_OPPONENT_RIGHT].species == SPECIES_NONE))
        return FALSE;

    return TRUE;
}

static u32 GetMonPublicType(u32 battlerId, u32 typeNum)
{
    struct Pokemon* mon = GetBattlerMon(battlerId);
    u32 monSpecies = GetMonData(mon,MON_DATA_SPECIES,NULL);
    struct Pokemon* monIllusion;
    u32 illusionSpecies;

    if (ShouldHideUncaughtType(monSpecies) || ShouldHideUnseenType(monSpecies))
        return TYPE_MYSTERY;

    monIllusion = GetIllusionMonPtr(battlerId);
    illusionSpecies = GetMonData(monIllusion,MON_DATA_SPECIES,NULL);

    if (GetActiveGimmick(battlerId) == GIMMICK_TERA)
        return GetMonDefensiveTeraType(mon,monIllusion,battlerId,typeNum,illusionSpecies,monSpecies);

    if (IsIllusionActiveAndTypeUnchanged(monIllusion,monSpecies, battlerId))
        return gSpeciesInfo[illusionSpecies].types[typeNum];

    return gBattleMons[battlerId].types[typeNum];
}

static bool32 ShouldHideUncaughtType(u32 species)
{
    if (B_SHOW_TYPES != SHOW_TYPES_CAUGHT)
        return FALSE;

    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
        return FALSE;

    return TRUE;
}

static bool32 ShouldHideUnseenType(u32 species)
{
    if (B_SHOW_TYPES != SHOW_TYPES_SEEN)
        return FALSE;

    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_SEEN))
        return FALSE;

    return TRUE;
}

static u32 GetMonDefensiveTeraType(struct Pokemon * mon, struct Pokemon* monIllusion, u32 battlerId, u32 typeNum, u32 illusionSpecies, u32 monSpecies)
{
    u32 teraType = GetBattlerTeraType(battlerId);
    u32 targetSpecies;

    if (teraType != TYPE_STELLAR)
        return teraType;

    targetSpecies = (monIllusion != NULL) ? illusionSpecies : monSpecies;

    return gSpeciesInfo[targetSpecies].types[typeNum];
}

static u32 IsIllusionActiveAndTypeUnchanged(struct Pokemon* monIllusion, u32 monSpecies, u32 battlerId)
{
    u32 typeNum;

    if (monIllusion == NULL)
        return FALSE;

    for (typeNum = 0; typeNum < 2; typeNum++)
        if (gSpeciesInfo[monSpecies].types[typeNum] != gBattleMons[battlerId].types[typeNum])
        return FALSE;

    return TRUE;
}

static void CreateSpriteFromType(u32 position, bool32 useDoubleBattleCoords, u32 types[], u32 typeNum, u32 battler)
{
    s32 x = 0, y = 0;

    if (ShouldSkipSecondType(types, typeNum))
        return;

    SetTypeIconXY(&x, &y, position, useDoubleBattleCoords, typeNum);

    CreateSpriteAndSetTypeSpriteAttributes(types[typeNum], x, y, position, battler, useDoubleBattleCoords);
}

static bool32 ShouldSkipSecondType(u32 types[], u32 typeNum)
{
    if (!typeNum)
        return FALSE;

    if (types[0] != types[1])
        return FALSE;

    return TRUE;
}

static void SetTypeIconXY(s32* x, s32* y, u32 position, bool32 useDoubleBattleCoords, u32 typeNum)
{
    *x = sTypeIconPositions[position][useDoubleBattleCoords].x;
    *y = sTypeIconPositions[position][useDoubleBattleCoords].y + (11 * typeNum);
}

static void CreateSpriteAndSetTypeSpriteAttributes(u32 type, u32 x, u32 y, u32 position, u32 battler, bool32 useDoubleBattleCoords)
{
    struct Sprite* sprite;
    const struct SpriteTemplate* spriteTemplate = gTypesInfo[type].useSecondTypeIconPalette ? &sSpriteTemplate_TypeIcons2 : &sSpriteTemplate_TypeIcons1;
    u32 spriteId = CreateSpriteAtEnd(spriteTemplate, x, y, UCHAR_MAX);

    if (spriteId == MAX_SPRITES)
        return;

    sprite = &gSprites[spriteId];
    sprite->tMonPosition = position;
    sprite->tBattlerId = battler;
    sprite->tVerticalPosition = y;

    sprite->hFlip = ShouldFlipTypeIcon(useDoubleBattleCoords, position, type);

    StartSpriteAnim(sprite, type);
}

static bool32 ShouldFlipTypeIcon(bool32 useDoubleBattleCoords, u32 position, u32 typeId)
{
    bool32 side = (useDoubleBattleCoords) ? B_SIDE_OPPONENT : B_SIDE_PLAYER;

    if (GetBattlerSide(GetBattlerAtPosition(position)) != side)
        return FALSE;

    return !gTypesInfo[typeId].isSpecialCaseType;
}

static void SpriteCB_TypeIcon(struct Sprite* sprite)
{
    u32 position = sprite->tMonPosition;
    u32 battlerId = sprite->tBattlerId;
    bool32 useDoubleBattleCoords = UseDoubleBattleCoords(GetBattlerAtPosition(position));

    if (sprite->tHideIconTimer == NUM_FRAMES_HIDE_TYPE_ICON)
    {
        DestroyTypeIcon(sprite);
        return;
    }

    if (ShouldHideTypeIcon(battlerId))
    {
        sprite->x += GetTypeIconHideMovement(useDoubleBattleCoords, position);
        ++sprite->tHideIconTimer;
        return;
    }

    sprite->x += GetTypeIconSlideMovement(useDoubleBattleCoords,position, sprite->x);
    sprite->y = GetTypeIconBounceMovement(sprite->tVerticalPosition,position);
}

static const u32 typeIconTags[] =
{
    TYPE_ICON_TAG,
    TYPE_ICON_TAG_2
};

static void DestroyTypeIcon(struct Sprite* sprite)
{
    u32 spriteId, tag;

    DestroySpriteAndFreeResources(sprite);

    for (spriteId = 0; spriteId < MAX_SPRITES; ++spriteId)
    {
        if (!gSprites[spriteId].inUse)
            continue;

        for (tag = 0; tag < 2; tag++)
        {
            if (gSprites[spriteId].template->paletteTag == typeIconTags[tag])
                return;

            if (gSprites[spriteId].template->tileTag == typeIconTags[tag])
                return;
        }
    }

    FreeAllTypeIconResources();
}

static void FreeAllTypeIconResources(void)
{
    u32 tag;

    for (tag = 0; tag < 2; tag++)
    {
        FreeSpriteTilesByTag(typeIconTags[tag]);
        FreeSpritePaletteByTag(typeIconTags[tag]);
    }
}

static void (* const sShowTypesControllerFuncs[])(u32 battler) =
{
    PlayerHandleChooseMove,
    HandleChooseMoveAfterDma3,
    HandleInputChooseTarget,
    HandleInputShowTargets,
    HandleInputShowEntireFieldTargets,
    HandleMoveSwitching,
    HandleInputChooseMove,
};


static bool32 ShouldHideTypeIcon(u32 battlerId)
{
    u32 funcIndex;

    for (funcIndex = 0; funcIndex < ARRAY_COUNT(sShowTypesControllerFuncs); funcIndex++)
        if (gBattlerControllerFuncs[battlerId] == sShowTypesControllerFuncs[funcIndex])
            return FALSE;

    return TRUE;
}

static s32 GetTypeIconHideMovement(bool32 useDoubleBattleCoords, u32 position)
{
    if (useDoubleBattleCoords)
    {
        if (position == B_POSITION_PLAYER_LEFT || position == B_POSITION_PLAYER_RIGHT)
            return 1;
        else
            return -1;
    }

    if (position == B_POSITION_PLAYER_LEFT)
        return -1;
    else
        return 1;
}

static s32 GetTypeIconSlideMovement(bool32 useDoubleBattleCoords, u32 position, s32 xPos)
{
    if (useDoubleBattleCoords)
    {
        switch (position)
        {
            case B_POSITION_PLAYER_LEFT:
            case B_POSITION_PLAYER_RIGHT:
                if (xPos > sTypeIconPositions[position][useDoubleBattleCoords].x - 10)
                    return -1;
                break;
            default:
            case B_POSITION_OPPONENT_LEFT:
            case B_POSITION_OPPONENT_RIGHT:
                if (xPos < sTypeIconPositions[position][useDoubleBattleCoords].x + 10)
                    return 1;
                break;
        }
        return 0;
    }

    if (position == B_POSITION_PLAYER_LEFT)
    {
        if (xPos < sTypeIconPositions[position][useDoubleBattleCoords].x + 10)
            return 1;
    }
    else
    {
        if (xPos > sTypeIconPositions[position][useDoubleBattleCoords].x - 10)
            return -1;
    }
    return 0;
}

static s32 GetTypeIconBounceMovement(s32 originalY, u32 position)
{
    struct Sprite* healthbox = &gSprites[gHealthboxSpriteIds[GetBattlerAtPosition(position)]];
    return originalY + healthbox->y2;
}

