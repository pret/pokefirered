#include "global.h"
#include "constants/species.h"
#include "malloc.h"
#include "battle.h"
#include "link.h"
#include "overworld.h"
#include "quest_log.h"

struct QuestLogStruct_TrainerBattleRecord
{
    u16 v0;
    u16 v2;
    u16 v4;
    u8 v6;
    u8 v7;
};

struct QuestLogStruct_WildBattleRecord
{
    u16 v0;
    u16 v2;
    u8 v4;
};

void sub_812C334(s32 *, s32 *);

void sub_812BFDC(void)
{
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_WALLY_TUTORIAL | BATTLE_TYPE_DOME)) && (gUnknown_2023E8A == 1 || gUnknown_2023E8A == 7))
    {
        struct QuestLogStruct_TrainerBattleRecord * questLogTrainerBattleRecord = Alloc(sizeof(struct QuestLogStruct_TrainerBattleRecord));
        struct QuestLogStruct_WildBattleRecord * questLogWildBattleRecord = Alloc(sizeof(struct QuestLogStruct_WildBattleRecord));
        u16 questLogMessageType;
        u16 playerEndingHP;
        u16 playerMaxHP;

        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            switch (gTrainers[gTrainerBattleOpponent_A].trainerClass)
            {
                case 0x54:
                    questLogMessageType = 30;
                    break;
                case 0x5a:
                    questLogMessageType = 33;
                    break;
                case 0x57:
                    questLogMessageType = 32;
                    break;
                default:
                    questLogMessageType = 34;
                    break;
            }
            questLogTrainerBattleRecord->v0 = gTrainerBattleOpponent_A;
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                questLogTrainerBattleRecord->v2 = gBattleResults.lastOpponentSpecies;
                if (GetBattlerSide(gBattleStruct->field_182) == B_SIDE_PLAYER)
                    questLogTrainerBattleRecord->v4 = gBattleMons[gBattleStruct->field_182].species;
                else if (gBattleMons[GetBattlerAtPosition(0)].hp != 0)
                    questLogTrainerBattleRecord->v4 = gBattleMons[GetBattlerAtPosition(0)].species;
                else
                    questLogTrainerBattleRecord->v4 = gBattleMons[GetBattlerAtPosition(2)].species;
                playerEndingHP = gBattleMons[GetBattlerAtPosition(0)].hp + gBattleMons[GetBattlerAtPosition(2)].hp;
                playerMaxHP = gBattleMons[GetBattlerAtPosition(0)].maxHP + gBattleMons[GetBattlerAtPosition(2)].maxHP;
            }
            else
            {
                questLogTrainerBattleRecord->v2 = gBattleResults.lastOpponentSpecies;
                questLogTrainerBattleRecord->v4 = gBattleMons[GetBattlerAtPosition(0)].species;
                playerEndingHP = gBattleMons[GetBattlerAtPosition(0)].hp;
                playerMaxHP = gBattleMons[GetBattlerAtPosition(0)].maxHP;
            }
            questLogTrainerBattleRecord->v7 = sav1_map_get_name();
            questLogTrainerBattleRecord->v6 = 0;
            if (playerEndingHP < playerMaxHP / 3 * 2)
                questLogTrainerBattleRecord->v6 = 1;
            if (playerEndingHP < playerMaxHP / 3)
                questLogTrainerBattleRecord->v6++;
            sub_8113550(questLogMessageType, (const u16 *)questLogTrainerBattleRecord);
        }
        else
        {
            if (gUnknown_2023E8A == 1)
            {
                questLogWildBattleRecord->v0 = GetMonData(gEnemyParty + 0, MON_DATA_SPECIES);
                questLogWildBattleRecord->v2 = SPECIES_NONE;
            }
            else
            {
                questLogWildBattleRecord->v0 = SPECIES_NONE;
                questLogWildBattleRecord->v2 = GetMonData(gEnemyParty + 0, MON_DATA_SPECIES);
            }
            questLogWildBattleRecord->v4 = sav1_map_get_name();
            sub_8113550(31, (const u16 *)questLogWildBattleRecord);
        }
        Free(questLogTrainerBattleRecord);
        Free(questLogWildBattleRecord);
    }
}

struct QuestLogStruct_LinkBattleRecord
{
    u8 v0;
    u8 v1[3][7];
};

void sub_812C224(void)
{
    s32 sp0;
    s32 sp4[2];
    u16 r8;
    s32 r3;
    u32 r0;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        struct QuestLogStruct_LinkBattleRecord * r5 = Alloc(sizeof(struct QuestLogStruct_LinkBattleRecord));
        r5->v0 = gUnknown_2023E8A - 1;
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            r8 = 15;
            sub_812C334(&sp0, sp4);
            for (r3 = 0; r3 < 7; r3++)
            {
                r5->v1[0][r3] = gLinkPlayers[sp0].name[r3];
                r5->v1[1][r3] = gLinkPlayers[sp4[0]].name[r3];
                r5->v1[2][r3] = gLinkPlayers[sp4[1]].name[r3];
            }
        }
        else
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                r8 = 14;
            else
            {
                r0 = InUnionRoom();
                r8 = 13;
                if (r0 == TRUE)
                    r8 = 19;
            }
            for (r3 = 0; r3 < 7; r3++)
            {
                r5->v1[0][r3] = gLinkPlayers[gBattleStruct->field_B5 ^ 1].name[r3];
            }
        }
        sub_8113550(r8, (const u16 *)r5);
        Free(r5);
    }
}

#ifdef NONMATCHING
void sub_812C334(s32 * a0, s32 * a1)
{
    s32 r5;
    u8 r2 = gLinkPlayers[gBattleStruct->field_B5].id;
    for (r5 = 0; r5 < 4; r5++)
    {
        if ((r2 ^ 2) == gLinkPlayers[r5].id)
            *a0 = r5;
        else if (r5 != gBattleStruct->field_B5)
            *a1++ = r5;
    }
}
#else
NAKED
void sub_812C334(s32 * a0, s32 * a1)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tadds r6, r0, 0\n"
                "\tldr r3, _0812C35C @ =gLinkPlayers\n"
                "\tldr r4, _0812C360 @ =gBattleStruct\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0xB5\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r0, r2, 3\n"
                "\tsubs r0, r2\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r3\n"
                "\tldrb r2, [r0, 0x18]\n"
                "\tmovs r0, 0x2\n"
                "\tmovs r5, 0\n"
                "\teors r2, r0\n"
                "_0812C352:\n"
                "\tldrh r0, [r3, 0x18]\n"
                "\tcmp r2, r0\n"
                "\tbne _0812C364\n"
                "\tstr r5, [r6]\n"
                "\tb _0812C370\n"
                "\t.align 2, 0\n"
                "_0812C35C: .4byte gLinkPlayers\n"
                "_0812C360: .4byte gBattleStruct\n"
                "_0812C364:\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0xB5\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r5, r0\n"
                "\tbeq _0812C370\n"
                "\tstm r1!, {r5}\n"
                "_0812C370:\n"
                "\tadds r3, 0x1C\n"
                "\tadds r5, 0x1\n"
                "\tcmp r5, 0x3\n"
                "\tble _0812C352\n"
                "\tpop {r4-r6}\n"
                "\tpop {r0}\n"
                "\tbx r0");
}
#endif // NONMATCHING
