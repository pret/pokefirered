#include "global.h"
#include "gflib.h"
#include "data.h"
#include "script.h"
#include "overworld.h"
#include "party_menu.h"
#include "field_fadetransition.h"
#include "pokemon_summary_screen.h"
#include "event_data.h"
#include "battle.h"
#include "money.h"
#include "pokemon.h"
#include "string_util.h"
#include "constants/items.h"
#include "constants/moves.h"

static void Task_ChoosePartyMon(u8 taskId);

void ChoosePartyMon(void)
{
    u8 taskId;

    LockPlayerFieldControls();
    taskId = CreateTask(Task_ChoosePartyMon, 10);
    gTasks[taskId].data[0] = PARTY_MENU_TYPE_CHOOSE_SINGLE_MON;
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
}

void ChooseMonForMoveRelearner(void)
{
    u8 taskId;

    LockPlayerFieldControls();
    taskId = CreateTask(Task_ChoosePartyMon, 10);
    gTasks[taskId].data[0] = PARTY_MENU_TYPE_MOVE_RELEARNER;
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 0x10, RGB_BLACK);
}

static void Task_ChoosePartyMon(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gPaletteFade.bufferTransferDisabled = TRUE;
        ChoosePartyMonByMenuType((u8)gTasks[taskId].data[0]);
        DestroyTask(taskId);
    }
}

void SelectMoveDeleterMove(void)
{
    ShowSelectMovePokemonSummaryScreen(gPlayerParty, gSpecialVar_0x8004, gPlayerPartyCount - 1, CB2_ReturnToField, 0);
    SetPokemonSummaryScreenMode(PSS_MODE_FORGET_MOVE);
    gFieldCallback = FieldCB_ContinueScriptHandleMusic;
}

void GetNumMovesSelectedMonHas(void)
{
    u8 i;

    gSpecialVar_Result = 0;
    for (i = 0; i < MAX_MON_MOVES; ++i)
        if (GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_MOVE1 + i) != MOVE_NONE)
            ++gSpecialVar_Result;
}

void BufferMoveDeleterNicknameAndMove(void)
{
    struct Pokemon *mon = &gPlayerParty[gSpecialVar_0x8004];
    u16 move = GetMonData(mon, MON_DATA_MOVE1 + gSpecialVar_0x8005);

    GetMonNickname(mon, gStringVar1);
    StringCopy(gStringVar2, gMoveNames[move]);
}

static void ShiftMoveSlot(struct Pokemon *mon, u8 slotTo, u8 slotFrom)
{
    u16 move1 = GetMonData(mon, MON_DATA_MOVE1 + slotTo);
    u16 move0 = GetMonData(mon, MON_DATA_MOVE1 + slotFrom);
    u8 pp1 = GetMonData(mon, MON_DATA_PP1 + slotTo);
    u8 pp0 = GetMonData(mon, MON_DATA_PP1 + slotFrom);
    u8 ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
    u8 ppBonusMask1 = gPPUpGetMask[slotTo];
    u8 ppBonusMove1 = (ppBonuses & ppBonusMask1) >> (slotTo * 2);
    u8 ppBonusMask2 = gPPUpGetMask[slotFrom];
    u8 ppBonusMove2 = (ppBonuses & ppBonusMask2) >> (slotFrom * 2);

    ppBonuses &= ~ppBonusMask1;
    ppBonuses &= ~ppBonusMask2;
    ppBonuses |= (ppBonusMove1 << (slotFrom * 2)) + (ppBonusMove2 << (slotTo * 2));
    SetMonData(mon, MON_DATA_MOVE1 + slotTo, &move0);
    SetMonData(mon, MON_DATA_MOVE1 + slotFrom, &move1);
    SetMonData(mon, MON_DATA_PP1 + slotTo, &pp0);
    SetMonData(mon, MON_DATA_PP1 + slotFrom, &pp1);
    SetMonData(mon, MON_DATA_PP_BONUSES, &ppBonuses);
}

void MoveDeleterForgetMove(void)
{
    u16 i;

    SetMonMoveSlot(&gPlayerParty[gSpecialVar_0x8004], MOVE_NONE, gSpecialVar_0x8005);
    RemoveMonPPBonus(&gPlayerParty[gSpecialVar_0x8004], gSpecialVar_0x8005);
    for (i = gSpecialVar_0x8005; i < MAX_MON_MOVES - 1; ++i)
        ShiftMoveSlot(&gPlayerParty[gSpecialVar_0x8004], i, i + 1);
}

void IsSelectedMonEgg(void)
{
    if (GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_IS_EGG))
        gSpecialVar_Result = TRUE;
    else
        gSpecialVar_Result = FALSE;
}


static bool8 CanLevelUpMonWithSouls(u8 partyId, u32 *requiredSouls, u32 *nextLevelExp)
{
    struct Pokemon *mon;
    u16 species;
    u8 level;
    u32 currentExp;
    u32 targetExp;

    if (partyId >= PARTY_SIZE)
        return FALSE;

    mon = &gPlayerParty[partyId];
    if (GetMonData(mon, MON_DATA_IS_EGG) == TRUE)
        return FALSE;

    level = GetMonData(mon, MON_DATA_LEVEL);
    if (level >= MAX_LEVEL)
        return FALSE;

    species = GetMonData(mon, MON_DATA_SPECIES);
    currentExp = GetMonData(mon, MON_DATA_EXP);
    targetExp = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1];

    if (nextLevelExp != NULL)
        *nextLevelExp = targetExp;
    *requiredSouls = targetExp - currentExp;
    return TRUE;
}

u16 PkmnCenterLevelUp_PrepareSelection(void)
{
    u32 requiredSouls = 0;

    if (!CanLevelUpMonWithSouls(gSpecialVar_0x8004, &requiredSouls, NULL))
        return FALSE;

    ConvertIntToDecimalStringN(gStringVar1, gSaveBlock1Ptr->money, STR_CONV_MODE_LEFT_ALIGN, 10);
    ConvertIntToDecimalStringN(gStringVar2, requiredSouls, STR_CONV_MODE_LEFT_ALIGN, 10);
    gSpecialVar_0x8005 = requiredSouls;
    return TRUE;
}

u16 PkmnCenterLevelUp_Purchase(void)
{
    struct Pokemon *mon;
    u16 learnedMove;
    bool8 firstMove;
    u32 requiredSouls = 0;
    u32 nextLevelExp = 0;

    if (!CanLevelUpMonWithSouls(gSpecialVar_0x8004, &requiredSouls, &nextLevelExp))
        return FALSE;

    if (!IsEnoughMoney(&gSaveBlock1Ptr->money, requiredSouls))
        return FALSE;

    RemoveMoney(&gSaveBlock1Ptr->money, requiredSouls);

    mon = &gPlayerParty[gSpecialVar_0x8004];
    SetMonData(mon, MON_DATA_EXP, &nextLevelExp);
    CalculateMonStats(mon);

    firstMove = TRUE;
    while ((learnedMove = MonTryLearningNewMove(mon, firstMove)) != MOVE_NONE)
    {
        firstMove = FALSE;
        if (learnedMove == MON_HAS_MAX_MOVES)
            DeleteFirstMoveAndGiveMoveToMon(mon, gMoveToLearn);
    }

    return TRUE;
}
