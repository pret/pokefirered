#ifndef GUARD_FIELD_POISON_H
#define GUARD_FIELD_POISON_H

#include "global.h"

enum {
    FLDPSN_NONE,
    FLDPSN_PSN,
    FLDPSN_FNT
};

s32 DoPoisonFieldEffect(void);

#endif //GUARD_FIELD_POISON_H
