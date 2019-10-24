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
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_OLD_MAN_TUTORIAL | BATTLE_TYPE_POKEDUDE)) && (gBattleOutcome == B_OUTCOME_WON || gBattleOutcome == B_OUTCOME_CAUGHT))
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
            questLogTrainerBattleRecord->v7 = GetCurrentRegionMapSectionId();
            questLogTrainerBattleRecord->v6 = 0;
            if (playerEndingHP < playerMaxHP / 3 * 2)
                questLogTrainerBattleRecord->v6 = 1;
            if (playerEndingHP < playerMaxHP / 3)
                questLogTrainerBattleRecord->v6++;
            sub_8113550(questLogMessageType, (const u16 *)questLogTrainerBattleRecord);
        }
        else
        {
            if (gBattleOutcome == B_OUTCOME_WON)
            {
                questLogWildBattleRecord->v0 = GetMonData(gEnemyParty + 0, MON_DATA_SPECIES);
                questLogWildBattleRecord->v2 = SPECIES_NONE;
            }
            else
            {
                questLogWildBattleRecord->v0 = SPECIES_NONE;
                questLogWildBattleRecord->v2 = GetMonData(gEnemyParty + 0, MON_DATA_SPECIES);
            }
            questLogWildBattleRecord->v4 = GetCurrentRegionMapSectionId();
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
        r5->v0 = gBattleOutcome - 1; // 0 = won, 1 = lost, 2 = drew
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
                r5->v1[0][r3] = gLinkPlayers[gBattleStruct->multiplayerId ^ 1].name[r3];
            }
        }
        sub_8113550(r8, (const u16 *)r5);
        Free(r5);
    }
}

void sub_812C334(s32 * a0, s32 * a1)
{
    s32 r5;
    s32 _optimized_out = 0;
    u8 r2 = gLinkPlayers[gBattleStruct->multiplayerId].id ^ 2;
    for (r5 = 0; r5 < 4; r5++)
    {
        if (r2 == gLinkPlayers[r5].id)
            a0[0] = r5;
        else if (r5 != gBattleStruct->multiplayerId)
            a1[_optimized_out++] = r5;
    }
}
