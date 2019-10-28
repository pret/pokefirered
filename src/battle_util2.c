#include "global.h"
#include "bg.h"
#include "battle.h"
#include "battle_anim.h"
#include "pokemon.h"
#include "malloc.h"
#include "trainer_tower.h"
#include "battle_util2.h"

void AllocateBattleResources(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
        InitTrainerTowerBattleStruct();
    if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
    {
        s32 i;

        for (i = 0; i < 4; ++i)
            gUnknown_3005EE0[i] = AllocZeroed(8);
    }
    gBattleStruct = AllocZeroed(sizeof(*gBattleStruct));
    gBattleResources = AllocZeroed(sizeof(*gBattleResources));
    gBattleResources->secretBase = AllocZeroed(sizeof(*gBattleResources->secretBase));
    gBattleResources->flags = AllocZeroed(sizeof(*gBattleResources->flags));
    gBattleResources->battleScriptsStack = AllocZeroed(sizeof(*gBattleResources->battleScriptsStack));
    gBattleResources->battleCallbackStack = AllocZeroed(sizeof(*gBattleResources->battleCallbackStack));
    gBattleResources->beforeLvlUp = AllocZeroed(sizeof(*gBattleResources->beforeLvlUp));
    gBattleResources->ai = AllocZeroed(sizeof(*gBattleResources->ai));
    gBattleResources->battleHistory = AllocZeroed(sizeof(*gBattleResources->battleHistory));
    gBattleResources->AI_ScriptsStack = AllocZeroed(sizeof(*gBattleResources->AI_ScriptsStack));
    gLinkBattleSendBuffer = AllocZeroed(BATTLE_BUFFER_LINK_SIZE);
    gLinkBattleRecvBuffer = AllocZeroed(BATTLE_BUFFER_LINK_SIZE);
    gUnknown_2022BB8 = AllocZeroed(0x2000);
    gUnknown_2022BBC = AllocZeroed(0x1000);
    SetBgTilemapBuffer(1, gUnknown_2022BBC);
    SetBgTilemapBuffer(2, gUnknown_2022BBC);
}

void FreeBattleResources(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
        FreeTrainerTowerBattleStruct();
    if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
    {
        s32 i;

        for (i = 0; i < 4; ++i)
        {
            FREE_AND_SET_NULL(gUnknown_3005EE0[i]);
        }
    }
    if (gBattleResources != NULL)
    {
        FREE_AND_SET_NULL(gBattleStruct);
        FREE_AND_SET_NULL(gBattleResources->secretBase);
        FREE_AND_SET_NULL(gBattleResources->flags);
        FREE_AND_SET_NULL(gBattleResources->battleScriptsStack);
        FREE_AND_SET_NULL(gBattleResources->battleCallbackStack);
        FREE_AND_SET_NULL(gBattleResources->beforeLvlUp);
        FREE_AND_SET_NULL(gBattleResources->ai);
        FREE_AND_SET_NULL(gBattleResources->battleHistory);
        FREE_AND_SET_NULL(gBattleResources->AI_ScriptsStack);
        FREE_AND_SET_NULL(gBattleResources);
        FREE_AND_SET_NULL(gLinkBattleSendBuffer);
        FREE_AND_SET_NULL(gLinkBattleRecvBuffer);
        FREE_AND_SET_NULL(gUnknown_2022BB8);
        FREE_AND_SET_NULL(gUnknown_2022BBC);
    }
}

void AdjustFriendshipOnBattleFaint(u8 battlerId)
{
    u8 opposingBattlerId, opposingBattlerId2;

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        opposingBattlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        opposingBattlerId2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
        if (gBattleMons[opposingBattlerId2].level > gBattleMons[opposingBattlerId].level)
            opposingBattlerId = opposingBattlerId2;
    }
    else
    {
        opposingBattlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
    }
    if (gBattleMons[opposingBattlerId].level > gBattleMons[battlerId].level)
    {
        if (gBattleMons[opposingBattlerId].level - gBattleMons[battlerId].level > 29)
            AdjustFriendship(&gPlayerParty[gBattlerPartyIndexes[battlerId]], 9);
        else
            AdjustFriendship(&gPlayerParty[gBattlerPartyIndexes[battlerId]], 7);
    }
    else
    {
        AdjustFriendship(&gPlayerParty[gBattlerPartyIndexes[battlerId]], 7);
    }
}
