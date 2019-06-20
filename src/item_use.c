#include "global.h"
#include "berry_pouch.h"
#include "berry_powder.h"
#include "bike.h"
#include "coins.h"
#include "event_data.h"
#include "field_fadetransition.h"
#include "field_map_obj_helpers.h"
#include "field_player_avatar.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "item.h"
#include "item_menu.h"
#include "item_use.h"
#include "mail.h"
#include "map_obj_80688E4.h"
#include "map_obj_lock.h"
#include "metatile_behavior.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "script.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "constants/fanfares.h"
#include "constants/flags.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/songs.h"

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
void sub_813EC8C(u8 taskId);

extern void (*const gUnknown_83E2954[])(void);

void sub_80A0FBC(u8 taskId)
{
    u8 itemType;
    if (gSpecialVar_ItemId == ITEM_ENIGMA_BERRY)
        itemType = gTasks[taskId].data[4] - 1;
    else
        itemType = ItemId_GetType(gSpecialVar_ItemId) - 1;
    if (GetPocketByItemId(gSpecialVar_ItemId) == POCKET_BERRY_POUCH)
    {
        sub_813D934(gUnknown_83E2954[itemType]);
        sub_813D808(taskId);
    }
    else
    {
        sub_8108EE0(gUnknown_83E2954[itemType]);
        if (itemType == 1)
            sub_8108CB4();
        sub_8108B50(taskId);
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
    if (sub_807AA70() == TRUE)
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
    player_bitmagic();
    ScriptContext2_Enable();
    sub_807DC00();
    CreateTask(sub_80A11C0, 10);
    gUnknown_2031DE0 = 0;
    return TRUE;
}

void sub_80A11C0(u8 taskId)
{
    if (sub_807AA70() == TRUE)
    {
        UnfreezeMapObjects();
        ScriptContext2_Disable();
        DestroyTask(taskId);
    }
}

void FieldUseFunc_OrangeMail(u8 taskId)
{
    sub_8108EE0(sub_80A1208);
    sub_8108B50(taskId);
}

void sub_80A1208(void)
{
    u16 buffer[18];

    buffer[16] = gSpecialVar_ItemId;
    sub_80BEBEC(buffer, UseFameCheckerFromMenu, 0);
}

void FieldUseFunc_MachBike(u8 taskId)
{
    s16 x, y;
    u8 behavior;

    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);

    if (FlagGet(FLAG_0x830) == TRUE
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
    sub_80BD5C8(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE);
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
        if (MetatileBehavior_ReturnFalse_6(behavior) == TRUE)
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
    sItemUseOnFieldCB = sub_813EC8C;
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
