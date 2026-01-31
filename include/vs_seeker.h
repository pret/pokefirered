#ifndef GUARD_VS_SEEKER_H
#define GUARD_VS_SEEKER_H

#include "global.h"
#include "script.h"

#define REMATCH_TRAINER_COUNT 221
#define MAX_REMATCH_PARTIES 6
#define VSSEEKER_RECHARGE_STEPS 100

struct RematchData
{
    u16 trainerIDs[MAX_REMATCH_PARTIES];
    u16 mapGroup; // unused
    u16 mapNum; // unused
};

void Task_VsSeeker_0(u8 taskId);
void ClearRematchStateByTrainerId(void);
void ClearRematchStateOfLastTalked(void);
int GetRematchTrainerId(u16 trainerId);
bool8 UpdateVsSeekerStepCounter(void);
void MapResetTrainerRematches(u16 mapGroup, u16 mapNum);
void NativeVsSeekerRematchId(struct ScriptContext *ctx);

extern const struct RematchData sRematches[];

#endif //GUARD_VS_SEEKER_H
