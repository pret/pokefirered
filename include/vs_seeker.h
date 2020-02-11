#ifndef GUARD_VS_SEEKER_H
#define GUARD_VS_SEEKER_H

#include "global.h"

#define GET_VS_SEEKER_COUNTER_0() (gSaveBlock1Ptr->trainerRematch.stepCounter & 0xFF)
#define GET_VS_SEEKER_COUNTER_1() (gSaveBlock1Ptr->trainerRematch.stepCounter >> 8)
#define SET_VS_SEEKER_COUNTER_0(x) ({\
    gSaveBlock1Ptr->trainerRematch.stepCounter &= 0xFF00;\
    gSaveBlock1Ptr->trainerRematch.stepCounter |= (x);\
})
#define SET_VS_SEEKER_COUNTER_1(x) ({\
    gSaveBlock1Ptr->trainerRematch.stepCounter &= 0x00FF;\
    gSaveBlock1Ptr->trainerRematch.stepCounter |= ((x) << 8);\
})
#define INC_VS_SEEKER_COUNTER_0() ({\
    u8 x = GET_VS_SEEKER_COUNTER_0();\
    if (x < 100) gSaveBlock1Ptr->trainerRematch.stepCounter++;\
})
#define INC_VS_SEEKER_COUNTER_1() ({\
    u8 x = GET_VS_SEEKER_COUNTER_1();\
    if (x < 100) {x++; SET_VS_SEEKER_COUNTER_1(x);}\
})

void sub_810C604(void);
void sub_810C640(void);

void Task_VsSeeker_0(u8 taskId);
void sub_810CB90(void);
void sub_810CDE8(void);
int GetRematchTrainerId(u16 a0);
bool8 sub_810CF04(u8 a0);
u8 sub_810CF54();
void sub_810D0D0(void);
void sub_810CB90(void);

#endif //GUARD_VS_SEEKER_H
