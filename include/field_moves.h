#ifndef GUARD_FIELD_MOVE_H
#define GUARD_FIELD_MOVE_H

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

#endif // GUARD_FIELD_MOVE_H
