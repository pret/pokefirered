#ifndef GUARD_REGIONS_H
#define GUARD_REGIONS_H

#include "constants/regions.h"

static inline u32 GetCurrentRegion(void)
{
    // TODO: Since there's no current multi-region support, we have this constant for the purposes of regional form comparisons.
    return REGION_HOENN;
}

#endif // GUARD_REGIONS_H
