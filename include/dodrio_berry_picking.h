#ifndef GUARD_DODRIO_BERRY_PICKING_H
#define GUARD_DODRIO_BERRY_PICKING_H

struct DodrioSubstruct_31A0_14
{
    u8 unk0[11];
    u8 unkB[11];
};

struct DodrioSubstruct_31A0_2C
{
    u8 unk0;
    u8 ALIGNED(4) unk4;
    u8 ALIGNED(4) unk8;
};

struct DodrioSubstruct_31A0
{
    u8 name[0x10];
    u32 unk10;
    struct DodrioSubstruct_31A0_14 unk14;
    struct DodrioSubstruct_31A0_2C unk2C;
    u8 filler_35[4];
}; // size = 0x3C

void StartDodrioBerryPicking(u16 species, MainCallback callback);

u32 sub_815A950(u32 unused, struct DodrioSubstruct_31A0 *arg0, struct DodrioSubstruct_31A0_2C *arg1, struct DodrioSubstruct_31A0_2C *arg2, struct DodrioSubstruct_31A0_2C *arg3, struct DodrioSubstruct_31A0_2C *arg4, struct DodrioSubstruct_31A0_2C *arg5, u8 *arg6, u32 *arg7, u32 *arg8);
u32 sub_815AB04(u32 arg0, u8 *arg1);
bool32 sub_815AB60(u8 a0);
void sub_815A61C(struct DodrioSubstruct_31A0 *arg0, struct DodrioSubstruct_31A0_2C *arg1, struct DodrioSubstruct_31A0_2C *arg2, struct DodrioSubstruct_31A0_2C *arg3, struct DodrioSubstruct_31A0_2C *arg4, struct DodrioSubstruct_31A0_2C *arg5, u8 arg6, u32 arg7, u32 arg8);
void sub_815A5BC(u8 a0);
void sub_815AAD8(u8 a0);
void sub_815AB3C(u8 a0);
u8 sub_815A5E8(s32 a0);
u32 IncrementWithLimit(u32, u32);

#endif //GUARD_DODRIO_BERRY_PICKING_H
