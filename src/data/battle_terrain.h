#include "graphics/battle_terrain.h"

const struct BattleTerrain gBattleEnvironmentInfo[BATTLE_ENVIRONMENT_COUNT] =
{
    [BATTLE_ENVIRONMENT_GRASS] =
    {
        .name = _("NORMAL - GRASS"),
    #if B_NATURE_POWER_MOVES >= GEN_6
        .naturePower = MOVE_ENERGY_BALL,
    #elif B_NATURE_POWER_MOVES >= GEN_4
        .naturePower = MOVE_SEED_BOMB,
    #else
        .naturePower = MOVE_STUN_SPORE,
    #endif
        .secretPowerEffect = B_SECRET_POWER_EFFECT >= GEN_4 ? MOVE_EFFECT_SLEEP : MOVE_EFFECT_POISON,
        .camouflageType = TYPE_GRASS,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_Grass,
            .tilemap = gBattleEnvironmentTilemap_Grass,
            .entryTileset = gBattleEnvironmentAnimTiles_Grass,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Grass,
            .palette = gBattleEnvironmentPalette_Grass,
        },
    },
    [BATTLE_ENVIRONMENT_LONG_GRASS] =
    {
        .name = _("NORMAL - LONG GRASS      "),
    #if B_NATURE_POWER_MOVES >= GEN_6
        .naturePower = MOVE_ENERGY_BALL,
    #elif B_NATURE_POWER_MOVES >= GEN_4
        .naturePower = MOVE_SEED_BOMB,
    #else
        .naturePower = MOVE_RAZOR_LEAF,
    #endif
        .secretPowerEffect = MOVE_EFFECT_SLEEP,
        .camouflageType = TYPE_GRASS,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_LongGrass,
            .tilemap = gBattleEnvironmentTilemap_LongGrass,
            .entryTileset = gBattleEnvironmentAnimTiles_LongGrass,
            .entryTilemap = gBattleEnvironmentAnimTilemap_LongGrass,
            .palette = gBattleEnvironmentPalette_LongGrass,
        },
    },
    [BATTLE_ENVIRONMENT_SAND] =
    {
        .name = _("NORMAL - SAND            "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_6 ? MOVE_EARTH_POWER : MOVE_EARTHQUAKE,
        .secretPowerEffect = MOVE_EFFECT_ACC_MINUS_1,
        .camouflageType = TYPE_GROUND,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_Sand,
            .tilemap = gBattleEnvironmentTilemap_Sand,
            .entryTileset = gBattleEnvironmentAnimTiles_Sand,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Sand,
            .palette = gBattleEnvironmentPalette_Sand,
        },
    },
    [BATTLE_ENVIRONMENT_UNDERWATER] =
    {
        .name = _("NORMAL - UNDERWATER      "),
        .naturePower = MOVE_HYDRO_PUMP,
        .secretPowerEffect = B_SECRET_POWER_EFFECT >= GEN_6 ? MOVE_EFFECT_ATK_MINUS_1 : MOVE_EFFECT_DEF_MINUS_1,
        .camouflageType = TYPE_WATER,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_Underwater,
            .tilemap = gBattleEnvironmentTilemap_Underwater,
            .entryTileset = gBattleEnvironmentAnimTiles_Underwater,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Underwater,
            .palette = gBattleEnvironmentPalette_Underwater,
        },
    },
    [BATTLE_ENVIRONMENT_WATER] =
    {
        .name = _("NORMAL - WATER           "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_HYDRO_PUMP : MOVE_SURF,
        .secretPowerEffect = MOVE_EFFECT_ATK_MINUS_1,
        .camouflageType = TYPE_WATER,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_Water,
            .tilemap = gBattleEnvironmentTilemap_Water,
            .entryTileset = gBattleEnvironmentAnimTiles_Water,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Water,
            .palette = gBattleEnvironmentPalette_Water,
        },
    },
    [BATTLE_ENVIRONMENT_POND] =
    {
        .name = _("NORMAL - POND            "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_HYDRO_PUMP : MOVE_BUBBLE_BEAM,
        .secretPowerEffect = B_SECRET_POWER_EFFECT >= GEN_4 ? MOVE_EFFECT_ATK_MINUS_1 : MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_WATER,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_Pond,
            .tilemap = gBattleEnvironmentTilemap_Pond,
            .entryTileset = gBattleEnvironmentAnimTiles_Pond,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Pond,
            .palette = gBattleEnvironmentPalette_Pond,
        },
    },
    [BATTLE_ENVIRONMENT_MOUNTAIN] =
    {
        .name = _("NORMAL - MOUNTAIN        "),
    #if B_NATURE_POWER_MOVES >= GEN_6
        .naturePower = MOVE_EARTH_POWER,
    #elif B_NATURE_POWER_MOVES >= GEN_5
        .naturePower = MOVE_EARTHQUAKE,
    #else
        .naturePower = MOVE_ROCK_SLIDE,
    #endif
    #if B_SECRET_POWER_EFFECT >= GEN_5
        .secretPowerEffect = MOVE_EFFECT_ACC_MINUS_1,
    #elif B_SECRET_POWER_EFFECT >= GEN_4
        .secretPowerEffect = MOVE_EFFECT_FLINCH,
    #else
        .secretPowerEffect = MOVE_EFFECT_CONFUSION,
    #endif
        .camouflageType = B_CAMOUFLAGE_TYPES >= GEN_5 ? TYPE_GROUND : TYPE_ROCK,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_Mountain,
            .tilemap = gBattleEnvironmentTilemap_Mountain,
            .entryTileset = gBattleEnvironmentAnimTiles_Mountain,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Mountain,
            .palette = gBattleEnvironmentPalette_Mountain,
        },
    },
    [BATTLE_ENVIRONMENT_CAVE] =
    {
        .name = _("NORMAL - CAVE            "),
    #if B_NATURE_POWER_MOVES >= GEN_6
        .naturePower = MOVE_EARTH_POWER,
    #elif B_NATURE_POWER_MOVES >= GEN_5
        .naturePower = MOVE_EARTHQUAKE,
    #elif B_NATURE_POWER_MOVES >= GEN_4
        .naturePower = MOVE_ROCK_SLIDE,
    #else
        .naturePower = MOVE_SHADOW_BALL,
    #endif
        .secretPowerEffect = MOVE_EFFECT_FLINCH,
        .camouflageType = TYPE_ROCK,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_Cave,
            .tilemap = gBattleEnvironmentTilemap_Cave,
            .entryTileset = gBattleEnvironmentAnimTiles_Cave,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Cave,
            .palette = gBattleEnvironmentPalette_Cave,
        },
    },
    [BATTLE_ENVIRONMENT_BUILDING] =
    {
        .name = _("NORMAL - BUILDING        "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_Building,
            .tilemap = gBattleEnvironmentTilemap_Building,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Building,
        },
    },
    [BATTLE_ENVIRONMENT_PLAIN] =
    {
        .name = _("NORMAL - PLAIN           "),
    #if B_NATURE_POWER_MOVES >= GEN_6
        .naturePower = MOVE_TRI_ATTACK,
    #elif B_NATURE_POWER_MOVES >= GEN_4
        .naturePower = MOVE_EARTHQUAKE,
    #else
        .naturePower = MOVE_SWIFT,
    #endif
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = B_CAMOUFLAGE_TYPES >= GEN_4 ? TYPE_GROUND : TYPE_NORMAL,
        .background =
        {
            .tileset = gBattleEnvironmentTiles_Building,
            .tilemap = gBattleEnvironmentTilemap_Building,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Plain,
        },
    },
    [BATTLE_ENVIRONMENT_SOARING] =
    {
        .name = _("NORMAL - SOARING         "),
        .naturePower = MOVE_AIR_SLASH,
        .secretPowerEffect = MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_FLYING,
    },
    [BATTLE_ENVIRONMENT_SKY_PILLAR] =
    {
        .name = _("NORMAL - SKY PILLAR      "),
        .naturePower = MOVE_AIR_SLASH,
        .secretPowerEffect = MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_FLYING,
    },
    [BATTLE_ENVIRONMENT_BURIAL_GROUND] =
    {
        .name = _("NORMAL - BURIAL GROUND   "),
        .naturePower = MOVE_SHADOW_BALL,
        .secretPowerEffect = MOVE_EFFECT_FLINCH,
        .camouflageType = TYPE_GHOST,
    },
    [BATTLE_ENVIRONMENT_PUDDLE] =
    {
        .name = _("NORMAL - PUDDLE          "),
        .naturePower = MOVE_MUD_BOMB,
        .secretPowerEffect = B_SECRET_POWER_EFFECT >= GEN_5 ? MOVE_EFFECT_SPD_MINUS_1 : MOVE_EFFECT_ACC_MINUS_1,
        .camouflageType = TYPE_GROUND,
    },
    [BATTLE_ENVIRONMENT_MARSH] =
    {
        .name = _("NORMAL - MARSH           "),
        .naturePower = MOVE_MUD_BOMB,
        .secretPowerEffect = MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_GROUND,
    },
    [BATTLE_ENVIRONMENT_SWAMP] =
    {
        .name = _("NORMAL - SWAMP           "),
        .naturePower = MOVE_MUD_BOMB,
        .secretPowerEffect = MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_GROUND,
    },
    [BATTLE_ENVIRONMENT_SNOW] =
    {
        .name = _("NORMAL - SNOW            "),
    #if B_NATURE_POWER_MOVES >= GEN_7
        .naturePower = MOVE_ICE_BEAM,
    #elif B_NATURE_POWER_MOVES >= GEN_6
        .naturePower = MOVE_FROST_BREATH,
    #else
        .naturePower = MOVE_BLIZZARD,
    #endif
        .secretPowerEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
        .camouflageType = TYPE_ICE,
    },
    [BATTLE_ENVIRONMENT_ICE] =
    {
        .name = _("NORMAL - ICE             "),
        .naturePower = MOVE_ICE_BEAM,
        .secretPowerEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
        .camouflageType = TYPE_ICE,
    },
    [BATTLE_ENVIRONMENT_VOLCANO] =
    {
        .name = _("NORMAL - VOLCANO         "),
        .naturePower = MOVE_LAVA_PLUME,
        .secretPowerEffect = MOVE_EFFECT_BURN,
        .camouflageType = TYPE_FIRE,
    },
    [BATTLE_ENVIRONMENT_DISTORTION_WORLD] =
    {
        .name = _("NORMAL - DISTORTION WORLD"),
        .naturePower = MOVE_TRI_ATTACK,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
    },
    [BATTLE_ENVIRONMENT_SPACE] =
    {
        .name = _("NORMAL - SPACE           "),
        .naturePower = MOVE_DRACO_METEOR,
        .secretPowerEffect = MOVE_EFFECT_FLINCH,
        .camouflageType = TYPE_DRAGON,
    },
    [BATTLE_ENVIRONMENT_ULTRA_SPACE] =
    {
        .name = _("NORMAL - ULTRA SPACE     "),
        .naturePower = MOVE_PSYSHOCK,
        .secretPowerEffect = MOVE_EFFECT_DEF_MINUS_1,
        .camouflageType = TYPE_PSYCHIC,
    },
    [BATTLE_ENVIRONMENT_LINK] =
    {
        .name = _("NORMAL - LINK            "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Building,
            .tilemap = gBattleEnvironmentTilemap_Building,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Link
        }
    },
    [BATTLE_ENVIRONMENT_GYM] =
    {
        .name = _("NORMAL - GYM             "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Building,
            .tilemap = gBattleEnvironmentTilemap_Building,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Gym
        }
    },
    [BATTLE_ENVIRONMENT_LEADER] =
    {
        .name = _("NORMAL - LEADER          "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Building,
            .tilemap = gBattleEnvironmentTilemap_Building,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Leader
        }
    },
    [BATTLE_ENVIRONMENT_INDOOR_2] =
    {
        .name = _("NORMAL - INDOOR_2        "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Indoor,
            .tilemap = gBattleEnvironmentTilemap_Indoor,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Indoor2
        }
    },
    [BATTLE_ENVIRONMENT_INDOOR_1] =
    {
        .name = _("NORMAL - INDOOR_1        "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Indoor,
            .tilemap = gBattleEnvironmentTilemap_Indoor,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Indoor1
        }
    },
    [BATTLE_ENVIRONMENT_LORELEI] =
    {
        .name = _("NORMAL - LORELEI         "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Indoor,
            .tilemap = gBattleEnvironmentTilemap_Indoor,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Lorelei
        }
    },
    [BATTLE_ENVIRONMENT_BRUNO] =
    {
        .name = _("NORMAL - BRUNO           "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Indoor,
            .tilemap = gBattleEnvironmentTilemap_Indoor,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Bruno
        }
    },
    [BATTLE_ENVIRONMENT_AGATHA] =
    {
        .name = _("NORMAL - AGATHA          "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Indoor,
            .tilemap = gBattleEnvironmentTilemap_Indoor,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Agatha
        }
    },
    [BATTLE_ENVIRONMENT_LANCE] =
    {
        .name = _("NORMAL - LANCE           "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Indoor,
            .tilemap = gBattleEnvironmentTilemap_Indoor,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Lance
        }
    },
    [BATTLE_ENVIRONMENT_CHAMPION] =
    {
        .name = _("NORMAL - CHAMPION        "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleEnvironmentTiles_Indoor,
            .tilemap = gBattleEnvironmentTilemap_Indoor,
            .entryTileset = gBattleEnvironmentAnimTiles_Building,
            .entryTilemap = gBattleEnvironmentAnimTilemap_Building,
            .palette = gBattleEnvironmentPalette_Champion
        }
    }
};
