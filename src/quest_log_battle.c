#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_anim.h"
#include "link.h"
#include "overworld.h"
#include "quest_log.h"
#include "constants/trainers.h"

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
    u16 defeatedSpecies;
    u16 caughtSpecies;
    u8 mapSec;
};

static void sub_812C334(s32 *, s32 *);

void TrySetQuestLogBattleEvent(void)
{
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_OLD_MAN_TUTORIAL | BATTLE_TYPE_POKEDUDE)) && (gBattleOutcome == B_OUTCOME_WON || gBattleOutcome == B_OUTCOME_CAUGHT))
    {
        struct QuestLogStruct_TrainerBattleRecord * questLogTrainerBattleRecord = Alloc(sizeof(struct QuestLogStruct_TrainerBattleRecord));
        struct QuestLogStruct_WildBattleRecord * questLogWildBattleRecord = Alloc(sizeof(struct QuestLogStruct_WildBattleRecord));
        u16 eventId;
        u16 playerEndingHP;
        u16 playerMaxHP;

        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            switch (gTrainers[gTrainerBattleOpponent_A].trainerClass)
            {
            case TRAINER_CLASS_LEADER:
                eventId = QL_EVENT_DEFEATED_GYM_LEADER;
                break;
            case TRAINER_CLASS_CHAMPION:
                eventId = QL_EVENT_DEFEATED_CHAMPION;
                break;
            case TRAINER_CLASS_ELITE_FOUR:
                eventId = QL_EVENT_DEFEATED_E4_MEMBER;
                break;
            default:
                eventId = QL_EVENT_DEFEATED_TRAINER;
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
            SetQuestLogEvent(eventId, (const u16 *)questLogTrainerBattleRecord);
        }
        else
        {
            if (gBattleOutcome == B_OUTCOME_WON)
            {
                questLogWildBattleRecord->defeatedSpecies = GetMonData(gEnemyParty, MON_DATA_SPECIES);
                questLogWildBattleRecord->caughtSpecies = SPECIES_NONE;
            }
            else // gBattleOutcome == B_OUTCOME_CAUGHT
            {
                questLogWildBattleRecord->defeatedSpecies = SPECIES_NONE;
                questLogWildBattleRecord->caughtSpecies = GetMonData(gEnemyParty, MON_DATA_SPECIES);
            }
            questLogWildBattleRecord->mapSec = GetCurrentRegionMapSectionId();
            SetQuestLogEvent(QL_EVENT_DEFEATED_WILD_MON, (const u16 *)questLogWildBattleRecord);
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

void TrySetQuestLogLinkBattleEvent(void)
{
    s32 sp0;
    s32 sp4[2];
    u16 eventId;
    s32 r3;
    bool32 inUnionRoom;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        struct QuestLogStruct_LinkBattleRecord * r5 = Alloc(sizeof(struct QuestLogStruct_LinkBattleRecord));
        r5->v0 = gBattleOutcome - 1; // 0 = won, 1 = lost, 2 = drew
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            eventId = QL_EVENT_LINK_BATTLED_MULTI;
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
                eventId = QL_EVENT_LINK_BATTLED_DOUBLE;
            else
            {
                inUnionRoom = InUnionRoom();
                eventId = QL_EVENT_LINK_BATTLED_SINGLE;
                
                if (inUnionRoom == TRUE)
                    eventId = QL_EVENT_LINK_BATTLED_UNION;
            }
            for (r3 = 0; r3 < 7; r3++)
            {
                r5->v1[0][r3] = gLinkPlayers[gBattleStruct->multiplayerId ^ 1].name[r3];
            }
        }
        SetQuestLogEvent(eventId, (const u16 *)r5);
        Free(r5);
    }
}

static void sub_812C334(s32 * a0, s32 * a1)
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
