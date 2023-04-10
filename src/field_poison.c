#include "global.h"
#include "gflib.h"
#include "strings.h"
#include "task.h"
#include "field_message_box.h"
#include "script.h"
#include "event_data.h"
#include "fldeff.h"
#include "party_menu.h"
#include "field_poison.h"
#include "constants/battle.h"

static bool32 IsMonValidSpecies(struct Pokemon *pokemon)
{
    u16 species = GetMonData(pokemon, MON_DATA_SPECIES_OR_EGG);
    if (species == SPECIES_NONE || species == SPECIES_EGG)
        return FALSE;
    return TRUE;
}

static bool32 AllMonsFainted(void)
{
    int i;

    struct Pokemon *pokemon = gPlayerParty;
    for (i = 0; i < PARTY_SIZE; i++, pokemon++)
        if (IsMonValidSpecies(pokemon) && GetMonData(pokemon, MON_DATA_HP))
            return FALSE;
    return TRUE;
}

static void FaintFromFieldPoison(u8 partyIdx)
{
    struct Pokemon *pokemon = gPlayerParty + partyIdx;
    u32 status = STATUS1_NONE;
    AdjustFriendship(pokemon, FRIENDSHIP_EVENT_FAINT_OUTSIDE_BATTLE);
    SetMonData(pokemon, MON_DATA_STATUS, &status);
    GetMonData(pokemon, MON_DATA_NICKNAME, gStringVar1);
    StringGet_Nickname(gStringVar1);
}

static bool32 MonFaintedFromPoison(u8 partyIdx)
{
    struct Pokemon *pokemon = gPlayerParty + partyIdx;
    if (IsMonValidSpecies(pokemon) && !GetMonData(pokemon, MON_DATA_HP) && GetAilmentFromStatus(GetMonData(pokemon, MON_DATA_STATUS)) == AILMENT_PSN)
        return TRUE;
    return FALSE;
}

#define tState   data[0]
#define tPartyId data[1]

static void Task_TryFieldPoisonWhiteOut(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (tState)
    {
    case 0:
        for (; tPartyId < PARTY_SIZE; tPartyId++)
        {
            if (MonFaintedFromPoison(tPartyId))
            {
                FaintFromFieldPoison(tPartyId);
                ShowFieldMessage(gText_PkmnFainted3);
                tState++;
                return;
            }
        }
        tState = 2;
        break;
    case 1:
        if (IsFieldMessageBoxHidden())
            tState--;
        break;
    case 2:
        if (AllMonsFainted())
            gSpecialVar_Result = TRUE;
        else
            gSpecialVar_Result = FALSE;
        ScriptContext_Enable();
        DestroyTask(taskId);
        break;
    }
}

void TryFieldPoisonWhiteOut(void)
{
    CreateTask(Task_TryFieldPoisonWhiteOut, 80);
    ScriptContext_Stop();
}

s32 DoPoisonFieldEffect(void)
{
    int i;
    u32 hp;
    
    struct Pokemon *pokemon = gPlayerParty;
    u32 numPoisoned = 0;
    u32 numFainted = 0;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(pokemon, MON_DATA_SANITY_HAS_SPECIES) && GetAilmentFromStatus(GetMonData(pokemon, MON_DATA_STATUS)) == AILMENT_PSN)
        {
            hp = GetMonData(pokemon, MON_DATA_HP);
            if (hp == 0 || --hp == 0)
                numFainted++;
            SetMonData(pokemon, MON_DATA_HP, &hp);
            numPoisoned++;
        }
        pokemon++;
    }
    if (numFainted || numPoisoned)
        FldEffPoison_Start();
    if (numFainted)
        return FLDPSN_FNT;
    if (numPoisoned)
        return FLDPSN_PSN;
    return FLDPSN_NONE;
}
