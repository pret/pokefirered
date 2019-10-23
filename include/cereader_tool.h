#ifndef GUARD_CEREADER_TOOL_H
#define GUARD_CEREADER_TOOL_H

#include "global.h"

struct TrainerTowerTrainer
{
    /* 0x000 */ u8 name[11];
    /* 0x00B */ u8 facilityClass;
    /* 0x00C */ u8 gender;
    /* 0x00E */ u16 speechBefore[6];
    /* 0x01A */ u16 speechWin[6];
    /* 0x026 */ u16 speechLose[6];
    /* 0x032 */ u16 speechAfter[6];
    /* 0x040 */ struct BattleTowerPokemon mons[PARTY_SIZE];
}; // size: 328

struct TrainerTowerFloor
{
    /* 0x000 */ u8 unk_000;
    /* 0x001 */ u8 floorIdx;
    /* 0x002 */ u8 challengeType;
    /* 0x003 */ u8 prize;
    /* 0x004 */ struct TrainerTowerTrainer trainers[3];
    /* 0x3DC */ u32 checksum;
};

struct Unk_203F458_Header
{
    u8 unk0;
    u8 unk1;
    u32 unk4;
};

struct EReaderTrainerHillSet
{
    u8 count;
    u8 id;
    u16 dummy;
    u32 checksum;
    struct TrainerTowerFloor floors[8];
};

bool32 ValidateTrainerTowerData(struct EReaderTrainerHillSet * a0);
bool32 CEReaderTool_SaveTrainerTower(struct EReaderTrainerHillSet * a0);

#endif //GUARD_CEREADER_TOOL_H
