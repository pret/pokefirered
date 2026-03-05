#ifndef GUARD_HEAL_LOCATION_H
#define GUARD_HEAL_LOCATION_H

#include "global.h"

struct HealLocation
{
    s8 mapGroup;
    s8 mapNum;
    s16 x;
    s16 y;
};

const struct HealLocation *GetHealLocation(u32 loc);
u32 GetHealLocationIndexFromMapGroupAndNum(u16 mapGroup, u16 mapNum);
void SetWhiteoutRespawnWarpAndHealerNpc(struct WarpData * warp);

#endif // GUARD_HEAL_LOCATION_H
