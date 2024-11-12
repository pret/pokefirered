#ifndef GUARD_FIELD_MOVE_H
#define GUARD_FIELD_MOVE_H

#include "constants/field_move.h"

struct FieldMoveInfo {
    u16 defaultSpecies;
    bool32 (*isUnlockedFunc)(void);
    u16 moveId;
    u8 partyMessageId;
    const u8* description;
    bool32 (*fieldMoveFunc)(void);
    const u8* questLogText;
};

extern const struct FieldMoveInfo gFieldMovesInfo[];

bool32 FieldMove_IsUnlocked(enum FieldMove fieldMove);
u16 FieldMove_GetDefaultSpecies(enum FieldMove fieldMove);

#endif // GUARD_FIELD_MOVE_H
