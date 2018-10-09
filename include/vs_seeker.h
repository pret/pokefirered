#ifndef GUARD_VS_SEEKER_H
#define GUARD_VS_SEEKER_H

#include "global.h"

struct VsSeekerSubstruct
{
    const u8 *unk_0;
    u16 unk_4;
    u8 unk_6;
    u8 unk_7;
    s16 unk_8;
    s16 unk_a;
    u8 unk_c;
};

struct VsSeekerStruct
{
    /*0x000*/ struct VsSeekerSubstruct unk_000[MAP_OBJECTS_COUNT];
    /*0x100*/ u8 filler_100[0x300];
    /*0x400*/ u16 unk_400[0x10];
    /*0x420*/ u8 unk_420[0x10];
    /*0x430*/ u8 unk_430;
    /*0x431*/ u8 unk_431_0:1;
    /*0x431*/ u8 unk_431_1:1;
    /*0x431*/ u8 unk_431_2:1;
              u8 unk_431_3:5;
};

#endif //GUARD_VS_SEEKER_H
