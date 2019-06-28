#include "global.h"
#include "field_player_avatar.h"
#include "field_effect.h"
#include "party_menu.h"
#include "malloc.h"
#include "event_data.h"
#include "script.h"
#include "fldeff.h"
#include "event_scripts.h"
#include "field_weather.h"
#include "sound.h"
#include "palette.h"
#include "wild_encounter.h"
#include "constants/songs.h"

static void FieldCallback_SweetScent(void);
static void StartSweetScentFieldEffect(void);
static void TrySweetScentEncounter(u8 taskId);
static void FailSweetScentEncounter(u8 taskId);

static void Unused_StartSweetscentFldeff(void)
{
	gUnknown_203B0A0.unk9 = 0;
	FieldCallback_SweetScent();
}

bool8 SetUpFieldMove_SweetScent(void)
{
    gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
    gPostMenuFieldCallback = FieldCallback_SweetScent;
    return TRUE;
}

static void FieldCallback_SweetScent(void)
{
    FieldEffectStart(FLDEFF_SWEET_SCENT);
    gFieldEffectArguments[0] = GetCursorSelectionMonId();
}

bool8 FldEff_SweetScent(void)
{
    u8 taskId;

    SetWeatherScreenFadeOut();
    taskId = oei_task_add();
    gTasks[taskId].data[8] = (u32)StartSweetScentFieldEffect >> 16;
    gTasks[taskId].data[9] = (u32)StartSweetScentFieldEffect;
    return FALSE;
}

static void StartSweetScentFieldEffect(void)
{
    u8 taskId;

    PlaySE(SE_W260);
    gPaletteDecompressionBuffer = (u8 *)Alloc(0x400);
    CpuFastSet(gPlttBufferUnfaded, gPaletteDecompressionBuffer, 0x100);
    CpuFastSet(gPlttBufferFaded, gPlttBufferUnfaded, 0x100);
    BeginNormalPaletteFade(~(1 << (gSprites[GetPlayerAvatarObjectId()].oam.paletteNum + 16)), 4, 0, 8, RGB(31, 0, 0));
    taskId = CreateTask(TrySweetScentEncounter, 0);
    gTasks[taskId].data[0] = 0;
    FieldEffectActiveListRemove(FLDEFF_SWEET_SCENT);
}

static void TrySweetScentEncounter(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        if (data[0] == 64)
        {
            data[0] = 0;
            if (SweetScentWildEncounter() == TRUE)
            {
                Free(gPaletteDecompressionBuffer);
                DestroyTask(taskId);
            }
            else
            {
                gTasks[taskId].func = FailSweetScentEncounter;
                BeginNormalPaletteFade(~(1 << (gSprites[GetPlayerAvatarObjectId()].oam.paletteNum + 16)), 4, 8, 0, RGB(31, 0, 0));
            }
        }
        else
        {
            data[0]++;
        }
    }
}

static void FailSweetScentEncounter(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CpuFastSet(gPaletteDecompressionBuffer, gPlttBufferUnfaded, 0x100);
        sub_807B070();
        Free(gPaletteDecompressionBuffer);
        ScriptContext1_SetupScript(EventScript_FailSweetScent);
        DestroyTask(taskId);
    }
}
