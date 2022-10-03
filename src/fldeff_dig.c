#include "global.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "fldeff.h"
#include "item_use.h"
#include "overworld.h"
#include "party_menu.h"

static void FieldCallback_Dig(void);
static void StartDigFieldEffect(void);

bool8 SetUpFieldMove_Dig(void)
{
    if (CanUseEscapeRopeOnCurrMap() == TRUE)
    {
        gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_Dig;
        return TRUE;
    }
    return FALSE;
}

static void FieldCallback_Dig(void)
{
    Overworld_ResetStateAfterDigEscRope();
    FieldEffectStart(FLDEFF_USE_DIG);
    gFieldEffectArguments[0] = GetCursorSelectionMonId();
}

bool8 FldEff_UseDig(void)
{
    u8 taskId = CreateFieldEffectShowMon();

    FLDEFF_SET_FUNC_TO_DATA(StartDigFieldEffect);
    SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
    return FALSE;
}

static void StartDigFieldEffect(void)
{
    u8 taskId;

    FieldEffectActiveListRemove(FLDEFF_USE_DIG);
    taskId = CreateTask(Task_UseDigEscapeRopeOnField, 8);
    gTasks[taskId].data[0] = 0;
}
