#include "global.h"
#include "constants/species.h"
#include "malloc.h"
#include "battle.h"
#include "overworld.h"
#include "quest_log.h"

struct QuestLogStruct_01
{
    u16 v0;
    u16 v2;
    u16 v4;
    u8 v6;
    u8 v7;
};

struct QuestLogStruct_02
{
    u16 v0;
    u16 v2;
    u8 v4;
};

void sub_812BFDC(void)
{
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_WALLY_TUTORIAL | BATTLE_TYPE_DOME)) && (gUnknown_2023E8A == 1 || gUnknown_2023E8A == 7))
    {
        struct QuestLogStruct_01 * questLogTrainerBattleRecord = Alloc(sizeof(struct QuestLogStruct_01));
        struct QuestLogStruct_02 * questLogWildBattleRecord = Alloc(sizeof(struct QuestLogStruct_02));
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
