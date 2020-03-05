#ifndef GUARD_DODRIO_BERRY_PICKING_H
#define GUARD_DODRIO_BERRY_PICKING_H

struct DodrioSubstruct_0160
{
    /*0x0000 : 0x3000*/ u16 ALIGNED(4) tilemapBuffers[3][BG_SCREEN_SIZE];
    /*0x3000 : 0x3160*/ bool32 finished;
    /*0x3004 : 0x3164*/ u8 ALIGNED(4) unk3004;
    /*0x3008 : 0x3168*/ u8 ALIGNED(4) unk3008[10];
    /*0x3014 : 0x3174*/ u8 ALIGNED(4) state;
    /*0x3018 : 0x3178*/ u8 ALIGNED(4) unk3018;
    /*0x301C : 0x317C*/ u16 ALIGNED(4) unk301C;
    /*0x3020 : 0x3180*/ u8 ALIGNED(4) unk3020;
    /*0x3024 : 0x3184*/ u8 ALIGNED(4) unk3024;
    /*0x3024 : 0x3184*/ void (*unk3028)(void);
}; // size = 0x302C

struct DodrioSubstruct_318C
{
    bool8 isShiny;
};

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

struct DodrioSubstruct_3308
{
    u8 unk0;
    u32 unk4;
};

void StartDodrioBerryPicking(u16 species, MainCallback callback);

u32 sub_815A950(u32 unused, struct DodrioSubstruct_31A0 *arg0, struct DodrioSubstruct_31A0_2C *arg1, struct DodrioSubstruct_31A0_2C *arg2, struct DodrioSubstruct_31A0_2C *arg3, struct DodrioSubstruct_31A0_2C *arg4, struct DodrioSubstruct_31A0_2C *arg5, u8 *arg6, u32 *arg7, u32 *arg8);
u32 sub_815AB04(u32 arg0, u8 *arg1);
bool32 sub_815AB60(u32 a0);
void sub_815A61C(struct DodrioSubstruct_31A0 *arg0, struct DodrioSubstruct_31A0_2C *arg1, struct DodrioSubstruct_31A0_2C *arg2, struct DodrioSubstruct_31A0_2C *arg3, struct DodrioSubstruct_31A0_2C *arg4, struct DodrioSubstruct_31A0_2C *arg5, u8 arg6, u32 arg7, u32 arg8);
void sub_815A5BC(s32 a0);
void sub_815AAD8(u8 a0);
void sub_815AB3C(u32 a0);
u8 sub_815A5E8(s32 a0);
u32 IncrementWithLimit(u32, u32);
void sub_8153A9C(void);
void sub_8153AFC(struct DodrioSubstruct_318C * unk318C, u8 a1, u8 a2, u8 a3);
void sub_8153BC0(u8 a0);
void sub_8153BF8(u8 a0);
void sub_8153D08(u8 playerCount);
u8 sub_8155E8C(void);
u8 sub_81533B4(void);
void sub_8153DA8(u8 a0, u8 a1);
void sub_8153D80(bool8 a0, u8 a1);
void sub_8153FC8(u8 a0);
void sub_8153DD8(void);
void sub_8153E28(void);
void sub_8153ED8(void);
bool32 sub_8153F1C(void);
void sub_81540DC(bool8 a0);
void sub_8154128(void);
void sub_815417C(void);
void sub_8154274(void);
void sub_81542EC(u8 a0, u8 a1);
void sub_8154370(u8 a0, u8 a1);
void sub_8154398(u16 a0, u8 a1);
void sub_8154438(void);
void sub_81544F0(void);
void sub_8154540(void);
void sub_8154578(void);
void sub_81545BC(bool8 a0);
void sub_81546C0(void);
void sub_8154730(void);
void sub_8154968(struct DodrioSubstruct_0160 * unk0160);
void sub_81549D4(u8 a0);
u8 *sub_81533C4(u8 id);
u8 sub_81537AC(u8 id);
void sub_81536A0(struct DodrioSubstruct_3308 *dst, u8 id);
u32 sub_81534AC(void);
u32 Min(u32 x, u32 y);
u16 sub_8153404(u8 arg0, u8 arg1);
u32 sub_81534F0(u8 arg0);
u32 sub_81535B0(void);
u16 sub_8153390(void);
u8 sub_815372C(void);
bool32 sub_8155E68(void);
void ShowDodrioBerryPickingRecords(void);
void IsDodrioInParty(void);

#endif //GUARD_DODRIO_BERRY_PICKING_H
