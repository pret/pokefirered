#include "global.h"
#include "main.h"
#include "task.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "malloc.h"
#include "save.h"
#include "util.h"
#include "string_util.h"
#include "event_data.h"
#include "random.h"
#include "cereader_tool.h"
#include "easy_chat.h"
#include "text.h"
#include "battle_setup.h"
#include "battle_transition.h"
#include "battle.h"
#include "battle_2.h"
#include "overworld.h"

struct UnkStruct_8479D34
{
    s8 mapGroup;
    s8 mapNum;
    u8 filler[2];
    u8 flags1[8];
    u8 flags2[8];
    u8 flags3[8];
};

struct UnkSubstruct_203F458_000C_004
{
    /* 0x000 */ u8 unk_000[11];
    /* 0x00B */ u8 unk_00B;
    /* 0x00C */ u8 unk_00C;
    /* 0x00E */ u16 unk_00E[6];
    /* 0x01A */ u16 unk_01A[6];
    /* 0x026 */ u16 unk_026[6];
    /* 0x032 */ u16 unk_032[6];
    /* 0x040 */ struct BattleTowerPokemon unk_040[PARTY_SIZE];
}; // size: 328

struct UnkSubstruct_203F458_000C
{
    /* 0x000 */ u8 filler_000[2];
    /* 0x002 */ u8 unk_002;
    /* 0x003 */ u8 unk_003;
    /* 0x004 */ struct UnkSubstruct_203F458_000C_004 unk_004[3];
    /* 0x3DC */ u8 filler_3DC[4];
};

struct Unk_203F458_Header
{
    u8 unk0;
    u8 unk1;
    u32 unk4;
};

struct UnkStruct_203F458_SaveBlock
{
    struct Unk_203F458_Header unk_0000;
    struct UnkSubstruct_203F458_000C unk_0008[8];
};

struct UnkStruct_203F458
{
    /* 0x0000 */ u8 unk_0000;
    /* 0x0004 */ struct UnkStruct_203F458_SaveBlock unk_0004;
};

struct UnkStruct_203F45C
{
    /* 0x00 */ u8 unk_00[11];
    /* 0x0C */ u16 unk_0C[6];
    /* 0x18 */ u16 unk_18[6];
    /* 0x24 */ u16 unk_24[6];
    /* 0x30 */ u16 unk_30[6];
    /* 0x3C */ u8 unk_3C;
    /* 0x3D */ u8 unk_3D;
    /* 0x3E */ u8 unk_3E;
};

struct UnkStruct_8479ED8
{
    u8 unk0;
    u8 unk1;
    bool8 unk2;
};

struct UnkStruct_847A024
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    bool8 unk3;
    bool8 unk4;
};

EWRAM_DATA struct UnkStruct_203F458 * gUnknown_203F458 = NULL;
EWRAM_DATA struct UnkStruct_203F45C * gUnknown_203F45C = NULL;

void sub_815D96C(void);
void sub_815DC8C(void);  // setup
void sub_815DD2C(void);  // teardown
void sub_815DD44(void);
void sub_815DDB0(void);
void sub_815DEFC(u16 * ecWords, u8 * dest);
void sub_815DF54(void);
void sub_815E068(u8 battleType, u8 facilityClass);
void sub_815E160(void);
void sub_815E1C0(void);
void sub_815E1F0(void);
void sub_815E218(void);
void sub_815E28C(void);
void sub_815E394(void);
void sub_815E408(void);
void sub_815E4B0(void);
void sub_815E56C(void);
void sub_815E5C4(void);
void sub_815E5F0(void);
void sub_815E658(void);
void sub_815E720(void);
void sub_815E88C(void);
void sub_815E8B4(void);
void sub_815E8CC(void);
void sub_815E908(void);
void sub_815E948(void);
void sub_815E9C8(void);
void sub_815E9FC(void);
void sub_815EC0C(void);

extern const struct UnkStruct_8479D34 gUnknown_8479D34[15];
extern void (*const gUnknown_847A230[])(void);
extern const struct Unk_203F458_Header gUnknown_84827AC;
extern const struct UnkSubstruct_203F458_000C *const gUnknown_84827B4[][8];
extern const u16 gUnknown_847A284[8][3];
extern const struct UnkStruct_8479ED8 gUnknown_8479ED8[83];
extern const struct UnkStruct_847A024 gUnknown_847A024[10];

bool32 sub_815D7BC(void * dest, void * buffer)
{
    if (TryCopySpecialSaveSection(30, buffer) != 1)
        return FALSE;
    memcpy(dest + 0x000, buffer, 0xF88);

    if (TryCopySpecialSaveSection(31, buffer) != 1)
        return FALSE;
    memcpy(dest + 0xF88, buffer, 0xF80);

    if (!sub_815D6B4(dest))
        return FALSE;
    return TRUE;
}

bool32 sub_815D80C(void * dest)
{
    void * buffer = AllocZeroed(0x1000);
    bool32 success = sub_815D7BC(dest, buffer);
    Free(buffer);
    return success;
}

bool32 sub_815D834(void)
{
    // Stubbed out?
    return FALSE;
}

void sub_815D838(void)
{
    u8 i, j;

    for (i = 0; i < 15; i++)
    {
        const u8 * flags1 = gUnknown_8479D34[i].flags1;
        const u8 * flags2 = gUnknown_8479D34[i].flags2;
        const u8 * flags3 = gUnknown_8479D34[i].flags3;
        for (j = 0; j < 8; j++)
        {
            if (flags1[j] != 0xFF)
                FlagSet(FLAG_TRAINER_TOWER_START + flags1[j]);
            if (flags2[j] != 0xFF)
                FlagSet(FLAG_TRAINER_TOWER_START + flags2[j]);
            if (flags3[j] != 0xFF)
                FlagSet(FLAG_TRAINER_TOWER_START + flags3[j]);
        }
    }
}

void sub_815D8C8(void)
{
    u16 var = VarGet(VAR_0x4023);
    if (var < 1500) {
        VarSet(VAR_0x4023, var + 1);
    }
}

void sub_815D8F8(void) // fakematching
{
    u8 i;
    register u32 found_map asm("r4") = 0xFF;
    for (i = 0; i < 15; i++)
    {
        if (gUnknown_8479D34[i].mapGroup == gSaveBlock1Ptr->location.mapGroup && gUnknown_8479D34[i].mapNum == gSaveBlock1Ptr->location.mapNum)
            found_map = i;
    }

    if (found_map == 0xFF)
        return;
    if (VarGet(VAR_0x4023) >= 1500)
    {
        VarSet(VAR_0x4023, 0);
        sub_815D838();
        sub_815D96C();
    }
}

void sub_815D96C(void)
{
    u8 i, j;
    const u8 * flags;
    u16 rval;

    for (i = 0; i < 15; i++)
    {
        rval = Random() % 100;
        if (rval >= 90)
            flags = gUnknown_8479D34[i].flags1;
        else if (rval >= 60)
            flags = gUnknown_8479D34[i].flags2;
        else
            flags = gUnknown_8479D34[i].flags3;
        for (j = 0; j < 8; j++)
        {
            if (flags[j] != 0xFF)
                FlagClear(FLAG_TRAINER_TOWER_START + flags[j]);
        }
    }
}

void sub_815D9E8(void)
{
    sub_815DC8C();
    gUnknown_847A230[gSpecialVar_0x8004]();
    sub_815DD2C();
}

u8 sub_815DA10(void)
{
    return gFacilityClassToTrainerClass[gUnknown_203F45C->unk_3D];
}

void sub_815DA28(u8 * dest)
{
    StringCopyN(dest, gUnknown_203F45C->unk_00, 11);
}

u8 sub_815DA3C(void)
{
    return gFacilityClassToPicIndex[gUnknown_203F45C->unk_3D];
}

void sub_815DA54(void)
{
    u16 r10;
    s32 r9;

    sub_815DC8C();
    gUnknown_203F45C = AllocZeroed(sizeof(*gUnknown_203F45C));
    r10 = VarGet(VAR_0x4001);
    StringCopyN(gUnknown_203F45C->unk_00, gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r10].unk_000, 11);

    for (r9 = 0; r9 < 6; r9++)
    {
        gUnknown_203F45C->unk_0C[r9] = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r10].unk_01A[r9];
        gUnknown_203F45C->unk_18[r9] = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r10].unk_026[r9];

        if (gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_002 == 1)
        {
            gUnknown_203F45C->unk_24[r9] = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r10 + 1].unk_01A[r9];
            gUnknown_203F45C->unk_30[r9] = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r10 + 1].unk_026[r9];
        }
    }

    gUnknown_203F45C->unk_3C = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_002;
    gUnknown_203F45C->unk_3D = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r10].unk_00B;
    gUnknown_203F45C->unk_3E = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r10].unk_00C;
    SetVBlankCounter1Ptr(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
    sub_815DD2C();
}

void sub_815DBDC(void)
{
    Free(gUnknown_203F45C);
    gUnknown_203F45C = NULL;
}

void sub_815DBF4(u8 * dest, u8 opponentIdx)
// TTower_GetBeforeBattleMessage?
{
    VarSet(VAR_0x4003, opponentIdx);
    sub_815E068(gUnknown_203F45C->unk_3C, gUnknown_203F45C->unk_3D);
    if (opponentIdx == 0)
        sub_815DEFC(gUnknown_203F45C->unk_0C, dest);
    else
        sub_815DEFC(gUnknown_203F45C->unk_24, dest);
}

void sub_815DC40(u8 * dest, u8 opponentIdx)
// TTower_GetAfterBattleMessage?
{
    VarSet(VAR_0x4003, opponentIdx);
    sub_815E068(gUnknown_203F45C->unk_3C, gUnknown_203F45C->unk_3D);
    if (opponentIdx == 0)
        sub_815DEFC(gUnknown_203F45C->unk_18, dest);
    else
        sub_815DEFC(gUnknown_203F45C->unk_30, dest);
}

#ifdef NONMATCHING
void sub_815DC8C(void) // fakematching
{
    u32 whichTimer = gSaveBlock1Ptr->unkArrayIdx;
    s32 r4;
    const struct UnkSubstruct_203F458_000C *const * r7;

    gUnknown_203F458 = AllocZeroed(sizeof(*gUnknown_203F458));
    gUnknown_203F458->unk_0000 = gMapHeader.mapDataId - 0x2A;
    if (sub_815D834() == TRUE)
        sub_815D80C(&gUnknown_203F458->unk_0004);
    else
    {
        struct UnkStruct_203F458 * r0_ = gUnknown_203F458;
        const struct Unk_203F458_Header * r1 = &gUnknown_84827AC;
//        *r0_ = *r1;
        memcpy(&r0_->unk_0004.unk_0000, r1, sizeof(struct Unk_203F458_Header));
//        gUnknown_203F458->unk_0004.unk_0000 = gUnknown_84827AC;
        r7 = gUnknown_84827B4[whichTimer];
        for (r4 = 0; r4 < 8; r4++)
        {
            void * r0 = gUnknown_203F458;
            r0 = r4 * sizeof(struct UnkSubstruct_203F458_000C) + r0;
            r0 += offsetof(struct UnkStruct_203F458, unk_0004.unk_0008);
            memcpy(r0, r7[r4], sizeof(struct UnkSubstruct_203F458_000C));
//            r0[r4] = *r7[r4];
        }
        gUnknown_203F458->unk_0004.unk_0000.unk4 = CalcByteArraySum((void *)gUnknown_203F458->unk_0004.unk_0008, sizeof(gUnknown_203F458->unk_0004.unk_0008));
        sub_815EC0C();
    }
}
#else
NAKED
void sub_815DC8C(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tldr r0, _0815DCBC @ =gSaveBlock1Ptr\n"
                "\tldr r0, [r0]\n"
                "\tldr r1, _0815DCC0 @ =0x00003d34\n"
                "\tadds r0, r1\n"
                "\tldr r5, [r0]\n"
                "\tldr r4, _0815DCC4 @ =gUnknown_203F458\n"
                "\tldr r0, _0815DCC8 @ =0x00001f0c\n"
                "\tbl AllocZeroed\n"
                "\tstr r0, [r4]\n"
                "\tldr r1, _0815DCCC @ =gMapHeader\n"
                "\tldrb r1, [r1, 0x12]\n"
                "\tsubs r1, 0x2A\n"
                "\tstrb r1, [r0]\n"
                "\tbl sub_815D834\n"
                "\tcmp r0, 0x1\n"
                "\tbne _0815DCD0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x4\n"
                "\tbl sub_815D80C\n"
                "\tb _0815DD18\n"
                "\t.align 2, 0\n"
                "_0815DCBC: .4byte gSaveBlock1Ptr\n"
                "_0815DCC0: .4byte 0x00003d34\n"
                "_0815DCC4: .4byte gUnknown_203F458\n"
                "_0815DCC8: .4byte 0x00001f0c\n"
                "_0815DCCC: .4byte gMapHeader\n"
                "_0815DCD0:\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, _0815DD20 @ =gUnknown_84827AC\n"
                "\tadds r0, 0x4\n"
                "\tmovs r2, 0x8\n"
                "\tbl memcpy\n"
                "\tlsls r1, r5, 5\n"
                "\tldr r0, _0815DD24 @ =gUnknown_84827B4\n"
                "\tadds r7, r1, r0\n"
                "\tmovs r5, 0\n"
                "\tmovs r4, 0x7\n"
                "_0815DCE6:\n"
                "\tldr r6, _0815DD28 @ =gUnknown_203F458\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5, r0\n"
                "\tadds r0, 0xC\n"
                "\tldm r7!, {r1}\n"
                "\tmovs r2, 0xF8\n"
                "\tlsls r2, 2\n"
                "\tbl memcpy\n"
                "\tmovs r0, 0xF8\n"
                "\tlsls r0, 2\n"
                "\tadds r5, r0\n"
                "\tsubs r4, 0x1\n"
                "\tcmp r4, 0\n"
                "\tbge _0815DCE6\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, 0xC\n"
                "\tmovs r1, 0xF8\n"
                "\tlsls r1, 5\n"
                "\tbl CalcByteArraySum\n"
                "\tldr r1, [r6]\n"
                "\tstr r0, [r1, 0x8]\n"
                "\tbl sub_815EC0C\n"
                "_0815DD18:\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0815DD20: .4byte gUnknown_84827AC\n"
                "_0815DD24: .4byte gUnknown_84827B4\n"
                "_0815DD28: .4byte gUnknown_203F458");
}
#endif // NONMATCHING

void sub_815DD2C(void)
{
    Free(gUnknown_203F458);
    gUnknown_203F458 = NULL;
}

void sub_815DD44(void)
{
    if (gMapHeader.mapDataId - 0x129 > gUnknown_203F458->unk_0004.unk_0000.unk0)
    {
        gSpecialVar_Result = 3;
        sub_8055D40(0x132);
    }
    else
    {
        gSpecialVar_Result = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_002;
        sub_8055D40(gUnknown_847A284[gUnknown_203F458->unk_0000][gSpecialVar_Result]);
        sub_815DDB0();
    }
}

void sub_815DDB0(void)
{
    s32 r3, r4;
    u8 r1, r2, r4_;
    switch (gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_002)
    {
        case 0:
            r2 = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[0].unk_00B;
            for (r3 = 0; r3 < NELEMS(gUnknown_8479ED8); r3++)
            {
                if (gUnknown_8479ED8[r3].unk1 == r2)
                    break;
            }
            if (r3 != NELEMS(gUnknown_8479ED8))
                r1 = gUnknown_8479ED8[r3].unk0;
            else
                r1 = 18;
            VarSet(VAR_0x4011, r1);
            break;
        case 1:
            r2 = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[0].unk_00B;
            for (r3 = 0; r3 < NELEMS(gUnknown_847A024); r3++)
            {
                if (gUnknown_847A024[r3].unk2 == r2)
                    break;
            }
            if (r3 != NELEMS(gUnknown_847A024))
            {
                r1  = gUnknown_847A024[r3].unk0;
                r4_ = gUnknown_847A024[r3].unk1;
            }
            else
            {
                r1  = 18;
                r4_ = 18;
            }
            VarSet(VAR_0x4010, r1);
            VarSet(VAR_0x4013, r4_);
            break;
        case 2:
            for (r4 = 0; r4 < 3; r4++)
            {
                r2 = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r4].unk_00B;
                for (r3 = 0; r3 < NELEMS(gUnknown_8479ED8); r3++)
                {
                    if (gUnknown_8479ED8[r3].unk1 == r2)
                        break;
                }
                if (r3 != NELEMS(gUnknown_8479ED8))
                    r1 = gUnknown_8479ED8[r3].unk0;
                else
                    r1 = 18;
                switch (r4)
                {
                    case 0:
                        VarSet(VAR_0x4012, r1);
                        break;
                    case 1:
                        VarSet(VAR_0x4010, r1);
                        break;
                    case 2:
                        VarSet(VAR_0x4011, r1);
                        break;
                }
            }
    }
}

void sub_815DEFC(u16 * ecWords, u8 * dest)
{
    s32 r1;
    ConvertEasyChatWordsToString(dest, ecWords, 3, 2);
    if ((unsigned)GetStringWidth(2, dest, -1) > 196)
    {
        ConvertEasyChatWordsToString(dest, ecWords, 2, 3);
        r1 = 0;
        while (dest[r1++] != CHAR_NEWLINE)
            ;
        while (dest[r1] != CHAR_NEWLINE)
            r1++;
        dest[r1] = CHAR_PROMPT_SCROLL;
    }
}

#ifdef NONMATCHING
void sub_815DF54(void)
{
    u16 r4 = gSpecialVar_0x8006;
    u8 r1;
    u8 r5 = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_002;
    // HOW DO I MATCH THIS CONTROL FLOW?!?!
    r1 = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r5 == 1 ? 0 : r4].unk_00B;
    switch (gSpecialVar_0x8005)
    {
        case 2:
            sub_815E068(r5, r1);
            sub_815DEFC(gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r4].unk_00E, gStringVar4);
            break;
        case 3:
            sub_815E068(r5, r1);
            sub_815DEFC(gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r4].unk_01A, gStringVar4);
            break;
        case 4:
            sub_815E068(r5, r1);
            sub_815DEFC(gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r4].unk_026, gStringVar4);
            break;
        case 5:
            sub_815DEFC(gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_004[r4].unk_032, gStringVar4);
            break;
    }
}
#else
NAKED
void sub_815DF54(void)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                "\tldr r0, _0815DF90 @ =gSpecialVar_0x8006\n"
                "\tldrh r4, [r0]\n"
                "\tldr r2, _0815DF94 @ =gUnknown_203F458\n"
                "\tldr r3, [r2]\n"
                "\tldrb r1, [r3]\n"
                "\tlsls r0, r1, 5\n"
                "\tsubs r0, r1\n"
                "\tlsls r1, r0, 5\n"
                "\tadds r0, r3, r1\n"
                "\tldrb r5, [r0, 0xE]\n"
                "\tcmp r5, 0x1\n"
                "\tbeq _0815DF7C\n"
                "\tlsls r0, r4, 2\n"
                "\tadds r0, r4\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r4\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r1\n"
                "\tadds r0, r3, r0\n"
                "_0815DF7C:\n"
                "\tldrb r1, [r0, 0x1B]\n"
                "\tldr r0, _0815DF98 @ =gSpecialVar_0x8005\n"
                "\tldrh r0, [r0]\n"
                "\tcmp r0, 0x3\n"
                "\tbeq _0815DFD4\n"
                "\tcmp r0, 0x3\n"
                "\tbgt _0815DF9C\n"
                "\tcmp r0, 0x2\n"
                "\tbeq _0815DFA6\n"
                "\tb _0815E05C\n"
                "\t.align 2, 0\n"
                "_0815DF90: .4byte gSpecialVar_0x8006\n"
                "_0815DF94: .4byte gUnknown_203F458\n"
                "_0815DF98: .4byte gSpecialVar_0x8005\n"
                "_0815DF9C:\n"
                "\tcmp r0, 0x4\n"
                "\tbeq _0815E000\n"
                "\tcmp r0, 0x5\n"
                "\tbeq _0815E038\n"
                "\tb _0815E05C\n"
                "_0815DFA6:\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_815E068\n"
                "\tldr r0, _0815DFD0 @ =gUnknown_203F458\n"
                "\tldr r0, [r0]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0xE\n"
                "\tb _0815E026\n"
                "\t.align 2, 0\n"
                "_0815DFD0: .4byte gUnknown_203F458\n"
                "_0815DFD4:\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_815E068\n"
                "\tldr r0, _0815DFFC @ =gUnknown_203F458\n"
                "\tldr r0, [r0]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0x1A\n"
                "\tb _0815E026\n"
                "\t.align 2, 0\n"
                "_0815DFFC: .4byte gUnknown_203F458\n"
                "_0815E000:\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_815E068\n"
                "\tldr r0, _0815E030 @ =gUnknown_203F458\n"
                "\tldr r0, [r0]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0x26\n"
                "_0815E026:\n"
                "\tldr r1, _0815E034 @ =gStringVar4\n"
                "\tbl sub_815DEFC\n"
                "\tb _0815E05C\n"
                "\t.align 2, 0\n"
                "_0815E030: .4byte gUnknown_203F458\n"
                "_0815E034: .4byte gStringVar4\n"
                "_0815E038:\n"
                "\tldr r0, [r2]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0x32\n"
                "\tldr r1, _0815E064 @ =gStringVar4\n"
                "\tbl sub_815DEFC\n"
                "_0815E05C:\n"
                "\tpop {r4,r5}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0815E064: .4byte gStringVar4");
}
#endif // NONMATCHING

void sub_815E068(u8 battleType, u8 facilityClass)
{
    u16 r5 = FALSE;
    s32 r4;
    switch (battleType)
    {
        case 0:
        case 2:
            for (r4 = 0; r4 < NELEMS(gUnknown_8479ED8); r4++)
            {
                if (gUnknown_8479ED8[r4].unk1 == facilityClass)
                    break;
            }
            if (r4 != NELEMS(gUnknown_8479ED8))
                r5 = gUnknown_8479ED8[r4].unk2;
            break;
        case 1:
            for (r4 = 0; r4 < NELEMS(gUnknown_847A024); r4++)
            {
                if (gUnknown_847A024[r4].unk2 == facilityClass)
                    break;
            }
            if (r4 != NELEMS(gUnknown_847A024))
            {
                if (VarGet(VAR_0x4003))
                    r5 = gUnknown_847A024[r4].unk4;
                else
                    r5 = gUnknown_847A024[r4].unk3;
            }
            break;
    }
    gUnknown_20370DC = gUnknown_20370DA;
    gUnknown_20370DA = r5;
}

void sub_815E114(void)
{
    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

void sub_815E124(u8 taskId)
{
    if (sub_80D08F8() == TRUE)
    {
        gMain.savedCallback = sub_815E114;
        sub_80563F0();
        SetMainCallback2(sub_800FD9C);
        DestroyTask(taskId);
    }
}

void sub_815E160(void)
{
    gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_FACTORY;
    if (gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_002 == 1)
        gBattleTypeFlags |= BATTLE_TYPE_DOUBLE;
    gTrainerBattleOpponent_A = 0;
    sub_815E9FC();
    CreateTask(sub_815E124, 1);
    PlayMapChosenOrBattleBGM(0);
    sub_80D08B8(sub_8080060());
}

void sub_815E1C0(void)
{
    if (!gSpecialVar_0x8005)
        gSpecialVar_Result = gUnknown_203F458->unk_0004.unk_0008[gUnknown_203F458->unk_0000].unk_002;
}

void sub_815E1F0(void)
{
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk8++;
}
