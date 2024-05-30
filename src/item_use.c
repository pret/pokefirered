#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_anim.h"
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
#include "constants/item_effects.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/field_weather.h"

static EWRAM_DATA void (*sItemUseOnFieldCB)(u8 taskId) = NULL;

static void FieldCB_FadeInFromBlack(void);
static void Task_WaitFadeIn_CallItemUseOnFieldCB(u8 taskId);
static void Task_ItemUse_CloseMessageBoxAndReturnToField(u8 taskId);
static void Task_ItemUseWaitForFade(u8 taskId);
static bool8 FieldCB2_UseItemFromField(void);
static void CB2_CheckMail(void);
static void ItemUseOnFieldCB_Bicycle(u8 taskId);
static bool8 CanFish(void);
static void ItemUseOnFieldCB_Rod(u8 taskId);
static void Task_PlayPokeFlute(u8 taskId);
static void Task_DisplayPokeFluteMessage(u8 taskId);
static void InitTMCaseFromBag(void);
static void Task_InitTMCaseFromField(u8 taskId);
static void InitBerryPouchFromBag(void);
static void Task_InitBerryPouchFromField(u8 taskId);
static void InitBerryPouchFromBattle(void);
static void InitTeachyTvFromBag(void);
static void Task_InitTeachyTvFromField(u8 taskId);
static void Task_UseRepel(u8 taskId);
static void RemoveUsedItem(void);
static void Task_UsedBlackWhiteFlute(u8 taskId);
static void ItemUseOnFieldCB_EscapeRope(u8 taskId);
static void UseTownMapFromBag(void);
static void Task_UseTownMapFromField(u8 taskId);
static void UseFameCheckerFromBag(void);
static void Task_UseFameCheckerFromField(u8 taskId);

static void (*const sExitCallbackByItemType[])(void) = {
    [ITEM_TYPE_PARTY_MENU - 1] = CB2_ShowPartyMenuForItemUse,
    [ITEM_TYPE_FIELD      - 1] = CB2_ReturnToField,
    [ITEM_TYPE_UNUSED     - 1] = NULL,
    [ITEM_TYPE_BAG_MENU   - 1] = NULL,
    [ITEM_TYPE_PARTY_MENU_MOVES - 1] = CB2_ShowPartyMenuForItemUse
};

static void SetUpItemUseCallback(u8 taskId)
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
        if (itemType == ITEM_TYPE_FIELD - 1)
            Bag_BeginCloseWin0Animation();
        ItemMenu_StartFadeToExitCallback(taskId);
    }
}

static void SetUpItemUseOnFieldCallback(u8 taskId)
{
    if (gTasks[taskId].data[3] != 1)
    {
        gFieldCallback = FieldCB_FadeInFromBlack;
        SetUpItemUseCallback(taskId);
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
        sItemUseOnFieldCB(taskId);
}

static void DisplayItemMessageInCurrentContext(u8 taskId, bool8 inField, u8 fontId, const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    if (inField == FALSE)
        DisplayItemMessageInBag(taskId, fontId, gStringVar4, Task_ReturnToBagFromContextMenu);
    else
        DisplayItemMessageOnField(taskId, fontId, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

static void PrintNotTheTimeToUseThat(u8 taskId, bool8 inField)
{
    DisplayItemMessageInCurrentContext(taskId, inField, FONT_MALE, gText_OakForbidsUseOfItemHere);
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
    else if (ItemId_GetFieldFunc(itemId) == ItemUseOutOfBattle_EvolutionStone)
        return 2;
    else
        return 0;
}

static void SetFieldCallback2ForItemUse(void)
{
    gFieldCallback2 = FieldCB2_UseItemFromField;
}

static bool8 FieldCB2_UseItemFromField(void)
{
    FreezeObjectEvents();
    LockPlayerFieldControls();
    FadeInFromBlack();
    CreateTask(Task_ItemUseWaitForFade, 10);
    gExitStairsMovementDisabled = FALSE;
    return TRUE;
}

static void Task_ItemUseWaitForFade(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
    {
        UnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        DestroyTask(taskId);
    }
}

void ItemUseOutOfBattle_AbilityCapsule(u8 taskId)
{
    gItemUseCB = ItemUseCB_AbilityCapsule;
    SetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_AbilityPatch(u8 taskId)
{
    gItemUseCB = ItemUseCB_AbilityPatch;
    SetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_Mail(u8 taskId)
{
    ItemMenu_SetExitCallback(CB2_CheckMail);
    ItemMenu_StartFadeToExitCallback(taskId);
}

static void CB2_CheckMail(void)
{
    struct Mail mail;

    mail.itemId = gSpecialVar_ItemId;
    ReadMail(&mail, CB2_BagMenuFromStartMenu, FALSE);
}

void ItemUseOutOfBattle_Bike(u8 taskId)
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
        DisplayItemMessageInCurrentContext(taskId, gTasks[taskId].data[3], FONT_NORMAL, gText_CantDismountBike);
    else if (Overworld_IsBikingAllowed() == TRUE && !IsBikingDisallowedByPlayer())
    {
        sItemUseOnFieldCB = ItemUseOnFieldCB_Bicycle;
        SetUpItemUseOnFieldCallback(taskId);
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

void ItemUseOutOfBattle_Rod(u8 taskId)
{
    if (CanFish() == TRUE)
    {
        sItemUseOnFieldCB = ItemUseOnFieldCB_Rod;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

static bool8 CanFish(void)
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
    SetUpItemUseOnFieldCallback(taskId);
}

#define tIsFieldUse data[3]

void ItemUseOutOfBattle_CoinCase(u8 taskId)
{
    ConvertIntToDecimalStringN(gStringVar1, GetCoins(), STR_CONV_MODE_LEFT_ALIGN, 4);
    StringExpandPlaceholders(gStringVar4, gText_CoinCase);
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].tIsFieldUse == FALSE)
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_ReturnToBagFromContextMenu);
    else
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

void ItemUseOutOfBattle_PowderJar(u8 taskId)
{
    ConvertIntToDecimalStringN(gStringVar1, GetBerryPowder(), STR_CONV_MODE_LEFT_ALIGN, 5);
    StringExpandPlaceholders(gStringVar4, gText_PowderQty);
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].tIsFieldUse == FALSE)
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_ReturnToBagFromContextMenu);
    else
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_ItemUse_CloseMessageBoxAndReturnToField);
}

void ItemUseOutOfBattle_PokeFlute(u8 taskId)
{
    bool8 wokeSomeoneUp = FALSE;
    u8 i;

    for (i = 0; i < CalculatePlayerPartyCount(); i++)
    {
        if (!ExecuteTableBasedItemEffect(&gPlayerParty[i], ITEM_AWAKENING, i, 0))
            wokeSomeoneUp = TRUE;
    }

    if (wokeSomeoneUp)
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
        if (gTasks[taskId].tIsFieldUse == FALSE)
            DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_PlayedPokeFlute, Task_PlayPokeFlute);
        else
            DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_PlayedPokeFlute, Task_PlayPokeFlute);
    }
    else
    {
        if (gTasks[taskId].tIsFieldUse == FALSE)
            DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_PlayedPokeFluteCatchy, Task_ReturnToBagFromContextMenu);
        else
            DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_PlayedPokeFluteCatchy, Task_ItemUse_CloseMessageBoxAndReturnToField);
    }
}

static void Task_PlayPokeFlute(u8 taskId)
{
    PlayFanfareByFanfareNum(FANFARE_POKE_FLUTE);
    gTasks[taskId].func = Task_DisplayPokeFluteMessage;
}

static void Task_DisplayPokeFluteMessage(u8 taskId)
{
    if (WaitFanfare(FALSE))
    {
        if (gTasks[taskId].tIsFieldUse == FALSE)
            DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_PokeFluteAwakenedMon, Task_ReturnToBagFromContextMenu);
        else
            DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_PokeFluteAwakenedMon, Task_ItemUse_CloseMessageBoxAndReturnToField);
    }
}

void ItemUseOutOfBattle_TmCase(u8 taskId)
{
    if (gTasks[taskId].tIsFieldUse == FALSE)
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

void ItemUseOutOfBattle_BerryPouch(u8 taskId)
{
    if (gTasks[taskId].tIsFieldUse == FALSE)
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

void ItemUseOutOfBattle_TeachyTv(u8 taskId)
{
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].tIsFieldUse == FALSE)
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

void ItemUseOutOfBattle_TownMap(u8 taskId)
{
    if (gTasks[taskId].tIsFieldUse == FALSE)
    {
        ItemMenu_SetExitCallback(UseTownMapFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_UseTownMapFromField;
    }
}

void ItemUseOutOfBattle_FameChecker(u8 taskId)
{
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].tIsFieldUse == FALSE)
    {
        ItemMenu_SetExitCallback(UseFameCheckerFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        FadeScreen(FADE_TO_BLACK, 0);
        gTasks[taskId].func = Task_UseFameCheckerFromField;
    }
}

#undef tIsFieldUse

static void DoSetUpItemUseCallback(u8 taskId)
{
    SetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_Medicine(u8 taskId)
{
    gItemUseCB = ItemUseCB_Medicine;
    DoSetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_Mint(u8 taskId)
{
    gItemUseCB = ItemUseCB_Mint;
    SetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_PPRecovery(u8 taskId)
{
    gItemUseCB = ItemUseCB_PPRecovery;
    DoSetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_PPUp(u8 taskId)
{
    gItemUseCB = ItemUseCB_PPUp;
    DoSetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_RareCandy(u8 taskId)
{
    gItemUseCB = ItemUseCB_RareCandy;
    DoSetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_EvolutionStone(u8 taskId)
{
    gItemUseCB = ItemUseCB_EvolutionStone;
    DoSetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_SacredAsh(u8 taskId)
{
    gItemUseCB = ItemUseCB_SacredAsh;
    SetUpItemUseCallback(taskId);
}

static void InitTMCaseFromBag(void)
{
    InitTMCase(TMCASE_FIELD, CB2_BagMenuFromStartMenu, FALSE);
}

static void Task_InitTMCaseFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetFieldCallback2ForItemUse();
        InitTMCase(TMCASE_FIELD, CB2_ReturnToField, TRUE);
        DestroyTask(taskId);
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
        SetFieldCallback2ForItemUse();
        InitBerryPouch(BERRYPOUCH_FROMFIELD, CB2_ReturnToField, 1);
        DestroyTask(taskId);
    }
}

static void ItemUseInBattle_BerryPouch(u8 taskId)
{
    ItemMenu_SetExitCallback(InitBerryPouchFromBattle);
    ItemMenu_StartFadeToExitCallback(taskId);
}

static void InitBerryPouchFromBattle(void)
{
    InitBerryPouch(BERRYPOUCH_FROMBATTLE, CB2_BagMenuFromBattle, 0);
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
        SetFieldCallback2ForItemUse();
        InitTeachyTvController(0, CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

void ItemUseOutOfBattle_Repel(u8 taskId)
{
    if (VarGet(VAR_REPEL_STEP_COUNT) == 0)
    {
        PlaySE(SE_REPEL);
        gTasks[taskId].func = Task_UseRepel;
    }
    else
        // An earlier repel is still in effect
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gText_RepelEffectsLingered, Task_ReturnToBagFromContextMenu);
}

void ItemUseOutOfBattle_ReduceEV(u8 taskId)
{
    gItemUseCB = ItemUseCB_ReduceEV;
    SetUpItemUseCallback(taskId);
}

void ItemUseOutOfBattle_ResetEVs(u8 taskId)
{
    gItemUseCB = ItemUseCB_ResetEVs;
    SetUpItemUseCallback(taskId);
}

static void Task_UseRepel(u8 taskId)
{
    if (!IsSEPlaying())
    {
        ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
        VarSet(VAR_REPEL_STEP_COUNT, ItemId_GetHoldEffectParam(gSpecialVar_ItemId));
        RemoveUsedItem();
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_ReturnToBagFromContextMenu);
    }
}

static void RemoveUsedItem(void)
{
    u8 pocketId = ItemId_GetPocket(gSpecialVar_ItemId) - 1;
    RemoveBagItem(gSpecialVar_ItemId, 1);
    Pocket_CalculateNItemsAndMaxShowed(pocketId);
    PocketCalculateInitialCursorPosAndItemsAbove(pocketId);
    CopyItemName(gSpecialVar_ItemId, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gText_PlayerUsedVar2);
}

void ItemUseOutOfBattle_BlackWhiteFlute(u8 taskId)
{
    ItemUse_SetQuestLogEvent(QL_EVENT_USED_ITEM, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gSpecialVar_ItemId == ITEM_WHITE_FLUTE)
    {
        FlagSet(FLAG_SYS_WHITE_FLUTE_ACTIVE);
        FlagClear(FLAG_SYS_BLACK_FLUTE_ACTIVE);
        CopyItemName(gSpecialVar_ItemId, gStringVar2);
        StringExpandPlaceholders(gStringVar4, gText_UsedVar2WildLured);
        gTasks[taskId].func = Task_UsedBlackWhiteFlute;
        gTasks[taskId].data[8] = 0;
    }
    else if (gSpecialVar_ItemId == ITEM_BLACK_FLUTE)
    {
        FlagSet(FLAG_SYS_BLACK_FLUTE_ACTIVE);
        FlagClear(FLAG_SYS_WHITE_FLUTE_ACTIVE);
        CopyItemName(gSpecialVar_ItemId, gStringVar2);
        StringExpandPlaceholders(gStringVar4, gText_UsedVar2WildRepelled);
        gTasks[taskId].func = Task_UsedBlackWhiteFlute;
        gTasks[taskId].data[8] = 0;
    }
}

static void Task_UsedBlackWhiteFlute(u8 taskId)
{
    if (++gTasks[taskId].data[8] > 7)
    {
        PlaySE(SE_GLASS_FLUTE);
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_ReturnToBagFromContextMenu);
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
        sItemUseOnFieldCB = ItemUseOnFieldCB_EscapeRope;
        SetUpItemUseOnFieldCallback(taskId);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

static void ItemUseOnFieldCB_EscapeRope(u8 taskId)
{
    Overworld_ResetStateAfterDigEscRope();
    RemoveUsedItem();
    gTasks[taskId].data[0] = 0;
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gStringVar4, Task_UseDigEscapeRopeOnField);
}

void Task_UseDigEscapeRopeOnField(u8 taskId)
{
    ResetInitialPlayerAvatarState();
    StartEscapeRopeFieldEffect();
    DestroyTask(taskId);
}

static void UseTownMapFromBag(void)
{
    InitRegionMapWithExitCB(REGIONMAP_TYPE_NORMAL, CB2_BagMenuFromStartMenu);
}

static void Task_UseTownMapFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetFieldCallback2ForItemUse();
        InitRegionMapWithExitCB(REGIONMAP_TYPE_NORMAL, CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

static void UseFameCheckerFromBag(void)
{
    UseFameChecker(CB2_BagMenuFromStartMenu);
}

static void Task_UseFameCheckerFromField(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetFieldCallback2ForItemUse();
        UseFameChecker(CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

void ItemUseOutOfBattle_VsSeeker(u8 taskId)
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
        SetUpItemUseOnFieldCallback(taskId);
    }
}

void Task_ItemUse_CloseMessageBoxAndReturnToField_VsSeeker(u8 taskId)
{
    Task_ItemUse_CloseMessageBoxAndReturnToField(taskId);
}

static void ItemUseInBattle_PokeFlute(u8 taskId)
{
    Bag_BeginCloseWin0Animation();
    ItemMenu_StartFadeToExitCallback(taskId);
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

void ItemUseInBattle_BagMenu(u8 taskId)
{
    if (gSpecialVar_ItemId == ITEM_BERRY_POUCH)
    {
        ItemUseInBattle_BerryPouch(taskId);
    } 
    else if (CannotUseItemsInBattle(gSpecialVar_ItemId, NULL))
    {
        DisplayItemMessageInBag(taskId, FONT_NORMAL, gStringVar4, Task_ReturnToBagFromContextMenu);
    }
    else
    {
        PlaySE(SE_SELECT);
        if (!(B_TRY_CATCH_TRAINER_BALL >= GEN_4 && (ItemId_GetBattleUsage(gSpecialVar_ItemId) == EFFECT_ITEM_THROW_BALL) && (gBattleTypeFlags & BATTLE_TYPE_TRAINER))) 
        {
            RemoveBagItem(gSpecialVar_ItemId, 1);
        }
        ScheduleBgCopyTilemapToVram(2);
        gTasks[taskId].func = ItemMenu_StartFadeToExitCallback;
    }
}

void ItemUseInBattle_PartyMenu(u8 taskId)
{
    gItemUseCB = ItemUseCB_BattleScript;
    ItemUse_SwitchToPartyMenuInBattle(taskId);
}

void ItemUseInBattle_PartyMenuChooseMove(u8 taskId)
{
    gItemUseCB = ItemUseCB_BattleChooseMove;
    ItemUse_SwitchToPartyMenuInBattle(taskId);
}

static u32 GetBallThrowableState(void)
{
    if (IsBattlerAlive(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT))
     && IsBattlerAlive(GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT)))
        return BALL_THROW_UNABLE_TWO_MONS;
    else if (IsPlayerPartyAndPokemonStorageFull() == TRUE)
        return BALL_THROW_UNABLE_NO_ROOM;
    else if (B_SEMI_INVULNERABLE_CATCH >= GEN_4 && (gStatuses3[GetCatchingBattler()] & STATUS3_SEMI_INVULNERABLE))
        return BALL_THROW_UNABLE_SEMI_INVULNERABLE;
    else if (FlagGet(B_FLAG_NO_CATCHING))
        return BALL_THROW_UNABLE_DISABLED_FLAG;

    return BALL_THROW_ABLE;
}

static const u8 sText_CantThrowPokeBall_TwoMons[] = _("Cannot throw a ball!\nThere are two Pokémon out there!\p");
static const u8 sText_CantThrowPokeBall_SemiInvulnerable[] = _("Cannot throw a ball!\nThere's no Pokémon in sight!\p");
static const u8 sText_CantThrowPokeBall_Disabled[] = _("POKé BALLS cannot be used\nright now!\p");
// Returns whether an item can be used in battle and sets the fail text.
bool32 CannotUseItemsInBattle(u16 itemId, struct Pokemon *mon)
{
    u16 battleUsage = ItemId_GetBattleUsage(itemId);
    bool8 cannotUse = FALSE;
    const u8* failStr = NULL;
    u32 i;
    u16 hp = GetMonData(mon, MON_DATA_HP);

    // Embargo Check
    if ((gPartyMenu.slotId == 0 && gStatuses3[B_POSITION_PLAYER_LEFT] & STATUS3_EMBARGO)
        || (gPartyMenu.slotId == 1 && gStatuses3[B_POSITION_PLAYER_RIGHT] & STATUS3_EMBARGO))
    {
        return TRUE;
    }

    // battleUsage checks
    switch (battleUsage)
    {
    case EFFECT_ITEM_INCREASE_STAT:
        if (gBattleMons[gBattlerInMenuId].statStages[ItemId_GetEffect(itemId)[1]] == MAX_STAT_STAGE)
            cannotUse = TRUE;
        break;
    case EFFECT_ITEM_SET_FOCUS_ENERGY:
        if (gBattleMons[gBattlerInMenuId].status2 & STATUS2_FOCUS_ENERGY)
            cannotUse = TRUE;
        break;
    case EFFECT_ITEM_SET_MIST:
        if (gSideStatuses[GetBattlerSide(gBattlerInMenuId)] & SIDE_STATUS_MIST)
            cannotUse = TRUE;
        break;
    case EFFECT_ITEM_ESCAPE:
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            cannotUse = TRUE;
        break;
    case EFFECT_ITEM_THROW_BALL:
        switch (GetBallThrowableState())
        {
        case BALL_THROW_UNABLE_TWO_MONS:
            failStr = sText_CantThrowPokeBall_TwoMons;
            cannotUse = TRUE;
            break;
        case BALL_THROW_UNABLE_NO_ROOM:
            failStr = gText_BoxFull;
            cannotUse = TRUE;
            break;
        case BALL_THROW_UNABLE_SEMI_INVULNERABLE:
            failStr = sText_CantThrowPokeBall_SemiInvulnerable;
            cannotUse = TRUE;
            break;
        case BALL_THROW_UNABLE_DISABLED_FLAG:
            failStr = sText_CantThrowPokeBall_Disabled;
            cannotUse = TRUE;
            break;
        }
        break;
    case EFFECT_ITEM_INCREASE_ALL_STATS:
        for (i = STAT_ATK; i < NUM_STATS; i++)
        {
            if (CompareStat(gBattlerInMenuId, i, MAX_STAT_STAGE, CMP_EQUAL))
            {
                cannotUse = TRUE;
                break;
            }
        }
        break;
    case EFFECT_ITEM_RESTORE_HP:
        if (hp == 0 || hp == GetMonData(mon, MON_DATA_MAX_HP))
            cannotUse = TRUE;
        break;
    case EFFECT_ITEM_CURE_STATUS:
        if (!((GetMonData(mon, MON_DATA_STATUS) & GetItemStatus1Mask(itemId))
            || (gPartyMenu.slotId == 0 && gBattleMons[gBattlerInMenuId].status2 & GetItemStatus2Mask(itemId))))
            cannotUse = TRUE;
        break;
    case EFFECT_ITEM_HEAL_AND_CURE_STATUS:
        if ((hp == 0 || hp == GetMonData(mon, MON_DATA_MAX_HP))
            && !((GetMonData(mon, MON_DATA_STATUS) & GetItemStatus1Mask(itemId))
            || (gPartyMenu.slotId == 0 && gBattleMons[gBattlerInMenuId].status2 & GetItemStatus2Mask(itemId))))
            cannotUse = TRUE;
        break;
    case EFFECT_ITEM_REVIVE:
        if (hp != 0)
            cannotUse = TRUE;
        break;
    case EFFECT_ITEM_RESTORE_PP:
        if (ItemId_GetEffect(itemId)[6] == ITEM4_HEAL_PP)
        {
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                if (GetMonData(mon, MON_DATA_PP1 + i) < CalculatePPWithBonus(GetMonData(mon, MON_DATA_MOVE1 + i), GetMonData(mon, MON_DATA_PP_BONUSES), i));
                    break;
            }
            if (i == MAX_MON_MOVES)
                cannotUse = TRUE;
        }
        else if (GetMonData(mon, MON_DATA_PP1 + gPartyMenu.data[0]) == CalculatePPWithBonus(GetMonData(mon, MON_DATA_MOVE1 + gPartyMenu.data[0]), GetMonData(mon, MON_DATA_PP_BONUSES), gPartyMenu.data[0]))
        {
            cannotUse = TRUE;
        }
        break;
    }

    if (failStr != NULL)
        StringExpandPlaceholders(gStringVar4, failStr);
    else
        StringExpandPlaceholders(gStringVar4, gText_WontHaveEffect);

    return cannotUse;
}

void ItemUseOutOfBattle_EnigmaBerry(u8 taskId)
{
    switch (GetItemEffectType(gSpecialVar_ItemId))
    {
    case ITEM_EFFECT_HEAL_HP:
    case ITEM_EFFECT_CURE_POISON:
    case ITEM_EFFECT_CURE_SLEEP:
    case ITEM_EFFECT_CURE_BURN:
    case ITEM_EFFECT_CURE_FREEZE:
    case ITEM_EFFECT_CURE_PARALYSIS:
    case ITEM_EFFECT_CURE_ALL_STATUS:
    case ITEM_EFFECT_ATK_EV:
    case ITEM_EFFECT_HP_EV:
    case ITEM_EFFECT_SPATK_EV:
    case ITEM_EFFECT_SPDEF_EV:
    case ITEM_EFFECT_SPEED_EV:
    case ITEM_EFFECT_DEF_EV:
        gTasks[taskId].data[4] = 1;
        ItemUseOutOfBattle_Medicine(taskId);
        break;
    case ITEM_EFFECT_SACRED_ASH:
        gTasks[taskId].data[4] = 1;
        ItemUseOutOfBattle_SacredAsh(taskId);
        break;
    case ITEM_EFFECT_RAISE_LEVEL:
        gTasks[taskId].data[4] = 1;
        ItemUseOutOfBattle_RareCandy(taskId);
        break;
    case ITEM_EFFECT_PP_UP:
    case ITEM_EFFECT_PP_MAX:
        gTasks[taskId].data[4] = 1;
        ItemUseOutOfBattle_PPUp(taskId);
        break;
    case ITEM_EFFECT_HEAL_PP:
        gTasks[taskId].data[4] = 1;
        ItemUseOutOfBattle_PPRecovery(taskId);
        break;
    default:
        gTasks[taskId].data[4] = 4;
        ItemUseOutOfBattle_CannotUse(taskId);
    }
}

void ItemUseOutOfBattle_CannotUse(u8 taskId)
{
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        StringExpandPlaceholders(gStringVar4, gText_OakForbidsUseOfItemHere);
        DisplayItemMessageInBerryPouch(taskId, FONT_MALE, gStringVar4, Task_BerryPouch_DestroyDialogueWindowAndRefreshListMenu);
    }
    else
        PrintNotTheTimeToUseThat(taskId, gTasks[taskId].data[3]);
}

void ItemUse_SetQuestLogEvent(u8 eventId, struct Pokemon *pokemon, u16 itemId, u16 param)
{
    struct QuestLogEvent_Item *data = Alloc(sizeof(*data));

    data->itemId = itemId;
    data->itemParam = param;
    if (pokemon != NULL)
        data->species = GetMonData(pokemon, MON_DATA_SPECIES_OR_EGG);
    else
        data->species = 0xFFFF;
    SetQuestLogEvent(eventId, (void *)data);
    Free(data);
}
