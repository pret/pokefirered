#ifndef GUARD_VS_SEEKER_H
#define GUARD_VS_SEEKER_H

#include "global.h"

void Task_VsSeeker_0(u8 taskId);
void sub_810CB90(void);
void sub_810CDE8(void);
s32 GetRematchTrainerId(u16 a0);
bool8 sub_810CF04(u8 a0);
void sub_810D0D0(void);
void sub_810CB90(void);
bool8 UpdateVsSeekerStepCounter(void);
void TryUpdateRandomTrainerRematches(u16 mapGroup, u16 mapNum);

#endif //GUARD_VS_SEEKER_H
