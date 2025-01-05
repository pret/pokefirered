#include "global.h"
#include "generational_changes.h"
#include "malloc.h"
#include "constants/generational_changes.h"

#if TESTING
EWRAM_DATA u8 *gGenerationalChangesTestOverride = NULL;

void TestInitConfigData(void)
{
    gGenerationalChangesTestOverride = Alloc(sizeof(sGenerationalChanges));
    memcpy(gGenerationalChangesTestOverride, sGenerationalChanges, sizeof(sGenerationalChanges));
}

void TestFreeConfigData(void)
{
    TRY_FREE_AND_SET_NULL(gGenerationalChangesTestOverride)
}
#endif
