#ifndef GUARD_CONSTANTS_BERRY_H
#define GUARD_CONSTANTS_BERRY_H

#define BERRY_NONE 0

#define BERRY_FIRMNESS_UNKNOWN     0
#define BERRY_FIRMNESS_VERY_SOFT   1
#define BERRY_FIRMNESS_SOFT        2
#define BERRY_FIRMNESS_HARD        3
#define BERRY_FIRMNESS_VERY_HARD   4
#define BERRY_FIRMNESS_SUPER_HARD  5

#define BERRY_COLOR_RED    0
#define BERRY_COLOR_BLUE   1
#define BERRY_COLOR_PURPLE 2
#define BERRY_COLOR_GREEN  3
#define BERRY_COLOR_YELLOW 4
#define BERRY_COLOR_PINK   5

enum __attribute__((__packed__)) Flavor
{
    FLAVOR_SPICY,
    FLAVOR_DRY,
    FLAVOR_SWEET,
    FLAVOR_BITTER,
    FLAVOR_SOUR,
    FLAVOR_COUNT,
};

#define BERRY_STAGE_NO_BERRY    0  // there is no tree planted and the soil is completely flat.
#define BERRY_STAGE_PLANTED     1
#define BERRY_STAGE_SPROUTED    2
#define BERRY_STAGE_TALLER      3
#define BERRY_STAGE_FLOWERING   4
#define BERRY_STAGE_BERRIES     5
#define BERRY_STAGE_TRUNK       6 // These follow BERRY_STAGE_BERRIES to preserve save compatibility
#define BERRY_STAGE_BUDDING     7
#define BERRY_STAGE_SPARKLING   255

// Berries can be watered in the following stages:
// - BERRY_STAGE_PLANTED
// - BERRY_STAGE_SPROUTED
// - BERRY_STAGE_TALLER
// - BERRY_STAGE_FLOWERING
#define NUM_WATER_STAGES 4

// IDs for berry tree objects, indexes into berryTrees in SaveBlock1
// Named for whatever berry is initially planted there on a new game
// Those with no initial berry are named "soil"
// 90 reserved
enum BerryTreeId
{
    BERRY_TREES_COUNT = 90,
};


#endif // GUARD_CONSTANTS_BERRY_H
