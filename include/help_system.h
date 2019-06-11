#ifndef GUARD_HELP_SYSTEM_H
#define GUARD_HELP_SYSTEM_H

#include "global.h"

struct HelpSystemStruct_203F1AC
{

};

struct HelpSystemStruct_203F190_sub
{
    struct HelpSystemStruct_203F1AC * field_00;
    u16 field_04;
    u16 field_06;
    u8 field_08;
    u8 field_09;

};

struct HelpSystemStruct_203F190
{
    struct HelpSystemStruct_203F190_sub field_00;
    u8 filler_0C[0x10];
};

extern struct HelpSystemStruct_203F190 gUnknown_203F190;
extern struct HelpSystemStruct_203F1AC gUnknown_203F1AC;
extern bool8 gUnknown_3005ECC;
extern u8 gUnknown_203F175;

void sub_812B1E0(u8);
void sub_812B484(void);
void HelpSystem_SetSomeVariable2(u8);
void sub_812B478(void);
void sub_813C64C(struct HelpSystemStruct_203F190_sub *, u8, u8);
void sub_813BDA4(u8);
void sub_813BD5C(u8);

#endif //GUARD_HELP_SYSTEM_H
