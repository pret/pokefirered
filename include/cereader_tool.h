#ifndef GUARD_CEREADER_TOOL_H
#define GUARD_CEREADER_TOOL_H

#include "global.h"

struct TrainerTowerTrainer_004
{
    /* 0x000 */ u8 unk_000[11];
    /* 0x00B */ u8 unk_00B;
    /* 0x00C */ u8 unk_00C;
    /* 0x00E */ u16 unk_00E[6];
    /* 0x01A */ u16 unk_01A[6];
    /* 0x026 */ u16 unk_026[6];
    /* 0x032 */ u16 unk_032[6];
    /* 0x040 */ struct BattleTowerPokemon unk_040[PARTY_SIZE];
}; // size: 328

struct TrainerTowerTrainer
{
    /* 0x000 */ u8 unk_000;
    /* 0x000 */ u8 unk_001;
    /* 0x002 */ u8 unk_002;
    /* 0x003 */ u8 unk_003;
    /* 0x004 */ struct TrainerTowerTrainer_004 unk_004[3];
    /* 0x3DC */ u32 checksum;
};

struct Unk_203F458_Header
{
    u8 unk0;
    u8 unk1;
    u32 unk4;
};

struct TrainerTowerData
{
    u8 count;
    u8 id;
    u16 dummy;
    u32 checksum;
    struct TrainerTowerTrainer trainers[8];
};

bool32 ValidateTrainerTowerData(struct TrainerTowerData * a0);
bool32 CEReaderTool_SaveTrainerTower(struct TrainerTowerData * a0);

#endif //GUARD_CEREADER_TOOL_H
