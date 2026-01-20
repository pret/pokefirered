#include "global.h"
#include "battle_tower.h"
#include "random.h"
#include "text.h"
#include "event_data.h"
#include "string_util.h"
#include "battle.h"
#include "data.h"
#include "pokedex.h"
#include "overworld.h"
#include "battle_transition.h"
#include "easy_chat.h"
#include "battle_setup.h"
#include "battle_main.h"
#include "task.h"
#include "battle.h"
#include "party_menu.h"
#include "new_game.h"
#include "save.h"
#include "item.h"
#include "script_pokemon_util.h"
#include "constants/abilities.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/event_objects.h"

static EWRAM_DATA u16 sSpecialVar_0x8004_Copy = 0;

#define TakeBravoTrainerBattleTowerOffTheAir()
#define ewram160FB (*((u8 *)&gBattleStruct->field_DA))

static void ResetBattleTowerStreak(u8 levelType);
static void SetBattleTowerTrainerGfxId(u8 trainerClass);
static void CheckMonBattleTowerBanlist(u16 species, u16 heldItem, u16 hp, u8 battleTowerLevelType, u8 monLevel, u16 *validPartySpecies, u16 *validPartyHeldItems, u8 *numValid);
static void SaveCurrentWinStreak(void);
static void ValidateBattleTowerRecordChecksums(void);
static void SetBattleTowerRecordChecksum(struct BattleTowerRecord * record);
static void ClearBattleTowerRecord(struct BattleTowerRecord * record);
static void PopulateBravoTrainerBattleTowerLostData(void);
static u16 GetCurrentBattleTowerWinStreak(u8 levelType);
static void PrintEReaderTrainerFarewellMessage(void);

static const u8 sText_100[] = _("100");

static const struct BattleTowerTrainer sBattleTowerTrainers[] =
{
// added entry to fix warnings
    {
        .trainerClass = FACILITY_CLASS_YOUNGSTER,
        .name = _("X"),
        .teamFlags = 0x01,
        .greeting = {
            EC_WORD_ARE,
            EC_WORD_YOU,
            EC_WORD_READY,
            EC_WORD_QUES,
            EC_WORD_HERE_I_COME,
            EC_WORD_EXCL,
        },
    },
};

static const u16 sBattleTowerHeldItems[] = {
    ITEM_NONE,
    ITEM_KINGS_ROCK,
    ITEM_SITRUS_BERRY,
    ITEM_ORAN_BERRY,
    ITEM_CHESTO_BERRY,
    ITEM_HARD_STONE,
    ITEM_FOCUS_BAND,
    ITEM_PERSIM_BERRY,
    ITEM_MIRACLE_SEED,
    ITEM_BERRY_JUICE,
    ITEM_MACHO_BRACE,
    ITEM_SILVER_POWDER,
    ITEM_CHERI_BERRY,
    ITEM_BLACK_GLASSES,
    ITEM_BLACK_BELT,
    ITEM_SOUL_DEW,
    ITEM_CHOICE_BAND,
    ITEM_MAGNET,
    ITEM_SILK_SCARF,
    ITEM_WHITE_HERB,
    ITEM_DEEP_SEA_SCALE,
    ITEM_DEEP_SEA_TOOTH,
    ITEM_MYSTIC_WATER,
    ITEM_SHARP_BEAK,
    ITEM_QUICK_CLAW,
    ITEM_LEFTOVERS,
    ITEM_RAWST_BERRY,
    ITEM_LIGHT_BALL,
    ITEM_POISON_BARB,
    ITEM_NEVER_MELT_ICE,
    ITEM_ASPEAR_BERRY,
    ITEM_SPELL_TAG,
    ITEM_BRIGHT_POWDER,
    ITEM_LEPPA_BERRY,
    ITEM_SCOPE_LENS,
    ITEM_TWISTED_SPOON,
    ITEM_METAL_COAT,
    ITEM_MENTAL_HERB,
    ITEM_CHARCOAL,
    ITEM_PECHA_BERRY,
    ITEM_SOFT_SAND,
    ITEM_LUM_BERRY,
    ITEM_DRAGON_SCALE,
    ITEM_DRAGON_FANG,
    ITEM_IAPAPA_BERRY,
    ITEM_WIKI_BERRY,
    ITEM_SEA_INCENSE,
    ITEM_SHELL_BELL,
    ITEM_SALAC_BERRY,
    ITEM_LANSAT_BERRY,
    ITEM_APICOT_BERRY,
    ITEM_STARF_BERRY,
    ITEM_LIECHI_BERRY,
    ITEM_STICK,
    ITEM_LAX_INCENSE,
    ITEM_AGUAV_BERRY,
    ITEM_FIGY_BERRY,
    ITEM_THICK_CLUB,
    ITEM_MAGO_BERRY,
    ITEM_METAL_POWDER,
    ITEM_PETAYA_BERRY,
    ITEM_LUCKY_PUNCH,
    ITEM_GANLON_BERRY
};

#include "data/battle_tower/level_50_mons.h"
#include "data/battle_tower/level_100_mons.h"

static const u8 sMaleTrainerClasses[] =
{
    FACILITY_CLASS_RUIN_MANIAC,
};

static const u8 sFemaleTrainerClasses[] =
{
    FACILITY_CLASS_AROMA_LADY,
};

static const u8 sMaleTrainerGfx[] =
{
    OBJ_EVENT_GFX_HIKER,
};

static const u8 sFemaleTrainerGfx[] =
{
    OBJ_EVENT_GFX_WOMAN_3,
};

const u16 gBattleTowerBannedSpecies[] = {
    SPECIES_MEW,
    SPECIES_MEWTWO,
    SPECIES_HO_OH,
    SPECIES_LUGIA,
    SPECIES_CELEBI,
    SPECIES_KYOGRE,
    SPECIES_GROUDON,
    SPECIES_RAYQUAZA,
    SPECIES_JIRACHI,
    SPECIES_DEOXYS,
    0xFFFF
};

static const u16 sShortStreakPrizes[] = {
    ITEM_HP_UP,
    ITEM_PROTEIN,
    ITEM_IRON,
    ITEM_CALCIUM,
    ITEM_CARBOS,
    ITEM_ZINC
};

static const u16 sLongStreakPrizes[] = {
    ITEM_BRIGHT_POWDER,
    ITEM_WHITE_HERB,
    ITEM_QUICK_CLAW,
    ITEM_LEFTOVERS,
    ITEM_MENTAL_HERB,
    ITEM_KINGS_ROCK,
    ITEM_FOCUS_BAND,
    ITEM_SCOPE_LENS,
    ITEM_CHOICE_BAND
};

void BattleTowerMapScript2(void)
{
    u8 count = 0;
    s32 levelType;

    for (levelType = 0; levelType < 2; levelType++)
    {
        switch (gSaveBlock2Ptr->battleTower.var_4AE[levelType])
        {
        default:
        case 0:
            ResetBattleTowerStreak(levelType);
            if (count == 0)
                VarSet(VAR_TEMP_0, 5);
            break;
        case 1:
            ResetBattleTowerStreak(levelType);
            VarSet(VAR_TEMP_0, BTSPECIAL_RESULT_SAVE_SCUM);
            count++;
            break;
        case 3:
            break;
        case 4:
            VarSet(VAR_TEMP_0, BTSPECIAL_RESULT_WON7);
            count++;
            break;
        case 5:
            VarSet(VAR_TEMP_0, BTSPECIAL_RESULT_LOST);
            count++;
            break;
        case 6:
            break;
        case 2:
            VarSet(VAR_TEMP_0, BTSPECIAL_RESULT_QUICKSAVE);
            count++;
            break;
        }
    }
    if (gSaveBlock2Ptr->battleTower.var_4AE[0] == 3 && gSaveBlock2Ptr->battleTower.var_4AE[1] == 3)
        VarSet(VAR_TEMP_0, BTSPECIAL_RESULT_INACTIVE);
    ValidateBattleTowerRecordChecksums();
}

static void ResetBattleTowerStreak(u8 levelType)
{
    gSaveBlock2Ptr->battleTower.var_4AE[levelType] = 0;
    gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] = 1;
    gSaveBlock2Ptr->battleTower.curStreakChallengesNum[levelType] = 1;
}

#if FREE_BATTLE_TOWER_E_READER == FALSE
static bool8 ShouldBattleEReaderTrainer(u8 levelType, u16 winStreak)
{
    u8 trainerTeamLevel;
    u8 monLevel;
    s32 i;
    u16 validPartySpecies[6];
    u16 validPartyHeldItems[6];
    u8 numValid;

    numValid = 0;

    ValidateEReaderTrainer();

    if (gSpecialVar_Result != 0 || gSaveBlock2Ptr->battleTower.ereaderTrainer.winStreak != winStreak)
        return FALSE;

    if (levelType != 0)
        trainerTeamLevel = 100;
    else
        trainerTeamLevel = 50;

    for (i = 0; i < 3; i++)
    {
        monLevel = gSaveBlock2Ptr->battleTower.ereaderTrainer.party[i].level;
        if (gSaveBlock2Ptr->battleTower.ereaderTrainer.party[i].level != trainerTeamLevel)
            return FALSE;

        CheckMonBattleTowerBanlist(
            gSaveBlock2Ptr->battleTower.ereaderTrainer.party[i].species,
            gSaveBlock2Ptr->battleTower.ereaderTrainer.party[i].heldItem,
            1,
            levelType,
            monLevel,
            validPartySpecies,
            validPartyHeldItems,
            &numValid);
    }

    return (numValid == 3);
}
#endif //FREE_BATTLE_TOWER_E_READER

static bool8 ChooseSpecialBattleTowerTrainer(void)
{
    s32 recordIndex, i;
    u8 battleTowerLevelType;
    u16 winStreak;
    bool8 retVal;
    s32 numCandidates;
    u32 trainerIds[5];

    numCandidates = 0;
    battleTowerLevelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;

    winStreak = GetCurrentBattleTowerWinStreak(battleTowerLevelType);

#if FREE_BATTLE_TOWER_E_READER == FALSE
    if (ShouldBattleEReaderTrainer(battleTowerLevelType, winStreak))
    {
        gSaveBlock2Ptr->battleTower.battleTowerTrainerId = BATTLE_TOWER_EREADER_TRAINER_ID;
        retVal = TRUE;
    }
    else
#endif //FREE_BATTLE_TOWER_E_READER
    {
        // Check if one of the battle tower trainers from record mixing should be the next trainer.
        for (recordIndex = 0; recordIndex < 5; recordIndex++)
        {
            struct BattleTowerRecord *record = &gSaveBlock2Ptr->battleTower.records[recordIndex];
            u32 recordHasData = 0;
            u32 checksum = 0;

            for (i = 0; i < sizeof(struct BattleTowerRecord) / sizeof(u32) - 1; i++)
            {
                recordHasData |= ((u32 *) record)[i];
                checksum += ((u32 *) record)[i];
            }

            if (gSaveBlock2Ptr->battleTower.records[recordIndex].winStreak == winStreak
                && gSaveBlock2Ptr->battleTower.records[recordIndex].battleTowerLevelType == battleTowerLevelType
                && recordHasData
                && gSaveBlock2Ptr->battleTower.records[recordIndex].checksum == checksum)
            {
                trainerIds[numCandidates] = recordIndex;
                numCandidates++;
            }
        }

        if (numCandidates == 0)
        {
            retVal = FALSE;
        }
        else
        {
            gSaveBlock2Ptr->battleTower.battleTowerTrainerId =
                trainerIds[Random() % numCandidates] + BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID;
            retVal = TRUE;
        }
    }
    return retVal;
}

void ChooseNextBattleTowerTrainer(void)
{
    int i;
    u16 trainerId;
    bool8 levelType;

    levelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;
    if (ChooseSpecialBattleTowerTrainer())
    {
        SetBattleTowerTrainerGfxId(gSaveBlock2Ptr->battleTower.battleTowerTrainerId);
        gSaveBlock2Ptr->battleTower.battledTrainerIds[gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] - 1] = gSaveBlock2Ptr->battleTower.battleTowerTrainerId;
        return;
    }

    if (gSaveBlock2Ptr->battleTower.curStreakChallengesNum[levelType] <= 7)
    {
        if (gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] == 7)
        {
            do
            {
                trainerId = ((Random() & 0xFF) * 5) >> 7;
                trainerId += (gSaveBlock2Ptr->battleTower.curStreakChallengesNum[levelType] - 1) * 10 + 20;

                // Ensure trainer wasn't previously fought in this challenge.
                for (i = 0; i < gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] - 1 && gSaveBlock2Ptr->battleTower.battledTrainerIds[i] != trainerId; i++);
            }
            while (i != gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] - 1);
            gSaveBlock2Ptr->battleTower.battleTowerTrainerId = trainerId;
        }
        else
        {
            do
            {
                trainerId = (((Random() & 0xFF) * 5) >> 6);
                trainerId += (gSaveBlock2Ptr->battleTower.curStreakChallengesNum[levelType] - 1) * 10;

                // Ensure trainer wasn't previously fought in this challenge.
                for (i = 0; i < gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] - 1 && gSaveBlock2Ptr->battleTower.battledTrainerIds[i] != trainerId; i++);
            }
            while (i != gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] - 1);
            gSaveBlock2Ptr->battleTower.battleTowerTrainerId = trainerId;
        }
    }
    else
    {
        do
        {
            trainerId = (((Random() & 0xFF) * 30) >> 8) + 70;

            // Ensure trainer wasn't previously fought in this challenge.
            for (i = 0; i < gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] - 1 && gSaveBlock2Ptr->battleTower.battledTrainerIds[i] != trainerId; i++);
        }
        while (i != gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] - 1);
        gSaveBlock2Ptr->battleTower.battleTowerTrainerId = trainerId;
    }

    SetBattleTowerTrainerGfxId(gSaveBlock2Ptr->battleTower.battleTowerTrainerId);
    // Don't bother saving this trainer, since it's the last one in the challenge.
    if (gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] < 7)
        gSaveBlock2Ptr->battleTower.battledTrainerIds[gSaveBlock2Ptr->battleTower.curChallengeBattleNum[levelType] - 1] = gSaveBlock2Ptr->battleTower.battleTowerTrainerId;
}

static void SetBattleTowerTrainerGfxId(u8 trainerClass)
{
    VarSet(VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_YOUNGSTER);
}

void SetEReaderTrainerGfxId(void)
{
    SetBattleTowerTrainerGfxId(BATTLE_TOWER_EREADER_TRAINER_ID);
}

u8 GetBattleTowerTrainerFrontSpriteId(u16 trainerId)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    if (trainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
    {
        return gFacilityClassToPicIndex[gSaveBlock2Ptr->battleTower.ereaderTrainer.trainerClass];
    }
    else if (trainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
#else
    if (trainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
#endif //FREE_BATTLE_TOWER_E_READER
    {
        return gFacilityClassToPicIndex[sBattleTowerTrainers[trainerId].trainerClass];
    }
    else
    {
        return gFacilityClassToPicIndex[gSaveBlock2Ptr->battleTower.records[trainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].trainerClass];
    }
}

u8 GetBattleTowerTrainerClassNameId(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
    {
        return gFacilityClassToTrainerClass[gSaveBlock2Ptr->battleTower.ereaderTrainer.trainerClass];
    }
    else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId >= BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
#else
    if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId >= BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
#endif //FREE_BATTLE_TOWER_E_READER
    {
        return gFacilityClassToTrainerClass[gSaveBlock2Ptr->battleTower.records[gSaveBlock2Ptr->battleTower.battleTowerTrainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].trainerClass];
    }
    else
    {
        return gFacilityClassToTrainerClass[sBattleTowerTrainers[gSaveBlock2Ptr->battleTower.battleTowerTrainerId].trainerClass];
    }
}

void GetBattleTowerTrainerName(u8 *dest)
{
    s32 i;
#if FREE_BATTLE_TOWER_E_READER == FALSE
    if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
    {
        for (i = 0; i < PLAYER_NAME_LENGTH; i++)
            dest[i] = gSaveBlock2Ptr->battleTower.ereaderTrainer.name[i];
    }
    else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
#else
    if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
#endif //FREE_BATTLE_TOWER_E_READER
    {
        for (i = 0; i < 3; i++)
            dest[i] = sBattleTowerTrainers[gSaveBlock2Ptr->battleTower.battleTowerTrainerId].name[i];
    }
    else
    {
        for (i = 0; i < PLAYER_NAME_LENGTH; i++)
            dest[i] = gSaveBlock2Ptr->battleTower.records[gSaveBlock2Ptr->battleTower.battleTowerTrainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].name[i];
    }
    dest[i] = EOS;
}

// static void FillBattleTowerTrainerParty(void)
// {
//     s32 partyIndex;
//     s32 i;
//     u16 chosenMonIndices[3];
//     u8 friendship;
//     u8 level;
//     u8 fixedIV;
//     u8 battleMonsOffset;
//     u8 monPoolSize;
//     u8 teamFlags;
//     const struct BattleTowerPokemonTemplate *battleTowerMons;

//     battleMonsOffset = 0;
//     monPoolSize = 60;
//     friendship = 255;

//     ZeroEnemyPartyMons();

//     // Different trainers have access to different sets of pokemon to use in battle.
//     // The pokemon later in gBattleTowerLevel100Mons or gBattleTowerLevel50Mons are
//     // stronger. Additionally, the later trainers' pokemon are granted higher IVs.
//     if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < 20)
//     {
//         fixedIV = 6;
//     }
//     else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < 30)
//     {
//         fixedIV = 9;
//         battleMonsOffset = 30;
//     }
//     else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < 40)
//     {
//         fixedIV = 12;
//         battleMonsOffset = 60;
//     }
//     else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < 50)
//     {
//         fixedIV = 15;
//         battleMonsOffset = 90;
//     }
//     else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < 60)
//     {
//         fixedIV = 18;
//         battleMonsOffset = 120;
//     }
//     else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < 70)
//     {
//         fixedIV = 21;
//         battleMonsOffset = 150;
//     }
//     else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < 80)
//     {
//         fixedIV = 31;
//         battleMonsOffset = 180;
//     }
//     else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
//     {
//         fixedIV = 31;
//         battleMonsOffset = 200;
//         monPoolSize = 100;
//     }
// #if FREE_BATTLE_TOWER_E_READER == FALSE
//     else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
//     {
//         // Load E-Reader trainer's party.
//         do
//         {
//             for (partyIndex = 0; partyIndex < 3; partyIndex++)
//                 CreateBattleTowerMon(&gEnemyParty[partyIndex], &gSaveBlock2Ptr->battleTower.ereaderTrainer.party[partyIndex]);
//             return;
//         } while (0);
//     }
// #endif //FREE_BATTLE_TOWER_E_READER
//     else
//     {
//         // Load a battle tower record's party. (From record mixing)
//         for (partyIndex = 0; partyIndex < 3; partyIndex++)
//         {
//             CreateBattleTowerMon(
//                 &gEnemyParty[partyIndex],
//                 &gSaveBlock2Ptr->battleTower.records[gSaveBlock2Ptr->battleTower.battleTowerTrainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].party[partyIndex]);
//         }
//         return;
//     }

//     // Use the appropriate list of pokemon and level depending on the
//     // current challenge type. (level 50 or level 100 challenge)
//     if (gSaveBlock2Ptr->battleTower.battleTowerLevelType != 0)
//     {
//         battleTowerMons = gBattleTowerLevel100Mons;
//         level = 100;
//     }
//     else
//     {
//         battleTowerMons = gBattleTowerLevel50Mons;
//         level = 50;
//     }

//     teamFlags = sBattleTowerTrainers[gSaveBlock2Ptr->battleTower.battleTowerTrainerId].teamFlags;

//     // Attempt to fill the trainer's party with random Pokemon until 3 have been
//     // successfully chosen. The trainer's party may not have duplicate pokemon species
//     // or duplicate held items. Each pokemon must have all of the trainer's team flags
//     // set, as well.  If any of those conditions are not met, then the loop starts over
//     // and another pokemon is chosen at random.
//     partyIndex = 0;
//     while (partyIndex != 3)
//     {
//         // Pick a random pokemon index based on the number of pokemon available to choose from
//         // and the starting offset in the battle tower pokemon array.
//         s32 battleMonIndex = ((Random() & 0xFF) * monPoolSize) / 256 + battleMonsOffset;

//         // Ensure the chosen pokemon has compatible team flags with the trainer.
//         if (teamFlags == 0 || (battleTowerMons[battleMonIndex].teamFlags & teamFlags) == teamFlags)
//         {
//             // Ensure this pokemon species isn't a duplicate.
//             for (i = 0; i < partyIndex; i++)
//             {
//                 if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES, NULL) == battleTowerMons[battleMonIndex].species)
//                     break;
//             }

//             if (i != partyIndex)
//                 continue;

//             // Ensure this pokemon's held item isn't a duplicate.
//             for (i = 0; i < partyIndex; i++)
//             {
//                 if (GetMonData(&gEnemyParty[i], MON_DATA_HELD_ITEM, NULL) != ITEM_NONE
//                     && GetMonData(&gEnemyParty[i], MON_DATA_HELD_ITEM, NULL) == sBattleTowerHeldItems[battleTowerMons[battleMonIndex].heldItem])
//                     break;
//             }

//             if (i != partyIndex)
//                 continue;

//             // Ensure this exact pokemon index isn't a duplicate. This check doesn't seem necessary
//             // because the species and held items were already checked directly above. Perhaps this
//             // is leftover code before the logic for duplicate species and held items was added.
//             //for (i = 0; i < partyIndex && chosenMonIndices[i] != battleMonIndex; i++);
//             for (i = 0; i < partyIndex; i++)
//             {
//                 if (chosenMonIndices[i] == battleMonIndex)
//                     break;
//             }

//             if (i != partyIndex)
//                 continue;

//             chosenMonIndices[partyIndex] = battleMonIndex;

//             // Place the chosen pokemon into the trainer's party.
//             CreateMonWithEVSpread(
//                 &gEnemyParty[partyIndex],
//                 battleTowerMons[battleMonIndex].species,
//                 level,
//                 fixedIV,
//                 battleTowerMons[battleMonIndex].evSpread);

//             // Give the chosen pokemon its specified moves.
//             for (i = 0; i < 4; i++)
//             {
//                 SetMonMoveSlot(&gEnemyParty[partyIndex], battleTowerMons[battleMonIndex].moves[i], i);
//                 if (battleTowerMons[battleMonIndex].moves[i] == MOVE_FRUSTRATION)
//                     friendship = 0;  // MOVE_FRUSTRATION is more powerful the lower the pokemon's friendship is.
//             }

//             SetMonData(&gEnemyParty[partyIndex], MON_DATA_FRIENDSHIP, &friendship);
//             SetMonData(&gEnemyParty[partyIndex], MON_DATA_HELD_ITEM, &sBattleTowerHeldItems[battleTowerMons[battleMonIndex].heldItem]);

//             // The pokemon was successfully added to the trainer's party, so it's safe to move on to
//             // the next party slot.
//             partyIndex++;
//         }
//     }
// }

static u8 AppendBattleTowerBannedSpeciesName(u16 species, u8 count)
{
    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
    {
        if (count == 0)
            StringAppend(gStringVar1, gText_BattleTowerBan_Space);
        count++;
        StringAppend(gStringVar1, gSpeciesInfo[species].speciesName);
        switch (count)
        {
        case 2:
            StringAppend(gStringVar1, gText_BattleTowerBan_Newline2);
            break;
        case 5:
        case 8:
        case 11:
            StringAppend(gStringVar1, gText_BattleTowerBan_Newline1);
            break;
        default:
            StringAppend(gStringVar1, gText_BattleTowerBan_Space);
            break;
        }
    }
    return count;
}

static void CheckMonBattleTowerBanlist(u16 species, u16 heldItem, u16 hp, u8 battleTowerLevelType, u8 monLevel, u16 *validPartySpecies, u16 *validPartyHeldItems, u8 *numValid)
{
    s32 i;
    u32 counter = 0;

    if (species == SPECIES_EGG || species == SPECIES_NONE)
        return;

    while (1)
    {
        if (gBattleTowerBannedSpecies[counter] == 0xFFFF)
            break;

        if (gBattleTowerBannedSpecies[counter] == species)
            break;

        counter++;
    }

    if (gBattleTowerBannedSpecies[counter] != 0xFFFF)
        return;

    if (battleTowerLevelType == 0 && monLevel > 50)
        return;

    for (i = 0; i < *numValid && validPartySpecies[i] != species ; i++);
    if (i != *numValid)
        return;

    if (heldItem != ITEM_NONE)
    {
        for (i = 0; i < *numValid && validPartyHeldItems[i] != heldItem ; i++);
        if (i != *numValid)
            return;
    }

    validPartySpecies[*numValid] = species;
    validPartyHeldItems[*numValid] = heldItem;
    *numValid = *numValid + 1;
}

void CheckPartyBattleTowerBanlist(void)
{
    s32 i;
    u16 species2;
    u16 heldItem;
    u8 level;
    u16 hp;
    u16 validPartySpecies[6];
    u16 validPartyHeldItems[6];
    u8 counter;

    counter = 0;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        species2 = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG);
        heldItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        level = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
        hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);

        CheckMonBattleTowerBanlist(species2, heldItem, hp, gSpecialVar_Result, level, validPartySpecies, validPartyHeldItems, &counter);
    }

    if (counter < 3)
    {
        gStringVar1[0] = EOS;
        gSpecialVar_0x8004 = 1;
        counter = 0;

        for (i = 0; gBattleTowerBannedSpecies[i] != 0xFFFF; i++)
            counter = AppendBattleTowerBannedSpeciesName(gBattleTowerBannedSpecies[i], counter);

        i = StringLength(gStringVar1);
        gStringVar1[i - 1] = EOS;
        if (counter < 3)
            StringAppend(gStringVar1, gText_BattleTowerBan_Is1);
        else
            StringAppend(gStringVar1, gText_BattleTowerBan_Is2);
    }
    else
    {
        gSpecialVar_0x8004 = 0;
        gSaveBlock2Ptr->battleTower.battleTowerLevelType = gSpecialVar_Result;
    }
}

static void BufferBattleTowerTrainerMessage(const u16 *greeting)
{
    s32 i;
    if (EC_DoesEasyChatStringFitOnLine(greeting, 3, 2, 18))
    {
        ConvertEasyChatWordsToString(gStringVar4, greeting, 2, 3);
        i = 0;
        while (gStringVar4[i++] != CHAR_NEWLINE)
            ;
        while (gStringVar4[i] != CHAR_NEWLINE)
            i++;
        gStringVar4[i] = CHAR_PROMPT_SCROLL;
    }
    else
    {
        ConvertEasyChatWordsToString(gStringVar4, greeting, 3, 2);
    }
}

void PrintBattleTowerTrainerGreeting(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
        BufferBattleTowerTrainerMessage(gSaveBlock2Ptr->battleTower.ereaderTrainer.greeting);
    else if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
#else
    if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
#endif //FREE_BATTLE_TOWER_E_READER
        BufferBattleTowerTrainerMessage(sBattleTowerTrainers[gSaveBlock2Ptr->battleTower.battleTowerTrainerId].greeting);
    else
        BufferBattleTowerTrainerMessage(gSaveBlock2Ptr->battleTower.records[gSaveBlock2Ptr->battleTower.battleTowerTrainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].greeting);
}

static void CB2_FinishEReaderBattle(void)
{
    s32 i;
    u16 heldItem;

    switch (sSpecialVar_0x8004_Copy)
    {
    case 0:
        break;
    case 1:
        for (i = 0; i < PARTY_SIZE; i++)
        {
            heldItem = GetMonData(&gSaveBlock1Ptr->playerParty[i], MON_DATA_HELD_ITEM);
            SetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM, &heldItem);
        }
        break;
    case 2:
        PrintEReaderTrainerFarewellMessage();
        break;
    }

    SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

static void Task_WaitBT(u8 taskId)
{
    if (IsBattleTransitionDone() == TRUE)
    {
        gMain.savedCallback = CB2_FinishEReaderBattle;
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_InitBattle);
        DestroyTask(taskId);
    }
}


void StartSpecialBattle(void)
{
    s32 i;
    u16 heldItem;
    u8 transition;

    sSpecialVar_0x8004_Copy = gSpecialVar_0x8004;
    switch (sSpecialVar_0x8004_Copy)
    {
    case 0: // battle tower battle
        // gBattleTypeFlags = (BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_TRAINER);
        // TRAINER_BATTLE_PARAM.opponentA = 0;

        // FillBattleTowerTrainerParty();

        // CreateTask(Task_WaitBT, 1);
        // PlayMapChosenOrBattleBGM(0);
        // transition = BattleSetup_GetBattleTowerBattleTransition();
        // BattleTransition_StartOnField(transition);
        break;
    case 1: // secret base battle
        for (i = 0; i < PARTY_SIZE; i++)
        {
            heldItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
            SetMonData(&gSaveBlock1Ptr->playerParty[i], MON_DATA_HELD_ITEM, &heldItem);
        }

        CreateTask(Task_WaitBT, 1);
        PlayMapChosenOrBattleBGM(0);
        transition = BattleSetup_GetBattleTowerBattleTransition();
        BattleTransition_StartOnField(transition);
        break;
    case 2: // e-reader trainer battle
#if FREE_BATTLE_TOWER_E_READER == FALSE
        ZeroEnemyPartyMons();

        for (i = 0; i < 3; i++)
            CreateBattleTowerMon(&gEnemyParty[i], &gSaveBlock2Ptr->battleTower.ereaderTrainer.party[i]);

        gBattleTypeFlags = (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_TRAINER);
        TRAINER_BATTLE_PARAM.opponentA = 0;

        CreateTask(Task_WaitBT, 1);
        PlayMapChosenOrBattleBGM(0);
        transition = BattleSetup_GetBattleTowerBattleTransition();
        BattleTransition_StartOnField(transition);
#endif //FREE_BATTLE_TOWER_E_READER
        break;
    }
}

void SetBattleTowerProperty(void)
{
    s32 i;
    u8 battleTowerLevelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        ewram160FB = gSaveBlock2Ptr->battleTower.var_4AE[battleTowerLevelType];
        gSaveBlock2Ptr->battleTower.var_4AE[battleTowerLevelType] = gSpecialVar_0x8005;
        break;
    case 1:
        gSaveBlock2Ptr->battleTower.battleTowerLevelType = gSpecialVar_0x8005;
        break;
    case 2:
        gSaveBlock2Ptr->battleTower.curChallengeBattleNum[battleTowerLevelType] = gSpecialVar_0x8005;
        break;
    case 3:
        gSaveBlock2Ptr->battleTower.curStreakChallengesNum[battleTowerLevelType] = gSpecialVar_0x8005;
        break;
    case 4:
        gSaveBlock2Ptr->battleTower.battleTowerTrainerId = gSpecialVar_0x8005;
        break;
    case 5:
        for (i = 0; i < 3; i++)
            gSaveBlock2Ptr->battleTower.selectedPartyMons[i] = gSelectedOrderFromParty[i];
        break;
    case 6:
#if FREE_BATTLE_TOWER_E_READER == FALSE
        if (gSaveBlock2Ptr->battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
            ClearEReaderTrainer(&gSaveBlock2Ptr->battleTower.ereaderTrainer);
#endif //FREE_BATTLE_TOWER_E_READER
        if (gSaveBlock2Ptr->battleTower.totalBattleTowerWins < 9999)
            gSaveBlock2Ptr->battleTower.totalBattleTowerWins++;
        gSaveBlock2Ptr->battleTower.curChallengeBattleNum[battleTowerLevelType]++;
        SaveCurrentWinStreak();
        gSpecialVar_Result = gSaveBlock2Ptr->battleTower.curChallengeBattleNum[battleTowerLevelType];
        gStringVar1[0] = gSaveBlock2Ptr->battleTower.curChallengeBattleNum[battleTowerLevelType] + 0xA1;
        gStringVar1[1] = 0xFF;
        break;
    case 7:
        if (gSaveBlock2Ptr->battleTower.curStreakChallengesNum[battleTowerLevelType] < 1430)
            gSaveBlock2Ptr->battleTower.curStreakChallengesNum[battleTowerLevelType]++;
        SaveCurrentWinStreak();
        gSpecialVar_Result = gSaveBlock2Ptr->battleTower.curStreakChallengesNum[battleTowerLevelType];
        break;
    case 8:
        gSaveBlock2Ptr->battleTower.unk_554 = gSpecialVar_0x8005;
        break;
    case 9:
        break;
    case 10:
        SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, gSaveBlock2Ptr->battleTower.bestBattleTowerWinStreak);
        break;
    case 11:
        if (gSaveBlock2Ptr->battleTower.var_4AE[battleTowerLevelType] != 3)
            ResetBattleTowerStreak(battleTowerLevelType);
        break;
    case 12:
        gSaveBlock2Ptr->battleTower.var_4AE[battleTowerLevelType] = ewram160FB;
        break;
    case 13:
        gSaveBlock2Ptr->battleTower.currentWinStreaks[battleTowerLevelType] = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
        break;
    case 14:
        gSaveBlock2Ptr->battleTower.lastStreakLevelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;
        break;
    }
}

void BattleTowerUtil(void)
{
    u8 battleTowerLevelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        gSpecialVar_Result = gSaveBlock2Ptr->battleTower.var_4AE[battleTowerLevelType];
        break;
    case 1:
        gSpecialVar_Result = gSaveBlock2Ptr->battleTower.battleTowerLevelType;
        break;
    case 2:
        gSpecialVar_Result = gSaveBlock2Ptr->battleTower.curChallengeBattleNum[battleTowerLevelType];
        break;
    case 3:
        gSpecialVar_Result = gSaveBlock2Ptr->battleTower.curStreakChallengesNum[battleTowerLevelType];
        break;
    case 4:
        gSpecialVar_Result = gSaveBlock2Ptr->battleTower.battleTowerTrainerId;
        break;
    case 5:
    case 6:
    case 7:
        break;
    case 8:
        gSpecialVar_Result = gSaveBlock2Ptr->battleTower.unk_554;
        break;
    case 9:
        gSpecialVar_Result = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
        break;
    case 10:
        SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, gSaveBlock2Ptr->battleTower.bestBattleTowerWinStreak);
        break;
    case 11:
        ResetBattleTowerStreak(battleTowerLevelType);
        break;
    case 12:
        gSaveBlock2Ptr->battleTower.var_4AE[battleTowerLevelType] = ewram160FB;
        break;
    case 13:
        gSaveBlock2Ptr->battleTower.currentWinStreaks[battleTowerLevelType] = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
        break;
    case 14:
        gSaveBlock2Ptr->battleTower.lastStreakLevelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;
        break;
    }
}

void SetBattleTowerParty(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
        gSelectedOrderFromParty[i] = gSaveBlock2Ptr->battleTower.selectedPartyMons[i];

    ReducePlayerPartyToSelectedMons();
}

static void SaveCurrentWinStreak(void)
{
    u8 levelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;
    u16 streak = GetCurrentBattleTowerWinStreak(levelType);

    if (gSaveBlock2Ptr->battleTower.recordWinStreaks[levelType] < streak)
        gSaveBlock2Ptr->battleTower.recordWinStreaks[levelType] = streak;

    if (gSaveBlock2Ptr->battleTower.recordWinStreaks[0] > gSaveBlock2Ptr->battleTower.recordWinStreaks[1])
    {
        streak = gSaveBlock2Ptr->battleTower.recordWinStreaks[0];
        SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, streak);

        if (streak > 9999)
            gSaveBlock2Ptr->battleTower.bestBattleTowerWinStreak = 9999;
        else
            gSaveBlock2Ptr->battleTower.bestBattleTowerWinStreak = streak;
    }
    else
    {
        streak = gSaveBlock2Ptr->battleTower.recordWinStreaks[1];
        SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, streak);

        if (streak > 9999)
            gSaveBlock2Ptr->battleTower.bestBattleTowerWinStreak = 9999;
        else
            gSaveBlock2Ptr->battleTower.bestBattleTowerWinStreak = streak;
    }
}

static void SetPlayerBattleTowerRecord(void)
{
    s32 i;
    u8 trainerClass;
    struct BattleTowerRecord *playerRecord = &gSaveBlock2Ptr->battleTower.playerRecord;
    u8 battleTowerLevelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;

    if (gSaveBlock2Ptr->playerGender != MALE)
    {
        trainerClass = sFemaleTrainerClasses[(gSaveBlock2Ptr->playerTrainerId[0] + gSaveBlock2Ptr->playerTrainerId[1]
                                              + gSaveBlock2Ptr->playerTrainerId[2] + gSaveBlock2Ptr->playerTrainerId[3]) % NELEMS(sFemaleTrainerClasses)];
    }
    else
    {
        trainerClass = sMaleTrainerClasses[(gSaveBlock2Ptr->playerTrainerId[0] + gSaveBlock2Ptr->playerTrainerId[1]
                                            + gSaveBlock2Ptr->playerTrainerId[2] + gSaveBlock2Ptr->playerTrainerId[3]) % NELEMS(sMaleTrainerClasses)];
    }

    playerRecord->battleTowerLevelType = battleTowerLevelType;
    playerRecord->trainerClass = trainerClass;

    CopyTrainerId(playerRecord->trainerId, gSaveBlock2Ptr->playerTrainerId);
    StringCopy_PlayerName(playerRecord->name, gSaveBlock2Ptr->playerName);

    playerRecord->winStreak = GetCurrentBattleTowerWinStreak(battleTowerLevelType);

    for (i = 0; i < 6; i++)
        playerRecord->greeting[i] = gSaveBlock1Ptr->easyChatBattleStart[i];

    for (i = 0; i < 3; i++)
        ConvertPokemonToBattleTowerPokemon(&gPlayerParty[gSaveBlock2Ptr->battleTower.selectedPartyMons[i] - 1],
                                           &playerRecord->party[i]);

    SetBattleTowerRecordChecksum(&gSaveBlock2Ptr->battleTower.playerRecord);
    SaveCurrentWinStreak();
}

void SaveBattleTowerProgress(void)
{
    u8 battleTowerLevelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;

    if (gSpecialVar_0x8004 == 3 || gSpecialVar_0x8004 == 0)
    {
        if (gSaveBlock2Ptr->battleTower.curStreakChallengesNum[battleTowerLevelType] > 1
            || gSaveBlock2Ptr->battleTower.curChallengeBattleNum[battleTowerLevelType] > 1)
            SetPlayerBattleTowerRecord();
    }

    PopulateBravoTrainerBattleTowerLostData();

    gSaveBlock2Ptr->battleTower.battleOutcome = gBattleOutcome;

    if (gSpecialVar_0x8004 != 3)
        gSaveBlock2Ptr->battleTower.var_4AE[battleTowerLevelType] = gSpecialVar_0x8004;

    VarSet(VAR_TEMP_0, BTSPECIAL_TEST);
    gSaveBlock2Ptr->battleTower.unk_554 = 1;
    TrySavingData(SAVE_EREADER);
}

void BattleTower_SoftReset(void)
{
    DoSoftReset();
}

static void ValidateBattleTowerRecordChecksums(void)
{
    u32 i;
    s32 recordIndex;
    struct BattleTowerRecord *record;
    u32 checksum;

    record = &gSaveBlock2Ptr->battleTower.playerRecord;
    checksum = 0;
    for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
        checksum += ((u32 *)record)[i];

    if (gSaveBlock2Ptr->battleTower.playerRecord.checksum != checksum)
        ClearBattleTowerRecord(&gSaveBlock2Ptr->battleTower.playerRecord);

    for (recordIndex = 0; recordIndex < 5; recordIndex++)
    {
        record = &gSaveBlock2Ptr->battleTower.records[recordIndex];
        checksum = 0;
        for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
            checksum += ((u32 *)record)[i];

        if (gSaveBlock2Ptr->battleTower.records[recordIndex].checksum != checksum)
            ClearBattleTowerRecord(&gSaveBlock2Ptr->battleTower.records[recordIndex]);
    }
}

static void SetBattleTowerRecordChecksum(struct BattleTowerRecord *record)
{
    u32 i;

    record->checksum = 0;
    for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
        record->checksum += ((u32 *)record)[i];
}

static void ClearBattleTowerRecord(struct BattleTowerRecord *record)
{
    u32 i;

    for (i = 0; i < sizeof(struct BattleTowerRecord) / sizeof(u32); i++)
        ((u32 *)record)[i] = 0;
}

static void PopulateBravoTrainerBattleTowerLostData(void)
{
    s32 i;

    GetBattleTowerTrainerName(gSaveBlock2Ptr->battleTower.defeatedByTrainerName);
    gSaveBlock2Ptr->battleTower.defeatedBySpecies = gBattleMons[1].species;
    gSaveBlock2Ptr->battleTower.firstMonSpecies = gBattleMons[0].species;

    for (i = 0; i < VANILLA_POKEMON_NAME_LENGTH; i++)
        gSaveBlock2Ptr->battleTower.firstMonNickname[i] = gBattleMons[0].nickname[i];
}

static u16 GetCurrentBattleTowerWinStreak(u8 battleTowerLevelType)
{
    u16 winStreak = ((gSaveBlock2Ptr->battleTower.curStreakChallengesNum[battleTowerLevelType] - 1) * 7 - 1)
                    + gSaveBlock2Ptr->battleTower.curChallengeBattleNum[battleTowerLevelType];

    if (winStreak > 9999)
        return 9999;
    else
        return winStreak;
}

void DetermineBattleTowerPrize(void)
{
    u8 levelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;

    if (gSaveBlock2Ptr->battleTower.curStreakChallengesNum[levelType] - 1 > 5)
        gSaveBlock2Ptr->battleTower.prizeItem = sLongStreakPrizes[Random() % NELEMS(sLongStreakPrizes)];
    else
        gSaveBlock2Ptr->battleTower.prizeItem = sShortStreakPrizes[Random() % NELEMS(sShortStreakPrizes)];
}

void GiveBattleTowerPrize(void)
{
    u8 battleTowerLevelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;

    if (AddBagItem(gSaveBlock2Ptr->battleTower.prizeItem, 1) == TRUE)
    {
        CopyItemName(gSaveBlock2Ptr->battleTower.prizeItem, gStringVar1);
        gSpecialVar_Result = 1;
    }
    else
    {
        gSpecialVar_Result = 0;
        gSaveBlock2Ptr->battleTower.var_4AE[battleTowerLevelType] = 6;
    }
}

void AwardBattleTowerRibbons(void)
{
    s32 i;
    u32 partyIndex;
    struct Pokemon *pokemon;
    u8 ribbonType;
    u8 battleTowerLevelType = gSaveBlock2Ptr->battleTower.battleTowerLevelType;

    if (battleTowerLevelType != 0)
        ribbonType = MON_DATA_VICTORY_RIBBON;
    else
        ribbonType = MON_DATA_WINNING_RIBBON;

    gSpecialVar_Result = 0;

    if (GetCurrentBattleTowerWinStreak(battleTowerLevelType) > 55)
    {
        for (i = 0; i < 3; i++)
        {
            partyIndex = gSaveBlock2Ptr->battleTower.selectedPartyMons[i] - 1;
            pokemon = &gPlayerParty[partyIndex];
            if (!GetMonData(pokemon, ribbonType))
            {
                gSpecialVar_Result = 1;
                SetMonData(pokemon, ribbonType, &gSpecialVar_Result);
            }
        }
    }

    if (gSpecialVar_Result != 0)
        IncrementGameStat(GAME_STAT_RECEIVED_RIBBONS);
}

u8 GetEreaderTrainerFrontSpriteId(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    return gFacilityClassToPicIndex[gSaveBlock2Ptr->battleTower.ereaderTrainer.trainerClass];
#else
    return 0;
#endif //FREE_BATTLE_TOWER_E_READER
}

u8 GetEreaderTrainerClassId(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    return gFacilityClassToTrainerClass[gSaveBlock2Ptr->battleTower.ereaderTrainer.trainerClass];
#else
    return 0;
#endif //FREE_BATTLE_TOWER_E_READER
}

void CopyEReaderTrainerName5(u8 *trainerName)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    s32 i;

    for (i = 0; i < 5; i++)
        trainerName[i] = gSaveBlock2Ptr->battleTower.ereaderTrainer.name[i];

    trainerName[i] = EOS;
#else
    trainerName[0] = EOS;
#endif //FREE_BATTLE_TOWER_E_READER
}

// Checks if the saved E-Reader trainer is valid.
void ValidateEReaderTrainer(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    u32 i;
    u32 checksum;
    struct BattleTowerEReaderTrainer *ereaderTrainer;

    gSpecialVar_Result = 0;
    ereaderTrainer = &gSaveBlock2Ptr->battleTower.ereaderTrainer;

    checksum = 0;
    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32) - 1; i++)
        checksum |= ((u32 *)ereaderTrainer)[i];

    if (checksum == 0)
    {
        gSpecialVar_Result = 1;
        return;
    }

    checksum = 0;
    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32) - 1; i++)
        checksum += ((u32 *)ereaderTrainer)[i];

    if (gSaveBlock2Ptr->battleTower.ereaderTrainer.checksum != checksum)
    {
        ClearEReaderTrainer(&gSaveBlock2Ptr->battleTower.ereaderTrainer);
        gSpecialVar_Result = 1;
    }
#else
    gSpecialVar_Result = FALSE;
#endif //FREE_BATTLE_TOWER_E_READER
}

void ClearEReaderTrainer(struct BattleTowerEReaderTrainer *ereaderTrainer)
{
    u32 i;

    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32); i++)
        ((u32 *)ereaderTrainer)[i] = 0;
}

void BufferEReaderTrainerGreeting(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    BufferBattleTowerTrainerMessage(gSaveBlock2Ptr->battleTower.ereaderTrainer.greeting);
#endif //FREE_BATTLE_TOWER_E_READER
}

static void PrintEReaderTrainerFarewellMessage(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    if (gBattleOutcome == B_OUTCOME_DREW)
        gStringVar4[0] = EOS;
    else if (gBattleOutcome == B_OUTCOME_WON)
        BufferBattleTowerTrainerMessage(gSaveBlock2Ptr->battleTower.ereaderTrainer.farewellPlayerWon);
    else
        BufferBattleTowerTrainerMessage(gSaveBlock2Ptr->battleTower.ereaderTrainer.farewellPlayerLost);
#endif //FREE_BATTLE_TOWER_E_READER
}

void Dummy_TryEnableBravoTrainerBattleTower(void)
{
    s32 i;

    for (i = 0; i < 2; i++)
    {
        if (gSaveBlock2Ptr->battleTower.var_4AE[i] == 1)
            TakeBravoTrainerBattleTowerOffTheAir();
    }
}

#define STEVEN_OTID 61226

static void FillPartnerParty(u16 trainerId)
{
    s32 i, j, k;
    u32 firstIdPart = 0, secondIdPart = 0, thirdIdPart = 0;
    u32 personality;
    u32 otID;
    u8 trainerName[(PLAYER_NAME_LENGTH * 3) + 1];
    s32 ball = -1;
    enum DifficultyLevel difficulty = GetBattlePartnerDifficultyLevel(trainerId);

    if (trainerId > TRAINER_PARTNER(PARTNER_NONE))
    {
        for (i = 0; i < 3; i++)
            ZeroMonData(&gPlayerParty[i + 3]);

        for (i = 0; i < 3 && i < gBattlePartners[difficulty][trainerId - TRAINER_PARTNER(PARTNER_NONE)].partySize; i++)
        {
            const struct TrainerMon *partyData = gBattlePartners[difficulty][trainerId - TRAINER_PARTNER(PARTNER_NONE)].party;
            const u8 *partnerName = gBattlePartners[difficulty][trainerId - TRAINER_PARTNER(PARTNER_NONE)].trainerName;
            for (k = 0; partnerName[k] != EOS && k < 3; k++)
            {
                if (k == 0)
                {
                    firstIdPart = partnerName[k];
                    secondIdPart = partnerName[k];
                    thirdIdPart = partnerName[k];
                }
                else if (k == 1)
                {
                    secondIdPart = partnerName[k];
                    thirdIdPart = partnerName[k];
                }
                else if (k == 2)
                {
                    thirdIdPart = partnerName[k];
                }
            }
            if (trainerId == TRAINER_PARTNER(PARTNER_STEVEN))
                otID = STEVEN_OTID;
            else
                otID = ((firstIdPart % 72) * 1000) + ((secondIdPart % 23) * 10) + (thirdIdPart % 37) % 65536;

            personality = Random32();
            if (partyData[i].gender == TRAINER_MON_MALE)
                personality = (personality & 0xFFFFFF00) | GeneratePersonalityForGender(MON_MALE, partyData[i].species);
            else if (partyData[i].gender == TRAINER_MON_FEMALE)
                personality = (personality & 0xFFFFFF00) | GeneratePersonalityForGender(MON_FEMALE, partyData[i].species);
            ModifyPersonalityForNature(&personality, partyData[i].nature);
            CreateMon(&gPlayerParty[i + 3], partyData[i].species, partyData[i].lvl, personality, OTID_STRUCT_PRESET(otID));
            j = partyData[i].isShiny;
            SetMonData(&gPlayerParty[i + 3], MON_DATA_IS_SHINY, &j);
            SetMonData(&gPlayerParty[i + 3], MON_DATA_HELD_ITEM, &partyData[i].heldItem);
            CustomTrainerPartyAssignMoves(&gPlayerParty[i + 3], &partyData[i]);

            SetMonData(&gPlayerParty[i + 3], MON_DATA_IVS, &(partyData[i].iv));
            if (partyData[i].ev != NULL)
            {
                SetMonData(&gPlayerParty[i + 3], MON_DATA_HP_EV, &(partyData[i].ev[0]));
                SetMonData(&gPlayerParty[i + 3], MON_DATA_ATK_EV, &(partyData[i].ev[1]));
                SetMonData(&gPlayerParty[i + 3], MON_DATA_DEF_EV, &(partyData[i].ev[2]));
                SetMonData(&gPlayerParty[i + 3], MON_DATA_SPATK_EV, &(partyData[i].ev[3]));
                SetMonData(&gPlayerParty[i + 3], MON_DATA_SPDEF_EV, &(partyData[i].ev[4]));
                SetMonData(&gPlayerParty[i + 3], MON_DATA_SPEED_EV, &(partyData[i].ev[5]));
            }
            if (partyData[i].ability != ABILITY_NONE)
            {
                const struct SpeciesInfo *speciesInfo = &gSpeciesInfo[partyData[i].species];
                u32 maxAbilities = ARRAY_COUNT(speciesInfo->abilities);
                for (j = 0; j < maxAbilities; j++)
                {
                    if (speciesInfo->abilities[j] == partyData[i].ability)
                        break;
                }
                if (j < maxAbilities)
                    SetMonData(&gPlayerParty[i + 3], MON_DATA_ABILITY_NUM, &j);
            }
            SetMonData(&gPlayerParty[i + 3], MON_DATA_FRIENDSHIP, &(partyData[i].friendship));
            if (partyData[i].ball != ITEM_NONE)
            {
                ball = partyData[i].ball;
                SetMonData(&gPlayerParty[i + 3], MON_DATA_POKEBALL, &ball);
            }
            if (partyData[i].nickname != NULL)
            {
                SetMonData(&gPlayerParty[i + 3], MON_DATA_NICKNAME, partyData[i].nickname);
            }
            CalculateMonStats(&gPlayerParty[i + 3]);

            StringCopy(trainerName, gBattlePartners[difficulty][trainerId - TRAINER_PARTNER(PARTNER_NONE)].trainerName);
            SetMonData(&gPlayerParty[i + 3], MON_DATA_OT_NAME, trainerName);
            j = gBattlePartners[difficulty][SanitizeTrainerId(trainerId - TRAINER_PARTNER(PARTNER_NONE))].gender;
            SetMonData(&gPlayerParty[i + 3], MON_DATA_OT_GENDER, &j);
        }
    }
}

static void HandleSpecialTrainerBattleEnd(void)
{
    s32 i;

    switch (gBattleScripting.specialTrainerBattleType)
    {
    case SPECIAL_BATTLE_MULTI:
        for (i = 0; i < 3; i++)
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES))
                gSaveBlock1Ptr->playerParty[i] = gPlayerParty[i];
        }
        break;
    }

    SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

static void Task_StartBattleAfterTransition(u8 taskId)
{
    if (IsBattleTransitionDone() == TRUE)
    {
        gMain.savedCallback = HandleSpecialTrainerBattleEnd;
        SetMainCallback2(CB2_InitBattle);
        DestroyTask(taskId);
    }
}

void DoSpecialTrainerBattle(void)
{
    gBattleScripting.specialTrainerBattleType = gSpecialVar_0x8004;
    switch (gSpecialVar_0x8004)
    {
    case SPECIAL_BATTLE_MULTI:
        if (gSpecialVar_0x8005 & MULTI_BATTLE_2_VS_WILD) // Player + AI against wild mon
        {
            gBattleTypeFlags = BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER;
        }
        else if (gSpecialVar_0x8005 & MULTI_BATTLE_2_VS_1) // Player + AI against one trainer
        {
            TRAINER_BATTLE_PARAM.opponentB = 0xFFFF;
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER;
        }
        else // MULTI_BATTLE_2_VS_2
        {
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_TWO_OPPONENTS | BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER;
        }

        gPartnerTrainerId = VarGet(gSpecialVar_0x8006) + TRAINER_PARTNER(PARTNER_NONE);
        FillPartnerParty(gPartnerTrainerId);
        CreateTask(Task_StartBattleAfterTransition, 1);
        PlayMapChosenOrBattleBGM(0);
        if (gSpecialVar_0x8005 & MULTI_BATTLE_2_VS_WILD)
            BattleTransition_StartOnField(GetWildBattleTransition());
        else
            BattleTransition_StartOnField(GetTrainerBattleTransition());

        if (gSpecialVar_0x8005 & MULTI_BATTLE_CHOOSE_MONS) // Skip mons restoring(done in the script)
            gBattleScripting.specialTrainerBattleType = 0xFF;
        break;
    }

}
