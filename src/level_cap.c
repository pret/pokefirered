#include "global.h"
#include "level_cap.h"
#include "event_data.h"

u8 GetCurrentLevelCap(void)
{
    // Check badges from highest to lowest to return the appropriate level cap
    if (FlagGet(FLAG_BADGE08_GET))
        return LEVEL_CAP_BADGE_8;
    if (FlagGet(FLAG_BADGE07_GET))
        return LEVEL_CAP_BADGE_7;
    if (FlagGet(FLAG_BADGE06_GET))
        return LEVEL_CAP_BADGE_6;
    if (FlagGet(FLAG_BADGE05_GET))
        return LEVEL_CAP_BADGE_5;
    if (FlagGet(FLAG_BADGE04_GET))
        return LEVEL_CAP_BADGE_4;
    if (FlagGet(FLAG_BADGE03_GET))
        return LEVEL_CAP_BADGE_3;
    if (FlagGet(FLAG_BADGE02_GET))
        return LEVEL_CAP_BADGE_2;
    if (FlagGet(FLAG_BADGE01_GET))
        return LEVEL_CAP_BADGE_1;
    
    return LEVEL_CAP_NO_BADGES;
}
