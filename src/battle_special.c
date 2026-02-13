#include "global.h"
#include "battle.h"
#include "battle_partner.h"
#include "battle_setup.h"
#include "battle_special.h"
#include "battle_transition.h"
#include "easy_chat.h"
#include "event_data.h"
#include "overworld.h"
#include "task.h"
#include "constants/battle_special.h"
#include "constants/characters.h"
#include "constants/event_objects.h"

static void Task_StartBattleAfterTransition(u8 taskId);
static void HandleSpecialTrainerBattleEnd(void);
static void PrintEReaderTrainerFarewellMessage(void);

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
    case SPECIAL_BATTLE_EREADER: // e-reader trainer battle
#if FREE_BATTLE_TOWER_E_READER == FALSE
        ZeroEnemyPartyMons();

        for (u32 i = 0; i < 3; i++)
            CreateBattleTowerMon(&gEnemyParty[i], &gSaveBlock2Ptr->frontier.ereaderTrainer.party[i]);

        gBattleTypeFlags = (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_TRAINER);
        TRAINER_BATTLE_PARAM.opponentA = 0;

        CreateTask(Task_StartBattleAfterTransition, 1);
        PlayMapChosenOrBattleBGM(0);
        BattleTransition_StartOnField(BattleSetup_GetBattleTowerBattleTransition());
#endif //FREE_BATTLE_TOWER_E_READER
        break;
    }
}

static void Task_StartBattleAfterTransition(u8 taskId)
{
    if (IsBattleTransitionDone() == TRUE)
    {
        gMain.savedCallback = HandleSpecialTrainerBattleEnd;
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_InitBattle);
        DestroyTask(taskId);
    }
}

static void HandleSpecialTrainerBattleEnd(void)
{
    s32 i;

    switch (gBattleScripting.specialTrainerBattleType)
    {
    case SPECIAL_BATTLE_EREADER:
        PrintEReaderTrainerFarewellMessage();
        break;
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

void BufferEReaderTrainerGreeting(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    BufferBattleTowerTrainerMessage(gSaveBlock2Ptr->frontier.ereaderTrainer.greeting);
#endif //FREE_BATTLE_TOWER_E_READER
}

static void PrintEReaderTrainerFarewellMessage(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    if (gBattleOutcome == B_OUTCOME_DREW)
        gStringVar4[0] = EOS;
    else if (gBattleOutcome == B_OUTCOME_WON)
        BufferBattleTowerTrainerMessage(gSaveBlock2Ptr->frontier.ereaderTrainer.farewellPlayerWon);
    else
        BufferBattleTowerTrainerMessage(gSaveBlock2Ptr->frontier.ereaderTrainer.farewellPlayerLost);
#endif //FREE_BATTLE_TOWER_E_READER
}

void ClearEReaderTrainer(struct BattleTowerEReaderTrainer *ereaderTrainer)
{
    u32 i;

    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32); i++)
        ((u32 *)ereaderTrainer)[i] = 0;
}

void SetEReaderTrainerGfxId(void)
{
    VarSet(VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_YOUNGSTER);
}


u8 GetEreaderTrainerFrontSpriteId(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    return gFacilityClassToPicIndex[gSaveBlock2Ptr->frontier.ereaderTrainer.facilityClass];
#else
    return 0;
#endif //FREE_BATTLE_TOWER_E_READER
}

u8 GetEreaderTrainerClassId(void)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    return gFacilityClassToTrainerClass[gSaveBlock2Ptr->frontier.ereaderTrainer.facilityClass];
#else
    return 0;
#endif //FREE_BATTLE_TOWER_E_READER
}

void CopyEReaderTrainerName5(u8 *trainerName)
{
#if FREE_BATTLE_TOWER_E_READER == FALSE
    s32 i;

    for (i = 0; i < 5; i++)
        trainerName[i] = gSaveBlock2Ptr->frontier.ereaderTrainer.name[i];

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
    ereaderTrainer = &gSaveBlock2Ptr->frontier.ereaderTrainer;

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

    if (gSaveBlock2Ptr->frontier.ereaderTrainer.checksum != checksum)
    {
        ClearEReaderTrainer(&gSaveBlock2Ptr->frontier.ereaderTrainer);
        gSpecialVar_Result = 1;
    }
#else
    gSpecialVar_Result = FALSE;
#endif //FREE_BATTLE_TOWER_E_READER
}

void BufferEReaderTrainerName(void)
{
    CopyEReaderTrainerName5(gStringVar1);
}
