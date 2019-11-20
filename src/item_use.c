#include "global.h"
#include "battle.h"
#include "berry_pouch.h"
#include "berry_powder.h"
#include "bike.h"
#include "coins.h"
#include "event_data.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "field_map_obj_helpers.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "item.h"
#include "item_menu.h"
#include "item_use.h"
#include "itemfinder.h"
#include "mail.h"
#include "main.h"
#include "malloc.h"
#include "map_obj_80688E4.h"
#include "map_obj_lock.h"
#include "metatile_behavior.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "quest_log.h"
#include "region_map.h"
#include "script.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "teachy_tv.h"
#include "tm_case.h"
#include "vs_seeker.h"
#include "constants/fanfares.h"
#include "constants/flags.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/map_types.h"

EWRAM_DATA void (*sItemUseOnFieldCB)(u8 taskId) = NULL;

void sub_80A1084(void);
void sub_80A109C(u8 taskId);
void sub_80A112C(u8 taskId);
void sub_80A11C0(u8 taskId);
bool8 sub_80A1194(void);
void sub_80A1208(void);
void ItemUseOnFieldCB_Bicycle(u8 taskId);
bool8 ItemUseCheckFunc_Rod(void);
void ItemUseOnFieldCB_Rod(u8 taskId);
void FieldUseFunc_EvoItem(u8 taskId);
void sub_80A1648(u8 taskId);
void sub_80A1674(u8 taskId);
void InitTMCaseFromBag(void);
void Task_InitTMCaseFromField(u8 taskId);
void InitBerryPouchFromBag(void);
void Task_InitBerryPouchFromField(u8 taskId);
void InitBerryPouchFromBattle(void);
void InitTeachyTvFromBag(void);
void Task_InitTeachyTvFromField(u8 taskId);
void sub_80A19E8(u8 taskId);
void sub_80A1A44(void);
void sub_80A1B48(u8 taskId);
void sub_80A1C08(u8 taskId);
void sub_80A1CAC(void);
void sub_80A1CC0(u8 taskId);
void sub_80A1D58(void);
void sub_80A1D68(u8 taskId);
void Task_BattleUse_StatBooster_DelayAndPrint(u8 taskId);
void Task_BattleUse_StatBooster_WaitButton_ReturnToBattle(u8 taskId);

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

void (*const gUnknown_83E2954[])(void) = {
    CB2_ShowPartyMenuForItemUse,
    CB2_ReturnToField,
    NULL,
    NULL
};

void sub_80A0FBC(u8 taskId)
{
    u8 itemType;
    if (gSpecialVar_ItemId == ITEM_ENIGMA_BERRY)
        itemType = gTasks[taskId].data[4] - 1;
    else
        itemType = ItemId_GetType(gSpecialVar_ItemId) - 1;
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        BerryPouch_SetExitCallback(gUnknown_83E2954[itemType]);
        BerryPouch_StartFadeToExitCallback(taskId);
    }
    else
    {
        ItemMenu_SetExitCallback(gUnknown_83E2954[itemType]);
        if (itemType == 1)
            sub_8108CB4();
        ItemMenu_StartFadeToExitCallback(taskId);
    }
}

void sub_80A103C(u8 taskId)
{
    if (gTasks[taskId].data[3] != 1)
    {
        gFieldCallback = sub_80A1084;
        sub_80A0FBC(taskId);
    }
    else
        sItemUseOnFieldCB(taskId);
}

void sub_80A1084(void)
{
    sub_807DC00();
    CreateTask(sub_80A109C, 8);
}

void sub_80A109C(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
    {
        sItemUseOnFieldCB(taskId);
    }
}

void sub_80A10C4(u8 taskId, bool8 a1, u8 a2, const u8 * str)
{
    StringExpandPlaceholders(gStringVar4, str);
    if (a1 == FALSE)
        DisplayItemMessageInBag(taskId, a2, gStringVar4, sub_810A1F8);
    else
        DisplayItemMessageOnField(taskId, a2, gStringVar4, sub_80A112C);
}

void sub_80A1110(u8 taskId, bool8 a1)
{
    sub_80A10C4(taskId, a1, 4, gUnknown_8416425);
}

void sub_80A112C(u8 taskId)
{
    ClearDialogWindowAndFrame(0, 1);
    DestroyTask(taskId);
    sub_80696C0();
    ScriptContext2_Disable();
}

u8 GetItemCompatibilityRule(u16 itemId)
{
    if (ItemId_GetPocket(itemId) == POCKET_TM_CASE)
        return 1;
    else if (ItemId_GetFieldFunc(itemId) == FieldUseFunc_EvoItem)
        return 2;
    else
        return 0;
}

void sub_80A1184(void)
{
    gFieldCallback2 = sub_80A1194;
}

bool8 sub_80A1194(void)
{
    FreezeEventObjects();
    ScriptContext2_Enable();
    sub_807DC00();
    CreateTask(sub_80A11C0, 10);
    gUnknown_2031DE0 = 0;
    return TRUE;
}

void sub_80A11C0(u8 taskId)
{
    if (IsWeatherNotFadingIn() == TRUE)
    {
        UnfreezeMapObjects();
        ScriptContext2_Disable();
        DestroyTask(taskId);
    }
}

void FieldUseFunc_OrangeMail(u8 taskId)
{
    ItemMenu_SetExitCallback(sub_80A1208);
    ItemMenu_StartFadeToExitCallback(taskId);
}

void sub_80A1208(void)
{
    struct MailStruct mail;

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
     || MetatileBehavior_ReturnFalse_17(behavior) == TRUE
     || MetatileBehavior_ReturnFalse_18(behavior) == TRUE
     || MetatileBehavior_ReturnFalse_15(behavior) == TRUE
     || MetatileBehavior_ReturnFalse_16(behavior) == TRUE)
        sub_80A10C4(taskId, gTasks[taskId].data[3], 2, gUnknown_8416451);
    else if (sub_8055C9C() == TRUE && !sub_80BD540())
    {
        sItemUseOnFieldCB = ItemUseOnFieldCB_Bicycle;
        sub_80A103C(taskId);
    }
    else
        sub_80A1110(taskId, gTasks[taskId].data[3]);
}

void ItemUseOnFieldCB_Bicycle(u8 taskId)
{
    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
        PlaySE(SE_JITENSYA);
    StartTransitionToFlipBikeState(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE);
    sub_80696C0();
    ScriptContext2_Disable();
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
        sub_80A1110(taskId, gTasks[taskId].data[3]);
}

bool8 ItemUseCheckFunc_Rod(void)
{
    s16 x, y;
    u16 behavior;

    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);

    if (MetatileBehavior_IsWaterfall(behavior))
        return FALSE;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_4))
        return FALSE;
    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
    {
        if (IsPlayerFacingSurfableFishableWater())
            return TRUE;
    }
    else
    {
        if (MetatileBehavior_IsSurfable(behavior) && !MapGridIsImpassableAt(x, y))
            return TRUE;
        if (MetatileBehavior_IsBridge(behavior) == TRUE)
            return TRUE;
    }
    return FALSE;
}

void ItemUseOnFieldCB_Rod(u8 taskId)
{
    sub_805D2C0(ItemId_GetSecondaryId(gSpecialVar_ItemId));
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
    ItemUse_SetQuestLogEvent(4, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
        DisplayItemMessageInBag(taskId, 2, gStringVar4, sub_810A1F8);
    else
        DisplayItemMessageOnField(taskId, 2, gStringVar4, sub_80A112C);
}

void FieldUseFunc_PowderJar(u8 taskId)
{
    ConvertIntToDecimalStringN(gStringVar1, GetBerryPowder(), STR_CONV_MODE_LEFT_ALIGN, 5);
    StringExpandPlaceholders(gStringVar4, gUnknown_8416644);
    ItemUse_SetQuestLogEvent(4, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
        DisplayItemMessageInBag(taskId, 2, gStringVar4, sub_810A1F8);
    else
        DisplayItemMessageOnField(taskId, 2, gStringVar4, sub_80A112C);
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
        ItemUse_SetQuestLogEvent(4, NULL, gSpecialVar_ItemId, 0xFFFF);
        if (gTasks[taskId].data[3] == 0)
            DisplayItemMessageInBag(taskId, 2, gUnknown_8416690, sub_80A1648);
        else
            DisplayItemMessageOnField(taskId, 2, gUnknown_8416690, sub_80A1648);
    }
    else
    {
        // Now that's a catchy tune!
        if (gTasks[taskId].data[3] == 0)
            DisplayItemMessageInBag(taskId, 2, gUnknown_841665C, sub_810A1F8);
        else
            DisplayItemMessageOnField(taskId, 2, gUnknown_841665C, sub_80A112C);
    }
}

void sub_80A1648(u8 taskId)
{
    PlayFanfareByFanfareNum(FANFARE_POKEFLUTE);
    gTasks[taskId].func = sub_80A1674;
}

void sub_80A1674(u8 taskId)
{
    if (WaitFanfare(FALSE))
    {
        if (gTasks[taskId].data[3] == 0)
            DisplayItemMessageInBag(taskId, 2, gUnknown_84166A7, sub_810A1F8);
        else
            DisplayItemMessageOnField(taskId, 2, gUnknown_84166A7, sub_80A112C);
    }
}

void sub_80A16D0(u8 taskId)
{
    sub_80A0FBC(taskId);
}

void FieldUseFunc_Medicine(u8 taskId)
{
    gItemUseCB = sub_81252D0;
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
    gItemUseCB = dp05_rare_candy;
    sub_80A16D0(taskId);
}

void FieldUseFunc_EvoItem(u8 taskId)
{
    gItemUseCB = sub_8126B60;
    sub_80A16D0(taskId);
}

void FieldUseFunc_SacredAsh(u8 taskId)
{
    gItemUseCB = ItemUseCB_SacredAsh;
    sub_80A0FBC(taskId);
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
        fade_screen(1, 0);
        gTasks[taskId].func = Task_InitTMCaseFromField;
    }
}

void InitTMCaseFromBag(void)
{
    InitTMCase(0, CB2_BagMenuFromStartMenu, 0);
}

void Task_InitTMCaseFromField(u8 taskId)
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
        fade_screen(1, 0);
        gTasks[taskId].func = Task_InitBerryPouchFromField;
    }
}

void InitBerryPouchFromBag(void)
{
    InitBerryPouch(BERRYPOUCH_FROMFIELD, CB2_BagMenuFromStartMenu, 0);
}

void Task_InitBerryPouchFromField(u8 taskId)
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

void InitBerryPouchFromBattle(void)
{
    InitBerryPouch(BERRYPOUCH_FROMBATTLE, sub_8107ECC, 0);
}

void FieldUseFunc_TeachyTv(u8 taskId)
{
    ItemUse_SetQuestLogEvent(4, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(InitTeachyTvFromBag);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        fade_screen(1, 0);
        gTasks[taskId].func = Task_InitTeachyTvFromField;
    }
}

void InitTeachyTvFromBag(void)
{
    InitTeachyTvController(0, CB2_BagMenuFromStartMenu);
}

void Task_InitTeachyTvFromField(u8 taskId)
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
        PlaySE(SE_TU_SAA);
        gTasks[taskId].func = sub_80A19E8;
    }
    else
        // An earlier repel is still in effect
        DisplayItemMessageInBag(taskId, 2, gUnknown_841659E, sub_810A1F8);
}

void sub_80A19E8(u8 taskId)
{
    if (!IsSEPlaying())
    {
        ItemUse_SetQuestLogEvent(4, NULL, gSpecialVar_ItemId, 0xFFFF);
        VarSet(VAR_REPEL_STEP_COUNT, ItemId_GetHoldEffectParam(gSpecialVar_ItemId));
        sub_80A1A44();
        DisplayItemMessageInBag(taskId, 2, gStringVar4, sub_810A1F8);
    }
}

void sub_80A1A44(void)
{
    RemoveBagItem(gSpecialVar_ItemId, 1);
    sub_8108DC8(ItemId_GetPocket(gSpecialVar_ItemId));
    sub_81089F4(ItemId_GetPocket(gSpecialVar_ItemId));
    CopyItemName(gSpecialVar_ItemId, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gUnknown_841658C);
}

void FieldUseFunc_BlackFlute(u8 taskId)
{
    ItemUse_SetQuestLogEvent(4, NULL, gSpecialVar_ItemId, 0xFFFF);
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

void sub_80A1B48(u8 taskId)
{
    if (++gTasks[taskId].data[8] > 7)
    {
        PlaySE(SE_BIDORO);
        DisplayItemMessageInBag(taskId, 2, gStringVar4, sub_810A1F8);
    }
}

bool8 CanUseEscapeRopeOnCurrMap(void)
{
    if (gMapHeader.escapeRope & 1)
        return TRUE;
    else
        return FALSE;
}

void ItemUseOutOfBattle_EscapeRope(u8 taskId)
{
    if (CanUseEscapeRopeOnCurrMap() == TRUE)
    {
        ItemUse_SetQuestLogEvent(4, NULL, gSpecialVar_ItemId, gMapHeader.regionMapSectionId);
        sItemUseOnFieldCB = sub_80A1C08;
        sub_80A103C(taskId);
    }
    else
        sub_80A1110(taskId, gTasks[taskId].data[3]);
}

void sub_80A1C08(u8 taskId)
{
    Overworld_ResetStateAfterDigEscRope();
    sub_80A1A44();
    gTasks[taskId].data[0] = 0;
    DisplayItemMessageOnField(taskId, 2, gStringVar4, sub_80A1C44);
}

void sub_80A1C44(u8 taskId)
{
    ResetInitialPlayerAvatarState();
    sub_8085620();
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
        fade_screen(1, 0);
        gTasks[taskId].func = sub_80A1CC0;
    }
}

void sub_80A1CAC(void)
{
    sub_80BFF50(0, CB2_BagMenuFromStartMenu);
}

void sub_80A1CC0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        sub_80A1184();
        sub_80BFF50(0, CB2_ReturnToField);
        DestroyTask(taskId);
    }
}

void FieldUseFunc_FameChecker(u8 taskId)
{
    ItemUse_SetQuestLogEvent(4, NULL, gSpecialVar_ItemId, 0xFFFF);
    if (gTasks[taskId].data[3] == 0)
    {
        ItemMenu_SetExitCallback(sub_80A1D58);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        StopPokemonLeagueLightingEffectTask();
        fade_screen(1, 0);
        gTasks[taskId].func = sub_80A1D68;
    }
}

void sub_80A1D58(void)
{
    UseFameChecker(CB2_BagMenuFromStartMenu);
}

void sub_80A1D68(u8 taskId)
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
        sub_80A1110(taskId, gTasks[taskId].data[3]);
    }
    else
    {
        sItemUseOnFieldCB = Task_VsSeeker_0;
        sub_80A103C(taskId);
    }
}

void sub_80A1E0C(u8 taskId)
{
    sub_80A112C(taskId);
}

void BattleUseFunc_PokeBallEtc(u8 taskId)
{
    if (!IsPlayerPartyAndPokemonStorageFull())
    {
        RemoveBagItem(gSpecialVar_ItemId, 1);
        sub_8108CB4();
        ItemMenu_StartFadeToExitCallback(taskId);
    }
    else
    {
        DisplayItemMessageInBag(taskId, 2, gUnknown_8416631, sub_810A1F8);
    }
}

void BattleUseFunc_PokeFlute(u8 taskId)
{
    sub_8108CB4();
    ItemMenu_StartFadeToExitCallback(taskId);
}

void BattleUseFunc_GuardSpec(u8 taskId)
{
    if (ExecuteTableBasedItemEffect(&gPlayerParty[gBattlerPartyIndexes[gBattlerInMenuId]], gSpecialVar_ItemId, gBattlerPartyIndexes[gBattlerInMenuId], 0))
    {
        DisplayItemMessageInBag(taskId, 2, gText_WontHaveEffect, sub_810A1F8);
    }
    else
    {
        gTasks[taskId].data[8] = 0;
        gTasks[taskId].func = Task_BattleUse_StatBooster_DelayAndPrint;
    }
}

void Task_BattleUse_StatBooster_DelayAndPrint(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (++data[8] > 7)
    {
        u16 itemId = gSpecialVar_ItemId;
        PlaySE(SE_KAIFUKU);
        RemoveBagItem(itemId, 1);
        DisplayItemMessageInBag(taskId, 2, Battle_PrintStatBoosterEffectMessage(itemId), Task_BattleUse_StatBooster_WaitButton_ReturnToBattle);
    }
}

void Task_BattleUse_StatBooster_WaitButton_ReturnToBattle(u8 taskId)
{
    if (JOY_NEW(A_BUTTON) || JOY_NEW(B_BUTTON))
    {
        sub_8108CB4();
        ItemMenu_StartFadeToExitCallback(taskId);
    }
}

void ItemUse_SwitchToPartyMenuInBattle(u8 taskId)
{
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        BerryPouch_SetExitCallback(sub_81279E0);
        BerryPouch_StartFadeToExitCallback(taskId);
    }
    else
    {
        ItemMenu_SetExitCallback(sub_81279E0);
        ItemMenu_StartFadeToExitCallback(taskId);
    }
}

void BattleUseFunc_Medicine(u8 taskId)
{
    gItemUseCB = ItemUseCB_Medicine;
    ItemUse_SwitchToPartyMenuInBattle(taskId);
}

void sub_80A1FD8(u8 taskId)
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
        ItemUse_SetQuestLogEvent(4, 0, gSpecialVar_ItemId, 0xFFFF);
        DisplayItemMessageInBag(taskId, 2, gStringVar4, ItemMenu_StartFadeToExitCallback);
    }
    else
        sub_80A1110(taskId, 0);
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
        StringExpandPlaceholders(gStringVar4, gUnknown_8416425);
        DisplayItemMessageInBerryPouch(taskId, 4, gStringVar4, Task_BerryPouch_DestroyDialogueWindowAndRefreshListMenu);
    }
    else
        sub_80A1110(taskId, gTasks[taskId].data[3]);
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
    sub_8113550(eventId, (void *)questLog);
    Free(questLog);
}
