#include "global.h"
#include "field_player_avatar.h"
#include "field_effect.h"
#include "party_menu.h"
#include "event_data.h"
#include "script.h"
#include "fldeff.h"
#include "event_scripts.h"
#include "constants/event_objects.h"

static void FieldCB_UseStrength(void);
static void ShowMonCB_UseStrength(void);

bool8 SetUpFieldMove_Strength(void)
{
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING) || CheckObjectGraphicsInFrontOfPlayer(OBJ_EVENT_GFX_PUSHABLE_BOULDER) != TRUE)
    {
        return FALSE;
    }
    else
    {
        gSpecialVar_Result = GetCursorSelectionMonId();
        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCB_UseStrength;
        return TRUE;
    }
}
static void FieldCB_UseStrength(void)
{
    gFieldEffectArguments[0] = GetCursorSelectionMonId();
    ScriptContext_SetupScript(EventScript_FldEffStrength);
}

bool8 FldEff_UseStrength(void)
{
    u8 taskId = CreateFieldEffectShowMon();
    FLDEFF_SET_FUNC_TO_DATA(ShowMonCB_UseStrength);
    GetMonNickname(&gPlayerParty[gFieldEffectArguments[0]], gStringVar1);
    return FALSE;
}

static void ShowMonCB_UseStrength(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_STRENGTH);
    ScriptContext_Enable();
}
