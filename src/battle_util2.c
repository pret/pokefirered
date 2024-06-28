#include "global.h"
#include "bg.h"
#include "battle.h"
#include "battle_anim.h"
#include "malloc.h"
#include "party_menu.h"
#include "pokemon.h"
#include "trainer_tower.h"

void AllocateBattleResources(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
        InitTrainerTowerBattleStruct();
    if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
    {
        s32 i;

        for (i = 0; i < 4; i++)
            gPokedudeBattlerStates[i] = AllocZeroed(sizeof(struct PokedudeBattlerState));
    }

    gBattleStruct = AllocZeroed(sizeof(*gBattleStruct));

#if B_FLAG_SKY_BATTLE
    gBattleStruct->isSkyBattle = FlagGet(B_FLAG_SKY_BATTLE);
#endif

    gBattleResources = AllocZeroed(sizeof(*gBattleResources));
    gBattleResources->secretBase = AllocZeroed(sizeof(*gBattleResources->secretBase));
    gBattleResources->flags = AllocZeroed(sizeof(*gBattleResources->flags));
    gBattleResources->battleScriptsStack = AllocZeroed(sizeof(*gBattleResources->battleScriptsStack));
    gBattleResources->battleCallbackStack = AllocZeroed(sizeof(*gBattleResources->battleCallbackStack));
    gBattleResources->beforeLvlUp = AllocZeroed(sizeof(*gBattleResources->beforeLvlUp));
    gBattleResources->ai = AllocZeroed(sizeof(*gBattleResources->ai));
    gBattleResources->aiData = AllocZeroed(sizeof(*gBattleResources->aiData));
    gBattleResources->aiParty = AllocZeroed(sizeof(*gBattleResources->aiParty));
    gBattleResources->battleHistory = AllocZeroed(sizeof(*gBattleResources->battleHistory));

    gLinkBattleSendBuffer = AllocZeroed(BATTLE_BUFFER_LINK_SIZE);
    gLinkBattleRecvBuffer = AllocZeroed(BATTLE_BUFFER_LINK_SIZE);

    gBattleAnimBgTileBuffer = AllocZeroed(0x2000);
    gBattleAnimBgTilemapBuffer = AllocZeroed(0x1000);

    SetBgTilemapBuffer(1, gBattleAnimBgTilemapBuffer);
    SetBgTilemapBuffer(2, gBattleAnimBgTilemapBuffer);
}

void FreeBattleResources(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
        FreeTrainerTowerBattleStruct();
    if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
    {
        s32 i;

        for (i = 0; i < 4; i++)
        {
            FREE_AND_SET_NULL(gPokedudeBattlerStates[i]);
        }
    }
    gFieldStatuses = 0;
    if (gBattleResources != NULL)
    {
        FREE_AND_SET_NULL(gBattleStruct);

        FREE_AND_SET_NULL(gBattleResources->secretBase);
        FREE_AND_SET_NULL(gBattleResources->flags);
        FREE_AND_SET_NULL(gBattleResources->battleScriptsStack);
        FREE_AND_SET_NULL(gBattleResources->battleCallbackStack);
        FREE_AND_SET_NULL(gBattleResources->beforeLvlUp);
        FREE_AND_SET_NULL(gBattleResources->ai);
        FREE_AND_SET_NULL(gBattleResources->aiData);
        FREE_AND_SET_NULL(gBattleResources->aiParty);
        FREE_AND_SET_NULL(gBattleResources->battleHistory);
        FREE_AND_SET_NULL(gBattleResources);

        FREE_AND_SET_NULL(gLinkBattleSendBuffer);
        FREE_AND_SET_NULL(gLinkBattleRecvBuffer);

        FREE_AND_SET_NULL(gBattleAnimBgTileBuffer);
        FREE_AND_SET_NULL(gBattleAnimBgTilemapBuffer);
    }
}

void AdjustFriendshipOnBattleFaint(u8 battler)
{
    u8 opposingBattlerId;

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        u8 opposingBattlerId2;

        opposingBattlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        opposingBattlerId2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);

        if (gBattleMons[opposingBattlerId2].level > gBattleMons[opposingBattlerId].level)
            opposingBattlerId = opposingBattlerId2;
    }
    else
    {
        opposingBattlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
    }

    if (gBattleMons[opposingBattlerId].level > gBattleMons[battler].level)
    {
        if (gBattleMons[opposingBattlerId].level - gBattleMons[battler].level > 29)
            AdjustFriendship(&gPlayerParty[gBattlerPartyIndexes[battler]], FRIENDSHIP_EVENT_FAINT_LARGE);
        else
            AdjustFriendship(&gPlayerParty[gBattlerPartyIndexes[battler]], FRIENDSHIP_EVENT_FAINT_SMALL);
    }
    else
    {
        AdjustFriendship(&gPlayerParty[gBattlerPartyIndexes[battler]], FRIENDSHIP_EVENT_FAINT_SMALL);
    }
}

void SwitchPartyOrderInGameMulti(u8 battler, u8 arg1)
{
    if (GetBattlerSide(battler) != B_SIDE_OPPONENT)
    {
        s32 i;
        for (i = 0; i < (int)ARRAY_COUNT(gBattlePartyCurrentOrder); i++)
            gBattlePartyCurrentOrder[i] = *(0 * 3 + i + (u8 *)(gBattleStruct->battlerPartyOrders));

        SwitchPartyMonSlots(GetPartyIdFromBattlePartyId(gBattlerPartyIndexes[battler]), GetPartyIdFromBattlePartyId(arg1));

        for (i = 0; i < (int)ARRAY_COUNT(gBattlePartyCurrentOrder); i++)
            *(0 * 3 + i + (u8 *)(gBattleStruct->battlerPartyOrders)) = gBattlePartyCurrentOrder[i];
    }
}
