#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "berry_pouch.h"
#include "berry_powder.h"
#include "bike.h"
#include "coins.h"
#include "event_data.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "item.h"
#include "item_menu.h"
#include "item_use.h"
#include "itemfinder.h"
#include "mail.h"
#include "event_object_lock.h"
#include "metatile_behavior.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "party_menu.h"
#include "quest_log.h"
#include "region_map.h"
#include "script.h"
#include "strings.h"
#include "task.h"
#include "teachy_tv.h"
#include "tm_case.h"
#include "vs_seeker.h"
#include "constants/sound.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/field_weather.h"

static EWRAM_DATA void (*sItemUseOnFieldCB)(u8 taskId) = NULL;

static void FieldCB_FadeInFromBlack(void);
static void Task_WaitFadeIn_CallItemUseOnFieldCB(u8 taskId);
static void Task_ItemUse_CloseMessageBoxAndReturnToField(u8 taskId);
static void sub_80A11C0(u8 taskId);
static bool8 sub_80A1194(void);
static void sub_80A1208(void);
static void ItemUseOnFieldCB_Bicycle(u8 taskId);
static bool8 ItemUseCheckFunc_Rod(void);
static void ItemUseOnFieldCB_Rod(u8 taskId);
static void sub_80A1648(u8 taskId);
static void sub_80A1674(u8 taskId);
static void InitTMCaseFromBag(void);
static void Task_InitTMCaseFromField(u8 taskId);
static void InitBerryPouchFromBag(void);
static void Task_InitBerryPouchFromField(u8 taskId);
static void InitBerryPouchFromBattle(void);
static void InitTeachyTvFromBag(void);
static void Task_InitTeachyTvFromField(u8 taskId);
static void sub_80A19E8(u8 taskId);
static void sub_80A1A44(void);
static void sub_80A1B48(u8 taskId);
static void sub_80A1C08(u8 taskId);
static void sub_80A1CAC(void);
static void sub_80A1CC0(u8 taskId);
static void sub_80A1D58(void);
static void sub_80A1D68(u8 taskId);
static void Task_BattleUse_StatBooster_DelayAndPrint(u8 taskId);
static void Task_BattleUse_StatBooster_WaitButton_ReturnToBattle(u8 taskId);

// No clue what this is
static const u8 sUnref_83E27B4[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x40, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x20, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x04, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x10, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x20, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x20, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x21, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x10, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x40, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x40, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x40, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x30, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x40, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x23, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x10, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x1f, 0x00, 0xe0, 0x03, 0x00, 0x7c,
    0xff, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

static void (*const sExitCallbackByItemType[])(void) = {
    CB2_ShowPartyMenuForItemUse,
    CB2_ReturnToField,
    NULL,
    NULL
};

static void Task_FadeOuFromBackToField(u8 taskId)
{
    u8 itemType;
    if (gSpecialVar_ItemId == ITEM_ENIGMA_BERRY)
        itemType = gTasks[taskId].data[4] - 1;
    else
        itemType = ItemId_GetType(gSpecialVar_ItemId) - 1;
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        BerryPouch_SetExitCallback(sExitCallbackByItemType[itemType]);
        BerryPouch_StartFadeToExitCallback(taskId);
    }
    else
    {
        ItemMenu_SetExitCallback(sExitCallbackByItemType[itemType]);
        if (itemType == 1)
            Bag_BeginCloseWin0Animation();
        ItemMenu_StartFadeToExitCallback(taskId);
    }
}

static void sub_80A103C(u8 taskId)
{
    if (gTasks[taskId].data[3] != 1)
    {
        gFieldCallback = FieldCB_FadeInFromBlack;
        Task_FadeOuFromBackToField(taskId);
    }
    else
        sItemUseOnFieldCB(taskId);
}

static void FieldCB_FadeInFromBlack(void)
{
    FadeInFromBlack();
    CreateTask(Task_WaitFadeIn_CallItemUseOnFieldCB, 8);
}

static void Task_WaitFadeIn_CallItemUseOnFieldCB(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
    {
        sItemUseOnFieldCB(taskId);
    }
}

static void DisplayItemMessageInCurrentContext(u8 taskId, bool8 inField, u8 fontId, const u8 * str)
{
    StringExpandPlaceholders(gStringVar4, str);
    if (inField == FALSE)
        DisplayItemMessageInBag(taskId, fontId, gStringVar4, Task_ReturnToBagFromContextMenu);
    else
        DisplayItemMessageOnField(taskId, fontId, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

static void PrintNotTheTimeToUseThat(u8 taskId, bool8 inField)
{
    DisplayItemMessageInCurrentContext(taskId, inField, FONT_4, gText_OakForbidsUseOfItemHere);
}

static void Task_ItemUse_CloseMessageBoxAndReturnToField(u8 taskId)
{
    ClearDialogWindowAndFrame(0, 1);
    DestroyTask(taskId);
    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
}

u8 CheckIfItemIsTMHMOrEvolutionStone(u16 itemId)
{
    if (ItemId_GetPocket(itemId) == POCKET_TM_CASE)
        return 1;
    else if (ItemId_GetFieldFunc(itemId) == FieldUseFunc_EvoItem)
        return 2;
    else
        return 0;
}

static void sub_80A1184(void)
{
    gFieldCallback2 = sub_80A1194;
}

static bool8 sub_80A1194(void)
{
    FreezeObjectEvents();
    LockPlayerFieldControls();
    FadeInFromBlack();
    CreateTask(sub_80A11C0, 10);
    gExitStairsMovementDisabled = FALSE;
    return TRUE;
}

static void sub_80A11C0(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
    {
        UnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        DestroyTask(taskId);
    }
}

void FieldUseFunc_OrangeMail(u8 taskId)
{
    ItemMenu_SetExitCallback(sub_80A1208);
    ItemMenu_StartFadeToExitCallback(taskId);
}

static void sub_80A1208(void)
{
    struct Mail mail;

    mail.itemId = gSpecialVar_ItemId;
    ReadMail(&mail, CB2_BagMenuFromStartMenu, 0);
}

void FieldUseFunc_MachBike(u8 taskId)
{
    s16 x, y;
    u8 behavior;

    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);

    if (FlagGet(FLAG_SYS_ON_CYCLING_ROAD) == TRUE
     || MetatileBehavior_IsVerticalRail(behavior) == TRUE
     || MetatileBehavior_IsHorizontalRail(behavior) == TRUE
     || MetatileBehavior_IsIsolatedVerticalRail(behavior) == TRUE
     || MetatileBehavior_IsIsolatedHorizontalRail(behavior) == TRUE)
        DisplayItemMessageInCurrentContext(taskId, gTasks[taskId].data[3], FONT_2, gUnknown_8416451);
    else if (Overworld_IsBikingAllowed() == TRUE && !IsBikingDisallowedByPlayer())
    {
        sItemUseOnFieldCB = ItemUseOnFieldCB_Bicycle;
        sub_80A103C(taskId);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

static void ItemUseOnFieldCB_Bicycle(u8 taskId)
{
    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
        PlaySE(SE_BIKE_BELL);
    GetOnOffBike(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE);
    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
    DestroyTask(taskId);
}

void FieldUseFunc_OldRod(u8 taskId)
{
    if (ItemUseCheckFunc_Rod() == TRUE)
    {
        sItemUseOnFieldCB = ItemUseOnFieldCB_Rod;
        sub_80A103C(taskId);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

static bool8 ItemUseCheckFunc_Rod(void)
{
    s16 x, y;
    u16 behavior;

    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);

    if (MetatileBehavior_IsWaterfall(behavior))
        return FALSE;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_UNDERWATER))
        return FALSE;
    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
    {
        if (IsPlayerFacingSurfableFishableWater())
            return TRUE;
    }
    else
    {
        if (MetatileBehavior_IsSurfable(behavior) && MapGridGetCollisionAt(x, y) == 0)
            return TRUE;
        if (MetatileBehavior_IsBridge(behavior) == TRUE)
            return TRUE;
    }
    return FALSE;
}

static void ItemUseOnFieldCB_Rod(u8 taskId)
{
    StartFishing(ItemId_GetSecondaryId(gSpecialVar_ItemId));
    DestroyTask(taskId);
}

void ItemUseOutOfBattle_Itemfinder(u8 taskId)
{
    IncrementGameStat(GAME_STAT_USED_ITEMFINDER);
    sItemUseOnFieldCB = ItemUseOnFieldCB_Itemfinder;
    sub_80A103C(taskId);
}

void FieldUseFunc_CoinCase(u8 taskId)
{
    ConvertIntToDecimalStringN(gStringVar1, GetCoins(), STR_CONV_MODE_LEFT_ALIGN, 4);
    StringExpandPlaceholders(gStringVar4, gUnknown_8416537);
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
        DisplayItemMessageInBag(taskId, FONT_2, gStringVar4, Task_ReturnToBagFromContextMenu);
    else
        DisplayItemMessageOnField(taskId, FONT_2, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

void FieldUseFunc_PowderJar(u8 taskId)
{
    ConvertIntToDecimalStringN(gStringVar1, GetBerryPowder(), STR_CONV_MODE_LEFT_ALIGN, 5);
    StringExpandPlaceholders(gStringVar4, gUnknown_8416644);
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
        DisplayItemMessageInBag(taskId, FONT_2, gStringVar4, Task_ReturnToBagFromContextMenu);
    else
        DisplayItemMessageOnField(taskId, FONT_2, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

void FieldUseFunc_PokeFlute(u8 taskId)
{
    bool8 wokeSomeoneUp = FALSE;
    u8 i;

    for (i = 0; i < CalculatePlayerPartyCount(); i++)
    {
        if (!ExecuteTableBasedItemEffect(&gPlayerParty[i], ITEM_AWAKENING, i, MOVE_NONE))
            wokeSomeoneUp = TRUE;
    }

    if (wokeSomeoneUp)
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
        if (gTasks[taskId].data[3] == 0)
            DisplayItemMessageInBag(taskId, FONT_2, gUnknown_8416690, sub_80A1648);
        else
            DisplayItemMessageOnField(taskId, FONT_2, gUnknown_8416690, sub_80A1648);
    }
    else
    {
        // Now that's a catchy tune!
        if (gTasks[taskId].data[3] == 0)
            DisplayItemMessageInBag(taskId, FONT_2, gUnknown_841665C, Task_ReturnToBagFromContextMenu);
        else
            DisplayItemMessageOnField(taskId, FONT_2, gUnknown_841665C, Task_ItemUse_CloseMessageBoxAndReturnToField);
    }
}

static void sub_80A1648(u8 taskId)
{
    PlayFanfareByFanfareNum(FANFARE_POKE_FLUTE);
    gTasks[taskId].func = sub_80A1674;
}

static void sub_80A1674(u8 taskId)
{
    if (WaitFanfare(FALSE))
    {
        if (gTasks[taskId].data[3] == 0)
            DisplayItemMessageInBag(taskId, FONT_2, gUnknown_84166A7, Task_ReturnToBagFromContextMenu);
        else
            DisplayItemMessageOnField(taskId, FONT_2, gUnknown_84166A7, Task_ItemUse_CloseMessageBoxAndReturnToField);
    }
}

static void sub_80A16D0(u8 taskId)
{
    Task_FadeOuFromBackToField(taskId);
}

void FieldUseFunc_Medicine(u8 taskId)
{
    gItemUseCB = ItemUseCB_Medicine;
    sub_80A16D0(taskId);
}

void FieldUseFunc_Ether(u8 taskId)
{
    gItemUseCB = ItemUseCB_PPRecovery;
    sub_80A16D0(taskId);
}

void FieldUseFunc_PpUp(u8 taskId)
{
    gItemUseCB = ItemUseCB_PPUp;
    sub_80A16D0(taskId);
}

void FieldUseFunc_RareCandy(u8 taskId)
{
    gItemUseCB = ItemUseCB_RareCandy;
    sub_80A16D0(taskId);
}

void FieldUseFunc_EvoItem(u8 taskId)
{
    gItemUseCB = ItemUseCB_EvolutionStone;
    sub_80A16D0(taskId);
}

void FieldUseFunc_SacredAsh(u8 taskId)
{
    gItemUseCB = ItemUseCB_SacredAsh;
    Task_FadeOuFromBackToField(taskId);
}

void FieldUseFunc_TmCase(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(InitTMCaseFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_InitTMCaseFromField;
    }
}

static void InitTMCaseFromBag(void)
{
    InitTMCase(0, CB2_BagMenuFromStartMenu, 0);
}

static void Task_InitTMCaseFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        sub_80A1184();
        InitTMCase(0, CB2_ReturnToField, 1);
        DestroyTask(taskId);
    }
}

void FieldUseFunc_BerryPouch(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(InitBerryPouchFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_InitBerryPouchFromField;
    }
}

static void InitBerryPouchFromBag(void)
{
    InitBerryPouch(BERRYPOUCH_FROMFIELD, CB2_BagMenuFromStartMenu, 0);
}

static void Task_InitBerryPouchFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        sub_80A1184();
        InitBerryPouch(BERRYPOUCH_FROMFIELD, CB2_ReturnToField, 1);
        DestroyTask(taskId);
    }
}

void BattleUseFunc_BerryPouch(u8 taskId)
{
    ItemMenu_SetExitCallback(InitBerryPouchFromBattle);
    ItemMenu_StartFadeToExitCallback(taskId);
}

static void InitBerryPouchFromBattle(void)
{
    InitBerryPouch(BERRYPOUCH_FROMBATTLE, CB2_BagMenuFromBattle, 0);
}

void FieldUseFunc_TeachyTv(u8 taskId)
{
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(InitTeachyTvFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_InitTeachyTvFromField;
    }
}

static void InitTeachyTvFromBag(void)
{
    InitTeachyTvController(0, CB2_BagMenuFromStartMenu);
}

static void Task_InitTeachyTvFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        sub_80A1184();
        InitTeachyTvController(0, CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

void FieldUseFunc_SuperRepel(u8 taskId)
{
    if (VarGet(VAR_REPEL_STEP_COUNT) == 0)
    {
        PlaySE(SE_REPEL);
        gTasks[taskId].func = sub_80A19E8;
    }
    else
        // An earlier repel is still in effect
        DisplayItemMessageInBag(taskId, FONT_2, gUnknown_841659E, Task_ReturnToBagFromContextMenu);
}

static void sub_80A19E8(u8 taskId)
{
    if (!IsSEPlaying())
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
        VarSet(VAR_REPEL_STEP_COUNT, ItemId_GetHoldEffectParam(gSpecialVar_ItemId));
        sub_80A1A44();
        DisplayItemMessageInBag(taskId, FONT_2, gStringVar4, Task_ReturnToBagFromContextMenu);
    }
}

static void sub_80A1A44(void)
{
    RemoveBagItem(gSpecialVar_ItemId, 1);
    Pocket_CalculateNItemsAndMaxShowed(ItemId_GetPocket(gSpecialVar_ItemId));
    PocketCalculateInitialCursorPosAndItemsAbove(ItemId_GetPocket(gSpecialVar_ItemId));
    CopyItemName(gSpecialVar_ItemId, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gUnknown_841658C);
}

void FieldUseFunc_BlackFlute(u8 taskId)
{
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gSpecialVar_ItemId == ITEM_WHITE_FLUTE)
    {
        FlagSet(FLAG_SYS_WHITE_FLUTE_ACTIVE);
        FlagClear(FLAG_SYS_BLACK_FLUTE_ACTIVE);
        CopyItemName(gSpecialVar_ItemId, gStringVar2);
        StringExpandPlaceholders(gStringVar4, gUnknown_84165D2);
        gTasks[taskId].func = sub_80A1B48;
        gTasks[taskId].data[8] = 0;
    }
    else if (gSpecialVar_ItemId == ITEM_BLACK_FLUTE)
    {
        FlagSet(FLAG_SYS_BLACK_FLUTE_ACTIVE);
        FlagClear(FLAG_SYS_WHITE_FLUTE_ACTIVE);
        CopyItemName(gSpecialVar_ItemId, gStringVar2);
        StringExpandPlaceholders(gStringVar4, gUnknown_8416600);
        gTasks[taskId].func = sub_80A1B48;
        gTasks[taskId].data[8] = 0;
    }
}

static void sub_80A1B48(u8 taskId)
{
    if (++gTasks[taskId].data[8] > 7)
    {
        PlaySE(SE_GLASS_FLUTE);
        DisplayItemMessageInBag(taskId, FONT_2, gStringVar4, Task_ReturnToBagFromContextMenu);
    }
}

bool8 CanUseEscapeRopeOnCurrMap(void)
{
    if (gMapHeader.allowEscaping)
        return TRUE;
    else
        return FALSE;
}

void ItemUseOutOfBattle_EscapeRope(u8 taskId)
{
    if (CanUseEscapeRopeOnCurrMap() == TRUE)
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, gMapHeader.regionMapSectionId);
        sItemUseOnFieldCB = sub_80A1C08;
        sub_80A103C(taskId);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

static void sub_80A1C08(u8 taskId)
{
    Overworld_ResetStateAfterDigEscRope();
    sub_80A1A44();
    gTasks[taskId].data[0] = 0;
    DisplayItemMessageOnField(taskId, FONT_2, gStringVar4, sub_80A1C44);
}

void sub_80A1C44(u8 taskId)
{
    ResetInitialPlayerAvatarState();
    StartEscapeRopeFieldEffect();
    DestroyTask(taskId);
}

void FieldUseFunc_TownMap(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(sub_80A1CAC);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = sub_80A1CC0;
    }
}

static void sub_80A1CAC(void)
{
    InitRegionMapWithExitCB(REGIONMAP_TYPE_NORMAL, CB2_BagMenuFromStartMenu);
}

static void sub_80A1CC0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        sub_80A1184();
        InitRegionMapWithExitCB(REGIONMAP_TYPE_NORMAL, CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

void FieldUseFunc_FameChecker(u8 taskId)
{
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(sub_80A1D58);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = sub_80A1D68;
    }
}

static void sub_80A1D58(void)
{
    UseFameChecker(CB2_BagMenuFromStartMenu);
}

static void sub_80A1D68(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        sub_80A1184();
        UseFameChecker(CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

void FieldUseFunc_VsSeeker(u8 taskId)
{
    if ((gMapHeader.mapType != MAP_TYPE_ROUTE
      && gMapHeader.mapType != MAP_TYPE_TOWN
      && gMapHeader.mapType != MAP_TYPE_CITY)
     || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(VIRIDIAN_FOREST)
      && (gSaveBlock1Ptr->location.mapNum == MAP_NUM(VIRIDIAN_FOREST)
       || gSaveBlock1Ptr->location.mapNum == MAP_NUM(MT_EMBER_EXTERIOR)
       || gSaveBlock1Ptr->location.mapNum == MAP_NUM(THREE_ISLAND_BERRY_FOREST)
       || gSaveBlock1Ptr->location.mapNum == MAP_NUM(SIX_ISLAND_PATTERN_BUSH))))
    {
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
    }
    else
    {
        sItemUseOnFieldCB = Task_VsSeeker_0;
        sub_80A103C(taskId);
    }
}

void Task_ItemUse_CloseMessageBoxAndReturnToField_VsSeeker(u8 taskId)
{
    Task_ItemUse_CloseMessageBoxAndReturnToField(taskId);
}

void BattleUseFunc_PokeBallEtc(u8 taskId)
{
    if (!IsPlayerPartyAndPokemonStorageFull())
    {
        RemoveBagItem(gSpecialVar_ItemId, 1);
        Bag_BeginCloseWin0Animation();
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        DisplayItemMessageInBag(taskId, FONT_2, gUnknown_8416631, Task_ReturnToBagFromContextMenu);
    }
}

void BattleUseFunc_PokeFlute(u8 taskId)
{
    Bag_BeginCloseWin0Animation();
    ItemMenu_StartFadeToExitCallback(taskId);
}

void BattleUseFunc_GuardSpec(u8 taskId)
{
    if (ExecuteTableBasedItemEffect(&gPlayerParty[gBattlerPartyIndexes[gBattlerInMenuId]], gSpecialVar_ItemId, gBattlerPartyIndexes[gBattlerInMenuId], 0))
    {
        DisplayItemMessageInBag(taskId, FONT_2, gText_WontHaveEffect, Task_ReturnToBagFromContextMenu);
    }
    else
    {
        gTasks[taskId].data[8] = 0;
        gTasks[taskId].func = Task_BattleUse_StatBooster_DelayAndPrint;
    }
}

static void Task_BattleUse_StatBooster_DelayAndPrint(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (++data[8] > 7)
    {
        u16 itemId = gSpecialVar_ItemId;
        PlaySE(SE_USE_ITEM);
        RemoveBagItem(itemId, 1);
        DisplayItemMessageInBag(taskId, FONT_2, Battle_PrintStatBoosterEffectMessage(itemId), Task_BattleUse_StatBooster_WaitButton_ReturnToBattle);
    }
}

static void Task_BattleUse_StatBooster_WaitButton_ReturnToBattle(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        Bag_BeginCloseWin0Animation();
        ItemMenu_StartFadeToExitCallback(taskId);
    }
}

static void ItemUse_SwitchToPartyMenuInBattle(u8 taskId)
{
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        BerryPouch_SetExitCallback(EnterPartyFromItemMenuInBattle);
        BerryPouch_StartFadeToExitCallback(taskId);
    }
    else
    {
        ItemMenu_SetExitCallback(EnterPartyFromItemMenuInBattle);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
}

void BattleUseFunc_Medicine(u8 taskId)
{
    gItemUseCB = ItemUseCB_MedicineStep;
    ItemUse_SwitchToPartyMenuInBattle(taskId);
}

static void sub_80A1FD8(u8 taskId)
{
    gItemUseCB = ItemUseCB_SacredAsh;
    ItemUse_SwitchToPartyMenuInBattle(taskId);
}

void BattleUseFunc_Ether(u8 taskId)
{
    gItemUseCB = ItemUseCB_PPRecovery;
    ItemUse_SwitchToPartyMenuInBattle(taskId);
}

void BattleUseFunc_PokeDoll(u8 taskId)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
    {
        sub_80A1A44();
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, 0, gSpecialVar_ItemId, 0xFFFF);
        DisplayItemMessageInBag(taskId, FONT_2, gStringVar4, ItemMenu_StartFadeToExitCallback);
    }
    else
        PrintNotTheTimeToUseThat(taskId, 0);
}

void ItemUseOutOfBattle_EnigmaBerry(u8 taskId)
{
    switch (GetItemEffectType(gSpecialVar_ItemId) - 1)
    {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_Medicine(taskId);
        break;
    case 9:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_SacredAsh(taskId);
        break;
    case 0:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_RareCandy(taskId);
        break;
    case 18:
    case 19:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_PpUp(taskId);
        break;
    case 20:
        gTasks[taskId].data[4] = 1;
        FieldUseFunc_Ether(taskId);
        break;
    default:
        gTasks[taskId].data[4] = 4;
        FieldUseFunc_OakStopsYou(taskId);
    }
}

void ItemUseInBattle_EnigmaBerry(u8 taskId)
{
    switch (GetItemEffectType(gSpecialVar_ItemId))
    {
    case 0:
        BattleUseFunc_GuardSpec(taskId);
        break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
        BattleUseFunc_Medicine(taskId);
        break;
    case 21:
        BattleUseFunc_Ether(taskId);
        break;
    default:
        FieldUseFunc_OakStopsYou(taskId);
    }
}

void FieldUseFunc_OakStopsYou(u8 taskId)
{
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        StringExpandPlaceholders(gStringVar4, gText_OakForbidsUseOfItemHere);
        DisplayItemMessageInBerryPouch(taskId, FONT_4, gStringVar4, Task_BerryPouch_DestroyDialogueWindowAndRefreshListMenu);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

void ItemUse_SetQuestLogEvent(u8 eventId, struct Pokemon * pokemon, u16 itemId, u16 param)
{
    struct UnkStruct_ItemUseQuestLog
    {
        u16 itemId;
        u16 unk2;
        u16 species;
        u16 param;
    } * questLog = Alloc(sizeof(*questLog));

    questLog->itemId = itemId;
    questLog->param = param;
    if (pokemon != NULL)
        questLog->species = GetMonData(pokemon, MON_DATA_SPECIES2);
    else
        questLog->species = 0xFFFF;
    SetQuestLogEvent(eventId, (void *)questLog);
    Free(questLog);
}
