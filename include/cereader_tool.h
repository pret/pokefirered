#ifndef GUARD_CEREADER_TOOL_H
#define GUARD_CEREADER_TOOL_H

#include "global.h"
#include "constants/trainer_tower.h"

struct TrainerTowerTrainer
{
    /* 0x000 */ u8 name[11];
    /* 0x00B */ u8 facilityClass;
    /* 0x00C */ u8 textColor;
    /* 0x00E */ u16 speechBefore[6];
    /* 0x01A */ u16 speechWin[6];
    /* 0x026 */ u16 speechLose[6];
    /* 0x032 */ u16 speechAfter[6];
    /* 0x040 */ struct BattleTowerPokemon mons[PARTY_SIZE];
}; // size: 328

struct TrainerTowerFloor
{
    /* 0x000 */ u8 id;
    /* 0x001 */ u8 floorIdx;
    /* 0x002 */ u8 challengeType;
    /* 0x003 */ u8 prize;
    /* 0x004 */ struct TrainerTowerTrainer trainers[MAX_TRAINERS_PER_FLOOR];
    /* 0x3DC */ u32 checksum;
};

struct EReaderTrainerTowerSetSubstruct
{
    u8 numFloors;
    u8 id;
    u16 dummy;
    u32 checksum;
};

struct EReaderTrainerTowerSet
{
    u8 numFloors;
    u8 id;
    u16 dummy;
    u32 checksum;
    struct TrainerTowerFloor floors[MAX_TRAINER_TOWER_FLOORS];
};

bool32 ValidateTrainerTowerData(struct EReaderTrainerTowerSet * ttdata);
bool32 CEReaderTool_SaveTrainerTower(struct EReaderTrainerTowerSet * ttdata);
bool32 CEReaderTool_LoadTrainerTower(struct EReaderTrainerTowerSet * ttdata);
bool32 ReadTrainerTowerAndValidate(void);

#endif //GUARD_CEREADER_TOOL_H
