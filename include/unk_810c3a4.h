#ifndef GUARD_UNK_810C3A4_H
#define GUARD_UNK_810C3A4_H

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

#endif //GUARD_UNK_810C3A4_H
