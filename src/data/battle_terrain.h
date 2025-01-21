#include "graphics/battle_terrain.h"

const struct BattleTerrain gBattleTerrainInfo[BATTLE_TERRAIN_COUNT] =
{
    [BATTLE_TERRAIN_GRASS] =
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
            .tileset = gBattleTerrainTiles_Grass,
            .tilemap = gBattleTerrainTilemap_Grass,
            .entryTileset = gBattleTerrainAnimTiles_Grass,
            .entryTilemap = gBattleTerrainAnimTilemap_Grass,
            .palette = gBattleTerrainPalette_Grass,
        },
    },
    [BATTLE_TERRAIN_LONG_GRASS] =
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
            .tileset = gBattleTerrainTiles_LongGrass,
            .tilemap = gBattleTerrainTilemap_LongGrass,
            .entryTileset = gBattleTerrainAnimTiles_LongGrass,
            .entryTilemap = gBattleTerrainAnimTilemap_LongGrass,
            .palette = gBattleTerrainPalette_LongGrass,
        },
    },
    [BATTLE_TERRAIN_SAND] =
    {
        .name = _("NORMAL - SAND            "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_6 ? MOVE_EARTH_POWER : MOVE_EARTHQUAKE,
        .secretPowerEffect = MOVE_EFFECT_ACC_MINUS_1,
        .camouflageType = TYPE_GROUND,
        .background =
        {
            .tileset = gBattleTerrainTiles_Sand,
            .tilemap = gBattleTerrainTilemap_Sand,
            .entryTileset = gBattleTerrainAnimTiles_Sand,
            .entryTilemap = gBattleTerrainAnimTilemap_Sand,
            .palette = gBattleTerrainPalette_Sand,
        },
    },
    [BATTLE_TERRAIN_UNDERWATER] =
    {
        .name = _("NORMAL - UNDERWATER      "),
        .naturePower = MOVE_HYDRO_PUMP,
        .secretPowerEffect = B_SECRET_POWER_EFFECT >= GEN_6 ? MOVE_EFFECT_ATK_MINUS_1 : MOVE_EFFECT_DEF_MINUS_1,
        .camouflageType = TYPE_WATER,
        .background =
        {
            .tileset = gBattleTerrainTiles_Underwater,
            .tilemap = gBattleTerrainTilemap_Underwater,
            .entryTileset = gBattleTerrainAnimTiles_Underwater,
            .entryTilemap = gBattleTerrainAnimTilemap_Underwater,
            .palette = gBattleTerrainPalette_Underwater,
        },
    },
    [BATTLE_TERRAIN_WATER] =
    {
        .name = _("NORMAL - WATER           "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_HYDRO_PUMP : MOVE_SURF,
        .secretPowerEffect = MOVE_EFFECT_ATK_MINUS_1,
        .camouflageType = TYPE_WATER,
        .background =
        {
            .tileset = gBattleTerrainTiles_Water,
            .tilemap = gBattleTerrainTilemap_Water,
            .entryTileset = gBattleTerrainAnimTiles_Water,
            .entryTilemap = gBattleTerrainAnimTilemap_Water,
            .palette = gBattleTerrainPalette_Water,
        },
    },
    [BATTLE_TERRAIN_POND] =
    {
        .name = _("NORMAL - POND            "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_HYDRO_PUMP : MOVE_BUBBLE_BEAM,
        .secretPowerEffect = B_SECRET_POWER_EFFECT >= GEN_4 ? MOVE_EFFECT_ATK_MINUS_1 : MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_WATER,
        .background =
        {
            .tileset = gBattleTerrainTiles_Pond,
            .tilemap = gBattleTerrainTilemap_Pond,
            .entryTileset = gBattleTerrainAnimTiles_Pond,
            .entryTilemap = gBattleTerrainAnimTilemap_Pond,
            .palette = gBattleTerrainPalette_Pond,
        },
    },
    [BATTLE_TERRAIN_MOUNTAIN] =
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
            .tileset = gBattleTerrainTiles_Mountain,
            .tilemap = gBattleTerrainTilemap_Mountain,
            .entryTileset = gBattleTerrainAnimTiles_Mountain,
            .entryTilemap = gBattleTerrainAnimTilemap_Mountain,
            .palette = gBattleTerrainPalette_Mountain,
        },
    },
    [BATTLE_TERRAIN_CAVE] =
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
            .tileset = gBattleTerrainTiles_Cave,
            .tilemap = gBattleTerrainTilemap_Cave,
            .entryTileset = gBattleTerrainAnimTiles_Cave,
            .entryTilemap = gBattleTerrainAnimTilemap_Cave,
            .palette = gBattleTerrainPalette_Cave,
        },
    },
    [BATTLE_TERRAIN_BUILDING] =
    {
        .name = _("NORMAL - BUILDING        "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background =
        {
            .tileset = gBattleTerrainTiles_Building,
            .tilemap = gBattleTerrainTilemap_Building,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Building,
        },
    },
    [BATTLE_TERRAIN_PLAIN] =
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
            .tileset = gBattleTerrainTiles_Building,
            .tilemap = gBattleTerrainTilemap_Building,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Plain,
        },
    },
    [BATTLE_TERRAIN_SOARING] =
    {
        .name = _("NORMAL - SOARING         "),
        .naturePower = MOVE_AIR_SLASH,
        .secretPowerEffect = MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_FLYING,
    },
    [BATTLE_TERRAIN_SKY_PILLAR] =
    {
        .name = _("NORMAL - SKY PILLAR      "),
        .naturePower = MOVE_AIR_SLASH,
        .secretPowerEffect = MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_FLYING,
    },
    [BATTLE_TERRAIN_BURIAL_GROUND] =
    {
        .name = _("NORMAL - BURIAL GROUND   "),
        .naturePower = MOVE_SHADOW_BALL,
        .secretPowerEffect = MOVE_EFFECT_FLINCH,
        .camouflageType = TYPE_GHOST,
    },
    [BATTLE_TERRAIN_PUDDLE] =
    {
        .name = _("NORMAL - PUDDLE          "),
        .naturePower = MOVE_MUD_BOMB,
        .secretPowerEffect = B_SECRET_POWER_EFFECT >= GEN_5 ? MOVE_EFFECT_SPD_MINUS_1 : MOVE_EFFECT_ACC_MINUS_1,
        .camouflageType = TYPE_GROUND,
    },
    [BATTLE_TERRAIN_MARSH] =
    {
        .name = _("NORMAL - MARSH           "),
        .naturePower = MOVE_MUD_BOMB,
        .secretPowerEffect = MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_GROUND,
    },
    [BATTLE_TERRAIN_SWAMP] =
    {
        .name = _("NORMAL - SWAMP           "),
        .naturePower = MOVE_MUD_BOMB,
        .secretPowerEffect = MOVE_EFFECT_SPD_MINUS_1,
        .camouflageType = TYPE_GROUND,
    },
    [BATTLE_TERRAIN_SNOW] =
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
    [BATTLE_TERRAIN_ICE] =
    {
        .name = _("NORMAL - ICE             "),
        .naturePower = MOVE_ICE_BEAM,
        .secretPowerEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE,
        .camouflageType = TYPE_ICE,
    },
    [BATTLE_TERRAIN_VOLCANO] =
    {
        .name = _("NORMAL - VOLCANO         "),
        .naturePower = MOVE_LAVA_PLUME,
        .secretPowerEffect = MOVE_EFFECT_BURN,
        .camouflageType = TYPE_FIRE,
    },
    [BATTLE_TERRAIN_DISTORTION_WORLD] =
    {
        .name = _("NORMAL - DISTORTION WORLD"),
        .naturePower = MOVE_TRI_ATTACK,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
    },
    [BATTLE_TERRAIN_SPACE] =
    {
        .name = _("NORMAL - SPACE           "),
        .naturePower = MOVE_DRACO_METEOR,
        .secretPowerEffect = MOVE_EFFECT_FLINCH,
        .camouflageType = TYPE_DRAGON,
    },
    [BATTLE_TERRAIN_ULTRA_SPACE] =
    {
        .name = _("NORMAL - ULTRA SPACE     "),
        .naturePower = MOVE_PSYSHOCK,
        .secretPowerEffect = MOVE_EFFECT_DEF_MINUS_1,
        .camouflageType = TYPE_PSYCHIC,
    },
    [BATTLE_TERRAIN_LINK] =
    {
        .name = _("NORMAL - LINK            "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Building,
            .tilemap = gBattleTerrainTilemap_Building,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Link
        }
    },
    [BATTLE_TERRAIN_GYM] =
    {
        .name = _("NORMAL - GYM             "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Building,
            .tilemap = gBattleTerrainTilemap_Building,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Gym
        }
    },
    [BATTLE_TERRAIN_LEADER] =
    {
        .name = _("NORMAL - LEADER          "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Building,
            .tilemap = gBattleTerrainTilemap_Building,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Leader
        }
    },
    [BATTLE_TERRAIN_INDOOR_2] =
    {
        .name = _("NORMAL - INDOOR_2        "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Indoor,
            .tilemap = gBattleTerrainTilemap_Indoor,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Indoor2
        }
    },
    [BATTLE_TERRAIN_INDOOR_1] =
    {
        .name = _("NORMAL - INDOOR_1        "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Indoor,
            .tilemap = gBattleTerrainTilemap_Indoor,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Indoor1
        }
    },
    [BATTLE_TERRAIN_LORELEI] =
    {
        .name = _("NORMAL - LORELEI         "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Indoor,
            .tilemap = gBattleTerrainTilemap_Indoor,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Lorelei
        }
    },
    [BATTLE_TERRAIN_BRUNO] =
    {
        .name = _("NORMAL - BRUNO           "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Indoor,
            .tilemap = gBattleTerrainTilemap_Indoor,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Bruno
        }
    },
    [BATTLE_TERRAIN_AGATHA] =
    {
        .name = _("NORMAL - AGATHA          "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Indoor,
            .tilemap = gBattleTerrainTilemap_Indoor,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Agatha
        }
    },
    [BATTLE_TERRAIN_LANCE] =
    {
        .name = _("NORMAL - LANCE           "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Indoor,
            .tilemap = gBattleTerrainTilemap_Indoor,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Lance
        }
    },
    [BATTLE_TERRAIN_CHAMPION] =
    {
        .name = _("NORMAL - CHAMPION        "),
        .naturePower = B_NATURE_POWER_MOVES >= GEN_4 ? MOVE_TRI_ATTACK : MOVE_SWIFT,
        .secretPowerEffect = MOVE_EFFECT_PARALYSIS,
        .camouflageType = TYPE_NORMAL,
        .background = {
            .tileset = gBattleTerrainTiles_Indoor,
            .tilemap = gBattleTerrainTilemap_Indoor,
            .entryTileset = gBattleTerrainAnimTiles_Building,
            .entryTilemap = gBattleTerrainAnimTilemap_Building,
            .palette = gBattleTerrainPalette_Champion
        }
    }
};
