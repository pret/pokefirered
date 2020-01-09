#ifndef GUARD_REGION_MAP_H
#define GUARD_REGION_MAP_H

#include "global.h"

#include "bg.h"

// Exported type declarations

enum
{
    INPUT_EVENT_NONE,
    INPUT_EVENT_MOVE_START,
    INPUT_EVENT_MOVE_CONT,
    INPUT_EVENT_MOVE_END,
    INPUT_EVENT_A_BUTTON,
    INPUT_EVENT_B_BUTTON,
};

enum {
    MAPSECTYPE_NONE,
    MAPSECTYPE_PLAIN,
    MAPSECTYPE_CITY_CANFLY,
    MAPSECTYPE_CITY_CANTFLY,
};

enum {
    MAPPERM_0,
    MAPPERM_1,
    MAPPERM_2,
    MAPPERM_3
};

enum {
    REGIONMAP_KANTO,
    REGIONMAP_SEVII123,
    REGIONMAP_SEVII45,
    REGIONMAP_SEVII67
};

// Exported RAM declarations

// Exported ROM declarations
u8 *GetMapName(u8 *dest, u16 mapsec, u16 fill);
u8 *GetMapNameGeneric(u8 *dest, u16 mapsec);
void sub_80BFF50(u8 a0, void (*a1)(void));
void MCB2_FlyMap(void);

#endif //GUARD_REGION_MAP_H
